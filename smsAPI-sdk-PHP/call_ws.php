<?php
	include_once('lib/NuSoap.php');

	class yc_sms{
		
		static $wsdl = "http://114.80.200.100:8081/axis2/services/yc?wsdl";
		
		//发送短信
		/***
		$username	用户名	必须
		$password	密码	必须
		$message	短信内容	必须
		$target		目标号码（多个号码用;隔开）	必须
		$ext		扩展码（暂不支持）	非必须
		$send_time	发送时间（yyyy-mm-dd hh:mm:ss）	非必须
		***/
		public function sendsms($username,$password,$message,$target,$ext="",$send_time=""){
			
			$aryPara = array('username'=>$username, 'password'=>md5($password),'_SendRequset'=>array('message'=>$message,'target'=>$target,'ext'=>$ext,'send_time'=>$send_time));
			$result = $this->call('sendsms',$aryPara);
			
			return $result;
		
		}
		
		//按id号查询发送状态
		/***
		$username	用户名	必须
		$password	密码	必须
		$id			查询id（调用sendsms后返回的id号）	必须
		$offset		结果集起始值	非必须
		$mr			结果集的最大返回条数 	非必须
		***/
		public function getStatusById($username,$password,$id,$offset="",$mr=""){
			
			$aryPara = array('username'=>$username, 'password'=>md5($password),'id'=>$id,'target'=>$target,'offset'=>$offset,'mr'=>$mr);
			$result = $this->call('getStatusById',$aryPara);
			
			return $result;
		
		}
		
		//按时间查询发送状态
		/***
		$username	用户名	必须
		$password	密码	必须
		$phoneNum	电话号码	非必须
		$startTime	起始时间	必须
		$endTime	结束时间	必须
		$offset		结果集起始值	非必须
		$mr			结果集的最大返回条数 	非必须
		***/
		public function getStatusByTime($username,$password,$phoneNum="",$startTime,$endTime,$offset="",$mr=""){
			
			$aryPara = array('username'=>$username, 'password'=>md5($password),'phoneNum'=>$phoneNum,'startTime'=>$startTime,'endTime'=>$endTime,'offset'=>$offset,'mr'=>$mr);
			$result = $this->call('getStatusByTime',$aryPara);
			
			return $result;
		
		}
		
		//按时间查询上行短信
		/***
		$username	用户名	必须
		$password	密码	必须
		$phoneNum	电话号码	非必须
		$extNum 	扩展码 	非必须
		$startTime	起始时间	必须
		$endTime	结束时间	必须
		$offset		结果集起始值	非必须
		$mr			结果集的最大返回条数 	非必须
		***/
		public function getReplyByTime($username,$password,$phoneNum="",$extNum="",$startTime,$endTime,$offset="",$mr=""){
			
			$aryPara = array('username'=>$username, 'password'=>md5($password),'phoneNum'=>$phoneNum,'extNum'=>$extNum,'startTime'=>$startTime,'endTime'=>$endTime,'offset'=>$offset,'mr'=>$mr);
			$result = $this->call('getReplyByTime',$aryPara);
			
			return $result;
		
		}
		
		
		//查询余额
		/***
		$username	用户名	必须
		$password	密码	必须
		***/
		public function checkBalance($username,$password){
			
			$aryPara = array('username'=>$username, 'password'=>md5($password));
			$result = $this->call('checkBalance',$aryPara);
			
			return $result;
		
		}
		
		//调用webservices
		private function call($function,$param){
			$client = new soapclient(self::$wsdl, 'wsdl');
			$client->soap_defencoding = 'utf-8';
			$client->decode_utf8 = false;
			$client->xml_encoding = 'utf-8';
			$aryResult = $client->call($function,$param);
	
			if (!$err=$client->getError()) {
				return $aryResult;
			} else {
				return ("ERROR: $err");
			}
		}
	
	
	
	
	}
	
	



?>