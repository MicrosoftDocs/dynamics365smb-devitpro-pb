---
title: "CompanyProperty.DisplayName() Method"
description: "Gets the current company display name."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# CompanyProperty.DisplayName() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current company display name.


## Syntax
```AL
DisplayName :=   CompanyProperty.DisplayName()
```


## Return Value
*DisplayName*  
&emsp;Type: [String](../string/string-data-type.md)  
The display name of the company as specified in the **Display Name** field in the **Company** table. If no display name is specified, the company name that is stored in the **Name** field is returned. 


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[CompanyProperty Data Type](companyproperty-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)