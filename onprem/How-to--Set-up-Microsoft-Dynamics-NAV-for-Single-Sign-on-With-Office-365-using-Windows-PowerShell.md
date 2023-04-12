---
title: "How to: Set up Microsoft Dynamics NAV for Single Sign-on With Office 365 using Windows PowerShell"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 817bdbef-697e-4cbc-8342-77ec9fcba027
caps.latest.revision: 15
---
# How to: Set up Microsoft Dynamics NAV for Single Sign-on With Office 365 using Windows PowerShell
[!INCLUDE[navnow](includes/navnow_md.md)] supports federated user authentication with Microsoft Azure Active Directory \(Azure AD\). This is the Identity Provider service that is used by Office 365. Every time a new Office 365 subscription is provisioned, the Azure AD tenant for this subscription is also created. Thus, when [!INCLUDE[navnow](includes/navnow_md.md)] is configured for federated authentication with an Azure AD tenant, a Single Sign-on \(SSO\) user experience is achieved between [!INCLUDE[navnow](includes/navnow_md.md)] and the Office 365 Web Applications or/and any other applications which use the Single Sign-on capability provided by the Azure AD tenant.  
  
 The `Set-NavSingleSignOnWithOffice365` cmdlet also supports enabling Office 365 account authentication both for [!INCLUDE[nav_web](includes/nav_web_md.md)] and for [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Office 365 authentication is described in this topic for both clients.  
  
 The `Set-NavSingleSignOnWithOffice365` cmdlet can be used to perform the configuration task by automating all the steps of this process. The cmdlet performs the following operations:  
  
-   It validates that both your [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] are ready for this change.  
  
-   It validates your Office 365 credentials.  
  
-   Once the validation is over, the cmdlet starts the configuration:  
  
    -   It links your [!INCLUDE[navnow](includes/navnow_md.md)] user account to your Office 365 provided account by providing your Office 365 email address as the `AuthenticationEmail` for the provided [!INCLUDE[navnow](includes/navnow_md.md)] user account.  
  
    -   It configures the [!INCLUDE[nav_server](includes/nav_server_md.md)] by changing the values of the following configuration settings: `ClientServicesFederationMetadataLocation`, `ClientServicesCredentialType`, and `ServicesCertificateThumbprint`.  
  
    -   It configures the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] by changing the values for the following configuration settings: `ClientServicesCredentialType`, `ACSUri`, and `DnsIdentity`.  
  
    -   It configures the Azure AD tenant by creating a Service Principal that represents the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  
  
 If the configuration sub steps fail, the cmdlet reverts all of the changes in the sub steps made to the [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  
  
 To follow this how-to, you will need:  
  
-   [!INCLUDE[navnow](includes/navnow_md.md)] with a user account. For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)  
  
