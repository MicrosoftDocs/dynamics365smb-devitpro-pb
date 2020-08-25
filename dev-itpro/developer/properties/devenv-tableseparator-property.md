---
title: "TableSeparator Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 02bbb812-0ff4-429a-b1c0-8b28270a781b
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---

 

# TableSeparator Property
Specifies the table separator for a table.  
  
## Applies to  
  
-   XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**\<None>**|There is no table separator.|  
|**\<NewLine>**|Any combination of CR and LF characters.|  
|**\<CR/LF>**|CR followed by LF.|  
|**\<CR>**|CR alone.|  
|**\<LF>**|LF alone.|  
|**\<TAB>**|Tabulator alone.|  
|**Other strings**|The literal string entered.|  

## Syntax
```
TableSeparator = '<NewLine>';
```
  
## Remarks  

 **TableSeparator** property is only used if the **Format Property** is set to **Variable Text** or **Fixed Text**. Otherwise, the setting is ignored.  
 
 This property specifies how tables should be separated. The default value is a new line \(**\<NewLine>**\). 

The strings in the preceding table must be entered literally, that is, the **<** and **>** characters must be entered. These special strings can be combined and can be mixed with other characters.  

 CR refers to the character with ASCII value 13.  
  
 LF refers to the character with ASCII value 10.  
  
 You can set the table separator in AL code so that the XMLport can import and export tables with different separators. For example, if your XMLport must import from a file or stream where one table uses a single **NewLine** elements and another uses two **NewLine** elements, you can change the table separator at run time.  
  
## See Also  
 [Properties](devenv-properties.md)