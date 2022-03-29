---
title: "Notification.SetData(Text, Text) Method"
description: "Specifies a data property value for the notification."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Notification.SetData(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies a data property value for the notification. The data is specified as text in a key-value pair.


## Syntax
```AL
 Notification.SetData(Name: Text, Value: Text)
```
## Parameters
*Notification*  
&emsp;Type: [Notification](notification-data-type.md)  
An instance of the [Notification](notification-data-type.md) data type.  

*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text string to use as a unique identifier for the data item.
        

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The text string that represents the data.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Notification Data Type](notification-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)