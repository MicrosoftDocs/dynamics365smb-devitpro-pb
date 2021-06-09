---
title: "FilterPageHandler Attribute"
description: "Specifies that the method is a FilterPageHandler method, which handles StrMenu statements."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# FilterPageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a FilterPageHandler method, which handles StrMenu statements.


## Applies To

- Method

> [!NOTE]
> The **FilterPageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[FilterPageHandler]
procedure FilterPageHandler(var Record1: RecordRef [, var Record2: RecordRef] [, var Record3: RecordRef] [, var Record4: RecordRef] [, var Record5: RecordRef] [, var Record6: RecordRef] [, var Record7: RecordRef] [, var Record8: RecordRef] [, var Record9: RecordRef] [, var Record10: RecordRef]) : Boolean;
```

### Parameters
*Record1*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record2*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record3*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record4*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record5*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record6*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record7*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record8*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record9*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


*[Optional] Record10*  
&emsp;Type: [RecordRef](../methods-auto/recordref/recordref-data-type.md)  
Holds the record of the filter page.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  