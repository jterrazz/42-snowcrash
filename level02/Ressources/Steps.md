# Level 02

A `.pcap` file can be found in the user directory. These files are network packet snapshots.

Using secure copy (`scp`), we can copy it to our host system and inspect it

```bash
# from host
scp -P 4242 level02@localhost:/home/user/level02/level02.pcap .
```

The file has insufficient permissions to open it in Wireshark: `chmod 777 level02.pcap`.

```bash
# Trying strings on file
Password: Nf&Nat # not working on `su flag02`
```

Only show the **data** fields with tshark, using **hex** represntation, then converting it to **ascii**.

```bash
tshark -T fields -e data -r level02.pcap | xxd -r -p
# ft_waNDReL0L
```

We can also use https://www.rapidtables.com/convert/number/ascii-hex-bin-dec-converter.html

```bash
getflag
# Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
```

