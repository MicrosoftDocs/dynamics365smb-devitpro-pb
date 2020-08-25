---
title: "Indentation Property (XMLports)"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5c2d7eb6-0839-462c-9034-19777012c2aa
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

# Indentation Property (XMLports)
Sets the indentation level of an element or an attribute in **XMLport Designer**.  
  
## Applies To  
 XMLports  
  
## Remarks  
 In **XMLport Designer**, specify the names of elements and their attributes in the **Tag Name** field.  
  
 When you are determining the indentation level of an element or an attribute, remember the following:  
  
-   List the elements and their attributes in the order that they appear in the XML document.  
  
-   List child elements and attributes under the parent element that they define.  
  
-   Only indent each child one level more than its parent.  
  
-   Only the first element can have an indentation of 0.  
  
-   The indentation level that you set in the **Properties** window corresponds directly to the indentation level you can set in **XMLport Designer**. You can also use the buttons in **XMLport Designer** to change the indentation level of an element or an attribute.  
  
## See Also  
 [Properties](devenv-properties.md)