---
title: "ProductName.Marketing Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# ProductName.Marketing Method
> **Version**: _Available from runtime version 1.0._

MARKETING returns a text string that contains the application's marketing name.


## Syntax
```
ProductNameMarketing :=   ProductName.Marketing()
```


## Return Value
*ProductNameMarketing*
&emsp;Type: [String](../string/string-data-type.md)
Text of the product's marketing name.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
This method is useful when you have to include the application name in UI text. Instead of using static text for the name, you use one of the PRODUCTNAME methods. This lets you reuse the same text string across different applications, and makes it easier if the application is ever renamed.

You define the different name variations for an application in the `navsettings.json` configuration file. For more information, see [Configuring Business Central Web Server Instances](../../../administration/configure-web-server.md).

## See Also
[ProductName Data Type](productname-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Configuring Business Central Web Server Instances](../../../administration/configure-web-server.md)