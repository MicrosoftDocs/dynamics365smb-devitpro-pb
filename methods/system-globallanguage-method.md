---
title: "GlobalLanguage Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# GlobalLanguage Method
Gets and sets the current global language setting.

## Syntax
```
[LanguageID := ]  System.GlobalLanguage([NewLanguageID: Integer])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*NewLanguageID*  
&emsp;Type: [Integer](integer-data-type.md)  
  


## Return Value
*LanguageID*  
&emsp;Type: [Integer](integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The LanguageID is a standard Windows language ID. The Windows Language virtual table contains a list of these IDs and the corresponding names and short names.  
  
 For more information, see [Multilanguage Development](../devenv-multilanguage-development.md). 
 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)