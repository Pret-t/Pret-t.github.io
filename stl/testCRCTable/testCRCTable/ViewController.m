//
//  ViewController.m
//  testCRCTable
//
//  Created by tronsis_ios on 2018/11/2.
//  Copyright © 2018年 Tov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


unsigned int table[256] = {0};

unsigned char CRC8_Table(unsigned char *p, char counter)
{
    unsigned char res = 0x00;
    for(;counter >0 ; counter--){
        res = table[res ^ *p];
        p++;
    }
    return res;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int i,j,k = 0;
    short temp = 0x00;
//    int poly_src = 0x31;//1 0011 0001(B)  the top 1 is hidden
    int poly     = 0x8c;//  1000 1100(B)
//    int poly = 0x8408;
//    unsigned short reg = 0x3e;
//
//    unsigned char data[2] = {0x02,0x43};
//    unsigned char res = 0x00;
    
    for(i = 0;i < 256; i++){
        table[i] = i;
    }
    
    for(i = 0;i < 256; i++){
        for(j = 7;j >= 0; j--){
            temp = table[i] & 0x01;//take the last bit
            if(temp){
                table[i] = table[i] >> 1;
                table[i] ^= poly;
            }
            else{
                table[i] = table[i] >> 1;
            }
        }
    }
    
    NSLog(@"%d", *table);
    unsigned char data[3] = {0x01, 0x02, 0x03};
    unsigned char res = CRC8_Table(data, 1);
    NSLog(@"%d", res);
    
}

- (void)crc16Table {
    unsigned int table[256] = {0};
    
    int i,j = 0;
    short temp = 0x0000;
    int poly     = 0x1021;//  1000 1100(B)
    
    for(i = 0;i < 256; i++){
        table[i] = i;
    }
    
    for(i = 0;i < 256; i++){
        for(j = 15;j >= 0; j--){
            temp = table[i] >> 15 & 0x01;//take the last bit
            if(temp){
                table[i] = (table[i] << 1) & 0xFFFF;
                table[i] ^= poly;
            }
            else{
                table[i] = table[i] << 1;
            }
        }
    }
    NSLog(@"%d", *table);
}




@end
