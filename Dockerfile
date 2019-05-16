FROM agentejo/cockpit
COPY src /var/www/html/

RUN chown -R www-data:www-data /var/www/html

