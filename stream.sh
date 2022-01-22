ffmpeg -f avfoundation -i ":0" -acodec libmp3lame -ab 32k -ac 1 \
-content_type audio/mpeg -f mp3 \
icecast://source:hackme@localhost:8000/live \
# this is derrick's swarthmore IP 
# icecast://source:hackme@130.58.161.120:8000/live \