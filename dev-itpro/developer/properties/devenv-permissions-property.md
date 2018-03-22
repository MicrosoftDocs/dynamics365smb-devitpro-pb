---
title: "Permissions Property"
ms.custom: na
ms.date: 06/15/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 99eb343f-7bff-4956-ad1b-605440b7858c
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# Permissions Property
Sets whether an object has additional permission required to perform some operations on one or more tables. The operations can be to read, insert, modify, and delete data.  
  
## Applies To  
  
-   Codeunits  
  
-   Pages  
  
-   Queries  
  
-   Reports  
  
-   Tables  
  
-   XMLports  
  
## Remarks  
 The license file determines the permissions that users have within [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These permissions are further refined by the security permissions that you grant the different users.  
  
 Sometimes the license file only gives you indirect permission to perform operations on certain tables. Security permissions can also be used to give users only indirect permission to certain tables. If you only have indirect permission to, for example, insert data into a particular table, you cannot insert data into this table from the standard user interface. You must use a database object that has been given extra permission to insert data into the table in question.  
  
> [!NOTE]  
>  After you set the **Permissions** property of an object, only users with direct permission to perform all the extra operations that the object has been given can modify this object.  
>   
>  Do not use the **Permissions** property to give extra permissions to an object that you would like your users to be able to modify. These users might not have direct permission to perform these operations. This is why you should be careful when you use the **Permissions** property for tables and pages.  
  
## See Also  
 [Properties](devenv-properties.md)