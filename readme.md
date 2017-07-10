This guide takes advantage of the features available only to Linux/bash.

# Get started
Watch this video to get a feel for where dissectors fit into the grand scheme of
things.

https://www.youtube.com/watch?v=sP8ljsM8c9s

# Lua
An example of Lua dissector being developed.

https://www.youtube.com/watch?v=I4nf23HywmI

# Creating a message format
I have two messages in my format:
- request time
- respond with time

```c
struct request {

	unsigned int stx;			// Start transmission 0xa5a5
	unsigned int mode;		// 0 request, 1 response
	unsigned int length;	// Length is zero for a request
	char[length] time;		// Length of response string
}
```

Let's start by sending a packet to ourselves (using UDP so we don't have to
think about establishing a connection right now).
```bash
xxd -r -p <<< 'a5a5 0001 0000' > /dev/udp/0.0.0.0/9999
```

And capture it in ```tcpdump```.
```bash
sudo tcpdump -i lo -X -n dst port 9999

tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on lo, link-type EN10MB (Ethernet), capture size 262144 bytes
08:59:34.588571 IP 127.0.0.1.41157 > 127.0.0.1.9999: UDP, length 6
	0x0000:  4500 0022 f78f 4000 4011 4539 7f00 0001  E.."..@.@.E9....
	0x0010:  7f00 0001 a0c5 270f 000e fe21 a5a5 0001  ......'....!....
	0x0020:  0000      
```

# How long did this take?
I've logged my time on this project using the "logwork" hashtag in the git log.
Includes documenting it.

```bash
git log | grep logwork
YouTube and tinkering with /dev/tcp to develop a test message format #logwork 1h
#logwork 2h Googling, watching YouTube, tinkering with tcpdump options
```
