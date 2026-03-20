---
title: "Record.RecordId() Method"
description: "Gets the RecordId of the record that is currently selected in the table."
ms.author: solsen
ms.date: 12/10/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.RecordId() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the RecordId of the record that is currently selected in the table. If no table is selected, an error is generated.


## Syntax
```AL
RecordID :=   Record.RecordId()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

## Return Value
*RecordID*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

You can show strings that include `RecordId` in the user interface by using the [Format method)](../methods-auto/library.md). In most cases, use the standard format value `1`, which ensures that captions are shown in the current language. The following table illustrates the effect of the different standard formats when `RecordId` is used in a `Format` statement in a Danish locale.  
  
|Standard Format|Renders as|  
|---------------------|----------------|  
|`Format(Customer.RecordId,0,0)`|Customer: 1212121|  
|`Format(Customer.RecordId,0,1)`|Kunde: 1212121|  
|`Format(Customer.RecordId,0,9)`|Customer: 1212121|  
  
When you use standard format `1`, the caption of the record is returned. When you use other standard formats, the name of the record is returned, which is usually `English (US)`. Learn more in [Format property](../properties/devenv-format-property.md).  
  
## Example

The following example opens the `Customer` table as a `Record` variable that is named `MyRecord`. The [FindLast Method)](../methods-auto/mlibrary.md) finds the last record in the table. The record ID of the last record is retrieved, stored in the `RecID` variable displayed in message box.  
  
```AL
codeunit 50112 GetRecordId
{
    trigger OnRun()

    var
        MyRecord: Record Customer;
        RecID: RecordId;
        MyTextConst: Text; 

    MyRecord.FindLast;  
    RecID := MyRecord.RecordId;  
    Message(MyTextConst, RecID);  // The record ID for the last record is: %1

    end;
}
```  
  

## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)