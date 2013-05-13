from smsclould_client import *
import sys, time, os
import hashlib

loc = smsclouldLocator()
port = loc.getsmsclouldHttpSoap11Endpoint(url = "http://114.80.200.100:8081/axis2/services/smsclould.smsclouldHttpSoap11Endpoint/")

def sendsms(name, password, message, target, sendtime):
   m = sendsmsRequest()
   m._username = name
   m._password = hashlib.md5(password).hexdigest()
   m._target = target
   m._message = message
   m._sendtime = sendtime
   rsp = port.sendsms(m)
   return rsp
   
def getStatusById(name, password, messageid, offset, mr):
   m = getStatusByIdRequest()
   m._username = name
   m._password = hashlib.md5(password).hexdigest()
   m._id = messageid
   m._offset = offset
   m._mr = mr
   rsp = port.getStatusById(m)
   return rsp
   
def getStatusByTime(name, password, phoneNum, startTime, endTime, offset, mr):
   m = getStatusByTimeRequest()
   m._username = name
   m._password = hashlib.md5(password).hexdigest()
   m._phoneNum = phoneNum
   m._startTime = startTime
   m._endTime = endTime
   m._offset = offset
   m._mr = mr
   rsp = port.getStatusByTime(m)
   return rsp
   
def getReplyByTime(name, password, phoneNum, startTime, endTime, offset, mr):
   m = getReplyByTimeRequest()
   m._username = name
   m._password = hashlib.md5(password).hexdigest()
   m._phoneNum = phoneNum
   m._extNum = 0
   m._startTime = startTime
   m._endTime = endTime
   m._offset = offset
   m._mr = mr
   rsp = port.getReplyByTime(m)
   return rsp
   

def checkBalance(name, password):
   m = checkBalanceRequest()
   m._username = name
   m._password = hashlib.md5(password).hexdigest()
   rsp = port.checkBalance(m)
   return rsp