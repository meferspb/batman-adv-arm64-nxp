# batman-adv-arm64-nxp
Script for building batman-adv and batl for arm64 architecture based on ubuntu and debian for platforms based on LS1046 and LX2160 processors. It may be suitable for other arm64 platforms.

You must first install linux-headers to build the kernel module, as described here: https://github.com/meferspb/linux-headers-5.10.35-nxp

For other architectures, installing linux-headers will require other actions.
For example, for raspberry, you will need to give the command:

```
apt install linux-headers
```
