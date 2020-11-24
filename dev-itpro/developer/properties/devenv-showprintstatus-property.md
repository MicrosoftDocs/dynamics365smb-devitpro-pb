---
title: "ShowPrintStatus Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# ShowPrintStatus Property
> **Version**: _Available from runtime version 1.0._

Sets whether a window that shows the printing status of a report when it is run is displayed.

## Applies to
-   Report


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if a status window is shown; otherwise, **false**. The default is **true**.  

## Syntax

```AL
ShowPrintStatus = false;
```
  
## Remarks

Apart from showing the progress of the report, the window also contains a **Cancel** button that will cause the processing and printing of the report to terminate, when clicked. If you set ShowPrintStatus to **false**, the user will not be able to stop the report prematurely.  
  
If the [ProcessingOnly Property](devenv-processingonly-property.md) is **true**, there will be no status dialog box, even if ShowPrintStatus is **true**. If you need a status dialog box, you must create one yourself.  
  
## See Also  

[Properties](devenv-properties.md)  
[ProcessingOnly Property](devenv-processingonly-property.md)