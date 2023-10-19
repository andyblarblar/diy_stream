This docker container provides an nginx server setup to stream. Basically, it just forwards a RTMP stream from ex. OBS, and forwards it to clients via RTMP, DASH, or HLS.
This container provides no security nor interface, so be aware.

# Running

The `run_server.bash` script will run the server, even if from a cronjob. Put this in a boot cronjob to start the server on boot on something like a raspi.

# Steam side
To stream to this container with OBS, configure a custom stream to `rtmp://ip/live/`, where ip is the ip of the computer running this container.
The steam key is arbitrary, and will just decide the path to connect to the stream. Note that this is what allows for multiple streams, given everyone has different keys.
Steam settings such as bitrate apply as normal.

# Clients
These are the URLs this docker container will publish that you want to connect to on the viewers end.
Note that the easiest way to use this is to connect to one of these with VLCs network device.

For each protocol, replace `ip` in the URL with the ip of the computer running this container,
and stream_key with whatever steam key you chose.

## RTMP
Served on: `rtmp://ip/live/stream_key`

## HLS
Served on: `http://ip:8080/hls/stream_key.m3u8`

## DASH
Served on: `http://ip:8080/dash/stream_key.mpd`

# Stats

View stats such as current publishers and subscribers at `http://ip:8080/stat`