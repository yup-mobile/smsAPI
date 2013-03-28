package com.smslink.demo;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

import com.smslink.api.SmsClient;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		Button button1 = (Button)findViewById(R.id.button1);

		button1.setOnClickListener(new OnClickListener() {

		@Override
		public void onClick(View arg0) {
			
			new Thread(){
				@Override
				public void run(){
					try
					{
						EditText phone = (EditText)findViewById(R.id.editText1);
						EditText message = (EditText)findViewById(R.id.editText2);
						StringBuffer sendsms = SmsClient.sendsms("zhengyp", "12345678aA!", message.getText().toString(), phone.getText().toString(), "", "");
						System.out.print("sendsms="+sendsms.toString());
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				//handler.sendEmptyMessage(0);
				}
				}.start();
			
			
		}
		
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
