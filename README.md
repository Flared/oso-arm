# oso-arm

This builds oso on ARM64, for our private python repos.

Usage:
- Be on an ARM64 machine, or one that can run `--platform=linux/arm64` docker images.
- Change the git tag in the Makefile
- Run `make run`
- Run `./upload.sh`
- Enjoy oso on arm.


This must be done on all oso releases until https://github.com/osohq/oso/issues/1580 is fixed.
