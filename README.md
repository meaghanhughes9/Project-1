# Project-1
Cybersecurity Project 1.

Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram]  INSERT DIAGRAM!!!!!!!!!!



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

Load balancing ensures that the application will be highly available/stable, in addition to restricting access and traffic to the network.

What aspect of security do load balancers protect? 
Load balancers help to distribute web traffic evenly across the network's servers and helps to mitigate DoS attacks. They health probe function can check the machines behind it, keeping track of which machines have issues and avoid sending traffic to said machines. This protects the redundancy aspect of a network and adds resiliency.

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


Access Policies

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
| JumpBox Provisioner  |         Yes         |     75.72.136.50     |			UPDATE TABLE!!!!!!!!!
|       Web-VM 1       |          No         |       10.0.0.4       |
|       Web-VM 2       |          No         |       10.0.0.4       |
|        Elk-VM        |          No         |       10.0.0.4       |


Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?
Ansible is advantageous because it allows you to configure and deploy mutiple programs and machines quickly and simply which significantly reduces human error if done manually.

The playbook implements the following tasks:
- SSH into the JumpBox Provisioner (ssh azureuser@20.120.119.218)
- Start & attach to Ansible docker (sudo docker start infallible_germain) & (sudo docker attach infallible_germain)
- Navigate to /etc/ansible and create the Elk playbook (cd /etc/ansible) & (nano install-elk.yml)
- Ran the Elk playbook in the directory (ansible-playbook install-elk.yml)
- SSH into the Elk Server to confirm it is up and running (ssh azureuser@10.1.0.4)


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[docker ps screenshot](https://user-images.githubusercontent.com/88637028/147315953-85b49f9f-b7b2-44bb-ac08-fc276c55bc5d.jpg)


Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 VM 10.0.0.5
Web-2 Vm 10.0.0.6

We have installed the following Beats on these machines:
Filebeat and Metricbeat were both successfully installed on the Web Vms listed above.

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat collects data about the file system
Metricbeat collects machine metrics, such as uptime. 

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