-   [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
-   [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]  
  
-   An Office365 subscription  
  
     If you want to sign up for an Office 365 plan, you can use a plan such as Office 365 Enterprise E1 as your test site, or sign up for a trial developer plan. A trial plan includes an administrative account which you will use to access the Azure management portal. For example, if your Office 365 site is *Solutions.onmicrosoft.com*, your administrative account can be *admin@solutions.onmicrosoft.com*. For more information, see [Select an Office 365 plan for business](https://go.microsoft.com/fwlink/?LinkId=309050).  
  
-   Azure Active Directory Tenant Management Components  
  
     The cmdlet relies on the presence of the following components on the system:  
  
    -   [Microsoft Online Services Sign-In Assistant for IT Professionals](https://go.microsoft.com/fwlink/?LinkId=394784)  
  
    -   [Microsoft Azure Active Directory Module for Windows PowerShell](https://go.microsoft.com/fwlink/?LinkId=394785)  
  
     You can download and install these components from the links provided earlier in this section. If you have to decide between 32-bit and 64-bit versions of components, download the version that matches the Windows Operating System type.  
  
-   Security Certificate Used to Secure the Server – Web Server Communication Channel  
  
     Setting up user authentication types other than Windows for the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] requires securing the communication between the server and the client. This can be done by using a security certificate. The `Set-NavSingleSignOnWithOffice365` cmdlet assumes that you have already imported the security certificate in your certificate store. You can use a security certificate issued by a trusted certification authority. For more information, [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md). You can also use a self-signed certificate. For more information, see [Walkthrough: Implementing Security Certificates in a Test Environment](Walkthrough--Implementing-Security-Certificates-in-a-Test-Environment.md). We do not recommend the latter approach in a production environment; however, it is an alternative to consider when testing your environment.  
  
### To Import the NAVOffice365Administration Module  
  
1.  Open Windows PowerShell as administrator, by right-clicking the program and selecting **Run as administrator**.  
  
2.  Navigate to your [!INCLUDE[navnow](includes/navnow_md.md)] DVD, and then to the *WindowsPowerShellScripts\\NAVOffice365Administration* folder.  
  
3.  Run the following cmdlet in order to import the NAVOffice365Administration PowerShell module: `Import-Module .\NAVOffice365Administration.psm1`.  
  
 When you have imported the NAVOffice365Administration module, you can now run the `Set-NavSingleSignOnWithOffice365` cmdlet on the computer that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] components with the relevant parameters set.  
  
### To Automate the Single Sign-on Configuration in a One-Computer [!INCLUDE[navnow](includes/navnow_md.md)] Environment  
  
1.  In [!INCLUDE[wps_2](includes/wps_2_md.md)], at the prompt, enter `Set-NavSingleSignOnWithOffice365 -NavServerInstance “ServerInstanceName” -NavWebServerInstanceName “WebServerInstanceName” -NavUser “YourNavUser” -AuthenticationEmail “YourOffice365Email” -NavServerCertificateThumbprint “SecurityCertificateThumbprint”`. See the table below for a description of parameters.  
  
    |Parameter Name|Description|  
    |--------------------|-----------------|  
    |ServerInstanceName|Specifies the name of your [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. To find the names for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, run the `Get-NAVServerInstance` cmdlet|  
    |WebServerInstanceName|Specifies the name of your [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. To find the names for the [!INCLUDE[nav_web](includes/nav_web_md.md)] instances running in your IIS, run the `Get-NAVWebServerInstance` cmdlet.|  
    |YourNavUser|Specifies the name of your [!INCLUDE[navnow](includes/navnow_md.md)] user account. `YourNavUser` links the [!INCLUDE[navnow](includes/navnow_md.md)] user account to your Office 365 account by providing your Office 365 email address as the `AuthenticationEmail` for the provided [!INCLUDE[navnow](includes/navnow_md.md)] user account. This parameter is optional.|  
    |YourOffice365Email|Specifies the email address of your Office 365 user account. The syntax is *username@o365tenant.onmicrosoft.com*. This parameter is optional. **Important:**  This user must have administrative permissions, such as the Global Administrator role. If you create a custom administrator role for this account, the account must have permission to create service principals in Azure. For more information, see [Assigning admin roles](https://support.office.com/article/Assigning-admin-roles-d58b8089-cbfd-41ec-b64c-9cfcbef495ac).|  
    |SecurityCertificateThumbprint|Specifies the thumbprint for the security certificate that was used for securing the client–server communication channel. Get the list of thumbprints for your certificates by issuing this Windows PowerShell command: `Get-ChildItem -Path "Cert:\LocalMachine\My"` **Note:**  You can avoid providing this parameter if you already have your [!INCLUDE[nav_server](includes/nav_server_md.md)] configured to use a security certificate. This applies to [!INCLUDE[navnow](includes/navnow_md.md)] installations in the Azure environment, and other environments where any credential type other than Windows is active and functional.|  
  
2.  When the `Set-NavSingleSignOnWithOffice365` cmdlet is run, a dialog box will open, requesting your Office 365 account user name and password.  
  
## Automating the Single Sign-on Configuration in a Multi-Computer [!INCLUDE[navnow](includes/navnow_md.md)] Environment  
 This configuration type assumes that your [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] are on different computers. This means that you have to run the `Set-NavSingleSignOnWithOffice365` cmdlet on each of these computers separately with a different parameter set in order to correctly configure your [!INCLUDE[nav_web](includes/nav_web_md.md)] for single sign-on with Office 365.  
  
#### To automate single sign-on configuration in a multi-computer [!INCLUDE[navnow](includes/navnow_md.md)] environment  
  
1.  Run the `Set-NavSingleSignOnWithOffice365` cmdlet on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  
  
2.  To configure your [!INCLUDE[nav_server](includes/nav_server_md.md)] for single sign-on, you have to run the cmdlet with the following parameter set:  
  
    ```  
    Set-NavSingleSignOnWithOffice365 -NavServerInstance “ServerInstanceName” -NavUser “YourNavUser” -NavServerCertificateThumbprint “SecurityCertificateThumbprint” –SkipWebServerConfiguration -SkipWinClientConfiguration  
  
    ```  
  
    > [!NOTE]  
    >  The `SkipWebServerConfiguration` switch specifies that the [!INCLUDE[nav_web](includes/nav_web_md.md)] configuration should not be generated.  
  
3.  Run the `Set-NavSingleSignOnWithOffice365` cmdlet on the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] computer  
  
4.  To configure your [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] for single sign-on, you have to run the cmdlet with the following parameter set:  
  
    ```  
    Set-NavSingleSignOnWithOffice365 -NavWebServerInstanceName “WebServerInstanceName” -AuthenticationEmail “YourOffice365Email” –SkipNavServerConfiguration -SkipWinClientConfiguration  
    ```  
  
    > [!NOTE]  
    >  The `SkipNavServerConfiguration` switch specifies that the [!INCLUDE[nav_web](includes/nav_web_md.md)] configuration should not be generated.  
  
### To Enable Office 365 Account Authentication for [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
 The `Set-NavSingleSignOnWithOffice365` can be also used to perform most of the configuration steps necessary for enabling user authentication with Office 365 accounts for [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The example in this section only configures the [!INCLUDE[navnow](includes/navnow_md.md)] Service and the Azure AD tenant in order to enable Office 365 authentication for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
```  
$result = Set-NavSingleSignOnWithOffice365 -AuthenticationEmail “YourOffice365Email” –SkipNavWebServerConfiguration -SkipNavServerConfiguration  
```  
  
> [!NOTE]  
>  The `SkipNavWebServerConfiguration` switch specifies that the [!INCLUDE[nav_server](includes/nav_server_md.md)] should not be configured. The `SkipNavServerConfiguration` switch specifies that the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] should not be configured.  
  
 Because this cmdlet is usually run on the computer that is hosting the [!INCLUDE[navnow](includes/navnow_md.md)] service, the value returned by the cmdlet, which in this case is the sign-in page, must be copied and pasted in the `ACSUri` setting from the ClientUserSettings.config file.  
  
> [!IMPORTANT]  
>  When setting ACSUri in the ClientUserSettings.config file, make sure that the `ClientServicesCredentialType` is set to `AccessControlService`.  
  
### Adjusting the Client User Settings  
 To make sure that the account authentication for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] works correctly, the ClientUserSettings.Config file needs two settings to be of a specific type. The default location for the ClientUserSettings.Config file is *C:\\Users\\\<username>\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\90*. For more information, see [Configuring the Windows Client](Configuring-the-Windows-Client.md).  
  
 The `ClientServicesCredentialType` must be set to `AccessControlService`.  
  
 Depending on the Security Certificate that you are using, you may also need to change the `DnsIdentity` setting. For more information, see [How to: Implement Security Certificates in a Production Environment](How-to--Implement-Security-Certificates-in-a-Production-Environment.md).  
  
 `AcsUri` should have the following format `https://login.windows.net/<tenant>/wsfed?wa=wsignin1.0%26wtrealm=<realm>%26wreply=<reply>`.  
  
> [!NOTE]  
>  The difference between configuring the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)] for single sign-on with Office 365 is the addition of the `wreply` parameter in the URL. The [!INCLUDE[nav_web](includes/nav_web_md.md)] automatically sets the `wreply` parameter to the web site login page, whereas the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] requires that it is preconfigured.  
  
