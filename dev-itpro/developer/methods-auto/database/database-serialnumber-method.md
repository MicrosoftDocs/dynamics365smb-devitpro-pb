---
title: "Database.SerialNumber Method"
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
# Database.SerialNumber Method
Gets a string that contains the serial number of the license file for your system.


## Syntax
```
String :=   Database.SerialNumber()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The serial number.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
```
var
    SN: Text[30];
    Text000: Label 'The serial number for this software package is:%1.';
begin 
    SN := SERIALNUMBER;  
    MESSAGE(Text000, SN);  
end;
```  
  
 The output of this example is as follows:  
  
 **The serial number for this software package is:**  
  
 **W1-ZA-002-6R75A-7**  
  
> [!NOTE]  
> The serial number depends on your licensed version of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)]. The serial number shown here is an example.

## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)