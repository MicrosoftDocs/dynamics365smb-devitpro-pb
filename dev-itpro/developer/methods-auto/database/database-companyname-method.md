---
title: "Database.CompanyName Method"
description: "Gets the current company name."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Database.CompanyName Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current company name.


## Syntax
```
Name :=   Database.CompanyName()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the company, or an empty string if no company has been selected.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
var
    CompName: Text[1024];
    Text000: Label 'The name is %1.';
begin
    CompName := CompanyName;  
    Message(Text000, CompName);  
end;
```  

## See Also

[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)