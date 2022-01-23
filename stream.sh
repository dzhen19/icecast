ffmpeg -f avfoundation -i ":0" -acodec libmp3lame -ab 32k -ac 1 \
-content_type audio/mpeg -f mp3 \
icecast://source:hackme@167.99.15.200:8000/live \