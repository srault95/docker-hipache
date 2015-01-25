{
    "server": {
        "accessLog": "/var/log/hipache/hipache.log",
        "workers": 10,
        "maxSockets": 100,
        "deadBackendTTL": 30,
        "tcpTimeout": 30,
        "retryOnError": 3,
        "deadBackendOn500": true,
        "httpKeepAlive": false,
        "staticDir": null
    },
    "http": {
        "port": 80,
        "bind": [ "0.0.0.0" ]
    },
    "driver": "{{ DRIVER }}"
}
