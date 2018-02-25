import time 
from socket import *

class socketProgClient():
	def __init__(self):
		self.port = 8000
		self.ips = []

	def getIPAddresses(self):
		while True:
			inputS = input('IP (will stop if you enter q) : ')
			if inputS != 'q':
				self.ips.append(inputS)
			else:
				break

	def sendMessageToServer(self, ip='', message = ''):
		clientSocket = socket(AF_INET, SOCK_DGRAM)
		clientSocket.sendto(message.encode(),(ip, self.port))
		modifiedMessage, serverAddress = clientSocket.recvfrom(self.port)
		print("Recieved Message: "+ modifiedMessage.decode())
		clientSocket.close()


	def findMessageTime(self, message):
		ts = time.time()
		for thisIp in self.ips:
			ts1 = time.time()
			self.sendMessageToServer(thisIp, message)
			te1 = time.time()
			print("for IP = "+thisIp+" time was: "+str(te1 - ts1))
		te = time.time()
		return (te-ts)

	def findTimeDifference(self):
		tshortmessage = self.findMessageTime('c')
		tlongmessage = self.findMessageTime('adjlajsldjfl;ajdsfljshgalkjdflkjdhgoijdslknhgiuojfdkmvcnvbghurioejdfknvjghiofjdknhgiojedknjfdhgijodfknfhgrijdsfknfhgriojdsnfhgprieojds')
		print("total difference: "+str(tshortmessage - tlongmessage))

if __name__ == '__main__':
	sc = socketProgClient()
	sc.getIPAddresses()
	sc.findTimeDifference()