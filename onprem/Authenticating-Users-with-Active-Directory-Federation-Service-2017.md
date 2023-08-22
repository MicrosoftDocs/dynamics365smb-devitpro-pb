---
title: "Authenticating Users with Active Directory Federation Services"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
author: jswymer
---
# Authenticating Users with Active Directory Federation Services
**Applies to:** [!INCLUDE[navcrete_md](includes/navcrete_md.md)] (Cummulative Update 14 and later), [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] (Cummulative Update 2 and later), [!INCLUDE[nav2017](includes/nav2017.md)]

[!INCLUDE[navnow](includes/navnow_md.md)] supports Active Directory Federation Services (AD FS) authentication for authenticating users, without having to use the Access Control Service (ACS). This article walks you through the steps about how to set up AD FS authentication in AD FS Management console, and then how to configure it in [!INCLUDE[navnow](includes/navnow_md.md)].

## Prerequisites
Your deployment must meet the following prerequisites:

-   Active Directory Federation Services (AD FS) is installed on the computer that you want to prepare as the federation server.

    For more information, see [Active Directory Federation Services](https://go.microsoft.com/fwlink/?linkid=849251).

    To complete the steps in this article, you will need to know the public URL for AD FS server. This URL needs to be accessible from a web browser on the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.

    >[!Note]
    >The steps in this article are based on using the AD FS version on Windows Server 2016, but should also work with earlier versions of AD FS. Be aware that some dialog box references in the steps might be slightly different in earlier versions of AD FS.

-  A working [!INCLUDE[navnow](includes/navnow_md.md)] deployment that includes the following components:
    -   [!INCLUDE[nav_server](includes/nav_server_md.md)]
    -   [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)] installed and configured to use SSL (https)

        For more information, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md) and [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).
    -   [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] (optional)
    -   [!INCLUDE[nav_admin_md](includes/nav_admin_md.md)] (optional)
    -   Microsoft Dynamics NAV Administration Shell (optional)

## Configure AD FS to allow Dynamics NAV authentication
These steps are done by using the AD FS Management console on the server where AD FS is running.

### Set up a Relying Party Trust for the Dynamics NAV client
You must complete these steps separately for [!INCLUDE[nav_web_md](includes/nav_web_md.md)] and [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)].

1.  Open **Server Manager** on the computer that is running AD FS, and the choose **AD FS** to start **AD FS Management**.

    ![AD FS Management.](media/ADFS_Console.png "AD FS Management")
2.  Right-click **Relying Party Trusts**, and then choose **Add Relying Party Trust**.
    The **Add Relying Party Trust Wizard** appears.
3.  In the **Welcome** step, choose **Claims aware**, and then choose **Start**.

    ![AD FS Relying Trust Wizard.](media/ADFS_Relying_Trust_Wizard.png "AD FS Relying Trust Wizard")
4.  In the **Select Data Source** step, choose **Enter data about the relying party manually**, and then choose **Next**.
5.  In the **Specify Display Name** step, give the relying party a name, such as ```Dynamics NAV Web Client``` or ```Dynamics NAV Windows Client```, and then choose **Next**.
6.  In the **Configure Certificate** step, choose **Next** to skip specifying the token encryption certificate.

    This assumes that the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] is running https.
7.  In the **Configure URL** step, select the **Enable support for the WS-federation Passive protocol** check box.

    ![AD FS Configure URL.](media/ADFS_Relying_Trust_ConfigureURL.png "AD FS Configure URL")

    Then, in **Relying party WS-Federation Passive Control URL** field, enter the URL for the [!INCLUDE[navnow](includes/navnow_md.md)] client according to the following:

    -    If you are setting up AD FS for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)], set this to the full URL for the Web client. The URL typically has the format:

        ```
        https://[web-server-computer]:[port]/[web-server-instance]/WebClient
        ```

        For example:

        ```
        https://MyWebServer:8080/DynamicsNAV110/WebClient
        ```

    -   If you are setting up AD FS for the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)], use base URL for the Web client, which is the full URL without the ```/[web-instance]/WebClient``` part. This typically has the format:

        ```
        https://[web-server-computer]:[port]/[web-instance]
        ```

        For example:

        ```
        https://MyWebServer:8080
        ```

    Choose **Next** to continue.

    >[!Note]
    >This is the URL to which AD FS will be allowed to issue authentication tokens.

8.  In the **Configure Identifiers** step, in the **Relying party trust identifier** field, remove the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] URL, and then add one of the following URL instead:

    -   If you are setting up AD FS for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)], add the URL:
        ```
        https://dynamicsnavwebclient
        ```
    -   If you are setting up AD FS for the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)], add the URL:
    ```
    https://dynamicsnavwinclient
    ```

    Choose **Next** to continue.

    >[!Important]
    >This is the URL which is used to identify the relying party, and it has to be unique for the AD FS setup. This URL will be used as the **wtrealm** parameter in the **WSFederationLoginEndpoint** setting of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance configuration (CustomSettings.config file).

