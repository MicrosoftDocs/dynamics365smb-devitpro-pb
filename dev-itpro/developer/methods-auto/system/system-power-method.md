---
title: "System.Power Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Power Method
Raises a number to a power. For example, you can use this method to square the number 2 to get the result of 4.


## Syntax
```
NewNumber :=   System.Power(Number: Decimal, Power: Decimal)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Number*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
The number you want to raise exponentially. This number is the base in the exponential method.  
*Power*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
The exponent in the exponential method.  


## Return Value
*NewNumber*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
```  
var
    Number1: Decimal;
    Power1: Decimal;
    Result1: Decimal;
    Text000: Label '%1 raised to the power of %2 = %3';
begin
    Number1 := 64;   
    Power1 := 0.5;  
    Result1 := POWER(Number1, Power1);  
    MESSAGE(Text000, Number1, Power1, Result1);
end;
```  
  
 On a computer that has the regional format set to English \(United States\), the first message window displays the following:  
  
 **64 raised to the power of 0.5 = 8**  
  
 This example shows that raising a number to the power of 0.5 corresponds to the square root of the number.  
  
## Example  
 This example shows a typical use for the POWER method.  
  
 If a principal amount P is deposited at interest rate R and compounded annually, then at the end of N years, the accumulated amount \(A\) is:  
  
 A = P\(1 + R\)<sup>N</sup>  
  
 For example, you put LCY 2800 into a bank account that pays 5 percent, which is compounded quarterly. To determine what the amount will be in eight years, you must consider:  
  
 N = 32 payment periods \(8 years times 4 quarterly periods\)  
  
 R = 0.0125 per period \(5 percent divided by 4 quarterly periods\)  
  
 The accumulated amount A is:  
  
 A = LCY 2800\(1 + 0.0125\)<sup>32</sup> =LCY 2800\(1.4881\) = LCY 4166.77  
  
 If a principal amount P is deposited at the end of each year at interest rate R \(in decimal notation\) compounded annually, then at the end of N years, the accumulated amount is:  
  
 A = P\[\(\(1 + R\)<sup>N</sup> - 1\)/R\]  
  
 This is typically called an *annuity*.  
  
 For example, you have an annuity in which a payment of LCY 500 is made at the end of each year. The interest on this annuity is 4 percent, which is compounded annually. To determine what the annuity will be worth in 20 years, you must consider:  
  
 R = 0.04  
  
 N = 20  
  
 The amount of the annuity A will be:  
  
 A = LCY 500\[\(\(1 + 0.04\)<sup>20</sup> - 1\)/0.04 = LCY 14,889.04  
  
```  
var
    P: Decimal;
    R: Decimal;
    N: Decimal;
    A: Decimal;
    FormatString: Text;
    Text000: Label 'Principal $%1 at a 5 percent interest rate is compounded quarterly.\\';
    Text001: Label '(Rate = %2)\\';
    Text002: Label 'The amount after %3 years = $%4.';
    Text003: Label 'Principal $%1 is deposited at the end of each year at a 4 percent interest rate, compounded annually.\\';
    Text004: Label '(Rate = %2)\\';
    Text005: Label 'The amount after %3 years = $%4.';
begin    
    FormatString := '<Precision,2><Standard Format,1>';  
    // Example 1  
    P := 2800;  
    R := 0.0125;  
    N := 32;  
    A = P * (POWER(1 + R, N));  
    MESSAGE(Text000 + Text001 + Text002, P, R, N, FORMAT(A,0,FormatString);  
    // Example 2  
    P = 500;  
    R = 0.04;  
    N = 20;  
    A = P * ((POWER(1 + R, N) - 1)/R);  
    MESSAGE(Text001, P, R, N, FORMAT(A,0,FormatString));  
end;
```  
  
 On a computer that has the regional format set to English \(United States\), the first message window displays the following:  
  
 **Principal $2,800 at a 5 percent interest rate is compounded quarterly.**  
  
 **\(Rate = 0.0125\)**  
  
 **The amount after 32 years = $4166.77.**  
  
 The second message window displays the following:  
  
 **Principal $500 is deposited at the end of each year at a 4 percent interest rate, compounded annually.**  
  
 **\(Rate = 0.04\)**  
  
 **The amount after 20 years = $14889.04.**  

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)