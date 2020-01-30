# Level 08

Nm on the exec says: read, printf, open, so we can assumes it comports like a cat.

We try to read the token: You may not access './token'. We find back this on strings command: You may not access '%s', with the world token before. Weird.

By using r2, we find that the programs call strstr and compare it with the string `token`.

So maybe we can read the file if it's not called with token.

ln -s token res

We get the token for the flag08 user noice: quif5eloekouj29ke0vouxean