FROM debian:buster

COPY src/* ./root/

RUN ["chmod", "+x", "/root/install_script.sh"]
RUN /root/install_script.sh