9.  In the **Choose Access Control Policy** step, setup multi-factor authentication if required, and then choose **Next**.
10.  Review the configuration, and then choose **Next**.
11. On the **Finish** step, select the **Configure claims issuance policy for the application** check box, and then choose **Next**.

Based on whether you will be using SAML tokens or JSON Web Tokens (JWT), which are supported from AD FS 3.0 and later), you need to add different claims. Complete one of the following procedures for your token type.

### Set up support for SAML 1.0 tokens
1. In the **Edit Claim Rules** dialog box, choose **Add Rule**.

    ![AD FS Edit Claims Rule.](media/ADFS_Edit_Claims-Rule.png "AD FS Edit Claims Rule")
2. In the **Select Rule Template** step, choose **Transform an incoming Claim** template, and then choose **Next**.
3. In the **Edit Rule** step, set the **Claim rule name** to ```name```, the **Incoming claim type** to ```UPN```, and the **Outgoing claim type** to ```Name```. Choose **OK** when done.
4. Repeat steps 1 to 3 to add another rule, except this time, set the **Claim rule name** to ```objectidentifier```, the **Incoming claim type** to ```Primary SID```, and the **Outgoing claim type** to:

    ```
    https://schemas.microsoft.com/identity/claims/objectidentifier
    ```

    Choose **OK** when done.
5. Close the **Edit Claim Rules** dialog box.

    ![AD FS Edit Claims Rule Done.](media/ADFS_EditClaimsRule2.png "AD FS Edit Claims Rule Done")

### Set up support for JSON Web tokens (JWT)
JWT tokens are not supported by AD FS 2.0 or [!INCLUDE[navcrete_md](includes/navcrete_md.md)] (Cummulative Update 14 and earlier).

1.  In the **Edit Claim Rules** dialog box, choose **Add Rule**.

    ![AD FS Edit Claims Rule.](media/ADFS_Edit_Claims-Rule.png "AD FS Edit Claims Rule")
2.  In the **Select Rule Template** step, choose **Send Claims Using a Custom Rule** template, and then choose **Next**.
3. Set the **Claim rule name** to ```name```, and the  **Custom rule** to:

    ```
    c:[Type == "https://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"] => issue(Type = "unique_name", Issuer = c.Issuer, OriginalIssuer = c.OriginalIssuer, Value = c.Value, ValueType = c.ValueType);
    ```
4. Repeat steps 1 to 3 to add another custom rule, and set the **Claim rule name** to ```objectidentifier```, and the **Custom rule** to:

    ```
    c:[Type == "https://schemas.microsoft.com/ws/2008/06/identity/claims/primarysid"] => issue(Type = "oid", Issuer = c.Issuer, OriginalIssuer = c.OriginalIssuer, Value = c.Value, ValueType = c.ValueType);
    ```
5.  Close the **Edit Claim Rules** dialog box.
    ![AD FS Edit Claims Rule Done.](media/ADFS_EditClaimsRule2.png "AD FS Edit Claims Rule Done")
6.  Start Window Powershell, and run the following command to define the token type for the relying party to be JWT:

    ```
    Set-ADFSRelyingPartyTrust –TargetIdentifier "Web Client URL" –EnableJWT $true
    ```

## Configure Dynamics NAV to use AD FS authentication
To setup [!INCLUDE[navnow_md](includes/navnow_md.md)] for ADFS authentication, you must modify the configuration of the [!INCLUDE[nav_server](includes/nav_server_md.md)], [!INCLUDE[nav_web_md](includes/nav_web_md.md)], and [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)]s.

### Dynamics NAV Server instance setup
The [!INCLUDE[nav_server](includes/nav_server_md.md)] instance must be configured to allow claims based authentication. You can do this by using the [!INCLUDE[nav_admin_md](includes/nav_admin_md.md)], the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/Set-NAVServerConfiguration?view=dynamicsnav-ps-2017) in the [!INCLUDE[navnow_md](includes/navnow_md.md)] Administration Shell, or by modifying the server instance's CustomSettings.config file directly.

1.  Set the **Credential Type** (ClientServicesCredentialType) to ```NavUserPassword``` or ```AccessControlService```.
    -   If you set this to ```NavUserPassword```, client users can use either NavUserPassword or claims based authentication to access [!INCLUDE[navnow](includes/navnow_md.md)]. The CustomSetting.config file should include the following line:

        ```
        <add key="ClientServicesCredentialType" value="NavUserPassword"/>
        ```
    -   If you set this to ```AccessControlService```, only clients that use claims based authentication will be allowed to access [!INCLUDE[navnow](includes/navnow_md.md)]. The CustomSetting.config file should include the following line:

        ```
        <add key="ClientServicesCredentialType" value="AccessControlService"/>
        ```
2.  Set the **WS-Federation Metadata Location** (ClientServicesFederationMetadataLocation) to the URL that defines the federation metadata XML document for your AD FS. The URL has the following format:

    ```
    https://[Public URL for AD FS server]/federationmetadata/2007-06/federationmetadata.xml
    ```

    Replace ```[Public URL for AD FS server]``` with the URL for your installation.

    When you are done, the CustomSettings.config file should include the following key:

    ```
    <add key="ClientServicesFederationMetadataLocation" value="https://[Public URL for AD FS server]/federationmetadata/2007-06/federationmetadata.xml"/>
    ```
    >[!NOTE]
    >This URL must to be accessible from a browser on the computer running the [!INCLUDE[nav_server](includes/nav_server_md.md)].

