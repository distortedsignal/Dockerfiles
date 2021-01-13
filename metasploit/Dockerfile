FROM ubuntu:latest

RUN apt -y update && \
    apt -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt -y install curl gnupg gnupg2 gnupg1 nmap postgresql

RUN mkdir /workspace && \
    cd /workspace && \
    # This line pulled from metasploit docs here: https://docs.rapid7.com/metasploit/installing-the-metasploit-framework/
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall

RUN adduser --disabled-password --gecos "Metasploit DB User" msfdb
USER msfdb
RUN msfdb init --use-defaults

EXPOSE 5443

ENTRYPOINT ["msfconsole"]

