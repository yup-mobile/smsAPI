//
//  SmsClient.m
//  SmsDemo
//
//  Created by elliotyuan on 13-4-1.
//  Copyright (c) 2013年 elliotyuan. All rights reserved.
//

#import "SmsClient.h"

@implementation SmsClient

- (NSString *)sendSms: (NSString *)username password:(NSString *)password message:(NSString*) message  target:(NSString*) target ext:(NSString*) ext send_time:(NSString*) send_time{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://114.80.200.100:8081/axis2/services/yc.ycHttpSoap11Endpoint/"]];
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod: @"POST"];
    
    NSString *post = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\"> <soapenv:Header/>"
    "<soapenv:Body>"
    "<yc:sendsms>"
    "<yc:username>";
    post = [post stringByAppendingString:username];
    post = [post stringByAppendingString:
    @"</yc:username>"
    "<yc:password>"];
    post = [post stringByAppendingString:password];
    post = [post stringByAppendingString:
    @"</yc:password>"
    "<yc:_SendRequset>"
    "<xsd:ext>" ];
    post = [post stringByAppendingString:ext];
    post = [post stringByAppendingString:
    @"</xsd:ext>"
    "<xsd:message>"];
    post = [post stringByAppendingString: message];
    post = [post stringByAppendingString:
    @"</xsd:message>"
    "<xsd:send_time>"];
    post = [post stringByAppendingString: send_time];
    post = [post stringByAppendingString:
    @"</xsd:send_time>"
    "<xsd:target>"];
    post = [post stringByAppendingString: target];
    post = [post stringByAppendingString:
    @"</xsd:target>"
    "</yc:_SendRequset>"
    "</yc:sendsms>"
    "</soapenv:Body>"
    "</soapenv:Envelope>"];
    //NSLog(@"post=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	[request setHTTPBody:postData];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
    }
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"response: %@", response);
    return response;

};


- (NSString *)getStatusById: (NSString *)username password:(NSString *)password messageId:(NSString*) messageId   offset:(NSString*) offset mr:(NSString*) mr{

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://114.80.200.100:8081/axis2/services/yc.ycHttpSoap11Endpoint/"]];
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod: @"POST"];
    
    NSString *post = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\"> <soapenv:Header/>"
    "<soapenv:Body>"
    "<yc:getStatusById>"
    "<yc:username>";
    post = [post stringByAppendingString:username];
    post = [post stringByAppendingString:
            @"</yc:username>"
            "<yc:password>"];
    post = [post stringByAppendingString:password];
    post = [post stringByAppendingString:
            @"</yc:password>"];
    post = [post stringByAppendingString:
            @"<yc:id>"];
    post = [post stringByAppendingString:messageId];
    post = [post stringByAppendingString:
            @"</yc:id>"
            "<yc:offset>"];
    post = [post stringByAppendingString:offset];
    post = [post stringByAppendingString:
            @"</yc:offset>"
            "<yc:mr>"];
    post = [post stringByAppendingString:mr];
    post = [post stringByAppendingString:
            @"</yc:mr>"
            "</yc:getStatusById>"
            "</soapenv:Body>"
            "</soapenv:Envelope>"];
    //NSLog(@"post=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	[request setHTTPBody:postData];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
    }
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"response: %@", response);
    return response;

}

