---
layout:     post
title:      NSDecimalNumber
author:     Pret
tags: 		NSDecimalNumber
subtitle:  	note
category:  project1
---

## 初始化
```
/**
 创建并返回一个十进制对象
 @param dcm 十进制的结构体
 */
- (instancetype)initWithDecimal:(NSDecimal)dcm;

/**
 @param mantissa 十进制尾数 （如：123）
 @param exponent 指数      （如：3）
 @param flag 是否为负      （如：YES）
 return 十进制数字对象       (如：-123000)
 */
- (instancetype)initWithMantissa:(unsigned long long)mantissa
                        exponent:(short)exponent
                      isNegative:(BOOL)flag;

/**
 @param numberValue 数字字符串
 */
- (instancetype)initWithString:(nullable NSString *)numberValue;

/**
 @param numberValue 数字字符串,可以根据locale来解析 (如:@"123,456")
 @param locale 解析<numberValue>的字典(特别是NSLocaleDecimalSeparator:分割整数跟小数)
                                                (如 @{NSLocaleDecimalSeparator:@","})
 @return 十进制数字对象                           (如：123.456)
 */
- (instancetype)initWithString:(nullable NSString *)numberValue
                        locale:(nullable id)locale;

```

## NSDecimalNumberHandler
```
/**
 初始化方法

 @param roundingMode 舍入方式
 @param scale 小数点后舍入值的位数。
 @param exact 精度错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 @param overflow 溢出错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 @param underflow 下溢错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 @param divideByZero 除以0的错误处理；YES:如果出现错误，将引发异常，NO:忽略错误并将控制权放回给调用者。
 @return NSDecimalNumberHandler对象
 */
+ (instancetype)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode
                                               scale:(short)scale
                                    raiseOnExactness:(BOOL)exact
                                     raiseOnOverflow:(BOOL)overflow
                                    raiseOnUnderflow:(BOOL)underflow
                                 raiseOnDivideByZero:(BOOL)divideByZero

/**
 快速构造方法

 roundingMode:NSRoundPlain
 scale:全精度
 exact:NO
 overflow:NO
 underflow:NO
 divideByZero:NO
 */
+ (NSDecimalNumberHandler *)defaultDecimalNumberHandler;
```
> **NSRoundingMode的几种方式：**
> 
* NSRoundPlain:四舍五入
* NSRoundDown:只舍不入
* NSRoundUp：只入不舍
* NSRoundBankers: 在四舍五入的基础上加了一个判断：当最后一位为5的时候，只会舍入成偶数。比如：1.25不会返回1.3而是1.2，因为1.3不是偶数。

## 加法运算
```
- (NSDecimalNumber *)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber;
```

## 减法运算
```
- (NSDecimalNumber *)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber;

```

## 乘法运算
```
- (NSDecimalNumber *)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber;
```
## 除法运算
```
- (NSDecimalNumber *)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber;
```
## 次方运算
```
- (NSDecimalNumber *)decimalNumberByRaisingToPower:(NSUInteger)power;
```
## 10为底的次方运算
```
- (NSDecimalNumber *)decimalNumberByMultiplyingByPowerOf10:(short)power;
```
## 舍入运算
```
/**
 @param behavior NSDecimalNumberHandler对象
 */
- (NSDecimalNumber *)decimalNumberByRoundingAccordingToBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior;
```

