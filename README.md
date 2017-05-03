# Resouces

"Dissectors are usually written in C, it's also possible to write them in Lua for fast prototyping."

- http://www.sewio.net/open-sniffer/develop/how-to-write-wireshark-dissector/
- https://www.wireshark.org/docs/wsdg_html_chunked/ChDissectAdd.html#ChDissectSetup
- https://github.com/boundary/wireshark/blob/master/doc/packet-PROTOABBREV.c
- https://wiki.wireshark.org/Lua/Dissectors
- http://rationallyparanoid.com/articles/tcpdump.html - tcpdump usage

# Injecting messages
With xxd - inject just enough that it fits nicely on a line once all the other layers are added.
```bash
xxd -r -p <<< '0108 5556 5758' > /dev/udp/127.0.0.1/9999
```

View the message with tcpdump, but only those with out destination port.
```bash
sudo tcpdump -i lo -XX -n dst port 9999

21:59:26.540459 IP 127.0.0.1.38583 > 127.0.0.1.9999: UDP, length 6
        0x0000:  0000 0000 0000 0000 0000 0000 0800 4500  ..............E.
        0x0010:  0022 8d70 4000 4011 af58 7f00 0001 7f00  .".p@.@..X......
        0x0020:  0001 96b7 270f 000e fe21 0108 5556 5758  ....'....!..UVWX
```

# Time spent
Commute count: 1
