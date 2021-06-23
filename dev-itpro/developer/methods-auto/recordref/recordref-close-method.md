---
title: "RecordRef.Close Method"
description: "Closes the current page or table."
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
# RecordRef.Close Method
> **Version**: _Available or changed with runtime version 1.0._

Closes the current page or table.


## Syntax
```AL
 RecordRef.Close()
```

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You must use this method if you have several recordrefs defined as variables because these will be maintained until the variable gets out of scope.  
  
## Example  
The following example opens tables 3 through 10 as a Recordref variable that is named MyRecordRef. For each table that is open, the [Caption Method (RecordRef)](recordref-caption-method.md) retrieves the caption of the table and displays the table number and the caption in a messages box. After each caption is displayed, the Close method closes the table before the next table is open. 
  
```al
var
    varCaption: Text;
    MyRecordRef: RecordRef;
    i: Integer;
    Text000: Label 'Table No: %1 Caption: %2';
begin
    for i := 3 to 10 do begin  
        MyRecordRef.Open(i);  
        varCaption := MyRecordRef.Caption;  
        Message(Text000, i, varCaption);  
        MyRecordRef.Close;  
    end; 
end; 
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)