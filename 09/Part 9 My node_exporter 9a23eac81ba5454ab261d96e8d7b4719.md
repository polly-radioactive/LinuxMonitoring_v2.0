# Part 9. My node_exporter

## 1. Nginx

Install nginx:

`sudo apt install nginx`

 Change nginx.conf:

`sudo nano /etc/nginx/nginx.conf`

```
server {
                server_name localhost;
                listen 8080;
                location /metrics {
                        root /var/www;
                        index index.html;
                        allow 127.0.0.1;
                        allow all;
                }
        }
```

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled.png)

`ssh -L 9090:localhost:9090 -L 3000:localhost:3000 -L 8080:localhost:8080 [johannec@192.168.1.11](mailto:johannec@192.168.1.11)`

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%201.png)

## 2. Change Prometheus

`sudo nano /etc/prometheus/prometheus.yml`

`prometheus.yml`:

```
....
- job_name: my_node
    static_configs:
      - targets: ['localhost:8080']
```

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%202.png)

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%203.png)

## **Grafana dashboard**

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%204.png)

- Test part 2

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%205.png)

- `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`

![Untitled](Part%209%20My%20node_exporter%209a23eac81ba5454ab261d96e8d7b4719/Untitled%206.png)