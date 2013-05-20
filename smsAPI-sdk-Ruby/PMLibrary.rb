require 'rubygems'
require 'soap/wsdlDriver'

$endpoint = 'http://114.80.200.100:8081/axis2/services/smsclould.smsclouldHttpSoap11Endpoint/'
$wsdl = 'http://114.80.200.100:8081/axis2/services/smsclould?wsdl'
$namespace = 'http://yupsms.com'

class SmsClient
	private_class_method :new
	@@instance = nil

	def self.create
		@@instance = new unless @@instance
		@@instance
	end
	
	def initialize
		@soap = SOAP::RPC::Driver.new($endpoint, $namespace)
		@soap.add_method('sendsms', 'username', 'password', 'target', 'message', 'ext', 'sendtime')
		@soap.add_method('getStatusByTime', 'username', 'password', 'phoneNum', 'startTime', 'endTime', 'offset', 'mr')
		@soap.add_method('getStatusById', 'username', 'password', 'id', 'offset', 'mr')
		@soap.add_method('getReplyByTime', 'username', 'password', 'phoneNum', 'extNum', 'startTime', 'endTime', 'offset', 'mr')
		@soap.add_method('checkBalance', 'username', 'password')
	end

	def sendsms(username, password, target, message, ext, sendtime)
		begin
			result = @soap.sendsms(username, password ,target, message, ext, sendtime)
			result.response
		rescue Exception => e
			puts e.message
		end
	end

	def getStatusByTime(username, password, phoneNum, startTime, endTime, offset, mr)
		begin
			result = @soap.getStatusByTime(username, password, phoneNum, startTime, endTime, offset, mr)
			result.response
		rescue Exception => e
			puts e.message
		end
	end

	def getStatusById(username, password, id, offset, mr)
		begin
			result = @soap.getStatusById(username, password, id, offset, mr)
			result.response
		rescue Exception => e
			puts e.message
		end
	end


	def getReplyByTime(username, password, phoneNum, extNum, startTime, endTime, offset, mr)
		begin
			result = @soap.getReplyByTime(username, password, phoneNum, extNum, startTime, endTime, offset, mr)
			result.response
		rescue Exception => e
			puts e.message
		end
	end


	def checkBalance(username, password)
		begin		
			result = @soap.checkBalance(username, password)
			result.response
		rescue Exception => e
			puts e.message
		end
	end
	
end

#client = SmsClient.create
#puts (client.sendsms('zhengyp', 'aca3955f5c65c2f4be6c2bf8a2c956d2', '13917980980;18621817213', 'gongxifacai', '', '').resultMsg)


#param = {:username=>'zhengyp', :password=>'aca3955f5c65c2f4be6c2bf8a2c956d2'}
