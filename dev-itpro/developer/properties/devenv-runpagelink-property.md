---
title: "RunPageLink Property"
ms.custom: na
ms.date: 07/28/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 7b8c9e7a-894e-48ae-bd1a-018aa4b6130d
caps.latest.revision: 7
---

 

# RunPageLink Property
Sets up a link to the page you are launching.  
  
## Applies To  
  
-   Page Actions  
  
## Remarks  
 For example, if the current page is the customer card and you need to provide a way to see the outstanding sales orders for the current customer, you would select RunObject in the PushAction property and use the [RunObject Property](devenv-runobject-property.md) to run the customer sales orders page. In this property you would select the Customer No. field as the link between the two pages.  
<!--
 For an example of how to use RunPageLink to launch a page from an action in the RoleTailored client, see [Walkthrough: Adding Actions to a Customer List Page](Walkthrough--Adding-Actions-to-a-Customer-List-Page.md).  -->
  
## See Also  
 [RunPageView Property](devenv-runpageview-property.md)  
 [RunObject Property](devenv-runobject-property.md)