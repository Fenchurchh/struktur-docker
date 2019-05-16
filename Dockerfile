FROM agentejo/cockpit

RUN mkdir /var/www/html

#COPY src /var/www/html/

RUN chown -R www-data:www-data /var/www/html

