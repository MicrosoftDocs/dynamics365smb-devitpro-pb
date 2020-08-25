---
title: "RequestFilterHeading Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---


# RequestFilterHeading Property
Sets a caption for the request page tab that is related to a report's data item or an XMLport's table element. The value is taken from the [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) if this property is set.  
  
## Applies To  
  
- Data items on reports
  
- Table elements on XMLports  

## Parameters
*Locked*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
If `true` the RequestFilterHeading is locked and should not be translated.  

*Comment*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Descriptive text for the RequestFilterHeading, for example, with regards to translation.

*MaxLength*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Sets the maximum length of the specific RequestFilterHeading.

## Property Value  
Any valid string. If [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) is set, then the value for the selected language is used. If [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) is not set, then the default is the name of the table that is the specified in the [DataItemTable Property](devenv-dataitemtable-property.md) in a report or in the [SourceTable (XMLports) Property](devenv-sourcetable-XMLports-property.md) in an XMLport. 

## Syntax
```
RequestFilterHeading = 'Entry';
``` 
  
## See Also  
[Request Pages](../devenv-request-pages.md)  
[Multilanguage Development](../devenv-multilanguage-development.md)
