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
podman run --rm -it -v "\$(pwd):/data" Widukind42/ytdlp_debian [URL|(yt-dlp parameters)]

# With SELinux in place:
podman run --rm -it -v "\$(pwd):/data:z" Widukind42/ytdlp_debian [URL|(yt-dlp parameters)]
```
/out is the working directory.
To build this image via Podman, enter the following command in the directory where the Dockerfile is stored:
```sh
podman build -t ytdlp_debian .
```
Here’s an example of how I use it myself:
```sh
podman run --rm -it -v "$(pwd):/data:z" ytdlp_debian --config-locations ./yt_config/
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
### Release-Stands for ghcr.io/widukind42/ytdlp_debian as of 2026-08-22
- Debian GNU/Linux 13 (trixie)
- yt-dlp version 2026.08.19
- ffmpeg version 9.0.1 Copyright (c) 2000-2026 the FFmpeg developers
- ffprobe version 9.0.1 Copyright (c) 2007-2026 the FFmpeg developers
- deno 2.9.4 (stable, release, x86_64-unknown-linux-gnu)
