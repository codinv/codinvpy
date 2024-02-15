FROM python:3.11-slim-bullseye
LABEL maintainer "codinv"
RUN mkdir /opt/pywd
WORKDIR /opt/pywd
COPY startup_script.py /opt/pywd/
COPY entrypoint.sh /opt/pywd/
RUN chmod +x /opt/pywd/entrypoint.sh
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN pip config --user set global.progress_bar off
RUN pip install requests
ENTRYPOINT ["sh", "/opt/pywd/entrypoint.sh"]
