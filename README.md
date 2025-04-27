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
docker run -d \
  --name codinvpy \
  --network bridge \
  -v "$(pwd)":/app \
  -e TZ=Europe/Moscow \
  -e PY_SCRIPT=./startup_script.py \
  --restart unless-stopped \
  ghcr.io/codinv/codinvpy
```
