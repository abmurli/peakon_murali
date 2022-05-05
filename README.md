# Murali Arumugam Bagyalakshmi

## WORKDAY ASSESSMENT:

### Steps to deploy node app
- `git clone https://github.com/abmurli/peakon_murali.git`
- `cd nodeapp`
- `docker-compose up`

```docker-compose up
[+] Running 3/3
 ⠿ Network nodeapp_default  Created                                                                                                                      0.1s
 ⠿ Container nodeapp-db-1   Created                                                                                                                      0.2s
 ⠿ Container nodeapp-web-1  Created                                                                                                                      0.1s
Attaching to nodeapp-db-1, nodeapp-web-1
nodeapp-db-1   | The files belonging to this database system will be owned by user "postgres".
nodeapp-db-1   | This user must also own the server process.
nodeapp-db-1   |
nodeapp-db-1   | The database cluster will be initialized with locale "en_US.utf8".
nodeapp-db-1   | The default database encoding has accordingly been set to "UTF8".
nodeapp-db-1   | The default text search configuration will be set to "english".
nodeapp-db-1   |
nodeapp-db-1   | Data page checksums are disabled.
nodeapp-db-1   |
nodeapp-db-1   | fixing permissions on existing directory /var/lib/postgresql/data ... ok
nodeapp-db-1   | creating subdirectories ... ok
nodeapp-db-1   | selecting dynamic shared memory implementation ... posix
nodeapp-db-1   | selecting default max_connections ... 100
nodeapp-db-1   | selecting default shared_buffers ... 128MB
nodeapp-db-1   | selecting default time zone ... Etc/UTC
nodeapp-db-1   | creating configuration files ... ok
nodeapp-web-1  | app started on http://localhost:8080/
nodeapp-db-1   | running bootstrap script ... ok
nodeapp-db-1   | performing post-bootstrap initialization ... ok
nodeapp-db-1   | syncing data to disk ... initdb: warning: enabling "trust" authentication for local connections
nodeapp-db-1   | You can change this by editing pg_hba.conf or using the option -A, or
nodeapp-db-1   | --auth-local and --auth-host, the next time you run initdb.
nodeapp-db-1   | ok
nodeapp-db-1   |
nodeapp-db-1   |
nodeapp-db-1   | Success. You can now start the database server using:
nodeapp-db-1   |
nodeapp-db-1   |     pg_ctl -D /var/lib/postgresql/data -l logfile start
```

### Steps to test
- `curl http://localhost:8080`
- output
```
Hello Fake Product%
```

### steps to run terraform
- git clone https://github.com/abmurli/peakon_murali.git
- cd terraform
- terraform init
- terraform plan
- terraform apply

### Things to consider and improve.

#### Node app deployment
- Parameterize the ports
- Docker volume (persistent)
- Try catch block to check the status and connectivity of postgres
- Orchestrate the build and deployment
- Manage credentials with docker secret
- Logging the access

#### Terraform
- Restrict Admin access to users.
- Create a developer role and users to assume the developer role to access resources
- Scrutinize the SG and NACL ingress and egress rules
- Deny programmatic access to users with admin privilege
- Consider AWS session manager to access private EC2
