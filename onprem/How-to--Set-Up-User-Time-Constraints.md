---
title: "How to: Set Up User Time Constraints"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: ac4e9a2c-3d74-4d99-b3b3-23a50068ea09
caps.latest.revision: 17
---
# How to: Set Up User Time Constraints
Administrators can define periods of time during which specified users are able to post, and also specify whether [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] records the amount of time during which specified user are logged on. Administrators can also assign responsibility centers to users.  

## Setting Up User Time Constraints  

#### To set up user time constraints  

1.  In the **Search** box, enter **User Setup**, and then choose the related link. The **User Setup** window opens.  

2.  On the **Home** tab, in the **New** group, choose **New**. The **New – User Setup** window opens.  

3.  In the **User ID** field, enter the ID of a user, or choose the field to see all current Windows users for the current [!INCLUDE[navnow](includes/navnow_md.md)] database.  

4.  Enter time constraint data for the user by filling the fields as described in the following table.  

    |Field|Purpose|  
    |-----------|-------------|  
    |**Allow Posting From**|Specifies the first date on which the user is able to post.|  
    |**Allow Posting To**|Specifies the last date on which the user is able to post.|  
    |**Register Time**|To begin registering the amount of time the user spends working on the current company, select this field.|  
    |**Sales Resp. Ctr. Filter**|Specifies the code for a responsibility center. The user is then assigned to this responsibility center. Choose the **AssistEdit** button to the right of the field to see available responsibility centers.<br /><br /> The Sales responsibility center becomes the default responsibility center when the user creates new sales documents. The user only sees sales orders that are created from their responsibility center.<br /><br /> If you leave this field blank, the default responsibility center in the **Customer Card** or **Company Information** window \(in that order of priority\) is used.|  
    |**Purchase Resp. Ctr. Filter**|Specifies the code for a responsibility center. The user is then assigned to this responsibility center. Choose the **AssistEdit** button to the right of the field to see available responsibility centers.<br /><br /> The Purchase responsibility center becomes the default responsibility center when the user creates new purchase documents. The user only sees purchase orders that are created from their responsibility center.<br /><br /> If you leave this field blank, the default responsibility center in the **Customer Card** or **Company Information** window \(in that order of priority\) is used.|  
    |**Service Resp. Ctr. Filter**|Specifies the code for a responsibility center. The user is then assigned to this responsibility center. Choose the **AssistEdit** button to the right of the field to see available responsibility centers.<br /><br /> The Service responsibility center becomes the default responsibility center when the user creates new service documents. The user only sees service orders created from their responsibility center.<br /><br /> If you leave this field blank, the default responsibility center in the **Customer Card** or **Company Information** window \(in that order of priority\) is used.|  
    |**Time Sheet Admin.**|Specifies whether the user is a time sheet administrator.|  

## See Also  
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   