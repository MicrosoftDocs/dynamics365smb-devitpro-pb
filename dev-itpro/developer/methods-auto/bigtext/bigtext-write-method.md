---
title: "BigText.Write Method"
description: "Streams a BigText object to a BLOB field in a table."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# BigText.Write Method
> **Version**: _Available or changed with runtime version 1.0._

Streams a BigText object to a BLOB field in a table.


## Syntax
```AL
[Ok := ]  BigText.Write(OutStream: OutStream)
```
## Parameters
*BigText*  
&emsp;Type: [BigText](bigtext-data-type.md)  
An instance of the [BigText](bigtext-data-type.md) data type.  

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream to which you write a BigText.
        


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the write transaction was successful, otherwise **false**.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To delete the content in a BigText variable, use the [Clear Method](../../methods-auto/system/system-clear-joker-method.md).  
  
```al
Clear(BigText)  
```  
  
## Example

This example shows how to stream a BigText to a BLOB field in a table.  

```al
var
    Bstr: BigText;
    Ostream: OutStream;
    ItemRec: Record Item;
begin 
    Bstr.AddText('This is the text string that we want to store in a BLOB field.');  
    ItemRec.Picture.CreateOutStream(Ostream);  
    Bstr.Write(Ostream);  
    ItemRec.Insert;  
end;
```  

## See Also

[BigText Data Type](bigtext-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)