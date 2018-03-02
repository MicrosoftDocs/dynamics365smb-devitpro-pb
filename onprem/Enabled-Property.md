---
title: "Enabled Property"
author: edupont04
ms.custom: na
ms.date: 12/08/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e54c1bbb-2070-40cb-b633-4be7738cd3d6
ms.author: edupont
---
# Enabled Property
Sets a value that indicates whether a field or key is enabled or disabled, or whether a control can respond to user-generated events.  

## Applies To  

-   Group, part, and field controls on pages  

-   Page actions  

-   Keys  

-   Table fields  

## Property Value  
 **Yes** \(**true** on pages\) if the field, key, or control is enabled; otherwise, **No** \(**false** on pages\). The default is **Yes** \(**true** on pages\).  

## Remarks  
 For keys, this property determines whether a key is maintained in the database. If you are not using the key or if you rarely use the key, you may want to mark it as disabled for performance reasons. When you want to use the key you can change this setting.  

 For fields, this property determines whether you can store data in the field. If the field is unused, disable it to conserve database space. In an XMLPort, a disabled field is read from the external file on import, but it is not inserted in the database.  

 For controls, the Enabled setting for the container that contains this control overrides what is entered here.  

 On pages, you use the **Enabled** property for group, part, field, and action controls. You can enable or disable the control either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

## Example: Dynamic Property Change Using a Boolean Field  
 To disable the **Credit Limit \(LCY\)** field on customer cards unless line discounts are allowed, follow these steps:  

1.  Open page 21, **Customer Card**, with Page Designer.  

2.  View the properties of field 22, **Credit Limit \(LCY\)**.  

3.  For the **Visible** property, enter **“Allow Line Disc.”** in the **Value** field.  

     The **Allow Line Disc.** field is a Boolean field on page 21, **Customer Card**.  

4.  Save the changes on page 21.  

 Now, when a user selects the **Allow Line Disc.** check box on a customer card, the **Credit Limit \(LCY\)** field is enabled. Otherwise, the field is disabled.  

## See Also  
[Table Properties](Table-Properties.md)  
[Properties](Properties.md)  
