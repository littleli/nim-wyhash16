import unittest, wyhash16

let vec0 = [
  uint16 36519,
  6808,
  42654,
  12957,
  48725,
  19014,
  54864,
  25199,
  61043,
  31236,
  1653,
]

var vec11 = [
  uint16 43968,
  14321,
  50149,
  20468,
  56074,
  26607,
  62443,
  32710,
  3029,
  38877,
  9118,
  44928,
  15255,
  51107,
  21452,
  57290,
  26665,
  62521,
  32826,
  3135,
]

test "start with sequence initialized with 0":
  let h = newHash(0)
  for v in vec0:
    check h.next == v

test "start with sequence initialized with 11":
  let h = newHash(11)
  for v in vec11:
    check h.next == v

test "use iterator":
  let h = newHash(0)
  for v in h.take(5):
    echo v
