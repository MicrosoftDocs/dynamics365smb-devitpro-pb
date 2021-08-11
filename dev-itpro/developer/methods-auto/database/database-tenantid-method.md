---
title: "Database.TenantId() Method"
description: "Gets the ID of the tenant that has started the current session."
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
# Database.TenantId() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the ID of the tenant that has started the current session. Use this method when your code must be specific about which tenant database to access in a multitenant deployment. For example, if your code imports data into a cache, you can make a cache tenant-specific by using the tenant ID as a key. Also, if you want to write code that saves documents, you can include the tenant ID in the file name or location, for example. In those cases, you can use the TENANTID method in combination with the COMPANYNAME method to identify the company and the tenant database.


## Syntax
```AL
ID :=   Database.TenantId()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*ID*  
&emsp;Type: [String](../string/string-data-type.md)  
The ID of the tenant that has started the current session.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)