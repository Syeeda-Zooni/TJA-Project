FROM nginx:alpine

RUN rm r-f /usr/share/nginx/html/*

COPY website/index.html.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off"]
