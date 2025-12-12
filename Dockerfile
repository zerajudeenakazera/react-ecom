from nginx:alpine3.23-slim

RUN rm -rf /usr/share/nginx/html/*

copy /build /usr/share/nginx/html

expose 80

CMD ["nginx", "-g", "daemon off;" ]
