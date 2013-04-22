

import com.smslink.api.SmsClient;

public class DirectSender {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try{
        	StringBuffer sendsms = SmsClient.sendsms("demouser", "aca3955f5c65c2f4be6c2bf8a2c956d2", "Œ“µƒ≤‚ ‘", "18611111111", "", "");
        	StringBuffer getStatusById = SmsClient.getStatusById("demouser", "aca3955f5c65c2f4be6c2bf8a2c956d2", "6376d806-440d-42bc-b40f-2ac0a7cb7cad",null ,null );
        	StringBuffer getStatusByTime = SmsClient.getStatusByTime("demouser", "aca3955f5c65c2f4be6c2bf8a2c956d2", "","2013-04-10 08:00:00" ,"2013-04-19 09:00:57", null, null );
        	StringBuffer getReplyByTime = SmsClient.getReplyByTime("demouser", "aca3955f5c65c2f4be6c2bf8a2c956d2", "","","2013-01-01 08:00:00" ,"2013-01-20 09:00:57", null, null );
        	StringBuffer checkBalance = SmsClient.checkBalance("demouser", "aca3955f5c65c2f4be6c2bf8a2c956d2");
        	
        	System.out.println("resp="+sendsms.toString());
        	System.out.println("resp="+getStatusById.toString());
        	System.out.println("resp="+getStatusByTime.toString());
        	System.out.println("resp="+getReplyByTime.toString());
        	System.out.println("resp="+checkBalance.toString());
        }
		catch(Exception e)
		{
			e.printStackTrace();
		}
   		   
   		
	}
	
}
