---
title: "FormatEvaluate Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FormatEvaluate Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the data that is being imported or exported as XML data types or as the standard C/SIDE data types.

## Applies to
-   Xml Port

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Legacy**|The data uses the standard AL data types.|
|**Xml**|The data uses the standard XML data types.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
FormatEvaluate = XML;
```

## Remarks  
  
### Importing  

If the XML document that you want to import contains data that corresponds to the standard AL data types, use AL Format/Evaluate (default value). The data is then evaluated before being inserted into the database.  
  
If the XML document that you want to import contains data that uses the standard XML data types, use the XML Format/Evaluate setting. This ensures that the data is evaluated and converted to the AL data types before being inserted into the database.  
  
 If the data that you want to import does not follow either the Standard AL formats or the XML formats, import the data into a temporary table in text format. You can then use AL code to convert the data before inserting it into the database.  
  
### Exporting

If you want to export data that uses the standard AL data types to an XML document and use these data types in the XML document, use AL Format/Evaluate (default value). The data from the database is then formatted according to the standard rules for AL data types.  
  
If you want to export data in the standard XML formats to an XML document, use the XML Format/Evaluate setting. This ensures that the data you export from the database is formatted and exported in the standard XML formats.  
  
The following XML Data types require evaluation.  
  
|**XML Data Type**|**Dynamics 365 Business Central Data Type**|  
|-----------------------|------------------------------------------|  
|Decimal<br /><br /> Float<br /><br /> Double|Decimal|  
|Boolean|Boolean|  
|Datetime|DateTime|  
|Time|Time|  
|Date|Date|  
|Integer|Integer|  
|Duration|Duration|  
  
This is an XMLport property and therefore applies to all the data that is being streamed. It cannot be applied only to specific fields.  
  
For more information about formatting AL data types, see [Format Property](devenv-format-property.md). For more information about evaluating variables, see [EVALUATE Method](../methods-auto/system/system-evaluate-method.md). For more information about using temporary tables, see [Temporary Property (XMLports)](devenv-temporary-xmlports-property.md).  
  
## See Also  

[Format Property (XMLports)](devenv-format-property.md)   
[Evaluate Method](../methods-auto/system/system-EVALUATE-method.md)   
[Temporary Property (XMLports)](devenv-temporary-xmlports-property.md)