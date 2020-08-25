---
title: "Caption Method"
ms.author: solsen
ms.custom: na
ms.date: 08/12/2020
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
# Caption Method
Gets the caption of the table that is currently selected. Returns an error if no table is selected.


## Syntax
```
Caption :=   RecordRef.Caption()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Caption*  
&emsp;Type: [String](../string/string-data-type.md)  
The caption of the table.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [TABLECAPTION Method (Record)](../record/record-tablecaption-method.md).  
  
## Example  
 The following example selects tables 3 through 5 and opens each table as a RecordRef variable that is named MyRecordRef. The CAPTION method uses the RecorRef variable to retrieve the caption for each of the tables and displays the table number and the caption in a message box. The [CLOSE Method (RecordRef)](recordref-close-method.md) closes the table.
  
```
var
    varCaption: Text;
    i: Integer;
    MyRecordRef: RecordRef;
    Text000: Label 'Table No: %1 Caption: %2';
begin
    for i := 3 TO 6 do begin  
        MyRecordRef.OPEN(i);  
        varCaption := MyRecordRef.CAPTION;  
        MESSAGE(Text000, i, varCaption);  
        MyRecordRef.CLOSE;  
        end;  
end;
```  
  
 This example displays the following:  
  
 **Table No: 3   Caption: Payment terms**  
  
 **Table No: 4   Caption: Currency**  
  
 **Table No: 5   Caption: Finance Charge Terms**  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)