---
title: "CuegroupLayout Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# CuegroupLayout Property
Specifies if the layout is wide.

## Applies to
-   Page Group

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Wide|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax

```AL
CuegroupLayout = wide;
```
  
## Remarks  
For more information about the wide layout for Cues, see [Normal and wide layout for Cues](../devenv-cues-action-tiles.md#CueWideLayout).

## Example

```AL
cuegroup(SalesCueContainer)
{
    CaptionML=ENU='Sales Invoices';
    CuegroupLayout=wide;
    field(SalesCue; SalesInvoicesOpen)
    {
        CaptionML=ENU='Open';
        DrillDownPageId="Sales Invoice List";
    }
} 
```
  
## See Also

[Properties](devenv-properties.md)
[Rowspan Property](devenv-rowspan-property.md)  
[Columnspan Property](devenv-columnspan-property.md)