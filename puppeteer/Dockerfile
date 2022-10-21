FROM ghcr.io/puppeteer/puppeteer:18.0.0

ENV DEBIAN_FRONTEND=noninteractive
ENV VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=password \
    VNC_VIEW_ONLY=false \
    VNC_PORT=5901 \
    NO_VNC_PORT=6080 \
    DISPLAY=:1

EXPOSE $VNC_PORT $NO_VNC_PORT

USER root

RUN echo "America/Bogota" > /etc/timezone
RUN apt-get install -y --no-install-recommends tzdata
RUN dpkg-reconfigure -f noninteractive tzdata

# Update package lists
# Install desktop and VNC server
RUN apt-get update -y && \
    apt-get install -y \
    --no-install-recommends \
    openbox \
    xfonts-base xfonts-75dpi xfonts-100dpi \
    tightvncserver \
    novnc \
    websockify \
    python-numpy && \
    apt-get autoclean -y && \
    apt-get autoremove -y

# ENV PASSWORD=password
# ENV VIEW_PASSWORD=password

# COPY ssl /etc/ssl

# RUN chmod 644 /etc/ssl/novnc.pem

RUN chmod -R 777 /var

USER pptruser
ENV USER=pptruser

RUN mv package.json package.json.old && mv package-lock.json package-lock.json.old

RUN yarn add \
    puppeteer \
    puppeteer-extra \
    puppeteer-extra-plugin-stealth \
    puppeteer-extra-plugin-adblocker \
    puppeteer-extra-plugin-devtools \
    puppeteer-extra-plugin-recaptcha \
    puppeteer-extra-plugin-repl \
    puppeteer-extra-plugin-block-resources \
    puppeteer-extra-plugin-flash \
    puppeteer-extra-plugin-anonymize-ua \
    puppeteer-extra-plugin-user-preferences \
    csv-parser \
    totp-generator

EXPOSE 5901
EXPOSE 6080
EXPOSE 9222

USER root
RUN apt-get update -y && apt-get install -y feh
RUN mkdir /usr/share/backgrounds
COPY pexels-dan-cristian-paduret-4041750.jpg /usr/share/backgrounds

RUN echo "puppeteercontainer" > /etc/hostname
RUN echo "127.0.0.1	localhost" > /etc/hosts
RUN echo "127.0.0.1	puppeteercontainer" >> /etc/hosts

USER pptruser

RUN mkdir .vnc
COPY --chown=pptruser xstartup .vnc/xstartup
RUN chmod a+x /home/pptruser/.vnc/xstartup
RUN touch /home/pptruser/.vnc/passwd
RUN chmod go-rwx /home/pptruser/.vnc
RUN touch /home/pptruser/.Xauthority

ENV COUNTRY_CODE=US \
    REGION=region \
    CITY=city \
    COMPANY=company \
    DEPARTMENT=department \
    FQDN=* \
    ADM_EMAIL=admin@localhost.local

# nodaemon set to fale because we can have it run in foreground via cli options
COPY --chown=pptruser startvncserver.sh /home/pptruser
RUN chmod a+x /home/pptruser/startvncserver.sh

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT [ "docker-entrypoint.sh" ]