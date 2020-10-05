---
title: "CuegroupLayout Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# CuegroupLayout Property
Sets whether a `cuegroup` control displays in the wide layout.   
  
## Applies to  
  
-   `cuegroup` controls
  
## Property Values  

`wide` sets the `cuegroup` control to the wide layout; otherwise, the control uses the normal layout.     

## Syntax
```
CuegroupLayout = wide;
```
  
## Remarks  
For more information about the wide layout for Cues, see [Normal and wide layout for Cues](../devenv-cues-action-tiles.md#CueWideLayout).

## Example
```
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
<!--
[How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to-Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md) 
-->