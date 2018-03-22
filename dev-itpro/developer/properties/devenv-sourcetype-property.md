---
title: "SourceType Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ca16823e-82ce-4230-98b0-f4ac0f962466
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# SourceType Property
Sets what a particular tag in the XMLport Designer corresponds to in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  
  
## Applies To  
 XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Text**|The XML data in the object denoted by the [NodeName Property](devenv-nodename-property.md) cannot be mapped directly to the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] database or when the database does not need the information. The name of the Text field in the XMLport Designer is put into a global text variable.<br/><br /> This variable functions just like a AL Global variable. However, it is not visible in AL Globals window but it is visible in the AL Symbol Menu.|  
|**Table**|The object denoted by the [NodeName Property](devenv-nodename-property.md) corresponds to a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] table. You should also select this value when a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] table record needs to be initialized.|  
|**Field**|Access is required to a field in the database. For this selection to be valid, you must first have declared a table as the parent of this object or attribute. Failure to do so will cause an error to occur when you try to compile the XMLport object.|  
  
## Remarks  
 This property is directly related to the SourceType field in the XMLport Designer.  
  
## See Also  
 [NodeName Property](devenv-nodename-property.md)