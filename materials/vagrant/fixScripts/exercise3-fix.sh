#!/bin/bash
sed -i 's/all denied/all granted/g' /etc/apache2/sites-available/000-default.conf
systemctl restart apache2.service
