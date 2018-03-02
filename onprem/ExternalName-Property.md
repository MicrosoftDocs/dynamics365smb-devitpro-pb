---
title: "ExternalName Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ddde23c8-cc94-4b5b-a5d7-83595ea4943a
caps.latest.revision: 2
manager: edupont
---
# ExternalName Property
Specifies the name of the original table in the external database.  

 Specify this property if the original name is different from the name that you specify in the **Name** property. This means that you can use a different name for the table in [!INCLUDE[navnow](includes/navnow_md.md)].  

## Applies To  

-   Tables  

## Property Value  
 The name of the table in the external database.  

## Remarks  
 This property appears when you specify **CRM** or **ExternalSQL** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

## See Also  
 [TableType Property](TableType-Property.md)   
 [ExternalSchema Property](ExternalSchema-Property.md)   
 [Name Property](Name-Property.md)   
 [Properties](Properties.md)   
 [Table Designer](uiref/-$-S_2102-Table-Designer-$-.md)   
 [External Tables](External-Tables.md)   
 [Customizing Dynamics CRM and Dynamics NAV Integration](Customizing-Dynamics-CRM-and-Dynamics-NAV-Integration.md)
