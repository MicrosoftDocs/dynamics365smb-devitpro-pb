---
title: "UseLax Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d95f6afe-8b48-4934-be3b-0e5d0fda4aa0
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# UseLax Property
Specifies whether an XMLport uses LAX \(Lazy API for XML\) to process an XML file.  
  
## Applies To  
  
-   XMLports  
  
## Property Value  
 **True** if the XMLport uses LAX; otherwise **false**.  
  
## Remarks  
 Extra elements and attributes are often added to XML documents when they are processed in software systems. If this property is set to **true**, the XML document will be validated as long as the document meets the minimum schema definition. For example, if an XML document contains extra elements and attributes than the schema strictly defines, the document will validated against the schema.  
  
## See Also  
 [Properties](devenv-properties.md)