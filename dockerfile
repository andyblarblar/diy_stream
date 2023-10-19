FROM ubuntu

# Deps
RUN apt update && apt-get install nginx libnginx-mod-rtmp -y

COPY nginx.conf /etc/nginx/nginx.conf
COPY stat.xsl /usr/local/nginx/html/stat.xsl

# Folder for DASH/HLS stream fragments
RUN mkdir /var/www/html/stream

CMD ["nginx", "-g", "daemon off;"]