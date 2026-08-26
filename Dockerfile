#
# Dockerfile for ytdlp_debian
# based on python:3.14-slim which is in fact on debian

FROM python:3.14-slim-trixie
MAINTAINER Widukind <Widukind@proton.me>

COPY --from=denoland/deno:bin-2.9.5 /deno /usr/local/bin/deno
#COPY --from=denoland/deno:debian /deno /usr/local/bin/deno
COPY --from=mwader/static-ffmpeg /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg /ffprobe /usr/local/bin/

# A maybe more challenging variation. Just spotted and tried with the alpine variant
RUN pip3 install --break-system-packages --no-cache-dir --upgrade "yt-dlp[default,curl-cffi]"

# Try to run it so we know it works
RUN yt-dlp --version

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
