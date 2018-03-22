---
title: "DELETEARCHIVEDATA Method"
ms.custom: na
ms.date: 11/02/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

 

# DELETEARCHIVEDATA Method
Deletes the archived data for a specified table of an extension during installation.  
## Syntax  

```  
DELETEARCHIVEDATA (TableNo)  
```  

#### Parameters

*TableNo*  
Type: Integer  

Specifies the ID of the extension table whose archive data you want to delete.  

## Return Value  
Type: Boolean  

**true**, if the archived data was deleted for the specified table; otherwise **false**.  

If you omit this optional return value and if archived data cannot be deleted for the specified table, then a run-time error occurs. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the archived data is not deleted.  

## Remarks
You use this method as part of the upgrade code for an extension, where it is called from the `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()` system methods. When an extension is uninstalled, the data in application tables of the extension is automatically stored into a set of special tables so that the data is still preserved. With the DELETEARCHIVEDATA method, you can delete the archived data from the application table of the new version of an extension when it is installed.


