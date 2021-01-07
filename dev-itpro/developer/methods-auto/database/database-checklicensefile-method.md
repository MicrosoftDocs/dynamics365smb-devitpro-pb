---
title: "Database.CheckLicenseFile Method"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# Database.CheckLicenseFile Method
> **Version**: _Available from runtime version 1.0._

Checks a key in the license file of the system.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 Database.CheckLicenseFile(KeyNumber: Integer)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*KeyNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the key you want to check.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The license file turns on or off different system capabilities. Use this method to check a key in the file for the current user. If the user has no access rights to the object, a message is displayed and the process is terminated.  
  
 If you omit this method, the user will have the ability to continue regardless of whether the appropriate license file is open. 

 
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)