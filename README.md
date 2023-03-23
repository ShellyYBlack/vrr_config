# Virtual reading room configuration

This script applies security configurations to a remote, virtual server that acts as a virtual reading room. Researchers connect via the RDP protocol, which enables desktop virtualization.

The script: installs software for opening researcher materials and enabling sound redirection; disables HTTP, HTTPS, and SSH connections for accounts other than library_specialcollections and the user running the script; and creates a sample directory, ABC, for which the account researcherID has read-only permissions.

NC State University Libraries has used the script on servers hosted by the [Virtual Computing Lab](https://vcl.ncsu.edu/), a campus service that uses [Apache VCL](https://vcl.apache.org/), an open-source cloud computing platform. The script has been tested in Ubuntu 18.04 LTS, 20.04.1 LTS, and 22.04 LTS on VCL servers. It has not been tested on other cloud computing services.

To learn more about the NC State virtual reading room, view our [blog](https://www.lib.ncsu.edu/news/special-collections/introducing-virtual-reading-room) or [researcher user guide](https://ncsu-libraries.github.io/vrr/user-guide/).

## Prerequisites
- A virtual server must be set up through a cloud computing service, e.g. Amazon EC2 or Google Cloud, first.
- A desktop environment, such as Mate, needs to be installed before running the script.

## Instructions
1. Download the script.
1. Go to lines 17 and 21 and change the default SSH port number from 22 to a number higher than 1024.
1. Go to line 37 and change researcherID to an existing user account.
1. Transfer the script to the server: `rsync -avhP vrr_config.sh [IPADDRESS]:/home/$(whoami)`
1. Connect to the server: `ssh [IPADDRESS]`
1. Make the script executable: `sudo chmod u+x vrr_config.sh`
1. Run script: `sudo ./vrr_config.sh`
1. [Verify](/testing.md) that the security configurations were applied.
