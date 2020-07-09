# Dockerfile for upx

[UPX](https://github.com/upx/upx) seems like a cool and good utility - let's containerize it!

## Build Concerns

The biggest build concern is going to be keeping the release tag up to date. Currently [the latest release](https://github.com/upx/upx/releases) is [v3.96](https://github.com/upx/upx/releases/tag/v3.96). If that changes in the future, I'll have to rebuild and reship the container.

## Runtime Concerns

The way that I'm currently using the upx image is to volume mount the directory with the target binary inside of the upx container, and call the upx binary with the path to the target binary and any flags necessary for compression. For example, I'm using this to work on the `kubectl-hpecp` plugin. The output binaries look like `kubectl-hpecp.$os.uncompressed` (where os is in [`linux`, `windows`, and `darwin`]). If I wanted to run upx with `-9` (very good) compression on the `linux` version of the binary and output the file as `kubectl-hpecp.linux`, I would call `docker run` as follows:

```sh
> docker run --rm -t -v $(pwd):/kubectl-hpecp:rw distortedsignal/upx -9 -o /kubectl-hpecp/kubectl-hpecp.linux /kubectl-hpecp/kubectl-hpecp.linux.uncompressed
```

A few notes about what this run syntax does for me:
* `--rm` should dispose of the container instance when the run is completed.
* `-t` should attach a terminal so that the user can watch (in real time!) as the binary is compressed.
* `-v $(pwd):/kubectl-hpecp:rw` mounts the current directory to the container at /kubectl-hpecp and lets the container write files to it. It would be kinda sad if we did all this work and couldn't use the output.
* `distortedsignal/upx` is the name of the container. On my personal machine, I've also got this tagged as `upx`, so I usually call that.

## License Concerns

UPX is licensed under the GNU General Public License. Because of this, I copied the `LICENSE` and `COPYING` files into the container to comply with the licensing requests.
