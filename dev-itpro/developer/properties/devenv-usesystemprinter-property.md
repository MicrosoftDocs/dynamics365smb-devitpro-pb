---
title: "UseSystemPrinter Property"
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
# UseSystemPrinter Property
> **Version**: _Available or changed with runtime version 1.0._

Sets which printer is suggested when the report is run.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if you want the system default printer to be used; otherwise, **false**. The default is **false**.  

## Syntax

```AL
UseSystemPrinter = true;
```
  
## Remarks  

The user will be able to select another printer at runtime if the [UseRequestPage Property](devenv-userequestpage-property.md) is **true**.  
  
If the UseSystemPrinter property is set to **false**, but there is no specific printer defined for the User/Report combination, the system default printer will be suggested.  
  
## See Also  

[UseRequestPage Property](devenv-userequestpage-property.md)