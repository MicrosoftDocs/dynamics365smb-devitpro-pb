---
title: "Database.SID Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Database.SID Method
Retrieves the security identifier (SID) of a Windows user account.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
SID :=   Database.SID([UserAccount: String])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*UserAccount*  
&emsp;Type: [String](../string/string-data-type.md)  
The Windows user account for which you want to get the SID. You must specify a domain and user name, such as 'cronus\\simon'.  


## Return Value
*SID*  
&emsp;Type: [String](../string/string-data-type.md)  
The SID of the specified Windows user account.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you create a page for adding Windows logins, then you must use the SID method to retrieve the SID for the user account so that you can enter the new login into the Windows Login table.  
  
 This method runs only on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. If you call this method from the client computer, then no action occurs.  
  
## Example  
```
var
    NewSID: Text[119];
    UserAccount: Text[132];
begin
    UserAccount := 'cronus\simon';  
    NewSID := SID(UserAccount);  
end;
```

## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)