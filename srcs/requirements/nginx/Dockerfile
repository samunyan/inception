FROM debian:bullseye

RUN apt update
RUN apt upgrade -y
RUN apt install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 -keyout /etc/ssl/private/inception.key \
        -out /etc/ssl/certs/inception.crt -subj "/CN=$samunyan.42.fr"

COPY nginx.conf /etc/nginx/conf.d/inception.conf

WORKDIR /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]