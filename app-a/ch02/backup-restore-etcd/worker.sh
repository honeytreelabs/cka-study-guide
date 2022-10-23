#!/usr/bin/env bash

extract_join_command() {
  grep -A 2 "kubeadm join" < /vagrant/kubeadm-init.out | sed -e 's/^[ \t]*//' | tr '\n' ' ' | sed -e 's/ \\ / /g'
}

eval "$(extract_join_command)"

cp /vagrant/admin.conf /etc/kubernetes/admin.conf
chmod ugo+r /etc/kubernetes/admin.conf
echo "KUBECONFIG=/etc/kubernetes/admin.conf" >> /etc/environment