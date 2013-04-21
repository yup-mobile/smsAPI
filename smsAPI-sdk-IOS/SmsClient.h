//
//  SmsClient.h
//  SmsDemo
//
//  Created by elliotyuan on 13-4-1.
//  Copyright (c) 2013年 elliotyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmsClient : NSObject{
}

- (NSString *)sendSms: (NSString *)username password:(NSString *)password message:(NSString*) message  target:(NSString*) target ext:(NSString*) ext send_time:(NSString*) send_time;

- (NSString *)getStatusById: (NSString *)username password:(NSString *)password messageId:(NSString*) messageId   offset:(NSString*) offset mr:(NSString*) mr;

- (NSString *)getStatusByTime: (NSString *)username password:(NSString *)password phoneNum:(NSString*) phoneNum   startTime:(NSString*) startTime endTime:(NSString*) endTime offset:(NSString*) offset mr:(NSString*) mr;

- (NSString *)getReplyByTime: (NSString *)username password:(NSString *)password phoneNum:(NSString*) phoneNum  extNum:(NSString*) extNum startTime:(NSString*) startTime endTime:(NSString*) endTime offset:(NSString*) offset mr:(NSString*) mr;

- (NSString *)checkBalance: (NSString *)username password:(NSString *)password;

@end
