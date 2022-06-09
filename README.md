# Project_1

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

<img src="https://github.com/fehanor/Project_1/blob/main/Diagrams/Cloud%20Net.drawio.png">

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml files may be used to install only certain pieces of it, such as Filebeat.

[Docker and DVWA](https://github.com/fehanor/Project_1/blob/main/Ansible/Pentest.yml)

[Install-elk](https://github.com/fehanor/Project_1/blob/main/Ansible/install-elk.yml)

[Filebeat](https://github.com/fehanor/Project_1/blob/main/Ansible/filebeat-playbook.yml)

[Metricbeat](https://github.com/fehanor/Project_1/blob/main/Ansible/metricbeat-config.yml)


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resiliant and available, in addition to restricting access to the network. It also allows us to distribute the traffic between multiple servers available in our infrastructure in a transparent way, providing a better experience to the customer. This also enable us to simplify aspects such as performance, scalability and security as it is a centralized point of control. 

- What is the advantage of a jump box?

The key advance of a jumpbox server is that it allows us to focus on a single host or virtual machine and implement our security all the required security policies for external connection to the intranet. This simplifies tasks such as monitoring and access control as it functions as a single point of access. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the configuration and system attacks.

Two key components are: 

Filebeat, which is primarily used to monitor system logs and any changes of them. These changes can be monitored and reviewed on Elasticsearch.

while Metricbeat allows us to monitor system resource availability and utilization.  

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.1.0.4   | Ubuntu 18.04.6 LTS |
| ELK-Sever | Monitoring | 10.0.0.4 | Ubuntu 18.04.6 LTS |
| Web-1 | Webserver | 10.1.0.5 | Ubuntu 18.04.6 LTS |
| Web-2 | Webserver | 10.1.0.6 | Ubuntu 18.04.6 LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 123.208.203.32

Machines within the network can only be accessed by Jumpbox.

Jumpbox: Public ip 20.211.185.15 / Private IP 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 123.208.203.32    |
| ELK-server | Yes -Kibana 5601  | No restricted |
| Web-1         | no             |  10.1.0.4      |
| Web-1         | no             |  10.1.0.4      |
| LB         | yes             |  123.208.203.32      |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because

It can mitigate human errors by removing manual configuration. 

it reduces the amount of work required to deploy large scale environments in a consistent way.

Deployments can be easily replicated on demand.

Guarantee consistency across the environment. 

The playbook implements the following tasks:

- Download and implement Docker and DVWA 
- Download and implement ELK on exisiting docker containers. 
- Download and implement and start filebeats and metricbeat on Webserver ansible group
- The implementation of the above also includes configuration files and required ports for the proper


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
