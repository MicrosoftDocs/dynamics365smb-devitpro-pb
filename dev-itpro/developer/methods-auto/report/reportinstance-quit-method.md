---
title: "Report.Quit Method"
ms.author: solsen
ms.custom: na
ms.date: 05/19/2021
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
# Report.Quit Method
> **Version**: _Available from runtime version 1.0._

Aborts the processing of a report or XmlPort.


## Syntax
```
 Report.Quit()
```

## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When you use the QUIT method, the report or XMLport is exited without committing any changes that were made to the database during the execution. The [OnPostReport Trigger](../../triggers-auto/report/devenv-onpostreport-report-trigger.md) or [OnPostXMLport Trigger](../../triggers-auto/xmlport/devenv-onpostxmlport-xmlport-trigger.md) trigger will not be called.  
  
## Example  
 The following example shows how to use the QUIT method to abort an execution without committing any changes that were made during the processing.  
  
```  
  
// Do some database processing.  
CurrReport.QUIT;  
  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)