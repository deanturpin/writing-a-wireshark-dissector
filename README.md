# Resouces

"Dissectors are usually written in C, it's also possible to write them in Lua for fast prototyping."

- http://www.sewio.net/open-sniffer/develop/how-to-write-wireshark-dissector/
- https://www.wireshark.org/docs/wsdg_html_chunked/ChDissectAdd.html#ChDissectSetup
- https://github.com/boundary/wireshark/blob/master/doc/packet-PROTOABBREV.c
- https://wiki.wireshark.org/Lua/Dissectors

# Injecting messages
With xxd
```bash
xxd -r -p <<< '0108 5354 5556 5758' > /dev/udp/127.0.0.1/9999
```
View the message with tcpdump
```bash
sudo watch tcpdump -i lo -X

21:53:16.120038 IP localhost > localhost: ICMP localhost udp port 9999 unreachable, leng
th 44
        0x0000:  45c0 0040 1586 0000 4001 6675 7f00 0001  E..@....@.fu....
        0x0010:  7f00 0001 0303 3578 0000 0000 4500 0024  ......5x....E..$
        0x0020:  3979 4000 4011 034e 7f00 0001 7f00 0001  9y@.@..N........
        0x0030:  a136 270f 0010 fe23 0108 5354 5556 5758  .6'....#..STUVWX
```

# Time spent
Commute count: 1
