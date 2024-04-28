#!/bin/bash
echo "Desinstalando GitLab..."
sudo gitlab-ctl stop
sudo gitlab-ctl uninstall
sudo apt-get remove --purge -y gitlab-ee
sudo rm -rf /opt/gitlab
sudo rm -rf /var/opt/gitlab
sudo rm -rf /etc/gitlab
sudo apt-get autoremove -y
sudo apt-get autoclean
echo "GitLab desinstalado."

