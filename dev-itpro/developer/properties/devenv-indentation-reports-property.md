---
title: "Indentation Property (Reports)"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9149742a-9917-49db-b848-3aea53e9b384
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

# Indentation Property (Reports)
Sets the indentation level of a data item or column on a report.  
  
## Applies To  
  
-   Reports  

<!--
## Syntax
```
Indentation = 1;
```
-->
  
## Remarks  
 A value of **<0>** (zero) indicates no indentation. Data items can be indented ten levels deep. The largest possible value of this property is **<10>**. You can only indent a data item one level at a time, so the indentation level of a data item can be no more than one greater than the level of the preceding data item. Usually, you will set the indentation level property from the Report Dataset Designer, where you indent data items by clicking a button.  
  
 When a report is run, the first data item is processed. If there is an indented data item (second data item), it is processed each time a record is retrieved and processed in the first data item. This process is recursive, meaning that if there is a third data item with additional indentations after the second data item, then this third data item is processed in the same way as the second items was processed with regard to the top-level data item, and so on.