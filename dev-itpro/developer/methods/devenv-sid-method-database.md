---
title: "SID Method (Database)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 406a026b-f9bf-46e4-95bc-1d7df8a13a8d
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SID Method (Database)
Retrieves the security identifier \(SID\) of a Windows user account.  
  
## Syntax  
  
```  
  
Sid := SID(UserAccount);  
```  
  
#### Parameters  
 *UserAccount*  
 Type: Text  
  
 The Windows user account for which you want to get the SID. You must specify a domain and user name, such as 'cronus\\simon'.  
  
## Property Value/Return Value  
 Type: Text  
  
 The SID of the specified Windows user account.  
  
## Remarks  
 If you create a page for adding Windows logins, then you must use the SID method to retrieve the SID for the user account so that you can enter the new login into the Windows Login table.  
  
 This method runs only on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. If you call this method from the client computer, then no action occurs.  
  
## Example  
 This example assigns the SID for Simon's Windows user account to a variable. This example requires that you create the following variables.  
  
|Name|DataType|Length|  
|----------|--------------|------------|  
|NewSID|Text|119|  
|UserAccount|Text|132|  
  
```  
UserAccount := 'cronus\simon';  
NewSID := SID(UserAccount);  
```