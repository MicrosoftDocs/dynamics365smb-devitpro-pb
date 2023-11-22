---
title: "Report.WordXmlPart(Integer [, Boolean]) Method"
description: "Returns the report data structure as structured XML that is compatible with Microsoft Word custom XML parts."
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
# Report.WordXmlPart(Integer [, Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns the report data structure as structured XML that is compatible with Microsoft Word custom XML parts. The method has an instance call and a static call. The following code shows the syntax of the WORDXMLPART function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.


## Syntax
```AL
String :=   Report.WordXmlPart(Number: Integer [, ExtendedFormat: Boolean])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run. If the report you specify does not exist, then a run-time error occurs.  

*[Optional] ExtendedFormat*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If you set this variable to true, then XML elements will include the following attributes:
-   ElementType="Parameter|Column|DataItem". Specifies the element type as defined for the report in Report Designer. Parameter is typically used for elements, such as captions.
-   ElementId="ID". Specifies the ID that is assigned to the element by its ID Property.
-   DataType="Type". Specifies the data type of the element.
If you omit this parameter or set it to false, then the element attributes are not included in the XML. This is the recommended setting when you will use the Word XML part in Word for modifying the report layout because the XML is simpler.
The following example illustrates an XML element that has the ExtendedFormat set to true: \<CompanyName ElementType="Column" ElementId="3" DataType="OemText"\>
The following example illustrates the same XML with the ExtendedFormat set to false:\<CompanyName\>  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The report data structure as structured XML that is compatible with Microsoft Word custom XML parts.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
[!INCLUDE[WordXmlPart](../../includes/include-wordxmlpart-info.md)]

## Example  
[!INCLUDE[example-1](../../includes/include-wordxmlpart-example-1.md)]

```AL
var
    ReportAsXmlString: Text;
begin
    ReportAsXmlString := MyReport.WordXmlPart(Report::MyReport);  
end;
```  

> [!NOTE]  
> The first parameter in WordXmlPart is an integer that is the object ID of the report. To code robustly, never supply the object ID directly in your code. Instead, use the :: operator as illustrated in the example above. With this technique, if the report does not exist, you'll get a compile time error instead of a runtime error. 


[!INCLUDE[example-2](../../includes/include-wordxmlpart-example-2.md)]

## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)