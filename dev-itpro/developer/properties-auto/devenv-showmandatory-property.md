---
title: "ShowMandatory Property"
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
# ShowMandatory Property
Sets a value that specifies whether users must enter a value in the selected field or text box. The field is marked on the page with a red asterisk and does not enforce any validation. Once the field is filled, the red asterisk disappears. The ShowMandatory property only controls the UI and overrides any asterisk marking of the NotBlank Property.

The ShowMandatory property can be specified as true, false, or as an expression.

For an example, see the Purchase Invoice page where the Vendor Invoice No field is controlled by the VendorInvoiceNoMandatory expression. VendorInvoiceNoMandatory is a variable that takes the value from the Ext. Doc. No. Mandatory field on the Purchase page and the Payables page.

Using expressions has the limitation that number fields with default values, will be interpreted as having a value, and will not be marked with a red asterisk. For example, on the Customer page, on the Credit Limit field, using an expression like Credit Limit; 5000 will not result in a red asterisk, even if the value is below 5000, because the field already has a default value.

Also, be aware that while it is possible to use an expression for the ShowMandatory property, the property cannot validate an AL function.

## Applies to
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  