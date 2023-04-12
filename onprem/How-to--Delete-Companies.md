---
title: "How to: Delete Companies"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a5292b5b-7eb4-4f98-9f0e-7dd6a0492ad1
caps.latest.revision: 9
---
# How to: Delete Companies
You can delete companies in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)]. You can also delete companies by using the **Remove-NAVCompany** Windows PowerShell cmdlet.  
  
> [!WARNING]  
>  When you delete a company, the company and all of the data that it contains will be deleted. If you have made reports and customizations, they are not deleted. They are saved in the database.  
  
 We recommend that you make a backup before you delete a company.  
  
 Before you delete a company, you must make sure that you are the only user who has access to the company.  
  
### To make sure that you are the only user who has access to the company  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**.  
  
2.  Choose the **Options** tab, select the **Single user** check box, and then choose the **OK** button.  
  
 You can now delete the company in [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_web](includes/nav_web_md.md)], or by using the **Remove-NAVCompany** Windows PowerShell cmdlet.  
  
 You can only delete a company if you have the relevant permission.  
  
### To delete a company in [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
1.  In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], open a different company than the company that you want to delete. <!--For more information, see [How to: Select a Company](\($-S_COMPANY-How-to--Select-a-Company-$\).md).-->  
  
2.  In the **Search** box, enter **Companies**, and then choose the related link.  
  
3.  In the **Companies** window, choose the company that you want to delete, and then, on the **Home** tab, in the **Manage** group, choose **Delete**.  
  
4.  Confirm that you want to delete the company. You must confirm twice that you want to delete the company.  
  
 This deletes the company. The action cannot be undone.  
  
## See Also  
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)
