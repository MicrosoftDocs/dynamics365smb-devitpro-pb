---
title: "IndentationControls Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e2e75702-bc56-4c5b-a3b9-ac7d223808c4
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---
# IndentationControls Property

Sets which columns (controls) are indented in a list.  
 
## Syntax
```
IndentationControls = Field1, Field2;
```

## Applies To  
  
- Repeater controls on list page types

## Remarks  

The **IndentationControls** property lets you choose which columns are indented under a repeater control on a list page.

To enable an indented hieracrhy, in addition to setting **IndentationControls** property, you must also set the **IndentationColumn** property. This property specifies an integer data type field in the source table that is used to control the indentation of records in the list. 

When using this property, consider the following behavior:

- When indentation is specified, it is no longer possible to use sorting on the columns in the repeater control.
- [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] supports indentation on one column only. If you specify more than one column in the **IndentationControls** property, only the first column is used when the page is displayed in [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)].  
- This property is ignored if the **ShowAsTree** property on the repeater is set to **true**.

## Example

```
repeater(Control1)
{
    IndentationColumn = Indent;
    IndentationControls = Name;
    
    field("No."; "No.")
    {
       
    }

```
## See Also

[ShowAsTree](devenv-showastree-property.md)  
[IndentationColumn Property](devenv-indentationcolumn-property.md)  