# vulnbox_1
practice box
some budget hackthebox 

```
THE GENERAL PATH
Box 1 (Easy)

Public facing wordpress site, vulnerable plugin https://www.exploit-db.com/exploits/39575 (LFI #1)
Uses Box 2 mysql in wp-config attacker can find mysql container ip and creds for wordpressuser
have a upload directory requiring creds from the LFI. Upload webshell (no filter on php files #2)
privesc: python capabilities are on (Vuln #3)
loot and find root creds for Box 2 mysql root and drupal (Plaintext Creds #4). Do it some some SMTP fancy shit. 

Box 2 (Medium)
Has container with mysql open to all ips. https://www.exploit-db.com/exploits/49765 command inject (#5)
container breakout (#6)
ansible crontab running as root, ansible editable by d (#7 too many privs on one user)
alt route
Running Drupal (accessible through box 1). Drupalgeddon (#)
SUID executable that runs docker commands. Utilize path injection. (source code on the side). (#9)
```

These boxes are separated into two phases, an easy initial phase and then a harder later phase.
Basic enumeration will show the attack that wordpress is running and that there is a password-locked /dev directory that requires non-default credentials. Additional enumeration will reveal a vulenrable wordpress plugin that grants LFI, and reading the wp-config.php file will disclose credentials for a remote mysql database. Those credentials are shared with the /dev directory which allows for file upload, and the files can then be access from /uploads. With an initial foothold, enumeration reveals that python has capabilities set and root is obtained easily. To pivot into the second box, the attacker has to loot the box they rooted. A locally running mail service with default credentials discloses an email that has credentials for admin on drupal and a mysql root user.

The attack has two routes to pick: utilizing the sql credentials or taking the Drupal path. The drupal path has the attacker access the drupal web server of the second box and authenticating. Enumeration reveals that it is vulenrable to a Drupalgeddon exploit. With the initial foothold made, a suspicious suid executeable with its source code is exposed. An attacker leverages this by changing their path variable to gain root command execution.

Alternatively, th attacker utilizes the credentials to log into the mariadb. Enumeration reveals that it is vulnerable to CVE 2021-27928. After getting an initial foothold, the attacker should notice that they are inside of a docker container. The docker container is mounted on the local filesystem and the attacker is able to read the ssh key of a user. SSHing into the user, while the docker group seems tempting, the docker daemon is actually secured preventing root privilege escalation. However there is an automated task running as root that utilizes ansible to archive the sql directory and upload it into the /opt directory. The ansible playbook allows symlinks, so linking the directory to the root .ssh directory allows the attacker to gain root.
