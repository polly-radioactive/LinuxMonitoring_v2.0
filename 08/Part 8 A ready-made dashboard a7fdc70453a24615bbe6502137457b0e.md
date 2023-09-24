# Part 8 A ready-made dashboard

1. Установить готовый дашборд *Node Exporter Quickstart and Dashboard* с официального сайта **Grafana Labs**

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled.png)

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%201.png)

1. Провести тесты из 7 части
- Запуск скрипта из 2-го парта
    
    ![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%202.png)
    
    ![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%203.png)
    
- После запуска команды `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%204.png)

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%205.png)

## **Second VM created in the same network:**

1. Создал вторую виртуальную машину и добавила сетевой мост

Первая виртуальная машина:

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%206.png)

Вторая виртуальная машина:

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%207.png)

1. Запуск `iperf3`

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%208.png)

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%209.png)

## **Monitoring output during iperf3 execution**

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%2010.png)

![Untitled](Part%208%20A%20ready-made%20dashboard%20a7fdc70453a24615bbe6502137457b0e/Untitled%2011.png)