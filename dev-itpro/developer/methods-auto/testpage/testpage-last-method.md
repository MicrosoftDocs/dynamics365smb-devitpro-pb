---
title: "TestPage.Last Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# TestPage.Last Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the current row of the test page as the last row in the data set.


## Syntax
```
[Ok := ]  TestPage.Last()
```

## Parameters
*TestPage*
&emsp;Type: [TestPage](testpage-data-type.md)
An instance of the [TestPage](testpage-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the current row has changed, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
If *TestPage* is closed or has never been opened, then the method call fails.  

The Last method loops over all records until it sets  the identifies the current record.  For each record, the [OnAfterGetCurrRecord Trigger](../../triggers-auto/page/devenv-onaftergetcurrrecord-page-trigger.md) is executed.  
  
## Example  
 This example sets the current row to the last customer in the dataset. It requires that you create a TestPage variable named CustomerList with a Subtype of Customer List.  
  
```al
CustomerList.OpenView;  
CustomerList.Last;  
Message(CustomerList.Name.Value);  
  
```

## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)