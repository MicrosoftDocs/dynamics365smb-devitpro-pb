---
title: Create Dynamics NAV Users
description: Create and modify users in Dynamics NAV to give access and modify users by using the Windows client, web client or Windows PowerShell cmtlets.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3ff41005-9430-4fb9-84e8-33b4c056f61d
caps.latest.revision: 41
---
# Creating Microsoft Dynamics NAV Users
Before a user can access [!INCLUDE[navnow](includes/navnow_md.md)], you must have created them as users in [!INCLUDE[navnow](includes/navnow_md.md)]. To create and modify users, you can use the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_web](includes/nav_web_md.md)], or the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets.  

> [!IMPORTANT]  
>  You do not create user logins for [!INCLUDE[navnow](includes/navnow_md.md)] user in SQL Server before or after you create [!INCLUDE[navnow](includes/navnow_md.md)] users.  

 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] supports the following credential authorization mechanisms for [!INCLUDE[navnow](includes/navnow_md.md)] users:  

-   **Windows**  

-   **UserName**  

-   **NavUserPassword**  

-   **AccessControlService**  

-   **Office 365 Authentication**  

 This topic contains separate procedures for creating users for each credential authentication mechanism. For information about how to configure [!INCLUDE[rtc](includes/rtc_md.md)]s and the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for a specific authentication scheme, see [Users and Credential Types](Users-and-Credential-Types.md).  

> [!NOTE]  
>  The following procedures describe how to create users for a single credential type, but you can create users that are valid for multiple credential types, as long as you configure the appropriate settings for each credential type in the **New User** page. For example, you could create a user who would automatically be logged on without having to present credentials when the credential type is **Windows**, but would be prompted for a username \(the value of the **User Name** field\) and a password when the credential type is **UserName**.  

## Creating a New User  
 The following procedures describe how to configure users in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Similar steps apply for creating users in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For information about how to create users using the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md). A [!INCLUDE[nav_server](includes/nav_server_md.md)] instance can either support users with Windows authentication or users with other credentials.  

#### To create a new user  

1.  In the **Search** box, enter **Users**, and then choose the related link.  

2.  In the **Users** window, on the  **Home** tab, choose **New**.  

3.  In the **User Card** window, on the General FastTab, fill in the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**User Name**|Specify a unique, short name to identify the user.|  
    |**Full Name**|Specify the user’s full name.|  
    |**License Type**|Choose one of the available license types. For more information, see [License Types](License-Types.md).|  
    |**State**|Specify if the user’s access is enabled or disabled.|  
    |**Expiry Date**|Optionally, to set a time limit on the user’s access, choose a date.|  

4.  To set up a user for Windows authentication, follow this step:  

    -   On the **Windows Authentication** FastTab, in the **Windows User Name** field, type the name of a valid Active Directory user, using the format **domain\\username**. Or, choose the **AssistEdit** button, select **Allow for the Session**, and then, in the **Active Directory Select User or Group** dialog box, identify a Windows user.  

5.  To set up a user for NavUserPassword authentication, follow these steps:  

    1.  On the **NAV Password Authentication** FastTab, choose the **Password** field to specify a password for the user.  

    2.  If you want to require the user to change the password after they log in for the first time, select **User must change password at next login**.  

         The first time that the user logs on, a prompt will appear prompting the user to change the password.  

6.  To set up a user for AccessControlService authentication, follow these steps:  

    > [!NOTE]  
    >  The following steps apply to [!INCLUDE[navnow](includes/navnow_md.md)] solutions that are deployed on Azure. For more information, see [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  

    1.  On the **Access Control Service Authentication** FastTab, next to **ACS Access Status**, choose the word **Disabled**.  

         This opens the **User ACS Setup** dialog box.  

    2.  In the **User ACS Setup** dialog box, choose the **Generate Auth Key** button.  

         A string value is automatically inserted into the **Authentication Key** field.  

    3.  Save the **Authentication Key** value to a secure location such as a text file, where you can find it later. After you configure your deployment for ACS, and configure your [!INCLUDE[navnow](includes/navnow_md.md)] components for ACS, send this authentication key, and the **User Name** value, to the actual user and instruct the user to provide these values when they log on to a [!INCLUDE[navnow](includes/navnow_md.md)] client.  

    4.  Choose the **OK** button. The **ACS Access Status** changes to **Pending**. It will change to **Active** after the user successfully logs in.  

7.  To create a new user for Office 365 authentication, follow this step:  

    -   On the **Office 365 Authentication** FastTab, in the **Authentication Email** field, specify the Microsoft account that this user uses to access Office 365 and SharePoint. The authentication email address must be the organizational email account that the users log in to Office 365 with, such as an account from Azure Active Directory \(Azure AD\).  

         The [!INCLUDE[nav_server](includes/nav_server_md.md)] instance must be configured to accept the relevant credential types that support integration with Office 365, such as Azure AD. For more information, see [Users and Credential Types](Users-and-Credential-Types.md).  

         When you specify an email address, the **Authentication Status** field changes to **Inactive**. When the user logs in to Office 365, the authentication status changes to **Active**.  

8.  Open the **User Groups** FastTab to define which user groups the user is a member of. User groups are an easy way to manage permissions. For more information, see [Managing  User Groups](managing-user-groups.md).  

9. Optionally, open the **User Permission Sets** FastTab to review permission sets for the user.  

10. Add any Notes or Links for the user in the respective FactBoxes.  

11. Choose the **OK** button to close the window.  

 To update the settings for an already existing user in the **Users** window, select the user and then, on the **Home** tab, choose **Edit**.  

## See Also  
[How to: Create a Profile](how-to-create-a-profile.md)  
[Managing  User Groups](managing-user-groups.md)  
[How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
[Users and Credential Types](Users-and-Credential-Types.md)   
[License Types](License-Types.md)
