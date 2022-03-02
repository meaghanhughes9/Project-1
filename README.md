# Project-1
Automated ELK Stack Deployment



The files in this repository were used to configure the network depicted below.

[Network Diagram](https://github.com/meaghanhughes9/Project-1/blob/e368bf60a058f995719b8d7bcc4880558364e5fc/Diagrams/Meaghan%20Hughes%20Project%201%20Diagram.jpg)



These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  [install-elk.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/install-elk.yml)
  
  [pentest.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/pentest.yml)
  
  [filebeat-playbook.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/filebeat-playbook.yml)
  
  [filebeat-config.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/filebeat-config.yml)
  
  [metricbeat-playbook.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/metricbeat-playbook.yml)
  
  [metricbeat-config.yml](https://github.com/meaghanhughes9/Project-1/blob/9c415e9b4baa72808abd3920026dc13ff2d5a42f/Ansible/metricbeat-config.yml)



This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and stable, in addition to restricting access and traffic to the network.

What aspect of security do load balancers protect? 
Load balancers help to distribute web traffic evenly across the network's servers and helps to mitigate DoS attacks. The health probe function can check the machines behind it, keeping track of which machines have issues and avoid sending traffic to said machines. This protects the redundancy aspect of a network and adds resiliency.

What is the advantage of a jump box?
A jump box is advantageous because it's a hardened and monitored device that controls access to other internal devices. Having to access the network via SSH is more secure.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and file system logs.
What does Filebeat watch for?
Filebeat watches for any changes made to the file system. It monitors log files or locations specified, collects log events, and forwards them to Elasticsearch/Logstash for indexing. 
What does Metricbeat record?
Metricbeat records machine metrics and outputs the data to the specified location, Elasticsearch or Logstash. 

The configuration details of each machine may be found below.


|         Name         |     Function     | IP Address Private/Public | Operating System |
|:--------------------:|:----------------:|:-------------------------:|:----------------:|
| JumpBox Provisioner  |      Gateway     |  10.0.0.4/20.120.119.218  |       Linux      |
|       Web-VM 1       |    Web Server    |   10.0.0.5/40.87.106.122  |       Linux      |
|       Web-VM 2       |    Web Server    |   10.0.0.6/40.87.106.122  |       Linux      |
|        Elk-VM        | Elk Stack Server |   10.1.0.4/52.159.114.87  |       Linux      |


Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
75.72.136.50 (Local Host IP address)

Machines within the network can only be accessed by the JumpBox Provisioner.
Which machine did you allow to access your ELK VM? What was its IP address?
JumpBox Provisioner 
Private/Public IP = 10.0.0.4/20.120.119.218


A summary of the access policies in place can be found in the table below.

|         Name         | Publicly Accessible |     Allowed IP Addresses     | Port |
|:--------------------:|:-------------------:|:----------------------------:|:----:|
| Jump Box Provisioner |         Yes         |            Host IP           |  22  |
|       Web-VM 1       |          No         | JumpBox via Docker container |      |
|       Web-VM 2       |          No         | JumpBox via Docker container |      |
|     Load Balancer    |          No         |            Host IP           |  80  |
|      Elk Server      |          No         |            Host IP           | 5601 |



Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?
Ansible is advantageous because it allows you to configure and deploy mutiple programs and machines quickly and simply which significantly reduces human error if done manually.

The playbook implements the following tasks:
- Configures the machine with Docker.
- Installs Docker.io and pip3.
- Downloads and configures ELK docker container.
- Activates ports 5601, 9200, and 5044.
- SSH into the JumpBox Provisioner (ssh azureuser@20.120.119.218)
- Start & attach to Ansible docker (sudo docker start infallible_germain) & (sudo docker attach infallible_germain)
- Navigate to /etc/ansible and create the Elk playbook (cd /etc/ansible) & (nano install-elk.yml) Elk playbook includes increasing memory, installing docker.io, python3-pip,   & docker. 
- Ran the Elk playbook in the directory (ansible-playbook install-elk.yml)
- SSH from Ansible container into the Elk Server to verify the connection (ssh azureuser@10.1.0.4)


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[docker ps screenshot](https://user-images.githubusercontent.com/88637028/147315953-85b49f9f-b7b2-44bb-ac08-fc276c55bc5d.jpg)


Target Machines & Beats

This ELK server is configured to monitor the following machines:
Web-1 VM 10.0.0.5
Web-2 VM 10.0.0.6

We have installed the following Beats on these machines:
Filebeat and Metricbeat were both successfully installed on the Web VMs listed above.

These Beats allow us to collect the following information from each machine:
Filebeat collects data about the file system and logs events on log files or locations that are specified. Examples of files that could be stored are Apache or Logstash. 
Metricbeat collects machine metrics and shows machine health. Examples could be uptime, CPU usage, diskio, info, memory, or healthcheck. 

Using the Playbook:
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files
- Update the filebeat-config.yml file to include Elk private IP (10.1.0.4) in lines 1105 and 1806.
- Run the playbook and navigate to http://52.159.114.87:5601 (Elk-VM Public IP) to check that the installation worked as expected.

- Copy the metricbeat-config.yml file to /etc/ansible/files
- Update the metricbeat-config.yml file to include Elk private IP (10.1.0.4) in lines 62 and 95. 
- Run the playbook and navigate to http://52.159.114.87:5601 (Elk-VM Public IP) to check that the installation worked as expected. 

Answer the following questions to fill in the blanks:
- Which file is the playbook? 
  filebeat-playbook.yml & metricbeat-playbook.yml
- Where do you copy it?
  /etc/ansible/roles
- Which file do you update to make Ansible run the playbook on a specific machine? 
  /etc/ansible/hosts file (adding IPs of virtual machines)
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?
  Two separate groups in the /etc/ansible/hosts file are specified. One group is elkservers which will have the Elk-VM Private IP (10.1.0.4). The other group will be webservers which has the Web-VMs Private IPs (10.0.0.5 & 10.0.0.6) with Filebeat installed. 
- Which URL do you navigate to in order to check that the ELK server is running?
  http://52.159.114.87:5601/app/kibana
  

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

Playbook:
- SSH into JumpBox Provisioner from Local Desktop:
  ssh azureuser@20.120.119.218
 
- Start & Attach docker container:
  sudo docker start infallible_germain
  sudo docker attach infallible_germain
  
- Navigate to /etc/ansible and create the Elk playbook:
  cd /etc/ansible & nano install-elk.yml (Elk playbook includes increasing memory, installing docker.io, python3-pip, & docker).
    
- Run the Elk playbook in the directory: 
  ansible-playbook install-elk.yml
    
- SSH from Ansible container into the Elk Server to verify the connection:
  ssh azureuser@10.1.0.4
  
Config files:
  
 - SSH into JumpBox Provisioner & Start/Attach Ansible Container:
   ssh azureuser@20.120.119.218
   sudo docker start infallible_germain
   sudo docker attach infallible_germain
   
 - Run curl command to get Filebeat config file:
   curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat >> /etc/ansible/files/filebeat-   config.yml
    
 - Edit the /etc/ansible//files/filebeat-config.yml
   Replace IP addresses on lines 1105 & 1806 with Elk-VMs Private IP & save
    
 - Run curl command to get Metricbeat config file:
   curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f53/metricbeat >> /etc/ansible/files/metricbeat-config.yml
  
 - Edit the /etc/ansible/files/metricbeat-config.yml
   Replace IP addresses on lines 62 & 95 with Elk-VMs Private IP & save
