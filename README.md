# Virtual reading room configuration

This script applies security configurations to a remote, virtual server that acts as a virtual reading room. Researchers connect via the RDP protocol, which enables desktop virtualization.

The script: installs software for opening researcher materials and enabling sound redirection; disables HTTP, HTTPS, and SSH connections for accounts other than library_specialcollections and the user running the script; and creates a sample directory, ABC, for which the account researcherID has read-only permissions.

NC State University Libraries has used the script on servers hosted by the [Virtual Computing Lab](https://vcl.ncsu.edu/), a campus service that uses [Apache VCL](https://vcl.apache.org/), an open-source cloud computing platform. The script has been tested in Ubuntu 18.04 LTS, 20.04.1 LTS, and 22.04 LTS.

## Prerequisites
- A virtual server must be set up through a cloud computing service, e.g. Amazon EC2 or Google Cloud, first.
- A desktop environment, such as Mate, needs to be installed before running the script.