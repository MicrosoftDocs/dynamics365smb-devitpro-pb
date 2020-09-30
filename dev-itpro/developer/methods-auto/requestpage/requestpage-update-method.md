---
title: "RequestPage.Update Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# RequestPage.Update Method
Saves the current record and then updates the controls on the page. If you set the SaveRecord parameter to false, this method will not save the record before the page is updated.


## Syntax
```
 RequestPage.Update([SaveRecord: Boolean])
```
## Parameters
*RequestPage*  
&emsp;Type: [RequestPage](requestpage-data-type.md)  
An instance of the [RequestPage](requestpage-data-type.md) data type.  

*SaveRecord*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Indicates if the current record is saved. To save the current record, set the value to true. If the value is set to false, the page is updated without saving the record.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RequestPage Data Type](requestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)