# Part 7. Prometheus и Grafana

## Установка **Prometheus**

1. Создание системного пользователя:
    
    `sudo useradd --system --no-create-home --shell /bin/false prometheus`
    
2. Скачать и извлечь **Prometheus**
    
    `wget [https://github.com/prometheus/prometheus/releases/download/v2.32.1/prometheus-2.32.1.linux-amd64.tar.gz](https://github.com/prometheus/prometheus/releases/download/v2.32.1/prometheus-2.32.1.linux-amd64.tar.gz)`
    
    `tar -xvf prometheus-2.32.1.linux-amd64.tar.gz`
    
3. Создайте директорию данных для Prometheus и переместите туда распакованные файлы:
    
    `sudo mkdir -p /data /etc/prometheus`
    
    `cd prometheus-2.32.1.linux-amd64`
    
    `sudo mv prometheus promtool /usr/local/bin/`
    
    `sudo mv prometheus.yml /etc/prometheus/prometheus.yml`
    
4. Чтобы избежать проблем с правами доступа, вам необходимо правильно указать владельца для каталога /etc/prometheus/ и каталога данных:
    
    `sudo chown -R prometheus:prometheus /etc/prometheus/ /data/`
    
5. Проверяем успешность установки Прометея и удаляем ненужный больше архив и папку:
    
    `prometheus --version`
    
    `cd ..`
    
    `rm -rf prometheus*`
    
6. Cобираемся использовать systemd, системный и сервисный менеджер для операционных систем Linux. Для этого нам нужно создать файл конфигурации модуля systemd:
    
    `sudo vim /etc/systemd/system/prometheus.service`
    
    `prometheus.service`:
    
    > [Unit]
    Description=Prometheus
    Wants=network-online.target
    After=network-online.target
    > 
    > 
    > StartLimitIntervalSec=500
    > StartLimitBurst=5
    > 
    > [Service]
    > User=prometheus
    > Group=prometheus
    > Type=simple
    > Restart=on-failure
    > RestartSec=5s
    > ExecStart=/usr/local/bin/prometheus \
    > --config.file=/etc/prometheus/prometheus.yml \
    > --storage.tsdb.path=/data \
    > --web.listen-address=0.0.0.0:9090 \
    > --web.enable-lifecycle
    > 
    > [Install]
    > WantedBy=multi-user.target
    > 
7. Запускаем **Prometheus:**
    
    `sudo systemctl enable prometheus`
    
    `sudo systemctl start prometheus`
    
    `sudo systemctl status prometheus`
    

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled.png)

## **Настройка Node Exporter:**

1. Создайте системного пользователя:
    
    `sudo useradd --system --no-create-home --shell /bin/false node_exporter`
    
2. Загрузите средство экспорта узлов:
    
    `wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz`
    
3. Извлечение
    
    `tar -xvf node_exporter-1.3.1.linux-amd64.tar.gz`
    
4. Переместите и очистите файлы:
    
    `sudo mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/`
    
    `rm -rf node_exporter*`
    
5. Проверить как он установился
    
    `node_exporter --version`
    
6. Cобираемся использовать systemd, системный и сервисный менеджер для операционных систем Linux. Для этого нам нужно создать файл конфигурации модуля systemd:
    
    `sudo vim /etc/systemd/system/node_exporter.service`
    
    `node_exporter.service`:
    
    > [Unit]
    Description=Node Exporter
    Wants=network-online.target
    After=network-online.target
    > 
    > 
    > StartLimitIntervalSec=500
    > StartLimitBurst=5
    > 
    > [Service]
    > User=node_exporter
    > Group=node_exporter
    > Type=simple
    > Restart=on-failure
    > RestartSec=5s
    > ExecStart=/usr/local/bin/node_exporter \
    > --collector.logind
    > 
    > [Install]
    > WantedBy=multi-user.target
    > 
7. Запустить **Node Exporter**
    
    `sudo systemctl enable node_exporter`
    
    `sudo systemctl start node_exporter`
    
    `sudo systemctl status node_exporter`
    
    ![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%201.png)
    
8. Создание статическую цель для **Node Exporter:**
    
    `sudo vim /etc/prometheus/prometheus.yml`
    
    `prometheus.yml`:
    
    > ...
    > 
    > - job_name: node_export
    > static_configs:
    >     - targets: ["localhost:9100"]

## Устатновка **Grafana**

1. Установить зависимости
    
    `sudo apt-get install -y apt-transport-https software-properties-common`
    
2. Добавить ключ GPG
    
    `wget [https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb](https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb) && sudo dpkg -i grafana_9.2.4_amd64.deb`
    
3. Запустите Grafana:
    
    `sudo systemctl enable grafana-server`
    
    `sudo systemctl start grafana-server`
    
    `sudo systemctl status grafana-server`
    

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%202.png)

## Сетевой мост

1. В настройках виртуальной машины добавить 2 адаптер и выбрать там “Сетевой мост”
2. Запустить виртуальную машину. Ещё один адаптер добавился, меняем:
    
     `sudo nano /etc/netplan/00-installer-config.yaml`
    
    `netplan apply`
    
    ![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%203.png)
    
    ![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%204.png)
    
    ![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%205.png)
    
    В итоге получили ip для сетевого моста: 192.168.0.104
    
3. Соединяем свой комп и виртуальную машину:

`ssh -L 9090:localhost:9090 -L 3000:localhost:3000 [johannec@192.168.0.104](mailto:johannec@192.168.0.104)`

9090-порт **Prometheus**

3000-порт **Grafana**

## Веб интерфейс

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%206.png)

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%207.png)

Логин и пароль: admin

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%208.png)

Добавить Prometheus в качестве источника данных в Grafana:

### Добавить Prometheus в качестве источника данных в Grafana:

- Войдите в Grafana и щелкните значок шестеренки (Конфигурация) на левой боковой панели.
- Нажмите «Источники данных», а затем «Добавить источник данных».
- Выберите «Prometheus» в качестве типа источника данных.
- В поле URL введите [http://localhost:9090](http://localhost:9090/).
- Нажмите «Сохранить и протестировать», чтобы проверить соединение.

## Настройка Дашбордов

- CPU Usage: 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)
- Available RAM: node_memory_MemAvailable_bytes
- Free Disk Space: node_filesystem_free_bytes
- I/O Operations: rate(node_disk_io_time_seconds_total[1m])

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%209.png)

### После запуска скрипта из второй части

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%2010.png)

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%2011.png)

### После запуска команды `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%2012.png)

![Untitled](Part%207%20Prometheus%20%D0%B8%20Grafana%2047e58bad08d3406ab737dadeced39f26/Untitled%2013.png)