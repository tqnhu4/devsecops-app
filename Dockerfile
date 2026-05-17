FROM nginx:stable-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY src/index.html /usr/share/nginx/html/index.html
COPY src/styles.css /usr/share/nginx/html/styles.css

COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chown -R nginx:nginx /var/cache/nginx
RUN chown -R nginx:nginx /var/log/nginx
RUN chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]