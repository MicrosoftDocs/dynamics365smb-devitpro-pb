---
title: "Page.SetRecord Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Page.SetRecord Method
Sets the current record for the page.


## Syntax
```
 Page.SetRecord(var Record: Record)
```
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to set as the current record. You cannot use a temporary record for the Record parameter.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  
 You can use this method to set the record to display when the user opens the page.  
  
## Example  
 The following example retrieves the record that has a primary key value of ‘30000’ from the Customer table. If the record is found, it is stored in the MyRecord variable. The **SETRECORD** method uses the retrieved record as the current record and sets record for MyPage, which is a Customer Card page. When the code unit is run, the record is displayed on the MyPage page. If the record is not found, a message box displays a message that indicates that the record was not found. 

```
 var
    MyPage: Page "Customer Card";
    MyRecord: Record Customer;
    Text000: Label 'The record was not found';
begin
    if MyRecord.GET('30000') then begin  
      MyPage.SETRECORD(MyRecord);  
      MyPage.RUN;
    end else begin
      MESSAGE(Text000);  
    end;  
end;
```

## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)