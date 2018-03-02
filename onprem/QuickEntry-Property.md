---
title: "QuickEntry Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6d7713f7-4d68-4989-8ed5-4dec80ae7334
caps.latest.revision: 12
manager: edupont
---
# QuickEntry Property
Specifies if the page control should have input focus. The default value of the property is **true**. To specify that a control can be skipped, change this value to **false**.  
  
> [!NOTE]  
>  Specifying an expression as the value of the property is not supported.  
  
## Applies To  
 Page fields  
  
## Remarks  
 Apply this property setting to page controls that can be skipped for a faster entry of data. The **QuickEntry** property is respected when you use the Enter key. Tabbing through a page will sequentially give input focus to all page controls.  
  
 On pages, you use the **QuickEntry** property for groups, parts, fields, and action controls. You can enable or disable them either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  
  
## Example: Dynamic Property Change Using a Boolean Field  
 To skip over the **Credit Limit \(LCY\)** field on customer cards when the **Allow Invoice Discount** field is not selected, follow these steps:  
  
1.  Open page 21, **Customer Card**, with Page Designer.  
  
2.  View the properties of field 22, **Credit Limit \(LCY\)**.  
  
3.  For the **QuickEntry** property, enter **“Allow Line Disc.”** in the **Value** field.  
  
4.  The **Allow Line Disc.** field is a Boolean field on page 21, **Customer Card**.  
  
5.  Save the changes on page 21.  
  
 Now, when a user selects the **Allow Invoice Disc.** check box on a customer card, the **Credit Limit \(LCY\)** field receives focus when the user presses Enter to move focus to the field. Otherwise, focus skips over the field when the user presses Enter to move across the customer card.  
  
## See Also  
 [Properties](Properties.md)