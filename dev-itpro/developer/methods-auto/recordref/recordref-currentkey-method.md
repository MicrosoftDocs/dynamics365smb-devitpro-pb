---
title: "CurrentKey Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CurrentKey Method
Gets the current key of the table referred to by the RecordRef. The current key is returned as a string.


## Syntax
```
CurrentKey :=   RecordRef.CurrentKey()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*CurrentKey*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the current key of the record.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create the following text constants and global variables.  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The current key in the "%1" table is "%2".|  
  
|Variable|Data type|  
|--------------|---------------|  
|RecRef|RecordRef|  
  
```  
RecRef.OPEN(18);  
MESSAGE(Text000,RecRef.CAPTION,RecRef.CURRENTKEY)  
```  
  
 `RecRef.Open(18)` - Opens table 18 or causes a run-time error if table 18 does not exist.  
  
 `RecRef.Caption` - Returns the caption of the table.  
  
 `RecRef.CURRENTKEY` - Returns the caption of the current key in the table.  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)