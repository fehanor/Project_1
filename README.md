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

<img src="https://github.com/fehanor/Project_1/blob/main/Ansible/Running%20ELK.png">

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

| Name     | Function | IP Address |
|----------|----------|------------|
| Web-1 | Webserver | 10.1.0.5 |
| Web-2 | Webserver | 10.1.0.6 |

We have installed the following Beats on these machines:

- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat allow us to collect linux logs and focus on monitoring changes and events that could represent a risk for the host

- Metricbeat is intended to monitor the performance of the target servers. This will report information such as CPU load, memory utilization and storage availability as an example.  

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible.cfg file to /etc/ansible.
- Update the /etc/ansible/hosts file to include the list of target hosts <br />
example:
```
[webservers]
10.1.0.5 ansible_python_interpreter=/usr/bin/python3
10.1.0.6 ansible_python_interpreter=/usr/bin/python3
[elk]
10.0.0.4 ansible_python_interpreter=/usr/bin/python3
```  
- Run the playbook, and navigate to ELK public IP address on port 5601 to check that the installation worked as expected.

```
root@6ceb3e23dcca:/etc/ansible# ansible-playbook install-elk.yml
root@6ceb3e23dcca:/etc/ansible# ansible-playbook filebeat-playbook.yml
root@6ceb3e23dcca:/etc/ansible# ansible-playbook metricbeat-config.yml
```
<img src="https://github.com/fehanor/Project_1/blob/main/Ansible/Kibana.png">



Additional useful commands to connect to the docker container 

List existing container 

```
azadmin@Jump-Box-Provisioner:~$ sudo docker container list -a
CONTAINER ID   IMAGE                    COMMAND                  CREATED       STATUS                          PORTS     NAMES
6ceb3e23dcca   cyberxsecurity/ansible   "/bin/sh -c /bin/bas…"   2 weeks ago   Exited (0) About a minute ago             kind_fermi
```
Verify running container 

```
azadmin@Jump-Box-Provisioner:~$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

Start your existing container

```
azadmin@Jump-Box-Provisioner:~$ sudo docker start kind_fermi
kind_fermi
```

Confirm the docker container is running 

```
azadmin@Jump-Box-Provisioner:~$ sudo docker ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED       STATUS         PORTS     NAMES
6ceb3e23dcca   cyberxsecurity/ansible   "/bin/sh -c /bin/bas…"   2 weeks ago   Up 2 seconds             kind_fermi
```

Connect to an existing dokcer container 

```
azadmin@Jump-Box-Provisioner:~$ sudo docker attach kind_fermi
```
