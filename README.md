referenced this guide: https://gist.github.com/dmpanch/30408f71491f06352a73aec7775a50b7

to run icecast run `icecast ~/icecast/icecast.xml`
to see the running server go to localhost:8000/admin
usename: admin, pw: hackme to get into the admin portal

now that the icecast server is started, we can start streaming audio
stream.sh will stream laptop audio using ffmpeg into the icecast mountpoint "live"
run stream.sh `bash stream.sh` 
now you should be streaming your microphone into the icecast server

