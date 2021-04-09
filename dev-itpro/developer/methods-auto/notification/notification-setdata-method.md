---
title: "Notification.SetData Method"
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
# Notification.SetData Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies a data property value for the notification. The data is specified as text in a key-value pair.


## Syntax
```
 Notification.SetData(Name: String, Value: String)
```
## Parameters
*Notification*
&emsp;Type: [Notification](notification-data-type.md)
An instance of the [Notification](notification-data-type.md) data type.

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The text string to use as a unique identifier for the data item.
        
*Value*  
&emsp;Type: [String](../string/string-data-type.md)  
The text string that represents the data.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)