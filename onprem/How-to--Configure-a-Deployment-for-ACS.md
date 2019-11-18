---
title: Configure a Deployment for ACS
description: Configure the Dynamics NAV deployment to use Azure Access Control Services ACS, the authentication requires a configuration in the Azure management portal. 
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Configuring a Deployment for ACS in Dynamics NAV

[!INCLUDE[ACS_md](includes/ACS_md.md)]

To configure your [!INCLUDE[navnow](includes/navnow_md.md)] deployment to use Microsoft Azure Access Control service \(ACS\) authentication requires the following series of configuration procedures in the Azure management portal:  

-   Create a namespace.  

-   Configure the namespace.  

-   Specify relying party applications.  

-   Add a rule group.  

-   Add a logon page for relying party applications.  

### To create a namespace  

1.  In the Azure management portal, choose the **Active Directory** button.  

2.  Choose the **New** button, point to **Access Control**, and then choose **Quick Create**.  

3.  Fill in the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Namespace**|Enter a name for the namespace. The name can be any text. For example, you can enter the name of your company for the namespace name.<br /><br /> A green checkmark appears if the namespace is available. The value that you specify because a prefix for the fully qualified namespace, such as *mynamespace*.accesscontrol.windows.net.|  
    |**Region**|Choose the Azure region that you want to host your namespace in.<br /><br /> Choose the region that most closely matches your country/region. For example, if you and your customers are located in Denmark, choose North Europe, unless another region suits your needs better.|  
    |**Subscription**|Choose your Azure subscription.|  

4.  Choose **Create**.  

 After the status of your namespace becomes **Active**, you can continue with configuring the namespace.  

### To configure the namespace  

1.  Select your namespace. In the menu at the bottom of the page, choose **Manage**.  

    > [!NOTE]  
    >  If this button is not available, you may want to obtain Portal Administrator permission for the namespace. Ask the Service Administrator for the Azure subscription to grant you this permission. Co-administrator permission is sufficient for creating a namespace, but not for managing ACS.  

2.  In the left pane of the Access Control Service section of the Azure management portal, choose **Identity Providers**.  

     An identity provider is an organization that provides authentication services that you can use as your ACS authentication mechanism. There are five possible identity providers. Windows Live ID is the default identity provider. Two of the other options require no configuration: Google and Yahoo\!. The final two require additional configuration: Facebook and WS-Federation. WS-Federation lets users authenticate by logging on to their corporate account, which is managed by Active Directory. For more information about how to configure a WS-Federation identity provider, see [How to configure AD FS 2.0 as an Identity Provider](https://msdn.microsoft.com/library/gg185961.aspx) in the MSDN Library.  

3.  Select the identity providers that you want to make available to the users. You can choose as few as one, such as just Windows Live ID, or as many as all five identity providers.  

     Next, you specify relying party applications. Relying party applications are the websites, applications, and services for which you want to use ACS to implement Shared Services authentication. In this case, the relying party applications are [!INCLUDE[navnow](includes/navnow_md.md)] clients.  

### To specify relying party applications  

1.  In the left pane of the Access Control Service section of the Azure management portal, choose **Relying Party Applications**, and then choose **Add**.  

2.  In the **Add Relying Party Application** page, fill in the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Name**|Specify a name for the application.<br /><br /> A typical value would be the name of the organization for which the deployment was created.| 
    |**Mode**|Choose **Enter settings manually**.|  
    |**Realm**|Enter the DNS name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, such as *https://MyCompany.com* or https://localhost.<br /><br /> The DNS name must be the same that is specified in the Server parameter in the clientUserSettings.config file for [!INCLUDE[nav_windows](includes/nav_windows_md.md)] client and the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] for [!INCLUDE[nav_web](includes/nav_web_md.md)] clients.|  
    |**Return URL**|Enter the fully qualified URL for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], such as https://MyCompany.com or https://MyServer/WebClient.<br /><br /> The URL is case-sensitive.<br /><br />**Note:** The return URL will only work on URLs that are bound to the default ports 80 for http and 443 for https. <br /><br />If you do not deploy the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you can specify any address since the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] does not use this setting.|  
    |**Token format**|Select **SWT**. Other token types are not supported in this version of [!INCLUDE[navnow](includes/navnow_md.md)].<br /><br /> This adds a **Token Signing Settings** section to the page.|  

3.  In the **Token Signing Settings** section, in the **Token signing key** field, choose the **Generate** button.  

4.  Specify an effective date and an expiration date for the key.  

    > [!IMPORTANT]  
    >  To help secure your deployment, schedule a regeneration of this key regularly.  

5.  Copy the string of characters that automatically populate the field.  

     You will use this string to update the *TokenSigningKey* in the server configuration.  

6.  Choose the **Save** button to save your relying party application configuration.  

     Next, you add a rule group. Rule groups define how claims are passed from identity providers to your relying party applications.  

### To add a rule group  

1.  In the left pane of the Access Control Service portal, choose **Rule groups**.  

2.  Choose the default rule group for the relying party applications that you just created.  

3.  In the **Edit Rule Group** page, choose **Generate**. In the **Generate Rules** page, choose the relevant identity provider, and then choose the **Generate** button.  

4.  Choose the **Save** button.  

     The final step in the Access Control configuration is to add a Shared Services login page to your relying party application. There is where your user can present credentials for the configured identity provider.  

### To add a login page for relying party applications  

1.  In the left pane of the Access Control Service portal, choose **Application Integration**.  

2.  On the **Application Integration** page, choose **Login Pages**.  

3.  Choose your relying party application.  

4.  Under **Option 1: Link to an ACS-hosted login page**, copy the URI from the first text box to Notepad.  

5.  In Notepad, replace any instances of the ampersand character \(`&`\) with `%26`.  

     You will use this URI in the server configuration for ACS.  

### Next Steps  

-   During the configuration of your deployment for ACS, you have saved two values:  

    -   The string of characters from the **Token signing key** field in the **Add Relying Party Application** page.  

    -   The URI for your relying party application from the **Application Integration** section.  

     You will need these values for the next stage in the ACS configuration process, which is configuring your [!INCLUDE[navnow](includes/navnow_md.md)] components for ACS.  

## See Also  
[Configure Microsoft Dynamics NAV Components for ACS](Configure-Microsoft-Dynamics-NAV-Components-for-ACS.md)  
[How to: Set up Microsoft Dynamics NAV for Single Sign-on With Office 365 using Windows PowerShell](How-to--Set-up-Microsoft-Dynamics-NAV-for-Single-Sign-on-With-Office-365-using-Windows-PowerShell.md)  
