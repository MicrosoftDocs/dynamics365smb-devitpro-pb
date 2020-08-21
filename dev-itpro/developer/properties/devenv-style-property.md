---
title: "Style Property"
description: "Description of the Style property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 3ac73e26-7723-46b1-aa15-fd578aa4b56f
ms.author: solsen
---

 

# Style Property
Sets a value that determines how text in a field on a page is formatted. For fields that are included in a **CueGroup**, this property sets the value of the color indicator on the cue.  

## Applies to  

-   Page field controls that contain text.  

-   Fields in a **CueGroup** control.  

## Property Value  
 The following table lists the values and their formatting for text and Cues.  

|Value|Text Formatting|Cue color indicator|  
|-----------|---------------------|-------------------------|  
|**Standard**|Standard|Standard|  
|**StandardAccent**|Blue|Not applicable.|  
|**Strong**|Bold|Not applicable.|  
|**StrongAccent**|Blue + Bold|Not applicable.|  
|**Attention**|Red + Italic|Red|  
|**AttentionAccent**|Blue + Italic|Not applicable.|  
|**Favorable**|Bold + Green|Green|  
|**Unfavorable**|Bold + Italic + Red|Red|  
|**Ambiguous**|Yellow|Yellow|  
|**Subordinate**|Grey|Grey|  

## Remarks  

> [!NOTE]  
>  This information in this topic mainly pertains to formatting the text on page fields. <!-- For information about how to use the **Style** property for configuring Cues, see [How to: Set Up Colored Indicators on Cues by Using the Style and StyleExpr Property](devenv-How-to-Set-Up-Colored-Indicators-on-Cues-by-Using-the-Style-and-StyleExpr-Property.md).  -->

 The **Style** property works together with the [StyleExpr Property](devenv-styleexpr-property.md) value to determine whether the field is formatted. If the [StyleExpr Property](devenv-styleexpr-property.md) evaluates to **true**, then the value of the field is formatted as specified by the **Style** property.  

 By default, the **Style** property is not set.  

 This property is not supported if one of the following data types is used for the SourceExpr of the field:  

-   Code  

-   Boolean  

-   Binary  

-   BLOB  

-   GUID  

-   RecordID  

 On pages, you use the **Style** property for group, part, field, and action controls. You can change the formatting of a control either statically by setting the [StyleExpr Property](devenv-styleexpr-property.md) to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

## Example

The following code sample shows how to make the text of the field control `"Code"` bold using the **Style** property. The text will be formatted only if the Boolean variable `Emphasize` evaluates to **true**.

```
field("Code"; Code)
    {
        Style = Strong;
        StyleExpr = Emphasize;
    }
```

## See Also  
 <!-- [How to: Style Field Text on a Page](../devenv-How-to-Style-Field-Text-on-a-Page.md)   -->
 [Properties](devenv-properties.md)
