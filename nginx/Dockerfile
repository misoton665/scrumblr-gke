FROM nginx

ADD app.conf /etc/nginx/conf.d
ADD .htpasswd /etc/nginx

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
