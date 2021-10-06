# Random File Generation

Command-line tools in Linux and Git Bash provide multiple options for generating random files for testing.
Some suggestions are listed in this Q&A post: [How do I create a 1GB random file in Linux?][1]

## openssl rand

A good tool for this purpose is the [`openssl rand` command][2]. 
Here's an example roughly based on the above Q&A post.

* `openssl rand -out sample.txt -base64 $(( 2**30 * (6*64)/(8*64+2) ))`

The math/arithmetic within [bash is using the *Double-Parentheses Construct*][4] I believe.

## base64 encoding overhead

The above openssl example accounts for base64 text encoding overhead.
The assumption is 6 data bits per 8-bit character with 64-character lines and `\r\n` end-of-line.
See the [`Base64` Wikipedia article][3] for more on base64 encoding conventions.

[1]: https://superuser.com/questions/470949/how-do-i-create-a-1gb-random-file-in-linux
[2]: https://www.openssl.org/docs/manmaster/man1/openssl-rand.html
[3]: https://en.wikipedia.org/wiki/Base64
[4]: https://tldp.org/LDP/abs/html/dblparens.html
