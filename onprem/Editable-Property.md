---
title: "Editable Property"
ms.custom: na
ms.date: 12/08/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 10e8a6db-079f-4ac1-b589-245b1ad43196
caps.latest.revision: 18
ms.author: edupont
---
# Editable Property
Sets a value that indicates whether a field, page, or control can be edited through the UI.  

## Applies To  

-   Pages and group, part, and field controls  

-   Table fields  

## Property Value  
 **Yes** \(**true** on pages\) if the field, page, or control can be edited; otherwise, **No** \(**false** on pages\). The default value is **Yes**.  

## Remarks  
 For fields, use this property to make a field for display only.  

 For controls, if the **Editable** property for the container that contains this control is set to **No**, then that setting overrides what you enter here.  

 If a page has **Editable** set to **No**, then the controls on the page are not editable, even if the individual **Editable** properties are set to **Yes**.  

 The property setting is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table. If a field is updated through application code, then the **Editable** property is not validated.  

> [!NOTE]  
>  When using CurrPage.Editable, the **Editable** property also reflects the page mode that the page was opened in. This applies to Edit, Create, and Delete modes, but not to View mode. If the page is editable, then CurrPage.Editable will return **false**.  

 On pages, you use the **Editable** property for group, part, field, and action controls. You can make them editable or non-editable either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

> [!CAUTION]  
>  Do not use CurrPage.Editable to prevent users from deleting entries. We recommend that you use permissions to control which users can delete data.  

## Example: Dynamic Property Change Using a Boolean Field  
 To make the **Credit Limit \(LCY\)** field on customer cards non-editable unless line discounts are allowed, follow these steps:  

1.  Open page 21, **Customer Card**, with Page Designer.  

2.  View the properties of field 22, **Credit Limit \(LCY\)**.  

3.  For the **Visible** property, enter **“Allow Line Disc.”** in the **Value** field.  

     The **Allow Line Disc.** field is a Boolean field on page 21, **Customer Card**.  

4.  Save the changes on page 21.  

 Now, when a user selects the **Allow Line Disc.** check box on a customer card, the **Credit Limit \(LCY\)** field is editable. Otherwise, the field is non-editable.  

## See Also  
 [Properties](Properties.md)   
 [Page Properties](Page-Properties.md)
