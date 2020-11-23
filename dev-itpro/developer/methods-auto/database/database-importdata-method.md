---
title: "Database.ImportData Method"
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
# Database.ImportData Method
> **Version**: _Available from runtime version 1.0._

Imports data from a file that has been exported from a database.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Database.ImportData(ShowDialog: Boolean, var FileName: Text [, IncludeApplicationData: Boolean] [, IncludeGlobalData: Boolean] [, CompanyRecord: Record])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*ShowDialog*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if you want to display a dialog box where the user can confirm the action.
        
*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name and location of the file that must be imported. The file must have been exported from a database
      .  
*IncludeApplicationData*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  

Specifies if you want to import the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets.
Create a variable of type Boolean to specify this parameter.
To import application objects, you must use the Import-NAVData Windows PowerShell cmdlet.
          
*IncludeGlobalData*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  

Specifies if you want to import global, non-company specific data.
Create a variable of type Boolean to specify this parameter.
          
*CompanyRecord*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies the company or companies that must be imported.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)