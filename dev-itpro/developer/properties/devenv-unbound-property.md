---
title: "Unbound Property"
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
# Unbound Property
> **Version**: _Available from runtime version 1.0._

Sets whether the element can be repeated an unknown number of times at runtime before the import or export moves on to the next element.

## Applies to
-   Xml Port Text Element
-   Xml Port Field Element
-   Xml Port Table Element
-   Xml Port Field Attribute
-   Xml Port Text Attribute


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**True** if the element can be unbound; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
Unbound = true;
```
 
## Remarks

If you design an XMLport that is used to import or export data in different formats where the number of columns can vary, you can use this property to handle the number of columns.  
  
> [!WARNING]  
> If this property is set to **true**, then your code for handling exports must specify when to break to the next element by using the **BREAKUNBOUND** method.  
>  
> During an import, the XMLport will automatically move on to the next record when the code reaches a record separator.  
  
For example, your XMLport can export data in two different file formats. One format contains 5 columns, and the other contains 10 columns. Instead of duplicating the maximum number of columns and writing code that skips any redundant columns, you can set up a single column, make it unbound, and then specify in code when to break to the next element.  
  
## See Also  

[BreakUnbound Method \(XMLport\)](../methods-auto/xmlport/xmlportinstance-BREAKUNBOUND-method.md)