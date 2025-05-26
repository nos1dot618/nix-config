## Setup

Add the following line in "sudoers", so that `light` work with root priviledges without prompting for password. Launch "sudoers" file in default editor using sudo visudo:

```config
nosferatu ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/light
```
