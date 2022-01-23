## Audio flow

user stream (ffmpeg streaming your microphone audio) ->
icecast server (http://167.99.15.200:8000) ->
HLS client (wsrnfm.com)

## Icecast Setup (on a VM)

1. if installing on ubuntu, simply run `apt-get install icecast2 -y`
2. the `icecast.xml` file is located within `/etc/icecast2/icecast.xml` after installation
3. do `icecast2 -c /etc/icecast2/icecast.xml` to start the icecast server

Things to note:

- Currently, icecast is running on a DigitalOcean droplet. Its IPv4 is http://167.99.15.200/
- Icecast is running on port 8000, so go to http://167.99.15.200:8000 to see the Icecast GUI
- You can listen to your stream on http://167.99.15.200:8000/live

## How to stream audio from your PC to the Icecast server

1. Install FFMPEG https://www.ffmpeg.org/download.html
2. Check that the Icecast server is live by going to http://167.99.15.200:8000
3. Run `bash stream.sh`. I'll break down the variables worth noting in the FFMPEG command found in `stream.sh`

- `ffmpeg -f avfoundation -i ":0"` -> the ":0" in this command corresponds to the ID of your audio input device. If you have two microphones plugged in, you could want either ":0" or ":1" here.
- `icecast://source:hackme@167.99.15.200:8000/live` -> this is the URL that FFMPEG is streaming to. It's the "mountpoint" of the icecast server. This url schema is:
  "icecast://[SOURCE_NAME]:[SOUCE_PASSWORD]@[IP_ADDRESS]:[PORT]/[MOUNTPOINT_NAME]"
  Icecast supports multiple mountpoints. If the mount point "live" is taken, you can simply create another mountpoint by swapping out the URL with `icecast://source:hackme@167.99.15.200:8000/live2`