> [!TIP]  
>  Use the `Set-NavSingleSignOnWithOffice365` PowerShell script to get the AcsUri for Azure AD by running the following statement:  
>   
>  `Set-NavSingleSignOnWithOffice365 -SkipNavServerConfiguration -SkipWebServerConfiguration`  
  
 To change the client user settings in a ClickOnce environment, see [Deploying Microsoft Dynamics NAV Using ClickOnce](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md).  
  
## See Also  
 [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)   
 [Troubleshooting: Running the Cmdlet Fails Because the Microosft Dynamics NAV Server Fails to Start-Restart](Troubleshooting--Running-the-Cmdlet-Fails-Because-the-Microosft-Dynamics-NAV-Server-Fails-to-Start-Restart.md)   
 [Troubleshooting: Running the Cmdlet in a Multitenant Microsoft Dynamics NAV Environment](Troubleshooting--Running-the-Cmdlet-in-a-Multitenant-Microsoft-Dynamics-NAV-Environment.md)   
 [Troubleshooting: Avoiding the Office 365 Credentials Dialog box](Troubleshooting--Avoiding-the-Office-365-Credentials-Dialog-box.md)   
 [Troubleshooting: Running the Cmdlet for a Microsoft Dynamics NAV Web Server Hosted in Complex Network Topology](Troubleshooting--Running-the-Cmdlet-for-a-Microsoft-Dynamics-NAV-Web-Server-Hosted-in-Complex-Network-Topology.md)
