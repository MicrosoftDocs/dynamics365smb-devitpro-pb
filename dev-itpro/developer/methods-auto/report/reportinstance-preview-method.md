---
title: "Report.Preview Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Report.Preview Method
Indicates whether a report is being printed in preview mode.


## Syntax
```
IsPreview :=   Report.Preview()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

## Return Value
*IsPreview*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the report is being printed in preview mode, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You must use the return value. A compile error is generated if this value is not used.  

If you run a client report definition \(RDLC\) report layout in preview mode and then call the CurrReport.PREVIEW method, then the Print icon, Print Layout icon, Page Setup icon, and Save As icon are not displayed.  

 If you run a client report definition \(RDLC\) report layout in preview mode and do not call the CurrReport.PREVIEW method, then you can print from the **Print Preview** window.  

## Example  
 This example shows how to use the PREVIEW method. You can use this method in an application that stores a count of how many times a document has been printed in the database. This number must be updated from inside the report that is used to print the document. To avoid updating the number when the report is run in preview mode, add a construct to the OnPreDataItem trigger that resembles the one that is shown in this example when you add the code that updates the count.  

```  
if CurrReport.PREVIEW then  
... // Preview-specific processing.  
else  
... // Processing that is not preview specific:  
... // Update the print count.  
```  


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)