---
title: "RunPageOnRec Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RunPageOnRec Property
> **Version**: _Available from runtime version 1.0._

Sets the same record on the page you launch from this control as is already displayed on the current page.

## Applies to
-   Page Action


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if the current record on the page that you will launch from this control is displayed; otherwise, **false**. The default is **false**.  

## Syntax

```AL
RunPageOnRec = true;
```
  
## Remarks  

For example, suppose the current page is the sales order and you are providing a way to see the sales statistics for the current customer. You would select RunObject in the PushAction property and use the [RunObject Property](devenv-runobject-property.md) to run the sales statistics page. In this property you could select Yes to display the same record on both pages.  
  
## See Also  

[RunPageView Property](devenv-runpageview-property.md)   
[RunPageLink Property](devenv-runpagelink-property.md)