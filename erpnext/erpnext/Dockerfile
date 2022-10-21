FROM node:14-bullseye
ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Bogota
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt-get install -y locales && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen
RUN locale-gen
RUN apt update && apt-get install -y git python3-dev python3-setuptools python3-pip python3-venv libmariadb-dev redis-server curl xvfb libfontconfig wkhtmltopdf cron mariadb-client  && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}
RUN echo '[global]' | tee /etc/pip.conf && \
    echo 'timeout = 1000' | tee -a /etc/pip.conf && \
    echo 'no-cache-dir = true' | tee -a /etc/pip.conf
ENV PIP_CONFIG_FILE /etc/pip.conf
RUN pip3 install frappe-bench
RUN useradd -ms /bin/bash frappe
USER frappe
WORKDIR /home/frappe
RUN bench init frappe-bench --frappe-branch version-13
WORKDIR /home/frappe/frappe-bench
RUN bench get-app erpnext --branch version-13
COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["bench", "start"]

