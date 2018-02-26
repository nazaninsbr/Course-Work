from mininet.topo import Topo
from mininet.link import TCLink
from mininet.net import Mininet

class MyTopo(Topo):
	def __init__(self):

		Topo.__init__(self)
		#the hosts
		host1 = self.addHost('h1')
		host2 = self.addHost('h2')
		host3 = self.addHost('h3')
		host4 = self.addHost('h4')
		#the switches
		switch1 = self.addSwitch('s1')
		switch2 = self.addSwitch('s2')
		switch3 = self.addSwitch('s3')
		#add links between the switches and the hosts 
		self.addLink(host1, switch1, bw=5, delay='5ms')
		self.addLink(host2, switch1, bw=5, delay='5ms')
		self.addLink(host3, switch3, bw=5, delay='5ms')
		self.addLink(host4, switch3, bw=5, delay='5ms')
		self.addLink(switch1, switch2, bw=1, delay='50ms')
		self.addLink(switch3, switch2, bw=1, delay='50ms')

topos = { 'mytopo': ( lambda: MyTopo() ) }