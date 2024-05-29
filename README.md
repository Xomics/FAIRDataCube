## Introduction

FDCube is implemented as a catalog item on SURF Research Cloud (SRC). To use this “turn-key” solution, you need to have an access to the SRC platform and cloud resources. To get on board, please, check the following [documentation page](https://servicedesk.surf.nl/wiki/display/WIKI/Get+a+budget+for+Research+Cloud).  
Please, note, that only the researchers who are affiliated with Dutch institutions that are members of SURF can apply for NWO grants.  

If you would like to have FD-Cube on your local machine, please, follow the steps for the local deployment.

If you would like to set up FD-Cube on an infrastructure that is not SRC, you need to install all of the dependencies, such as Nginx, Ansible, Docker and Docker Compose by yourself. You can use these scripts as a guidance and adapt them to your infrastructure of interest. 

## Definitions
SRC-specific definitions that are used in this documentation page: 

- A workspace is a virtual machine (VM) with or without some extra software installed.
- A component is one script (Ansible Playbook, Powershell or Docker Compose) that realizes a particular feature in a workspace. This feature might be OS-related, like an alternative login method. Or a component might, for instance, install a particular software package.
- A catalog item is a sequence of components that are run in a given order when a workspace is created.

## “Turn key” solution
This section describes how to use FD-Cube as a catalog item on SRC. Before starting, make sure that you have credits to use SRC and you are able to log in to the SRC portal: [https://portal.live.surfresearchcloud.nl](https://portal.live.surfresearchcloud.nl)

Once you are logged in to the portal, you can start a workspaces that will have FD-Cube installed and configured. Go to “Create new workspace” panel on the top left and select “Create New”. You will be redirected to the “Create your workspace” wizard, where you will be guided through several steps to create a workspace. 
Firstly, choose your collaborative organization and a wallet that you would like to use for this project. Then, on the step “Catalog item” you flip through the catalog and select “FD-Cube” as you catalog item. Then you need to select the cloud provider, operating system (Ubuntu 22.04 is the only one choice) and a size of your VM (number of cores and amount of RAM). 
On the next step, you can attach an external storage volume, reserved IP and private network to your VM. All of this is optional, although we highly recommend to attach an external volume to your VMs and use it for storing data (read more about it [here](https://servicedesk.surf.nl/wiki/display/WIKI/External+storage+volumes)). 
On the last step, you can give a name and a hostname of your workspace, and press “submit”. 
After that, your workspace is being created. Please, note, that it can take up to 10 minutes for the workspace to create.

## UI access
When the status of your workspace is “running”, you can press the access button. You will be re-directed to the starting page of the FD-Cube which contains links to the user interface of Fair Data Point, GraphDB and Vantage6. Via these links you can work with the following services in a browser.

## SSH access
If you would like to have an ssh access to your workspace, first you need to make sure that you have a public/private ssh key pair set up in your SURF research Cloud profile. 
This has to be done once. Follow the steps in the following [documentation page](https://servicedesk.surf.nl/wiki/display/WIKI/Log+in+to+your+workspace), section “Workspace access with SSH”. After you set your key pair, it takes around 10 minutes to become usable, so don’t worry if you ssh access doesn’t work right away. 
Then go to the portal, navigate to your workspace in the list of running workspaces, expand the information about your workspace and copy the IP of your VM. After that, go to your terminal and use ssh to connect to your VM: 

```sh
  ssh <USERNAME>@<SRVER-IP>
```


To interact with containers, you need to have sudo rights. If you do not have sudo rights, please, check the following [documentation page](https://servicedesk.surf.nl/wiki/display/WIKI/Flag+a+CO-member+as+SRC+administrator) and ask an admin of your collaborative organization to add you to the “src_co_admin” group. 

If you would like to make changes to the docker-compose files or any configurations, you can do it in a following fashion:

For Vantage6, navigate to: cd /opt/vantage6/ 
The docker-compose.yml that is related to Vantage6 services runs two containers: 
- Vantage6 server
- Vantage6 UI

For Graph DB and Fair Data Point, navigate to: cd /rsc/plugins/fdcube/
The docker-compose.yml that is related to Graph DB and Fair Data Point services runs two containers: 
- Fair Data Point server
- Fair Data Point client
- Fair Data Cube - Graph DB repo manager
- Graph DB
- Mongo for FDP server
<!--
- Cde-box-daemon
- Yarrrml parser
- Rdfizer
-->

After you enter the desired folder, to stop all the containers use: 
```sh
docker compose down
```

If you are making changes to the environment variables of your docker compose file, you can re-start it without rebuilding images: 
```sh
docker compose up -d 
```

If you make changes to the docker compose file, you need to rebuild and the images that were affected and re-start everything: 
```sh
docker rm <container_id>
docker compose up -d
```

## Structure of the FD-Cube catalog item

FDCube catalog item consists of 7 components. Please, note that the components with the SRC- prefix are system components managed by the SRC. The components without the SRC prefix are custom components that install the software. 

- SRC-OS - installs Ubuntu 22.04 on a VM
- SRC-CO - checks for the members of the collaborative organization and sets up their roles in the workspace
- SRC-Nginx - installs and configures Nginx 
- SRC-External plugin - installs Ansible on the VM and executes the following Ansible playbooks
- Docker Environment - installs Docker and Docker Compose
- Vantage6 Server - installs dependencies and starts Vantage6 server and UI.
- FD-Cube - configures Nginx and starts Fair Data Point and Graph DB

This repository contains scripts for Vantage6 Server and FD-Cube components. The other components used in this catalog item are from SURF.  