- (NSString *)getStatusByTime: (NSString *)username password:(NSString *)password phoneNum:(NSString*) phoneNum   startTime:(NSString*) startTime endTime:(NSString*) endTime offset:(NSString*) offset mr:(NSString*) mr{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://114.80.200.100:8081/axis2/services/yc.ycHttpSoap11Endpoint/"]];
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod: @"POST"];
    
    NSString *post = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\"> <soapenv:Header/>"
    "<soapenv:Body>"
    "<yc:getStatusByTime>"
    "<yc:username>";
    post = [post stringByAppendingString:username];
    post = [post stringByAppendingString:
            @"</yc:username>"
            "<yc:password>"];
    post = [post stringByAppendingString:password];
    post = [post stringByAppendingString:
            @"</yc:password>"];
    post = [post stringByAppendingString:
            @"<yc:phoneNum>"];
    post = [post stringByAppendingString:phoneNum];
    post = [post stringByAppendingString:
            @"</yc:phoneNum>"
            "<yc:startTime>"];
    post = [post stringByAppendingString:startTime];
    post = [post stringByAppendingString:
            @"</yc:startTime>"
            "<yc:endTime>"];
    post = [post stringByAppendingString:endTime];
    post = [post stringByAppendingString:
            @"</yc:endTime>"
            "<yc:offset>"];
    post = [post stringByAppendingString:offset];
    post = [post stringByAppendingString:
            @"</yc:offset>"
            "<yc:mr>"];
    post = [post stringByAppendingString:mr];
    post = [post stringByAppendingString:
            @"</yc:mr>"
            "</yc:getStatusByTime>"
            "</soapenv:Body>"
            "</soapenv:Envelope>"];
    //NSLog(@"post=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	[request setHTTPBody:postData];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
    }
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"response: %@", response);
    return response;
    
}

- (NSString *)getReplyByTime: (NSString *)username password:(NSString *)password phoneNum:(NSString*) phoneNum  extNum:(NSString*) extNum startTime:(NSString*) startTime endTime:(NSString*) endTime offset:(NSString*) offset mr:(NSString*) mr{

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://114.80.200.100:8081/axis2/services/yc.ycHttpSoap11Endpoint/"]];
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod: @"POST"];
    
    NSString *post = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\"> <soapenv:Header/>"
    "<soapenv:Body>"
    "<yc:getReplyByTime>"
    "<yc:username>";
    post = [post stringByAppendingString:username];
    post = [post stringByAppendingString:
            @"</yc:username>"
            "<yc:password>"];
    post = [post stringByAppendingString:password];
    post = [post stringByAppendingString:
            @"</yc:password>"];
    post = [post stringByAppendingString:
            @"<yc:phoneNum>"];
    post = [post stringByAppendingString:phoneNum];
    post = [post stringByAppendingString:
            @"</yc:phoneNum>"
            @"<yc:extNum>"];
    post = [post stringByAppendingString:extNum];
    post = [post stringByAppendingString:
            @"</yc:extNum>"
            "<yc:startTime>"];
    post = [post stringByAppendingString:startTime];
    post = [post stringByAppendingString:
            @"</yc:startTime>"
            "<yc:endTime>"];
    post = [post stringByAppendingString:endTime];
    post = [post stringByAppendingString:
            @"</yc:endTime>"
            "<yc:offset>"];
    post = [post stringByAppendingString:offset];
    post = [post stringByAppendingString:
            @"</yc:offset>"
            "<yc:mr>"];
    post = [post stringByAppendingString:mr];
    post = [post stringByAppendingString:
            @"</yc:mr>"
            "</yc:getReplyByTime>"
            "</soapenv:Body>"
            "</soapenv:Envelope>"];
    //NSLog(@"post=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	[request setHTTPBody:postData];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
    }
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"response: %@", response);
    return response;

}

- (NSString *)checkBalance: (NSString *)username password:(NSString *)password{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://114.80.200.100:8081/axis2/services/yc.ycHttpSoap11Endpoint/"]];
    [request addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod: @"POST"];
    
    NSString *post = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:yc=\"http://yc\" xmlns:xsd=\"http://yc/xsd\"> <soapenv:Header/>"
    "<soapenv:Body>"
    "<yc:checkBalance>"
    "<yc:username>";
    post = [post stringByAppendingString:username];
    post = [post stringByAppendingString:
            @"</yc:username>"
            "<yc:password>"];
    post = [post stringByAppendingString:password];
    post = [post stringByAppendingString:
            @"</yc:password>"
            "</yc:checkBalance>"
            "</soapenv:Body>"
            "</soapenv:Envelope>"];
    //NSLog(@"post=%@",post);
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	[request setHTTPBody:postData];
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
    }
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"response: %@", response);
    return response;

}


@end
