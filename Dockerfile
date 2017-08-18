FROM nginx
LABEL maintainer='Grady Rogers'
LABEL description='Dynamic Nginx Proxy Image'

RUN mkdir -p /etc/nginx/logs
RUN touch /etc/nginx/logs/error.log
RUN mkdir /logs
RUN touch /logs/error.log

ADD server/proxy.conf ~/proxy.conf
ADD server/ssl /etc/ssl
ADD server/bin ~/bin

WORKDIR ~

RUN chmod +x bin/run.sh
RUN chmod +x bin/config.sh

EXPOSE 443 443

ENTRYPOINT ./bin/config.sh
