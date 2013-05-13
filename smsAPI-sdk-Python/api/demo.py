from SmsClient import *
import hashlib

name = "demo"
password = "12345678"
message = "test"
target = "13900000000;13600000000;18900000000;"
phoneNo = 13800000000
messageid = "eaaaaaaa-44b5-48a4-afa2-17abf59a1ba2"
starttime = "2013-03-23 19:00:00"
endtime = "2013-03-24 21:00:00"
offset = 0
mr = 100


#result = checkBalance(name,password)
#result = sendsms(name,password,message,target,sendtime)
#result = getStatusById(name, password, messageid, offset, mr)
result = getStatusByTime(name, password, phoneNo, starttime, endtime, offset, mr)
#result = getReplyByTime(name, password, phoneNo, starttime, endtime, offset, mr)

print result
