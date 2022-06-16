### The files in this repository were used to configure the network depicted below.

Diagramming the Network

<img width="626" alt="image" src="https://user-images.githubusercontent.com/100730516/173994442-d8fb072d-8acf-4b2d-b7e7-195aeaa10a73.png">
https://app.diagrams.net/#G1_0WPoQRQB4Zx2jqMtvT748WqDyXb0JzG

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

Ansible/filebeat-playbook.yml
Ansible/metricbeat-playbook.yml

This document contains the following details:

- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box?
Load Balancers protect against denial of service attacks (DDoS) because the load balancer analyzes the traffic coming in and determines what server to send the traffic to. This prevents one server from getting overloaded with traffic because the load balancer allows traffic to be distributed evenly among the servers that are connected to it. It is also common for load balancers to have a health probe that periodically checks that a machine is working properly before sending traffic. If it isn't, the load balancer will divert traffic from the malfunctioning server until the issue is resolved. A jump box limits the access that the public has to your virtual network because in order to access the other virtual machines, an individual needs the private IPs of the machines. A jumpbox allows greater control over access to a virtual network and its contents.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- What does Filebeat watch for?
Filebeat looks for changes in files and when they occurred by looking at log files because Filebeat generates and organizes log files.

- What does Metricbeat record?
Metricbeat records metrics from the Operating system and services running on the server. By using Elasticsearch or Logstash, you can visualize the metrics and statistics that Metricbeat generates from the OS and running services.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     |              Function             | IP Address |     Operating System     |
|----------|-----------------------------------|------------|--------------------------|
| Jump Box | Gateway & runs docker w/ Ansible  | 10.2.0.4   | Linux Ubuntu 18.04.5 LTS |
| Web-1    | Web Server used to run DVWA       | 10.2.0.5   | Linux Ubuntu 18.04.5 LTS |
| Web-2    | Web Server used to run DVWA       | 10.2.0.6   | Linux Ubuntu 18.04.5 LTS |
| Elk-VM   | Run Elk Container & Cabana        | 10.0.0.4   | Linux Ubuntu 18.04.5 LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 157.245.13.235 (my public IP)

Machines within the network can only be accessed by Jump-Box-Provisioner VM.
- Which machine did you allow to access your ELK VM? Jump-Box-Provisioner VM
- What was its IP address? 40.122.113.59

A summary of the access policies in place can be found in the table below.

|     Name      | Publicly Accessible | Allowed IP Addresses |
|---------------|---------------------|----------------------|
| Jump Box      | Yes/No              |     52.180.146.2     |
| Web-1         | No                  |       10.2.0.4       |
| Web-2         | No                  |       10.2.0.4       |
| Elk           | Yes (via Port 5601) |     52.180.146.2     |
| Load Balancer | Yes (via Port 80)   |     52.180.146.2     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No special coding skills are necessary to use Ansible's playbooks. Therefore, there were no configurations performed manually, which is advantageous because it prevented having to configure ELK manually resulting in a more streamlined process. It also allowed more control over what was being installed and/or performed on the machine.

The playbook implements the following tasks:
- The first task of the elk playbook installs docker.io on the Elk virtual machine
- Python is then installed on the Elk VM
- Elk requires more virtual memory so this task increases the memory to 262144
- Downloads, installs and executes the docker elk container on the Elk vm on restart so the elk container doesn't need to be manually started
- This enables docker on boot so you don't have to manually start docker when you turn your VM back on.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="948" alt="image" src="https://user-images.githubusercontent.com/100730516/174190931-4aa22309-6cd5-4281-8fa3-a2d3bdaf9184.png">

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.2.0.5
- Web-2: 10.2.0.6

We have installed the following Beats on these machines:
- Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log information about the file system and specifies which files have been changed and when a file was changed to either Elasticsearch or Logstash. If you wanted to see the output from Filebeat, you would connect to Kibana and check the logs for any changes that have been made to the file system over a specific or more general time interval. For example, you would specify the container, the beat and the argument you are looking for. You can further specify by date and time range. Metricbeat shows statistics for the every process running on your system including memory, CPU usage, file system, Network IO and disk IO statics. To view the data collected, you would navigate to Kibana (assuming that your VM is already running), select the system you'd like to review and from there can view the metrics of the system.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files/filebeat-config.yml.
- Update the filebeat-config.yml file to include host "10.0.0.4:9200" w/ username "elastic" and password "changeme" andsetup.kibana host to "10.0.0.4:5601".
- Run the playbook, and navigate to Kibana (Elk GUI interface) and click "Check Data" to check that the installation worked as expected.
<img width="468" alt="CommandForAnsible-PLAYBOOK" src="https://user-images.githubusercontent.com/100730516/174191870-7650dfed-8132-4934-aad6-c63b644aa63d.png">
<img width="475" alt="Module-statusForElk" src="https://user-images.githubusercontent.com/100730516/174191842-cf9050af-0238-4d06-8223-87bb97460d86.png">

_Answer the following questions to fill in the blanks:_
- Which file is the playbook? Filebeat-playbook.yml 
- Where do you copy it? /etc/ansible/filebeat.playbook.yml
- Which file do you update to make Ansible run the playbook on a specific machine? Filebeat-config.yml
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? All private IP addresses that need to be accessed need to be added to the hosts file in order to allow connection. Adding 3 IP addresses to this file: 2 were web servers (10.2.0.5 & 10.2.0.6) and an elk server was added with IP 10.0.0.4. From there, in the playbook file, navigate to "hosts" at the top of the file to specify whether you want the playbook installed on Elk or the Web servers. In addition to this, we also have to specify the host to the ELK server for Filebeat so IP "10.0.0.4" is added to the config file to specify the location for installation.

Ansible/filebeat-config.yml

- Which URL do you navigate to in order to check that the ELK server is running?
http://40.122.113.59:5601/app/kibana#/home

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Ansible/metricbeat-playbook.yml

Create/update a playbook: Nano playbook-name.yml <---name your playbook starting with playbook-[  ].yml
After running the playbook, edit the config file host to make sure the IP is added in order to run by nanoing into the file.

To run your playbook: Ansible-playbook playbookname.yml 


