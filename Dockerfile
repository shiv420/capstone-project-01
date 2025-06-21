FROM httpd:2.4

WORKDIR /app

RUN mkdir -p /usr/local/apache2/images

COPY images/github3.jpg /usr/local/apache2/htdocs/images/

COPY index.html /usr/local/apache2/htdocs/

EXPOSE 80