3.  To set up the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] in [!INCLUDE[nav2017](includes/nav2017.md)] and later, set the **WSFederationLoginEndpoint** (WSFederationLoginEndpoint) to point to the AD FS login page for authenticating users.

    For example, the CustomSettings file should include the following key:

    ```
    <add key="WSFederationLoginEndpoint" value="https://[Public URL for ADFS server]/adfs/ls/?wa=wsignin1.0%26wtrealm=https://dynamicsnavwebclient%26wreply=[Dynamics NAV Web Client URL]" />
    ```

    Replace ```[Public URL for AD FS server]``` with the URL for your installation.

    Replace ```[Dynamics NAV Web Client URL]``` with the full URL for your Web client, such as ```https://MyWebServer:8080/DynamicsNAV110/WebClient```. This is same value that was specified for **Relying party WS-Federation Passive Control URL** field in the Relying Party Trust set up for the client in AD FS.

    >[!NOTE]
    >In [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] and earlier, this setting does not exist. Instead, you set the **ACSUri** setting in the web.config for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. This will be done in the next task.

4.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.

    >[!TIP]
    >You can use the [Set-NAVServerInstance cmdlet](/powershell/module/microsoft.dynamics.nav.management/Set-NAVServerInstance?view=dynamicsnav-ps-2017) to restart the service instance.

### Dynamics NAV Web Client setup
You configure the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] by modifying it's [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].

1.  Change the **ClientServicesCredentialType** setting to ```AccessControlService``` as shown:

    ```
    <add key="ClientServicesCredentialType" value="AccessControlService" />
    ```

2. For [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)] and earlier, set the **ACSUri** setting the WS-Federation login end point for authenticating users.

    ```
    <add key="ACSUri" value="https://[Public URL for AD FS server]/adfs/ls/?wa=wsignin1.0%26wtrealm=https://dynamicsnavwebclient%26wreply=[Dynamics NAV Web Client URL]" />
    ```

    Replace ```[Dynamics NAV Web Client URL]``` with the full URL for your Web client, such as ```https://MyWebServer:8080/DynamicsNAV90/WebClient```. This is the same value that was specified for **Relying party WS-Federation Passive Control URL** field in the Relying Party Trust set up for the client in AD FS.

    This step is not relevant in [!INCLUDE[nav2017](includes/nav2017.md)] and later because the end point is configured in the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.

The configuration changes are automatically picked up by the Internet Information Service (IIS).

>[!TIP]
>Instead of reconfiguring the existing web client, consider using the [New-NAVWebServerInstance cmdlet](/powershell/module/microsoft.dynamics.nav.management/New-NAVWebServerInstance?view=dynamicsnav-ps-2017) in the Dynamics NAV Administration Shell to add an additional web client instance, and leave the existing instance running NavUserPassword authentication.

### Dynamic NAV Windows client setup (optional)
You configure the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] by modifying the ClientUserSettings.config file for each client installation.

1.  Set the **ClientServicesCredentialType** to ```AccessControlService``` as shown:

    ```
    <add key="ClientServicesCredentialType" value="AccessControlService" />
    ```

    This means that authentication is delegated to the URL that is specified by **ACSUri** setting.
2.  Set the **ACSUri** setting to the AD FS login page as shown:

    ```
    <add key="ACSUri" value="https://[Public URL for ADFS server]/adfs/ls/?wa=wsignin1.0%26wtrealm=https://dynamicsnavwinclient%26wreply=[Dynamics NAV Web Client URL without /[Web server instance]/WebClient]" />
    ```

    Replace ```[Dynamics NAV Web Client URL without /[Web server instance]/WebClient]``` with the same value that was specified for **Relying party WS-Federation Passive Control URL** field in the Relying Party Trust set up for the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] in AD FS.

3. Restart the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)].


### Dynamic NAV User setup
You must map the user accounts in [!INCLUDE[navnow](includes/navnow_md.md)] to corresponding user accounts in AD FS. The mapping is based on the User Principal Name (UPN) that is assigned to the user in Active Directory. The UPN is the user's name in email address format, such as ```username@realm```.

You can do this by using the [!INCLUDE[navnow](includes/navnow_md.md)] client. Open the **User Card** page for a user, and then in the **Office 365 Authentication** section, set the **Authentication Email** field to the UPN of the AD FS user.

When you initially set the **Authentication Email**, the **Authentication Status** will be **Inactive**. After the first tiome the user signs in to [!INCLUDE[navnow](includes/navnow_md.md)] by using AD FS, the status will be change to **Active**. This means that the Primary SID from AD FS has been registered on the user in [!INCLUDE[navnow](includes/navnow_md.md)], and all subsequent authentication mappings will be done on the Primary SID and not on the Authentication Email (UPN).

## See Also  
[Configuring the Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)  
[Users and Credential Types](Users-and-Credential-Types.md)  
[How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
