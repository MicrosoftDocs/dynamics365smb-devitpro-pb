---
title: Assign Permission to Use About This Page
description: Add permissions to run About This Report and view information for About This Page by adding the Zoom permission to permission set and assign users to it.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b86e1854-7c08-42c3-b73e-f318478779a0
caps.latest.revision: 13
---
# Assign Permission to Use About This Page in Dynamics NAV
The supplemental permission sets that are provided for the [!INCLUDE[rtc](includes/rtc_md.md)] do not include permissions to run About This Report and do not include permissions to view all information for About This Page. To add permissions to run About This Report and to view all information for About This Page, you add the Zoom permission to a permission set and assign users to that permission set.  
  
## Adding the Zoom Permission  
  
#### To add the Zoom permission to a permission set  
  
1.  Edit the permission set to which you want to add the Zoom permission. For more information, see [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md). Follow the steps in the procedure to edit a permission set.  
  
2.  Scroll to the end of the list and position the pointer on a new line to add an additional object to the permission set definition.  
  
3.  In the **Object Type** field, select **System**.  
  
4.  In the **Object ID** field, enter **5330**.  
  
     The **Object Name** field is filled in automatically with **Tools, Zoom**.  
  
5.  In the **Execute Permission** field of the line for the **Tools, Zoom** permission, choose **Yes**.  
  
6.  Close the **Permissions** window and the **Permission Sets** window.  
  
### Next Steps  
 After you add the Zoom permission to a permission set, you must assign users to that permission set. For more information, see [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md).  
  
## See Also  
 [Managing Users](Managing-Users.md)   
 [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)
