# Citrix

Tech notes related to Citrix support.

# NetScaler Load Balancer

NetScaler might also be referred to as the Application Delivery Controller (ADC).

When an SSL/TLS certificate is installed, it is important for NetScaler to send the 
**Intermediate CA** certs to the client to help complete the **trust chain** via a client trusted root.
Netscaler uses the Certificate **"Link"** feature to associate the Intermediate CA with an installed cert.
This can be confusing to find as the terminology "link" is not clearly a word for CA's and Trust Chains.
