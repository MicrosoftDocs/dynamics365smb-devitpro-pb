---
title: "Record.GetPosition([Boolean]) Method"
description: "Gets a string that contains the primary key of the current record."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.GetPosition([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a string that contains the primary key of the current record.


## Syntax
```AL
String :=   Record.GetPosition([UseNames: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following example uses the GetPosition method to retrieve the primary key of the current record (*MyRecord*) from the **Customer** table. The primary key is stored in the *varPrimaryKey* variable and displayed in a message box. The *UseNames* parameter is set to **true** so the caption of the field that contains the primary key is returned. If you set *UseNames* to **false**, the number of the field is returned.
   
```al
var
    MyRecord: Record Customer;
    varPrimaryKey: Text;
    Text000: Label 'The primary key is: %1.';
begin    
    varPrimaryKey := MyRecord.GetPosition(true);  
    Message(Text000, varPrimaryKey);  
end;
```

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)