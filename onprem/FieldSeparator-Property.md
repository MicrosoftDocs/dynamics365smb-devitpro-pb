---
title: "FieldSeparator Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1fde9a2c-75c6-45b2-8cb9-8eeaa8491521
caps.latest.revision: 12
---
# FieldSeparator Property
Sets the string that is to be used to separate fields.  
  
## Applies To  
  
-   XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**\<None>**|There is no field separator.|  
|**\<NewLine>**|Any combination of CR and LF characters.|  
|**\<CR/LF>**|CR followed by LF.|  
|**\<CR>**|CR alone.|  
|**\<LF>**|LF alone.|  
|**\<TAB>**|Tabulator alone.|  
|**Other strings**|The literal string entered.|  
  
## Remarks  
 The strings in the preceding table must be entered literally, using the \< and > characters. These special strings can be combined and can also be mixed with other characters.  
  
 The default value is a comma \(**\<,>**\).  
  
 CR refers to the character with ASCII value 13.  
  
 LF refers to the character with ASCII value 10.  
  
 **FieldSeparator** is only used if the Format property is set to **Variable Text**. Otherwise, the setting is ignored.  
  
 You can set the field separator in C/AL code so that the XMLport can import and export records with different separators. For example, if your XMLport must import from a file or stream where one record uses commas and another uses TAB, you can change the field seperator property at run time.  
  
## See Also  
 [Properties](Properties.md)   
 [Format Property \(XMLports\)](Format-Property--XMLports-.md)