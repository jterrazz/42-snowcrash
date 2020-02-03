# Level14

This time the directory is empty. Additionally, no user files for flag14 or level14 can be found. We can assume that we must exploit the getflag binary itself.

Lets start by taking a look at it

```bash
find / -name getflag 2>/dev/null
/bin/getflag
```

Time to copy getflag binary to host and dissassemble to take a closer look

From host:

```bash
scp -P 4242 level14@localhost:/bin/getflag .
```

Many options exist to disassemble. We used `radare2` and https://onlinedisassembler.com/odaweb/

Going through the strings we can see 15 successive odd looking strings:

```rien
0x80490b2	I`fA>_88eEd:=`85h0D8HE>,D
0x80490cc	7`4Ci4=^d=J,?>i;6,7d416,7
0x80490e6	<>B16\AD<C6,G_<1>^7ci>l4B
0x8049100	B8b:6,3fj7:,;bh>D@>8i:6@D
0x804911a	?4d@:,C>8C60G>8:h:Gb4?l,A
0x8049134	G8H.6,=4k5J0<cd/D@>>B:>:4
0x804914e	H8B8h_20B4J43><8>\ED<;j@3
0x8049168	78H:J4<4<9i_I4k0J^5>B1j`9
0x8049182	bci`mC{)jxkn<"uD~6%g7FK`7
0x804919c	Dc6m~;}f8Cj#xFkel;#&ycfbK
0x80491b6	74H9D^3ed7k05445J0E4e;Da4
0x80491d0	70hCi,E44Df[A4B/J@3f<=:`D
0x80491ea	8_Dw"4#?+3i]q&;p6 gtw88EC
0x8049204	boe]!ai0FB@.:|L6l@A?>qJ}I
0x8049220	g <t61:|4_|!@IF.-62FH&G~DCK/Ekrvvdwz?v|
```

Could these be the undigested tokens (flag00-14)? or at least keys for them? Two functions are cross referenced 15 times. One unnamed and the other: `ft_des` 

By looking at each XREF, we can see that each call to `ft_des` carries the address to one of the strings above(ex: below is the 15th call, carrying the 15th string):

```
loc_08048de5:
...
movl $0x8049220,(%esp)
call ft_des
...
```

Using GDB we can jump to the code that processes flag14 (https://sourceware.org/gdb/onlinedocs/gdb/Jumping.html)

```
gdb getflag
break _start (sets a breakpoint at the very start of the execution)
run (runs the target, in this case getflag)
jump *0x08048de5 (* specifies address instead of name)
Continuing at 0x8048de5.
7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
```

All that is left is to change users and `getflag`

```b
su flag14
7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
Congratulation. Type getflag to get the key and send it to me the owner of this livecd :)
getflag
Check flag.Here is your token : 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
```