---
title: "RequestPage.Update([Boolean]) Method"
description: "Saves the current record and then updates the controls on the page."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RequestPage.Update([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the current record and then updates the controls on the page. If you set the SaveRecord parameter to false, this method will not save the record before the page is updated.


## Syntax
```AL
 RequestPage.Update([SaveRecord: Boolean])
```
## Parameters
*RequestPage*  
&emsp;Type: [RequestPage](requestpage-data-type.md)  
An instance of the [RequestPage](requestpage-data-type.md) data type.  

*[Optional] SaveRecord*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Indicates if the current record is saved. To save the current record, set the value to true. If the value is set to false, the page is updated without saving the record.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[RequestPage Data Type](requestpage-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)