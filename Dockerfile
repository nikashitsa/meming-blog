FROM nginx:1.12.2

COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
COPY ./_site /usr/share/nginx/html
