---
title: "UseRequestPage Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# UseRequestPage Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether a request page is presented to the user.

## Applies to
-   Xml Port
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if you want to show a request page; otherwise, **false**. The default is **true**.

## Syntax

```AL
UseRequestPage = false;
```  
  
## Remarks  

If `UseRequestPage` is **false**, then a request page is not shown. The user cannot choose a sort order or set any filters. To run an XMLport without using a Request page, this property must be set to **false**.
  
You can override the setting of the `UseRequestPage` property at runtime by setting the *ReqWindow* parameter of the [Run (Report) Method](../methods-auto/report/report-run-method.md), [RunModal (Report) Method](../methods-auto/report/report-runmodal-method.md), or [Run (XMLport) Method](../methods-auto/xmlport/xmlport-run-method.md).

## See Also

[Properties](devenv-properties.md)  