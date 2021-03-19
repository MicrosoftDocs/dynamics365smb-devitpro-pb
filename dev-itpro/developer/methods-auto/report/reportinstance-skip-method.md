---
title: "Report.Skip Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Report.Skip Method
> **Version**: _Available from runtime version 1.0._

Skips the current iteration of the current report or XmlPort.


## Syntax
```
 Report.Skip()
```

## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
 
 The Skip method allows you to conditionally skip processing of the current report or XMLport. If the processing occurs inside a loop, the processing continues with the next record after the Skip method is called.  

 A typical situation in which you will use SKIP is when you want to retrieve records from a related table by using values in the current record for forming a filter. If the values in the current record already indicate that no records from the related table will be retrieved, there is no need to perform this processing and you can use SKIP to avoid the processing.  

## Example  
 The following example shows how to use the Skip method to skip processing the current record if the balance field of the record is zero. Processing of records will continue until a record that has a balance of 0 is encountered.

```  
var
    Balance: Decimal;
begin
    if Balance = 0 then  
      CurrReport.Skip  
    else  
      ... // Do some processing.  
end;
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)