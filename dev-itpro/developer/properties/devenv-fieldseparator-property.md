---
title: "FieldSeparator Property"
ms.custom: na
ms.date: 07/13/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# FieldSeparator Property
Sets the string that is to be used to separate fields.  
  
## Applies to  
  
- XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|<**None**>|There is no field separator.|  
|<**NewLine**>|Any combination of CR and LF characters.|  
|<**CR/LF**>|CR followed by LF.|  
|<**CR**>|CR alone.|  
|<**LF**>|LF alone.|  
|<**TAB**>|Tabulator alone.|  
|**Other strings**|The literal string entered.|  

## Syntax

```
Format = VariableText;
FieldSeparator = '<TAB>';
```
 
## Remarks  

**FieldSeparator** is only used if the **Format** property is set to **Variable Text**. Otherwise, the setting is ignored. 

This property specifies how tables should be separated. The default value is a comma (**<,>**).  

The strings in the preceding table must be entered literally, using the < and > characters. These special strings can be combined and can also be mixed with other characters.  
  
CR refers to the character with ASCII value 13.  
  
LF refers to the character with ASCII value 10.   
  
You can set the field separator in AL code so that the XMLport can import and export records with different separators. For example, if your XMLport must import from a file or stream where one record uses commas and another uses **TAB**, you can change the field separator property at run time.  
  
## See Also  

[Properties](devenv-properties.md)   
[Format Property (XMLports)](devenv-format-xmlports-property.md)