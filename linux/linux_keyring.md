# Linux Keyrings

## Reboot Persistence

It looks like these are Not persistently stored on disk to survive a reboot. 
Examples of keys/secrets which don't need to survive reboot include Kerberos tickets.
Example of secrets that require persistence: Machine or User PKI Certificates (SSL/TLS Private Keys).

## Documentation

* [The Linux Kernel Key Retention Service and why you should use it in your next application][1] (Cloudflare)
* [Kernel Key Retention Service][2] (kernel.org)
* [keyctl - key management facility control][3] (man7.org)

[1]: https://blog.cloudflare.com/the-linux-kernel-key-retention-service-and-why-you-should-use-it-in-your-next-application/
[2]: https://www.kernel.org/doc/html/v5.8/security/keys/core.html
[3]: https://man7.org/linux/man-pages/man1/keyctl.1.html
