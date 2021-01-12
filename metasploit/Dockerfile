FROM ubuntu:latest

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install curl gnupg gnupg2 gnupg1 nmap lsb-release

RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt -y install postgresql

RUN mkdir /workspace && \
    cd /workspace && \
    # This line pulled from metasploit docs here: https://docs.rapid7.com/metasploit/installing-the-metasploit-framework/
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall

ENTRYPOINT ["msfconsole"]

