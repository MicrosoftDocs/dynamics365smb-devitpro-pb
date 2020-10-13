---
title: "ShowMandatory Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1efce3ed-69c2-4655-b499-8e30b4d35ea9
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---
 

# ShowMandatory Property

Sets a value that specifies whether users must enter a value in the selected field or text box. The field is marked on the page with a red asterisk and does not enforce any validation. Once the field is filled, the red asterisk disappears. The **ShowMandatory** property only controls the UI and overrides any asterisk marking of the [NotBlank Property](devenv-notblank-property.md).  
  
The **ShowMandatory** property can be specified as **true**, **false**, or as an expression.  
  
For an example, see the **Purchase Invoice** page where the **Vendor Invoice No** field is controlled by the **VendorInvoiceNoMandatory** expression. **VendorInvoiceNoMandatory** is a variable that takes the value from the **Ext. Doc. No. Mandatory** field on the **Purchase** page and the **Payables** page.  
  
> [!IMPORTANT]  
> Using expressions has the limitation that number fields with default values, will be interpreted as having a value, and will not be marked with a red asterisk. For example, on the **Customer** page, on the **Credit Limit (LCY)** field, using an expression like **Credit Limit (LCY) < 5000** will not result in a red asterisk, even if the value is below 5000, because the field already has a default value.  
>   
> Also, be aware that while it is possible to use an expression for the **ShowMandatory** property, the property cannot validate an AL method.  
  
## Applies to  
  
- Page fields  

## Syntax

```AL
ShowMandatory = true;
```
 
## Remarks  

The **ShowMandatory** property controls marking the page field with a red asterisk independently of the [NotBlank Property](devenv-notblank-property.md). The **ShowMandatory** property can be used to mark all page fields, but does not enforce any validation of the field. This means that the user will be able to close a page without entering data.  
  
The **NotBlank** property can be used to mark the UI on primary key fields with a red asterisk and to enforce a validation error. For more information, see [NotBlank Property](devenv-notblank-property.md).  
  
## See Also  

[Properties](devenv-properties.md)   
[NotBlank Property](devenv-notblank-property.md)