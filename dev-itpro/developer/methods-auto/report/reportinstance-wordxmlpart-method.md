---
title: "Report.WordXmlPart([Boolean]) Method"
description: "Gets the report data structure as structured XML that is compatible with Microsoft Word custom XML parts."
ms.author: solsen
ms.custom: na
ms.date: 03/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.WordXmlPart([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the report data structure as structured XML that is compatible with Microsoft Word custom XML parts.


## Syntax
```AL
String :=   Report.WordXmlPart([ExtendedFormat: Boolean])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] ExtendedFormat*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If you set this variable to true, then XML elements will include the following attributes:
-   ElementType="Parameter|Column|DataItem". Specifies the element type as defined for the report in Report Designer. Parameter is typically used for elements, such as captions.
-   ElementId="ID". Specifies the ID that is assigned to the element by its ID Property.
-   DataType="Type". Specifies the data type of the element.
If you omit this parameter or set it to false, then the element attributes are not included in the XML.  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string representation of the report data structure as structured XML that is compatible with Microsoft Word custom XML parts.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  

[!INCLUDE[WordXmlPart](../../includes/include-wordxmlpart-info.md)]

## Example

[!INCLUDE[example-1](../../includes/include-wordxmlpart-example-1.md)]

```al
var
    ReportAsXmlString: Text;
    MyReport: Report Report6;
begin
    ReportAsXmlString := MyReport.WordXmlPart();  
end;
```  

[!INCLUDE[example-2](../../includes/include-wordxmlpart-example-2.md)]


## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)