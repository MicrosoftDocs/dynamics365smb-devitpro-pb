---
title: "NodeName Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 93b5940e-cfea-430d-86a5-0fb924ed793c
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 

# NodeName Property
Sets the name of a node in an XML document.  
  
## Applies To  
 XMLport data items

## Syntax
```
textelement(NodeName){...}
```
## Remarks
If the  [XmlName Property](devenv-xmlname-property.md) is not defined, it will use the string specified in the **NodeName Property** as the default variable name.

<!--
## Remarks  
 The name that you specify is inserted in the NodeName field of the XMLport Designer of the element or attribute in question.  
  
 You must enter node names in the order that they appear in the XML document. Parent elements must precede their child elements. Indent the node names of child elements under their parent elements using one indentation per level. List attributes under the elements that they define and indent them to the child level.  -->
  
## See Also  
 [XmlName Property](devenv-xmlname-property.md)  
 [XMLport properties](devenv-xmlport-properties.md)
