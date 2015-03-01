# http://www.binarytides.com/python-socket-server-code-example/
# https://github.com/Uberi/speech_recognition#readme

#imports for server
import socket

#imports for jacobian functions
import scipy
import math
from scipy.special import ellipj



r = 200
a = 0.9
t = 0
dt = 0.01
x = []
y = []
z = []
dt = 0.01

#ellipj returns sn,cn,dn,ph
count = 5000

print (">>>processing jacobi elliptic functions...")
#compute the jacobi elliptic functions from time t=0 to t=100
for i in range(0,5000):
	jacobi = scipy.special.ellipj(t,(a*a))
	x.append( repr(r * (jacobi[0])*math.cos(a*t)) ) #calculate x-value at time t
	y.append( str(r * (jacobi[0])*math.sin(a*t)) )#calculate y-value at time t
	z.append( str(r * jacobi[1]) )#calculate z-value at time t
	t += dt

xString = ','.join(x)
yString = ','.join(y)
zString = ','.join(z)

fx = open('xValsRaw.txt','w')
for i in xString:
	fx.write(i)
fx.close()

fy = open('yValsRaw.txt','w')
for i in yString:
	fy.write(i)
fy.close()

fz = open('zValsRaw.txt','w')
for i in zString:
	fz.write(i)
fz.close()
