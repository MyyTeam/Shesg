FROM nginx:latest
COPY ./dist/             /usr/share/nginx/html
COPY ./default.conf      /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
