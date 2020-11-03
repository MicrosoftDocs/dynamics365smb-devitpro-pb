---
title: "System.Clear Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# System.Clear Method
Clears the value of a single variable. Also, it clears all the filters that were set if the variable is a record and resets the key to the primary key and the company on a record variable.


## Syntax
```
 System.Clear(var Variable: Any)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Variable*  
&emsp;Type: [Any](../any/any-data-type.md)  
The identifier (variable) of any AL data type, including simple and composite data types. The following rules apply when you run the CLEAR method:
-   A number variable is set to 0 (zero)
-   A string variable is set to empty string
-   A date variable is set to 0D (undefined date)
-   A time variable is set to 0T (undefined time)
-   A Boolean variable is set to FALSE
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use the [CLEARALL Method](../../methods-auto/system/system-clearall-method.md) to clear all internal variables, keys, and filters in the object and in any associated objects such as reports, pages, and codeunits that contain AL code. Note, however, that [CLEARALL Method](../../methods-auto/system/system-clearall-method.md) does not affect or change values for variables in single instance codeunits.  

 For a composite data type, such as a record or an array, all elements are cleared. Furthermore, all fields in a record will be initialized with the [InitValue Property](../../properties/devenv-initvalue-property.md) of the field.  

 **CLEAR** can also be used on the [GUID Data Type](../../datatypes/devenv-guid-data-type.md). It converts the GUID to zeros. Use the [CREATEGUID Method \(GUID\)](../../methods-auto/system/system-createguid-method.md) to create a new unique GUID.  

 **CLEAR** can also be used to deselect a company. For more information, see [CHANGECOMPANY Method \(Record\)](../../methods-auto/record/record-changecompany-method.md).  

<!-- not relevant in web client/d365
For an Automation object, **CLEAR** releases the Automation object and decreases the reference count. The Automation server determines if this should cause a shutdown. After **CLEAR**, you can use the [CREATE Method \(Automation\)](devenv-CREATE-Method-Automation.md) on the Automation variable to create a new instance of the object.;  -->

 If you use **CLEAR** on a codeunit, only the reference to the codeunit is deleted and not the codeunit itself, as with Automation objects. This means that the content of the codeunit stays intact.  

 If you have an array of controls, the whole array is destroyed when the array variable goes out of scope.  

 If you have an array of automation servers, you may clear the whole array at once, or clear each element individually.  

## Example 1

 This example shows how to use the **CLEAR** method.  

```  
var
    Text000: Label 'Joe Raybon';
    Text001: Label 'Initially the variable "Name" contains: >;%1\>';
    Text002: Label 'After using CLEAR, the variable "Name" contains: >;%1\>';
begin
    Name := Text000;  
    MESSAGE(Text001, Name);  
    CLEAR(Name);  
    MESSAGE(Text002, Name);  
end;
```  

 The first message window displays the following:  

 **Initially the variable "Name" contains: >;Joe Raybon\>**  

 The second message window displays the following:  

 **After using CLEAR, the variable "Name" contains: >;\>**  

## Example 2

 In the following example you will declare two variables:  

```  
var 
    MyTextVar: Text; 
    GuidVar: GUID;
```  

 These variables will be declared and cleared, first by using **CLEAR** and then by using [CLEARALL Method](../../methods-auto/system/system-clearall-method.md).  

```  
var 
    Text000: Label 'My Text';
    Text001: Label 'Initially the variable "MyTextVar" contains >;%1> and "GuidVar" is defined as >;%2>';
    Text002: Label 'After using CLEAR(MyTextVar), the variable "MyTextVar" contains >;%1> and "GuidVar" is still defined as >;%2>';
    Text003: Label 'After using CLEAR(GuidVar) the variable "GuidVar" becomes undefined';
    Text004: Label 'Giving the "MyTextVar" variable the initial value again and creating a new "GuidVar" results in >;%1> and >;%2>';
    Text005: Label 'Using CLEARALL results in an empty "MyTextVar" >;%1> and an undefined "GuidVar"';
begin
    MyTextVar : Text000;  
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
end; 
```  

 The first message window displays the following:  

 **Initially the variable "MyTextVar" contains: >;My Text\> and "GuidVar" is defined as >;12345678-1234-1234-1234-1234567890AB\>**  

 The second message window displays the following:  

 **After using CLEAR\(MyTextVar\), the variable "MyTextVar" contains: >;\> and GuidVar is still defined as >;12345678-1234-1234-1234-1234567890AB\>**  

 The third message window displays the following:  

 **After using CLEAR\(GuidVar\) the variable "GuidVar" becomes undefined**  

 The fourth message window displays the following:  

 **Giving the "MyTextVar" variable the initial value again and creating a new "GuidVar" results in >;My Text\> and >;87654321-4321-4321-4321-BA0987654321\>**  

 The fifth message window displays the following:  

 **Using CLEARALL results in an empty "MyTextVar" >;\> and an undefined "GuidVar"**  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)