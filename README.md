> Hey there, app enthusiasts! 👋 Ready to dive into the world of game-changing apps? At [jterrazz.com](https://jterrazz.com), I'm all about crafting useful applications and sharing the journey! Discover coding insights, self-improvement hacks, and sneak peeks of my latest projects (psst... my next app is all about leveling up in life! 🚀). Come along for the ride - you might just find the spark for your next big idea! 💡💻

# 42-Snowcrash

> The project ressources (ISO and subject) are avaible at the 42 school. This project is composed of 14 levels, each one contains a security breach that gives you access to the next level.

## Common walkthrough

We use `radare2` to analyse the binary:
- We disassemble using the visual mode `r2 ./level0` then `v`.

We use `gdb` to debug the runtime:
  - breakpoints: `b *addr` and `b function`
  - move: `nexti`, `stepi`
  - run: `r`, `r $(CMD)`, `r < file` 

## Resources

### Used exploits

- **Return-to-libc** (replacing the RET addr in stack)
- **Buffer overflows** with unsecure `gets`, `strcat` and `strcpy`
- **Format string attacks**
- Exploits in binaries behaviour
- Bad use of casted values

### Programs
- Using a custom docker image to get the best analysing tools from linux on mac: [See this](https://github.com/jterrazz/docker-devstation)
- `r2`: disassembly ([doc](https://radare.gitbooks.io/radare2book/visual_mode/intro.html))
- `gdb`: runtime debugging and disassembly
- `readelf`
- `ltrace`
- `python` scripting
- `John the ripper`
- `wireshark`, `tshark`
- others: `netstat`, `top`, `getfacl`, `ltrace`, `strace`

### Skills
Doing this project I learned about:
- Analysing binaries
- Injecting code using unprotected inputs/parameters
- Usecure system calls such as `access`
