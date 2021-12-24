# Project-1
Cybersecurity project 1.

Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram]



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._


https://github.com/meaghanhughes9/Project-1/blob/3af3edba39133597fa7c323f2a5370a34aec53de/Ansible/install-elk.yml
Ansible/install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available/stable, in addition to restricting access and traffic to the network.
What aspect of security do load balancers protect? 
	Load balancers help to distribute web traffic evenly across the network's servers and helps to mitigate DoS attacks. They health probe function can check the machines behind it, keeping track of which machines have issues and avoid sending traffic to said machines. 
	This protects the redundancy aspect of a network and adds resiliency.
What is the advantage of a jump box?
	A jump box is advantageous because it's a hardened and monitored device that controls access to other internal devices. Having to access the network via SSH is more secure.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
What does Filebeat watch for?
	Filebeat watches for any changes made to the file system and whem. It also monitors log files or locations specified, collects logs events and forwards them to Elasticsearch/Logstash for indexing. 

What does Metricbeat record?
	Metricbeat records machine metrics and outputs the data to the specified location, Elasticsearch or Logstash. 

The configuration details of each machine may be found below.


|         Name         |     Function     | IP Address Private/Public | Operating System |
|:--------------------:|:----------------:|:-------------------------:|:----------------:|
| JumpBox Provisioner  |      Gateway     |  10.0.0.4/20.120.119.218  |       Linux      |
|       Web-VM 1       |    Web Server    |   10.0.0.5/40.87.106.122  |       Linux      |
|       Web-VM 2       |    Web Server    |   10.0.0.6/40.87.106.122  |       Linux      |
|        Elk-VM        | Elk Stack Server |   10.1.0.4/52.159.114.87  |       Linux      |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
	75.72.136.50 (Local Host IP address)

Machines within the network can only be accessed by the JumpBox Provisioner.
	Which machine did you allow to access your ELK VM? What was its IP address?
	JumpBox Provisioner 
	Private/Public IP = 10.0.0.4/20.120.119.218

A summary of the access policies in place can be found in the table below.

|         Name         | Publicly Accessible | Allowed IP Addresses |
|:--------------------:|:-------------------:|:--------------------:|
| JumpBox Provisioner  |         Yes         |     75.72.136.50     |
|       Web-VM 1       |          No         |       10.0.0.4       |
|       Web-VM 2       |          No         |       10.0.0.4       |
|        Elk-VM        |          No         |       10.0.0.4       |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
