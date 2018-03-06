---
title: "FieldDelimiter Property"
author: edupont04
ms.custom: na
ms.date: 06/21/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: edupont
---
# FieldDelimiter Property
Specifies the text delimiter for a field.  

## Applies To  

-   XMLports  

## Property Value  

|**Value**|**Description**|  
|---------------|---------------------|  
|**\<None>**|There is no text delimiter for the field.|  
|**\<">**|Double straight quotes.|  
|**\<NewLine>**|Any combination of CR and LF characters.|  
|**\<CR/LF>**|CR followed by LF.|  
|**\<CR>**|CR alone.|  
|**\<LF>**|LF alone.|  
|**\<TAB>**|Tabulator alone.|  

## Remarks  
The default value is " (double straight quotes).  

You can set the field delimiter in C/AL code so that the XMLport can import and export records with different delimiters. For example, if your XMLport must import from a file or stream where one record uses commas and another uses an empty string, you can change the field delimiter property at run time.  

## See Also  
[Properties](Properties.md)
