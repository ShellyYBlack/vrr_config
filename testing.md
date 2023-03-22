# Testing

Confirm that the script successfully applied the configurations.

1. Open your RDP client, such as Remote Desktop Connection (Windows) or Microsoft Remote Desktop (Mac).
1. Under the Local Resources tab, and Local Devices and Resources, check the box next to Clipboard.
1. Click on "More..." and check the box next to one of your local drives.
1. Connect to the virtual reading room as a non-admin.
1. Open ~/thinclient_drives and make sure no local drives are mapped.
1. If the clipboard was disabled, verify that copying and pasting between the host and remote server does not work.
1. Check for HTTP and HTTPS traffic by opening your web browser. You should see a message about the connection timing out.
1. Run `ls -lh /home/VRR/ABC` and confirm the permissions look like this:
    ```
    drwxrwxrwx 2 researcherID sshusers 4.0K Mar 13 19:24 DuplicationRequests
    drwxrwxr-x 2 researcherID sshusers 4.0K Jan 10 16:37 EADID
    ```
1. Run `ls -l /usr/bin/ssh` and confirm the permissions look like this:
    ```
    -rwxr-x---. 1 root sshusers 1037272 Feb  4  2020 /usr/bin/ssh
    ```
1. Close your RDP client.
1. Open a terminal on your host and try connecting to the server via SSH: `ssh [USER]@[IPADDRESS]` It should say, "Permission denied."