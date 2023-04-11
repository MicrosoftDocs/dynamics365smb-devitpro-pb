---
title: "How to: Rename Companies"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c1426b14-5599-410a-8af4-180d951aeb03
caps.latest.revision: 7
---
# How to: Rename Companies
You can rename companies in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)]. You can also rename companies by using the **Rename-NAVCompany** Windows PowerShell cmdlet.  

 Before you rename a company, you must make sure that you are the only user who has access to the company.  

### To make sure that you are the only user who has access to the company  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**.  

2.  Choose the **Options** tab, select the **Single user** check box, and then choose the **OK** button.  

 You can now rename the company in [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_web](includes/nav_web_md.md)], or by using the **Rename-NAVCompany** Windows PowerShell cmdlet.  

 You can only rename a company if you have the relevant permission.  

### To rename a company in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

1.  In the **Search** box, enter **Companies**, and then choose the related link.  

2.  Replace the current company name with the new name that you want to use.  

3.  Choose the **OK** button to accept the new company name.  

 You can rename a company at any time. You can use this function if you have made a mistake when naming the company, or if you think that a different name will be easier to recognize. However, renaming a company that has been used and already contains data can take some time.  

> [!NOTE]  
>  When you work in the [!INCLUDE[demolonglight](includes/demolonglight_md.md)] and use the Cronus.flf license file, you can only change the company name to one that starts with CRONUS with uppercase letters.  

## See Also  
 [How to: Delete Companies](How-to--Delete-Companies.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [How to: Create Companies](How-to--Create-Companies.md)
