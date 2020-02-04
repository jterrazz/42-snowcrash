import sys

i = 0
str = sys.argv[1]
for s in str:
  sys.stdout.write(chr(ord(s) - i))
  i += 1
