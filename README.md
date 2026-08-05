This is a proof on concept for a suggestion to update the image [`tanja84dk/Docker-yt-dlp`].

yt-dlp
======

[`yt-dlp`][1] is a feature-rich command-line program to download videos from
<https://www.youtube.com/> and many other sites. It is a fork of the original [`youtube-dl`][2].

[`yt-dlp`][1] is a [`youtube-dl`][2] fork based on the now inactive [`yt-dlc`][5]. The main focus of yt-dlp is adding new features and patches while also keeping up to date with the original project.

Inspiration
===========
The project was originally inspired by [`tanja84dk/Docker-yt-dlp`][3]. I had used her container for a long time and loved it most of the time.

After receiving a warning that Python 3.10 is outdated and Deno became a recommended add-on, I started testing which amendments to her Dockerfile could fulfill my intended changes.
With some help from Mistral/Le Chat, I decided to switch to Alpine Linux.

Now that I've achieved my goal with Alpine Linux, I'd like to use this project to learn how to work with GitHub. I also want to use the second solution to see which approach is more stable while still allowing for necessary updates. Within GitHub, I'll be trying my hand at Actions.

Used Images
===========
see `Dockerfile`

## Tutorial

```sh
podman run --rm -it -v "\$(pwd):/out" Widukind42/ytdlp_debian [URL|(yt-dlp parameters)]

# With SELinux in place:
podman run --rm -it -v "\$(pwd):/out\:z" Widukind42/ytdlp_debian [URL|(yt-dlp parameters)]
```
/out is the working directory.
To build this image via Podman, enter the following command in the directory where the Dockerfile is stored:
```sh
podman build -t ytdlp_debian .
```
Here’s an example of how I use it myself:
```sh
podman run --rm -it -v "$(pwd):/out:z" ytdlp_debian --config-locations ./youtube_config/
```
The directory yt_config holds the yt-dlp.conf file and an input URLs text file.

## Link of the image
`ghcr.io/widukind42/ytdlp_debian`

## Credits
 - Credit to [`youtube-dl`][2] for the original project Licensed under [`The Unlicense`][7]
 - Credit to [`yt-dlp`][1] for their updated fork of youtube-dl Licensed under [`The Unlicense`][6]
 


[1]: https://github.com/yt-dlp/yt-dlp
[2]: https://ytdl-org.github.io/youtube-dl/
[3]: https://hub.docker.com/r/tanja84dk/yt-dlp
[4]: empty
[5]: https://github.com/blackjack4494/yt-dlc
[6]: https://github.com/yt-dlp/yt-dlp/blob/master/LICENSE
[7]: https://github.com/ytdl-org/youtube-dl/blob/master/LICENSE

---
- podman --version
  podman version 5.4.2

- cat /etc/os-release
    PRETTY_NAME="Debian GNU/Linux 13 (trixie)"
    NAME="Debian GNU/Linux"
    VERSION_ID="13"
    VERSION="13 (trixie)"
    VERSION_CODENAME=trixie
    DEBIAN_VERSION_FULL=13.6
    ID=debian
    HOME_URL="https://www.debian.org/"
    SUPPORT_URL="https://www.debian.org/support"
    BUG_REPORT_URL="https://bugs.debian.org/"


- yt-dlp --version
   2026.07.04

- deno --version
   deno 2.9.4 (stable, release, x86_64-unknown-linux-gnu)
   v8 15.0.245.2-rusty
   typescript 6.0.3

- python --version
   Python 3.14.6

- fmpeg 
  ffmpeg version 8.1.2 Copyright (c) 2000-2026 the FFmpeg developers
  built with gcc 13.2.1 (Alpine 13.2.1_git20240309) 20240309

  
