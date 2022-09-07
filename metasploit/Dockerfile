FROM archlinux:latest

RUN pacman -Sy
RUN pacman -S --noconfirm postgresql metasploit

RUN useradd --create-home --home-dir "/home/msfdb" --comment "Metasploit DB User" msfdb
WORKDIR /home/msfdb
COPY ./startscript startscript
RUN chown msfdb:msfdb ./startscript && chmod 700 ./startscript

USER msfdb
RUN msfdb init --component database --use-defaults

ENTRYPOINT ["./startscript"]

