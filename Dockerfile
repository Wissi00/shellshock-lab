FROM heroku/cedar:14

# We skip apt-get update to avoid the 404 errors.
# Most old images already have apache2 and bash installed.
RUN a2enmod cgi

# Create the vulnerable script
RUN echo '#!/bin/bash\necho "Content-type: text/html"\necho ""\necho "Vulnerable Server Online."' > /usr/lib/cgi-bin/poc.cgi
RUN chmod +x /usr/lib/cgi-bin/poc.cgi

# Ensure Apache logs are visible to Docker
RUN ln -sf /dev/stdout /var/log/apache2/access.log && ln -sf /dev/stderr /var/log/apache2/error.log

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]