# Operational notes for stag serv

Congratulations on your your purchase of a clinical recording system that has been hardened through years agile development and in-flight QA.  This document will describe operational information of that server.

The server runs as Docker style containers on a digital ocean host.  the containers allow the separation of the server into well defined process environments: web server, web application, API server, Database engine. The main interface to the container envirnment are the programs `docker` and `docker-compose` run from the bash command line.

## `docker` and `docker-compose`

>> I will not go into detailed explanation of these as they change command syntax from time to time.  Just grab the latest web based references, including Dr. Google and Ms. Wikipedia.
>> `docker-compose` looks for a `docker-compose.yml` file in the current directory, and complains if it does not see one.  That file describes the configuration in a most human readable form.
>>
>> `docker-compose` shows the running containers, stops or starts them, kills or removes the containers for update if needed. `docker` itself is a lower level tool for working with a single container and does not really have access to the interconnections described in the `docker-compose.yml` file.

## The Unspoken stuff
When you login with the unspoken passwords, by ssh or scp, you will be user `root` -- The system may greet you with suggested or required updates.  Make sure the server is *shut down* if you need to re-boot after an update with `apt-get`.

## The simple stuff -- getting a mongoDB backup

One of the first requirements is that we be able from catastrophic shutdowns of the cloud servers.  The first hazard is a corrupted mongo database.

This backup method allows for recovering the DB on specific system restarts, which should be done "often."   All patient data after the date of the restore tar file will be lost.
  
All commands are issued in the `/retro` directory that contains the `docker-compose.yml`:

### Stopping the server

1) Log in as root, cd to /retro
1) check the status by running the shell command `docker-compose ps`
1) stop the system with a soft shutdown of `docker-compose stop`
1) Check to see if the system is stopped with the shell command `docker-compose ps`

### Generating or Restoring the Backup

1) Tar up the entire db sub directory with `tar tgz db >database.tgz`.  That's your back up.  Simply untar it to restore mongo on the next start-up.  Or really screw mongo up if you try that on a running system. Bin there Dun that.  Check the logs with `docker-compse logs`, make sure the process have all been shutdown before running the tar.
1) Move the old db directory away so that it's old contents are no longer accessable. Put it and the log files someplace safe if you want forensic information.
1) Untar the tar file `tar txz database.tgz`


### Starting the server
1) Check to see if the system is stopped with the shell command `docker-compose ps`
1) issue the command `nohup docker-compose start`.  That command will allow the processes to continue after you log out.

### more elaborate alternatives

Mongo recommends running with distributed servers to provide redundancy, it's part of their philosophy on getting back-ups without stopping the entire DB service.  At this moment we are running on a single server, as we retired the slave at end-of-life. Mongo has deprecated master-slave clusters.

If there is a failure or unprotected re-boot, there is a likelyhood of mongo database corruption.  Any sort of automatic restart would disallow error triage, and might likely bring up a system in an unstable state.
