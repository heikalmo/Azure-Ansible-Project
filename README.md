# Azure-Ansible-Project
This is a a project on Azure's Cloud platform.

3 virtual machines have been created in this Architecture.
1 machine is used as the master configurator of a resource group called REDTEAM. This VM contains a docker container- Ansible. Inside the Ansible container are the scripts for implementing DVWA containers for the other 2 VM's, along with the configuration files.

2 Virtual machines have been setup to run a DVWA container to host a website behind a Firewall and loadbalancer service provided by Azure.
