# Ausgabe der Release-Stande aus dem Container
# Einlesen des os-relaese, um den inhalt als Variable ausgeben zu können "
. /etc/os-release
echo "- $PRETTY_NAME"
echo "- $(python3 --version)"
echo "- yt-dlp version $(yt-dlp --version)"
echo "- $(ffmpeg -version | head -n 1)"
echo "- $(ffprobe -version | head -n 1)"
echo "- $(deno --version | head -n 1)"




