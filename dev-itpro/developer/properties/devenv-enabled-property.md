---
title: "Enabled Property"
ms.custom: na
ms.date: 06/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e54c1bbb-2070-40cb-b633-4be7738cd3d6
ms.author: solsen
---

# Enabled Property
Sets a value that indicates whether a field or key is enabled or disabled, or whether a control can respond to user-generated events.  

## Applies To  

-   Group, part, and field controls on pages  

-   Page actions  

-   Keys  

-   Table fields  

## Property Value  
 **True** on pages if the field, key, or control is enabled; otherwise, **false** on pages. The default is **true** on pages.  

## Remarks  
 For keys, this property determines whether a key is maintained in the database. If you are not using the key or if you rarely use the key, you may want to mark it as disabled for performance reasons. When you want to use the key you can change this setting.  

 For fields, this property determines whether you can store data in the field. If the field is unused, disable it to conserve database space. In an XMLPort, a disabled field is read from the external file on import, but it is not inserted in the database.  

 For controls, the Enabled setting for the container that contains this control overrides what is entered here.  

 On pages, you use the **Enabled** property for group, part, field, and action controls. You can enable or disable the control either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  

## See Also  
[Table Properties](devenv-table-properties.md)  
[Properties](devenv-properties.md)  
