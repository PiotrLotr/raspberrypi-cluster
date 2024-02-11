#!/bin/bash


echo "(/) :: Turning swap off..."
echo "(/) :: This moves stuff in swap to the main memory and might take several minutes"
sudo swapoff -a
echo "(+) :: The job is finished "

echo "(/) :: Creating an empty swapfile..."
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
echo "(+) :: The job is finished " 

echo "(/) :: Setting the correct permissions"
sudo chmod 0600 /swapfile
echo "(+) :: The job is finished " 

echo "(/) :: Setting up a Linux swap area"
sudo mkswap /swapfile 
echo "(+) The job is finished " 

echo "(/) :: Turning the swap on"
sudo swapon /swapfile
echo "(+) :: The job is finished "

echo "(/) :: Status:"
grep Swap /proc/meminfo

echo "(/) :: Configuring persistance on restarts"
echo "/swapfile none swap sw 0 0" >> /etc/fstab
echo "(+) :: The job is finished "
