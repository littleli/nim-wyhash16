# wyhash16 algorithm
type
  WyHash16* = ref object
    rng: uint16
    odd: uint16

func hash16(input, key: uint32): uint32 =
  let z = input * key
  return ((z shr 16) xor z) and 0xffff

func newHash*(init: uint16): WyHash16 =
  return WyHash16(rng: init, odd: 0xfc15)

proc setOdd*(self: WyHash16, odd: uint16) =
  self.odd = odd

proc next*(self: WyHash16): uint16 =
  self.rng += self.odd
  return hash16(self.rng.uint32, 0x2ab).uint16

iterator take*(self: WyHash16, n: Natural): uint16 =
  for v in 0..<n:
    yield self.next
  