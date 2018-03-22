---
title: "CLEAR Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 438b632a-5ba3-4820-b44e-ac0b0433eb33
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLEAR Method
Clears the value of a single variable. Also clears all the filters that were set if the variable is a record and resets the key to the primary key and the company on a record variable.  

## Syntax  

```  

CLEAR(Variable)  
```  

#### Parameters  
 *Variable*  
 Type: Any  

 The identifier \(variable\) of any AL data type, including simple and composite data types. The following rules apply when you run the **CLEAR** method:  

-   A number variable is set to 0 \(zero\)  

-   A string variable is set to empty string  

-   A date variable is set to 0D \(undefined date\)  

-   A time variable is set to 0T \(undefined time\)  

-   A Boolean variable is set to FALSE  

## Remarks  
 Use the [CLEARALL Method](devenv-CLEARALL-Method.md) to clear all internal variables, keys, and filters in the object and in any associated objects such as reports, pages, and codeunits that contain AL code. Note, however, that **CLEARALL** does not affect or change values for variables in single instance codeunits.  

 For a composite data type, such as a record or an array, all elements are cleared. Furthermore, all fields in a record will be initialized with the [InitValue Property](../properties/devenv-InitValue-Property.md) of the field.  

 **CLEAR** can also be used on the [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md). It converts the GUID to zeros. Use the [CREATEGUID Method \(GUID\)](devenv-CREATEGUID-Method-GUID.md) to create a new unique GUID.  

 **CLEAR** can also be used to deselect a company. For more information, see [CHANGECOMPANY Method \(Record\)](devenv-CHANGECOMPANY-Method-Record.md).  

<!-- not relevant in web client/d365
For an Automation object, **CLEAR** releases the Automation object and decreases the reference count. The Automation server determines if this should cause a shutdown. After **CLEAR**, you can use the [CREATE Method \(Automation\)](devenv-CREATE-Method-Automation.md) on the Automation variable to create a new instance of the object.  -->

 If you use **CLEAR** on a codeunit, only the reference to the codeunit is deleted and not the codeunit itself, as with Automation objects. This means that the content of the codeunit stays intact.  

 If you have an array of controls, the whole array is destroyed when the array variable goes out of scope.  

 If you have an array of automation servers, you may clear the whole array at once, or clear each element individually.  

## Example  
 This example shows how to use the **CLEAR** method.  

 This example requires that you create the following text constants.

|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|Joe Raybon|  
|Text001|Initially the variable "Name" contains: >%1\<|  
|Text002|After using CLEAR, the variable "Name" contains: >%1\<|  

```  
Name := Text000;  
MESSAGE(Text001, Name);  
CLEAR(Name);  
MESSAGE(Text002, Name);  
```  

 The first message window displays the following:  

 **Initially the variable "Name" contains: >Joe Raybon\<**  

 The second message window displays the following:  

 **After using CLEAR, the variable "Name" contains: >\<**  

## Example  
 In the following example you will declare two variables:  

```  
MyTextVar, data type: "text".  
GuidVar, data type: "GUID".  
```  

 These variables will be declared and cleared, first by using **CLEAR** and then by using **CLEARALL**.  

 This example requires that you create the following text constants  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|My Text|  
|Text001|Initially the variable "MyTextVar" contains >%1\< and "GuidVar" is defined as >%2\<|  
|Text002|After using CLEAR\(MyTextVar\), the variable "MyTextVar" contains >%1\< and "GuidVar" is still defined as >%2\<|  
|Text003|After using CLEAR\(GuidVar\) the variable "GuidVar" becomes undefined|  
|Text004|Giving the "MyTextVar" variable the initial value again and creating a new "GuidVar" results in >%1\< and >%2\<|  
|Text005|Using CLEARALL results in an empty "MyTextVar" >%1\< and an undefined "GuidVar"|  

```  
MyTextVar := Text000;  
GuidVar := CREATEGUID();  
MESSAGE(Text001,MyTextVar,GuidVar);  
CLEAR(MyTextVar);  
MESSAGE(Text002,MyTextVar,GuidVar);  
CLEAR(GuidVar);  
MESSAGE(Text003,GuidVar);  
MyTextVar := Text000;  
GuidVar := CREATEGUID();  
MESSAGE(Text004,MyTextVar,GuidVar);  
CLEARALL;  
MESSAGE(Text005,MyTextVar,GuidVar);  
```  

 The first message window displays the following:  

 **Initially the variable "MyTextVar" contains: >My Text\< and "GuidVar" is defined as >12345678-1234-1234-1234-1234567890AB\<**  

 The second message window displays the following:  

 **After using CLEAR\(MyTextVar\), the variable "MyTextVar" contains: >\< and GuidVar is still defined as >12345678-1234-1234-1234-1234567890AB\<**  

 The third message window displays the following:  

 **After using CLEAR\(GuidVar\) the variable "GuidVar" becomes undefined**  

 The fourth message window displays the following:  

 **Giving the "MyTextVar" variable the initial value again and creating a new "GuidVar" results in >My Text\< and >87654321-4321-4321-4321-BA0987654321\<**  

 The fifth message window displays the following:  

 **Using CLEARALL results in an empty "MyTextVar" >\< and an undefined "GuidVar"**  

## See Also  
 [CLEARALL Method](devenv-CLEARALL-Method.md)   
 [COPYSTREAM Method](devenv-COPYSTREAM-Method.md)   
 [EVALUATE Method](devenv-EVALUATE-Method.md)
