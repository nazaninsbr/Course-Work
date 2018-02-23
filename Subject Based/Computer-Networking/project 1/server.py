import time 
from socket import *

class socketProgServer():

	def __init__(self):
		self.ip = ""
		self.response = "Message Recieved"
		self.port = 8000

	def getIP(self):
		self.ip = input("IP: ")

	def setUpServer(self):
		print("Listening...")
		serverSocket = socket(AF_INET, SOCK_DGRAM)
		serverSocket.bind((self.ip, self.port))
		while 1:
			message, clientAddress = serverSocket.recvfrom(self.port)
			print("Recieved Message: "+ message.decode())
			serverSocket.sendto(self.response.encode(), clientAddress)

if __name__ == '__main__':
	ss = socketProgServer()
	ss.getIP()
	ss.setUpServer()