#!/bin/bash

if [ "$RUNTIME" == "" ]; then
    if [ -S /var/run/docker.sock ]; then
        RUNTIME="docker"
    elif [ -S /var/run/crio/crio.sock ]; then
        RUNTIME="crio"
    else # default
        RUNTIME="containerd"
    fi
fi

# create a single-node K3s cluster
if [ "$RUNTIME" == "docker" ]; then # docker
    CGROUP_SYSTEMD=$(docker info 2> /dev/null | grep -i cgroup | grep systemd | wc -l)
    if [ $CGROUP_SYSTEMD == 1 ]; then
        curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.23.9+k3s1" K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable=traefik --docker --kubelet-arg cgroup-driver=systemd" sh -
        [[ $? != 0 ]] && echo "Failed to install k3s" && exit 1
    else # cgroupfs
        curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.23.9+k3s1" K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable=traefik --docker" sh -
        [[ $? != 0 ]] && echo "Failed to install k3s" && exit 1
    fi
elif [ "$RUNTIME" == "crio" ]; then # cri-o
  curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable=traefik --container-runtime-endpoint unix:///var/run/crio/crio.sock --kubelet-arg cgroup-driver=systemd" sh -
  [[ $? != 0 ]] && echo "Failed to install k3s" && exit 1
else # use containerd by default
  curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable=traefik" sh -
  [[ $? != 0 ]] && echo "Failed to install k3s" && exit 1
fi

if [[ $(hostname) = kubearmor-dev* ]]; then
    mkdir -p /home/vagrant/.kube
    sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config 2>/dev/null
    echo "export KUBECONFIG=/home/vagrant/.kube/config" | tee -a /home/vagrant/.bashrc
    PATH=$PATH:/bin:/usr/bin:/usr/local/bin
else
    KUBEDIR=$HOME/.kube
    KUBECONFIG=$KUBEDIR/config
    [[ ! -d $KUBEDIR ]] && mkdir $KUBEDIR
    if [ -f $KUBECONFIG ]; then
        echo "Found $KUBECONFIG already in place ... backing it up to $KUBECONFIG.backup"
        cp $KUBECONFIG $KUBECONFIG.backup
    fi
    sudo cp /etc/rancher/k3s/k3s.yaml $KUBECONFIG 2>/dev/null
    echo "export KUBECONFIG=$KUBECONFIG" | tee -a ~/.bashrc
fi

echo "Wait for initialization"
sleep 15

# Loop until all pods are in the "Running" state or the timeout is reached
timeout="15m"
endtime=$(date -ud "$timeout" +%s)

while [[ $(date -u +%s) -le $endtime ]]; do
    running_pods=$(kubectl get pods -A --field-selector=status.phase=Running --no-headers | wc -l)
    total_pods=$(kubectl get pods -A --no-headers | wc -l)

    if [ "$running_pods" -eq "$total_pods" ]; then
        echo "All pods are in the 'Running' state."
        break
    else
        echo "Waiting for pods to be in the 'Running' state..."
        sleep 1
    fi
done

kubectl get pods -A
