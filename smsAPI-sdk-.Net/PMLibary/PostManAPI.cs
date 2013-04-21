using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Collections;
using System.Xml;

namespace PMLibary
{
    class PostManAPI
    {
        private static string soapURL = "http://114.80.200.100:8081/axis2/services/smsclould.smsclouldHttpSoap11Endpoint/";
        private static string WSDLURL = "http://114.80.200.100:8081/axis2/services/smsclould?wsdl";

        public static XmlDocument sendsms(String username, String password, String message, String target, String ext, String sendtime)
        {
            Queue parsQ = new Queue();
            parsQ.Enqueue(new DictionaryEntry("username", username));
            parsQ.Enqueue(new DictionaryEntry("password", password));
            parsQ.Enqueue(new DictionaryEntry("target", target));
            parsQ.Enqueue(new DictionaryEntry("message", message));
            parsQ.Enqueue(new DictionaryEntry("ext", ext));
            parsQ.Enqueue(new DictionaryEntry("sendtime", sendtime));
            return WebSrvCaller.QuerySoapWebService(soapURL, "sendsms", parsQ, WSDLURL);
        }

        /*public static XmlDocument sendsms(String username, String password, String message, String target, String ext, String send_time)
        {
            string soapStr = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\">"
					   +" <soapenv:Header/>" +
					   "<soapenv:Body>" +
					   "<yc:sendsms>" +
					   "<yc:username>"+username+"</yc:username>" +
					   "<yc:password>"+password+"</yc:password>" +
					   "<yc:_SendRequset>" +
					   "<xsd:ext>"+ext+"</xsd:ext>" +
					   "<xsd:message>"+message+"</xsd:message>" +
					   "<xsd:send_time>"+send_time+"</xsd:send_time>" +
					   "<xsd:target>"+target+"</xsd:target>" +
					   "</yc:_SendRequset>" +
					   "</yc:sendsms>" +
					   "</soapenv:Body>" +
					   "</soapenv:Envelope>";
            return WebSrvCaller.QuerySoapWebService(soapURL, "sendsms", null, WSDLURL, soapStr);
        }*/

        public static XmlDocument checkBalance(string username, string password)
        {
            Queue parsQ = new Queue();
            parsQ.Enqueue(new DictionaryEntry("username", username));
            parsQ.Enqueue(new DictionaryEntry("password", password));
            return WebSrvCaller.QuerySoapWebService(soapURL, "checkBalance", parsQ, WSDLURL);
        }

        public static XmlDocument getStatusById(string username, string password, string id, string offset, string mr)
        {
            Queue parsQ = new Queue();
            parsQ.Enqueue(new DictionaryEntry("username", username));
            parsQ.Enqueue(new DictionaryEntry("password", password));
            parsQ.Enqueue(new DictionaryEntry("id", id));
            parsQ.Enqueue(new DictionaryEntry("offset", offset));
            parsQ.Enqueue(new DictionaryEntry("mr", mr));
            return WebSrvCaller.QuerySoapWebService(soapURL, "getStatusById", parsQ, WSDLURL);
        }

        public static XmlDocument getStatusByTime(String username, String password, String phoneNum, String startTime, String endTime, String offset, String mr)
        {
            Queue parsQ = new Queue();
            parsQ.Enqueue(new DictionaryEntry("username", username));
            parsQ.Enqueue(new DictionaryEntry("password", password));
            parsQ.Enqueue(new DictionaryEntry("phoneNum", phoneNum));
            parsQ.Enqueue(new DictionaryEntry("startTime", startTime));
            parsQ.Enqueue(new DictionaryEntry("endTime", endTime));
            parsQ.Enqueue(new DictionaryEntry("offset", offset));
            parsQ.Enqueue(new DictionaryEntry("mr", mr));
            return WebSrvCaller.QuerySoapWebService(soapURL, "getStatusByTime", parsQ, WSDLURL);
        }

        public static XmlDocument getReplyByTime(String username, String password, String phoneNum, String extNum, String startTime, String endTime, String offset, String mr)
        {
            Queue parsQ = new Queue();
            parsQ.Enqueue(new DictionaryEntry("username", username));
            parsQ.Enqueue(new DictionaryEntry("password", password));
            parsQ.Enqueue(new DictionaryEntry("phoneNum", phoneNum));
            parsQ.Enqueue(new DictionaryEntry("extNum", extNum));
            parsQ.Enqueue(new DictionaryEntry("startTime", startTime));
            parsQ.Enqueue(new DictionaryEntry("endTime", endTime));
            parsQ.Enqueue(new DictionaryEntry("offset", offset));
            parsQ.Enqueue(new DictionaryEntry("mr", mr));
            return WebSrvCaller.QuerySoapWebService(soapURL, "getReplyByTime", parsQ, WSDLURL);
        }

        private static string MD5(string ori)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] data = System.Text.Encoding.Default.GetBytes(ori);
            byte[] result = md5.ComputeHash(data);
            String ret = "";
            for (int i = 0; i < result.Length; i++)
                ret += result[i].ToString("x").PadLeft(2, '0');
            return ret;
        }
        
    }

}
