# Metasploit

[Metasploit](https://www.metasploit.com/) is a penetration testing tool that is provided by [Rapid7](https://www.rapid7.com/).

This should be a relatively simple container that brings up a Metasploit web console and dumps the user into the `msfconsole`.

## Using the Container

This container should **NEVER** be pushed to any sort of container registry.

Because of the tools contained in this image, the image size should be very large. I would rather not force either Docker Hub or another container registry to store and serve all that data.

Please pull the code and run the commands on your own local host.

### Step 1: Pull the Code

```sh
> git clone git@github.com/distortedsignal/Dockerfiles.git
...
> cd Dockerfiles
```

### Step 2: Build the Container
```sh
> docker build -t metasploit metasploit
...
```

### Step 3: Run the Container
```sh
> docker run -it --rm --name metasploit -p 8080:8080 metasploit
...
msf6 >
```

### Step 4: Try It Out

```sh
msf6 > # Add hosts and host services to the database via db_nmap
msf6 > db_nmap -v -p 1-60000 -sU -sT -A ${list-of-ip-addresses}
...
```

