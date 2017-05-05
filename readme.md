# Get started
Watch this video to get a feel for where dissectors fit into the grand scheme of
things.

https://www.youtube.com/watch?v=sP8ljsM8c9s

# Lua
An example of Lua dissector being developed.

https://www.youtube.com/watch?v=I4nf23HywmI

# Resouces

"Dissectors are usually written in C, it's also possible to write them in Lua for fast prototyping."

## C
- http://www.sewio.net/open-sniffer/develop/how-to-write-wireshark-dissector/
- https://www.wireshark.org/docs/wsdg_html_chunked/ChDissectAdd.html#ChDissectSetup
- https://github.com/boundary/wireshark/blob/master/doc/packet-PROTOABBREV.c
- http://www.sewio.net/open-sniffer/develop/how-to-write-wireshark-dissector/

## Lua
- https://prontog.wordpress.com/2016/01/29/a-simpler-way-to-create-wireshark-dissectors-in-lua/
- https://wiki.wireshark.org/Lua/Dissectors
- https://ask.wireshark.org/questions/5726/newbie-trying-to-get-lua-scripts-to-execute

## tcpdump
- http://rationallyparanoid.com/articles/tcpdump.html - tcpdump usage

# Injecting messages
With xxd - inject just enough that it fits nicely on a line once all the other layers are added.
```bash
while :; do xxd -r -p <<< '0108 5556 5758' > /dev/tcp/127.0.0.1/9999; sleep 1; done
```

Create a server in another terminal
```
nc -kl 9999 | xxd -c 6
```

Capture the messages with tcpdump, but only those with out destination port.
```bash
sudo tcpdump -i lo -XX -n dst port 9999

21:59:26.540459 IP 127.0.0.1.38583 > 127.0.0.1.9999: UDP, length 6
        0x0000:  0000 0000 0000 0000 0000 0000 0800 4500  ..............E.
        0x0010:  0022 8d70 4000 4011 af58 7f00 0001 7f00  .".p@.@..X......
        0x0020:  0001 96b7 270f 000e fe21 0108 5556 5758  ....'....!..UVWX
```

# How long did this take?
I've logged my time on this project using the "logwork" hashtag in the git log.

```bash
 git log | grep logwork
 #logwork 2h Googling, watching YouTube, tinkering with tcpdump options
```
