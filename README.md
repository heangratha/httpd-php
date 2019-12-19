# Overview
This repository for setup wordpress on minikube 

# Requirements

- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [composer](https://getcomposer.org/doc/00-intro.md)
- [docker](https://docs.docker.com/install/)
- [virtualbox](https://www.virtualbox.org/)
- git

# Installation

1. Create project directory

        mkdir ~/dev
        git clone git@github.com:heangratha/minikube-httpd-php73.git ~/dev/local-wordpress.com
        cd ~/dev/local-wordpress.com
        comopser install

2. Start minikube

        minikube start

3. Change Shared Folders minikube vm

        open virtualbox -> minikube -> right click -> Settings -> Shared Folders -> edit shared folder
        - Folder Path: ~/dev
        - Folder Nmae: projects

4. Stop and Star minikube

        minikube stop
        minikube start

5. Configure minikube allow access internal pods

        kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico-typha.yaml
        kubectl apply -f https://raw.githubusercontent.com/containous/traefik/v1.7/examples/k8s/traefik-ds.yaml
        kubectl apply -f https://raw.githubusercontent.com/containous/traefik/v1.7/examples/k8s/traefik-rbac.yaml

6. Setup wordpress project with version 5.3

        cd ~/dev/local-wordpress.com
        kubectl apply -f k8s.yaml
        minikube ip

7. Create hosts file

        sudo vi /etc/hosts
        MINIKUBE_IP local-wordpress.com

8. Test Website

        Open you favourite browser
        type: http://local-wordpress.com

You should see the new wordpress setup site pop up


### NOTE
If you want to change the domain reflect to your environment setup you can edit k8s.yaml

        line 93: 'local-wordpress.com' -> 'yourdomain.com'
