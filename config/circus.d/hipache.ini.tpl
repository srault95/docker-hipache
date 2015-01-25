[watcher:hipache]
cmd = /usr/local/bin/hipache
args = -c /etc/hipache/config.json
#working_dir = /var/log
numprocesses = 1
copy_env = True
singleton = True
autostart = True
stdout_stream.class = StdoutStream
stderr_stream.class = StdoutStream
