---
title: "Database.DataFileInformation Method"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# Database.DataFileInformation Method
> **Version**: _Available from runtime version 1.0._

Specifies data from a file that has been exported from a database.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Database.DataFileInformation(ShowDialog: Boolean, var FileName: Text, var Description: Text, var HasApplication: Boolean, var HasApplicationData: Boolean, var HasGlobalData: Boolean, var tenantId: Text, var exportDate: DateTime, var CompanyRecord: Record)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*ShowDialog*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if you want to display a dialog box where the user can confirm the action.
        
*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name and location of the file that you want to read information from. The file must have been exported from a database.
        
*Description*  
&emsp;Type: [Text](../text/text-data-type.md)  
  
*HasApplication*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the file contains application objects. Create a variable of type Boolean to specify this parameter.
          
*HasApplicationData*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the file contains the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets. Create a variable of type Boolean to specify this parameter.
          
*HasGlobalData*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the file contains global, non-company specific data. Create a variable of type Boolean to specify this parameter.
          
*tenantId*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the tenant ID of the database that the data was exported from. Create a variable of type Text to specify this parameter.
          
*exportDate*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
Specifies the date and time when the data was exported. Create a variable of type DateTime to specify this parameter.
          
*CompanyRecord*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies the company or companies in the file.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)