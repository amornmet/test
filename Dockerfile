ARG NGINX_VERSION=1.25

FROM nginx:${NGINX_VERSION}-alpine

LABEL maintainer="system-engineer@example.com"
LABEL description="Custom Nginx for DevOps Learning"

ENV APP_ENV=production
ENV WEB_ROOT=/usr/share/nginx/html

WORKDIR ${WEB_ROOT}

RUN apk add --no-cache curl

COPY html/ .
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
