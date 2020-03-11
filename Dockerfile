FROM python:3.8.2-alpine

LABEL maintainer="subhead" \
      description="MQTT 2 InfluxDB relay bridge"	  

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY requirements.txt mqtt_bridge.py /app/

RUN apk add supervisor \
	&& pip install -r /app/requirements.txt

WORKDIR /app

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]