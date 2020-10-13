---
title: "RunPageLink Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# RunPageLink Property

Sets up a link to the page you are launching. Set the RunPageLink property to establish the link to the page that you want to launch. In the filter syntax, select a field from the table corresponding to the page that you want to launch. And then select the field in the table that underlies the current page and be careful that this field must match the field that you selected from the first table.

> [!NOTE]  
> This property is supported only on actions for pages.

> [!IMPORTANT]  
> For performance reasons, always set the `RunPageView` property if the `RunPageLink` property is also set. In fact, the sort order chosen in the `RunPageView` property must contain the fields listed in the `RunPageLink` property or else the performance is decreased.

## Applies to  
  
- Page Actions  
  
## Syntax example

```AL
action(ShowVendors)
{ 
    ...
    RunObject = page "Vendor Card";
    RunPageLink = "ID"=field(Id);
    ...
}
```

```AL
action(CustomerBalance)
{   
    ...
    RunObject = page "Customer List";
    RunPageLink = "Balance (LCY)"=filter(>=10000);
    ...
}
```

## Remarks

For example, if the current page is the customer card and you need to provide a way to see the outstanding sales orders for the current customer, you would use the [RunObject Property](devenv-runobject-property.md) to run the customer sales orders page. In this property you would select the `Customer No.` field as the link between the two pages.  
  
## See Also  

[RunPageView Property](devenv-runpageview-property.md)  
[RunObject Property](devenv-runobject-property.md)