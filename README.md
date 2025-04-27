Докер контейнер, после старта запускающий скрипт Python

Пробросить свой скрипт в файл: '/opt/pywd/startup_script.py' и запустить контейнер

#### Запуск с помощью Docker Compose
```yml
# docker-compose.yml
version: '3.8'
services:
  codinvpy:
    container_name: codinvpy
    image: ghcr.io/codinv/codinvpy
    network_mode: bridge
    volumes:
      - ./:/app
    environment:
      - TZ=Europe/Moscow
      - PY_SCRIPT=./startup_script.py
    restart: unless-stopped
```

#### Запуск с помощью Docker Run
```bash
docker run -d --name codinvpy \
-v ./your_python_script.py:/opt/pywd/startup_script.py \
-e TZ=Europe/Moscow \
--net bridge \
--restart unless-stopped \
ghcr.io/codinv/codinvpy
```
