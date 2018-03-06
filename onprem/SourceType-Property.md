---
title: "SourceType Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ca16823e-82ce-4230-98b0-f4ac0f962466
caps.latest.revision: 6
manager: edupont
---
# SourceType Property
Sets what a particular tag in the XMLport Designer corresponds to in the [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
## Applies To  
 XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Text**|The XML data in the object denoted by the [NodeName Property](NodeName-Property.md) cannot be mapped directly to the Microsoft Dynamics NAV database or when the database does not need the information. The name of the Text field in the XMLport Designer is put into a global text variable.<br /><br /> This variable functions just like a C/AL Global variable. However, it is not visible in C/AL Globals window but it is visible in the C/AL Symbol Menu.|  
|**Table**|The object denoted by the [NodeName Property](NodeName-Property.md) corresponds to a [!INCLUDE[navnow](includes/navnow_md.md)] table. You should also select this value when a [!INCLUDE[navnow](includes/navnow_md.md)] table record needs to be initialized.|  
|**Field**|Access is required to a field in the database. For this selection to be valid, you must first have declared a table as the parent of this object or attribute. Failure to do so will cause an error to occur when you try to compile the XMLport object.|  
  
## Remarks  
 This property is directly related to the SourceType field in the XMLport Designer.  
  
## See Also  
 [NodeName Property](NodeName-Property.md)