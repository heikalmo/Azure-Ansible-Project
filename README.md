# Azure-Ansible-Project
This is a a project on Azure's Cloud platform.

4 virtual machines have been created in this Architecture.
1 machine is used as the master configurator of a resource group called REDTEAM. This VM contains a docker container- Ansible. Inside the Ansible container are the scripts for implementing DVWA containers for the other 2 VM's, along with the configuration files.

2 Virtual machines have been setup to run a DVWA container to host a website behind a Firewall and loadbalancer service provided by Azure.

1 Virtual machine has been setup to run an ELK Stack which will monitor the Docker log files and access logs to the web servers.


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below. 

[Network Diagram](Diagrams/ELK_project.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available , in addition to restricting unauthorized access to the network.
Load balancers distribute the web server requests. It balances the resources of the indivudal virtual machines and protects from denial of services attack. The load balancer balances the requests to the web servers' internal IP address. Similarly, the jumpbox virtual machine is used to communicate with the internal resource, rather than have a remote machine SSH from outside the network- this provides an extra layer of security. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the web logs and system Log.
The ELK server is currently configured to gather filebeats- which are the event logs on the virtual machines
With the metricbeat configuration the ELK server will gather metrics from the operating system and services running on the virtual machines

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function          | IP Address | Operating System |
|---------- |-------------------|------------|------------------|
| Jump Box  | Gateway           | 10.0.0.4   | Linux            |
| WEB1      | Website Server 1  | 10.0.0.5   | Linux            |
| WEB2      | Website Server 2  | 10.0.0.6   | Linux            |
| ELK Server| ELK Server        | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer and jumpbox machine can accept connections from the Internet. Access to these machine is only allowed from the following IP addresses:
-My personal machine at home IP address: 24.150.88.100 is allowed SSH ( port 20) and TCP( port 80) access to Redteam network.

Machines within the network can only be accessed by the Jumpbox machine and ELK server.
-My personal machine at home IP address: 24.150.88.100 was allowed a TCP connection on ( port 5601) to access the ELK server.
- 

A summary of the access policies in place can be found in the table below.

| Name           | Publicly Accessible | Allowed IP Addresses |
|----------------|---------------------|----------------------|
| Jump Box       | Yes                 | 13.82.110.86         |
| Load Balancer  | Yes                 | 40.121.145.224       |
| ELK Server     | Yes                 | 13.91.246.73         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- You are able to perform mass enterprise configuration to multiple machines. This reduces the risk of human error and variance when compared to manually configuring a machine indivdually.

The playbook implements the following tasks:
- At the header it specifies to target elk group with the apropriate user name
- Install Docker.io with the apt install command
- Install Python3 as a prerequesite supporting software
- Increase the virtual memory via a systemctl command
- Allocate the increased virtual memory to the system
- Download the Elk container from Docker hub called: sebp/elk:761 and configure the used ports
- Finally it will enable docker to always rerun even after a reboot.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

**Note**: The following image link needs to be updated. Replace `docker_ps_output.png` with the name of your screenshot image file.  

[docker ps command](Ansible/Images/ELK_container_running.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- The playbook is specified to install configuration files on the webservers group.
  This group contains the IP addresses of web1( 10.0.0.5) and web2( 10.0.0.6)  

We have installed the following Beats on these machines:
- Filebeats and Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeats is an agent that will collect all log files, or specified ones, to record events and forwards them to the ELK server. In our case it displays who & when a user logged in, when archiving events happened, etc.
- Metricbeats is used to collect metrics from the operating system and services running on a machine. In our case it records the number of visits, data bytes shared, and DVWA service up time.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the /Ansible/filebeat-config file to Ansible docker machine ( control node).
- Update the filebeat-config file to include the Host's IP address of the ELK Server
- Run the filebeat-playbook, and navigate to agent machines (in our case, web1 and web2) to check that the installation worked as expected using "docker ps" command
