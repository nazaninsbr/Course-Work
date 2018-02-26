#!/bin/sh
#create hosts
ip netns add h1
ip netns add h2
#create switches
ovs-vsctl add-br s1
ovs-vsctl add-br s2
#create veth links
ip link add h1-eth0 type veth peer name s1-eth1
ip link add s1-eth2 type veth peer name s2-eth1
ip link add s2-eth2 type veth peer name h2-eth0
#move host ports into namespace
ip link set h1-eth0 netns h1
ip link set h2-eth0 netns h2
#connect switches to ovs
ovs-vsctl add-port s1 s1-eth1 
ovs-vsctl add-port s1 s1-eth2
ovs-vsctl add-port s2 s2-eth1 
ovs-vsctl add-port s2 s2-eth2
#connect controller to switch
#ovs-vsctl set-controller s1 tcp:127.0.0.1
#ovs-vsctl set-controller s2 tcp:127.0.0.1
#setup ip
ip netns exec h1 ifconfig h1-eth0 10.0.0.1 
ip netns exec h1 ifconfig lo up
ip netns exec h2 ifconfig h2-eth0 10.0.0.2 
ip netns exec h2 ifconfig lo up
#configure network
ifconfig s1-eth1 up
ifconfig s1-eth2 up
ifconfig s2-eth1 up
ifconfig s2-eth2 up
#test
ip netns exec h1 ping -c1 10.0.0.2
ip netns exec h2 ping -c1 10.0.0.1
#remove hosts and switches
ip netns delete h1
ip netns delete h2
ip link delete s1-eth2
ip link delete s2-eth2
ovs-vsctl del-br s1
ovs-vsctl del-br s2



