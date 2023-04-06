---
title: "Walkthrough: Implementing Security Certificates in a Test Environment"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 509a745a-f9ac-4a4f-b8b1-099bf2f0dfd6
caps.latest.revision: 39
---
# Walkthrough: Implementing Security Certificates in a Test Environment
In this walkthrough, you set up an environment to test integrating certificates into a configuration for connecting computers running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] to [!INCLUDE[nav_server](includes/nav_server_md.md)] instances over a wide area network \(WAN\) with the chain trust configuration.  

## Prerequisites  
 To complete this walkthrough, you will need:  

-   The Certificates snap-in for Microsoft Management Console \(MMC\). If you do not already have this snap-in installed, then follow these steps:  

    1.  Choose **Start**, choose **Run**, and then type **Mmc.exe**.  

    2.  In the console, on the **File** menu, choose **Add/Remove Snap-in**.  

    3.  In the **Add Standalone Snap-in** dialog box, select **Certificates**, choose **Computer Account**, choose **Local Computer**, and then choose **Add**.  

-   The makecert.exe utility.  

     The makecert.exe utility is installed with Microsoft Visual Studio and Microsoft Windows SDK. For more information, see [Certificate Creation Tool \(Makecert.exe\)](https://go.microsoft.com/fwlink/?LinkId=202833) in the MSDN Library.  

## Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)]  
 You create and install a root certification authority \(CA\) and a server certificate on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

#### To create a root CA and a private key file by using the makecert.exe utility  

1.  On the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], create a temporary folder to use when you work with certificates.  

2.  Open the command prompt as follows:  

    -   If you have Visual Studio installed on your computer, choose **Start**, choose **All Programs**, choose **Microsoft Visual Studio 2012**, choose **Visual Studio Tools**, and then right-click **Visual Studio Command Prompt** and choose **Run as Administrator**.  

    -   If you have the Windows SDK installed on your computer, choose **Start**, choose **All Programs**, choose **Microsoft Windows SDK**, and then right-click **Windows SDK Command Prompt \(2010\)** \(or **CMD Shell**\) and choose **Run as Administrator**.  

3.  At the command prompt, locate the temporary directory.  

4.  Type the following command.  

    ```  
    makecert -n "CN=RootNavServiceCA" -r -sv RootNavServiceCA.pvk RootNavServiceCA.cer  
    ```  

5.  When you are prompted, enter a password.  

     You need this password to create the service certificate.  

6.  The RootNavServiceCA.cer certificate file and the RootNavServiceCA.pvk private key are saved in your temporary folder.  

#### To use the Certificates snap-in to install the root CA on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  Start the Certificates snap-in for MMC on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], and then add the Certificates snap-in.  

2.  In the **Certificates snap-in** dialog box, choose **Computer account**, and then choose **Next**.  

3.  In the **Select Computer** pane, choose **Local computer: \(the computer this console is running on\)**, and then choose **Finish**.  

4.  Choose **OK** to close the **Add or Remove Snap-ins** dialog box.  

5.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node.  

6.  Expand the **Trusted Root Certification Authorities** node, right-click the **Certificates** subfolder, select **All Tasks**, and then choose **Import**.  

7.  In the Certificate Import Wizard, on the **Welcome** page, choose **Next**.  

8.  On the **File to Import** page, choose **Browse**.  

9. Browse to the location of the RootNavServiceCA.cer certificate file, select the file, and then choose **Open**.  

10. On the **File to Import** page, choose **Next**.  

11. On the **Certificate Store** page, accept the default selection, and then choose **Next**.  

12. On the **Completing the Certificate Import Wizard** page, choose **Finish**.  

 The RootNavServiceCA certificate is now visible in the list of trusted root CAs.  

 You now create a certificate revocation list for the root certification authority and then install the certificate revocation list on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]. A certificate revocation list is required because WCF applications check the revocation list when validating certificates.  

#### To create a certificate revocation list for the root certification authority  

1.  At the command prompt, type the following command:  

    ```  
    makecert -crl -n "CN=RootNavServiceCA" -r -sv RootNavServiceCA.pvk RootNavServiceCA.crl  
    ```  

2.  When you are prompted, enter the password that you used to create the root CA.  

#### To install the certificate revocation list on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  In the Certificates snap-in, in the left pane of MMC, expand the **Certificates \(Local Computer\)** node.  

2.  Expand the **Trusted Root Certification Authorities** node, right-click the **Certificates** subfolder, select **All Tasks**, and then choose **Import**.  

3.  In the Certificate Import Wizard, on the **Welcome** page, choose **Next**.  

4.  On the **File to Import** page, choose **Browse**.  

5.  In the File Type field, select **Certificate Revocation List \(\*.crl\)**.  

6.  Browse to the location of the RootNavServiceCA.crl file, select the file, and then choose **Open**.  

7.  On the **File to Import** page, choose **Next**.  

8.  On the **Certificate Store** page, accept the default selection, and then choose **Next**.  

9. On the **Completing the Certificate Import Wizard** page, choose **Finish**.  

10. Select the **Trusted Root Certificate Authorities** node, and then refresh the snap-in.  

     A Certificate Revocation List folder that contains the RootNavServiceCA.crl file has been created.  

#### To create and install a test certificate for the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer  

1.  At the command prompt, type the following command:  

    ```  
    makecert -sk NavServiceCert -iv RootNavServiceCA.pvk -n "CN=NavServiceCert" -ic RootNavServiceCA.cer -sr localmachine -ss my -sky exchange -pe NavServiceCert.cer  
    ```  

    > [!NOTE]  
    >  This command specifies the subject’s certificate name as **NavServiceCert**. You need this certificate name when you configure the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

2.  When you are prompted, enter the password that you used to create the root CA.  

3.  Select the **Trusted Root Certificate Authorities** node, and then refresh the snap-in.  

 You now have the NavServiceCert.cer certificate file in your temporary folder. The certificate is installed under the Personal node in the Certificates Snap-in.  

#### To grant access to the certificate’s private key to the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node, expand the **Personal** node, and then select the **Certificates** subfolder.  

2.  In the right pane, right-click the **NavServiceCert** certificate, choose **All Tasks**, and then choose **Manage Private Keys**.  

3.  In the **Permissions for NavServiceCert private keys** dialog box, choose **Add**.  

4.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, enter the name of the service account that is used by [!INCLUDE[nav_server](includes/nav_server_md.md)] By default, the service account is **NETWORK SERVICE**. Choose **OK** when done.  

    > [!IMPORTANT]  
    >  In a production environment, you run [!INCLUDE[nav_server](includes/nav_server_md.md)] under a dedicated domain user account instead of the less secure NETWORK SERVICE account. Because this is a test implementation, the NETWORK SERVICE account is acceptable.  

5.  In the **Permissions for NavServiceCert private keys** dialog box, select the account, and then select the **Allow** check box next to **Full Control**. Choose **OK** when done.  

6.  In the right pane, double-click the **NavServiceCert** certificate.  

7.  In the **Certificate** dialog box, choose the **Details** tab, and then select the **Thumbprint** field.  

8.  Copy or note the value of the **Thumbprint** field.  

#### To modify the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration file to support login over a WAN  

1.  Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  

2.  Stop the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  

3.  Modify the following settings for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  

4.  Modify the following settings in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  

    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |ClientServicesCredentialType<br /><br /> \(General tab\)|NavUserPassword or Username|This parameter is on the General tab in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. The default value is Windows. When you change it to NavUserPassword or Username, client users who connect to the server are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |CertificateThumbprint<br /><br /> \(Client Services tab\)|Value of the **Thumbprint** field in the previous procedure|The default value is \<key>. Remove any leading or trailing spaces in the thumbprint.|
    
5.  Choose **Save**.  

6.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  


If a problem or error occurs, see the Windows Event Log on the computer running the [!INCLUDE[nav_server](includes/nav_server_md.md)]. For more information, see [Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md).

## Configuring the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)]  
 With the chain trust configuration, only the root CA and the certificate revocation list must be installed for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. To do this, complete these procedures on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

#### To install the root CA  

1.  Start the Certificates snap-in for MMC on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], and then add the Certificates snap-in.  

    > [!NOTE]  
    >  This procedure is identical to the one that you followed for installing the root CA on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

2.  In the **Certificates snap-in** dialog box, choose **Computer account**, and then choose **Next**.  

3.  In the **Select Computer** pane, choose **Local computer: \(the computer this console is running on\)**, and then choose **Finish**.  

4.  Choose **OK** to close the **Add or Remove Snap-ins** dialog box.  

5.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node.  

6.  Expand the **Trusted Root Certification Authorities** node, right-click the **Certificates** subfolder, select **All Tasks**, and then choose **Import**.  

7.  In the Certificate Import Wizard, on the **Welcome** page, choose **Next**.  

8.  On the **File to Import** page, choose **Browse**.  

9. Browse to the location of the RootNavServiceCA.cer certificate file, select the file, and then choose **Open**.  

10. On the **File to Import** page, choose **Next**.  

11. On the **Certificate Store** page, accept the default selection, and then choose **Next**.  

12. On the **Completing the Certificate Import Wizard** page, choose **Finish**.  

#### To install the certificate revocation list  

1.  Start the Certificates snap-in for MMC on the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)], and then add the Certificates snap-in.  

2.  In the **Certificates snap-in** dialog box, choose **Computer account**, and then choose **Next**.  

3.  In the **Select Computer** pane, choose **Local computer: \(the computer this console is running on\)**, and then choose **Finish**.  

4.  Choose **OK** to close the **Add or Remove Snap-ins** dialog box.  

5.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node.  

6.  Expand the **Trusted Root Certification Authorities** node, right-click the **Certificates** subfolder, select **All Tasks**, and then choose **Import**.  

7.  In the Certificate Import Wizard, on the **Welcome** page, choose **Next**.  

8.  On the **File to Import** page, choose **Browse**.  

9. In the **File Type** field, select **Certificate Revocation List \(\*.crl\)**.  

10. Browse to the location of the RootNavServiceCA.crl file, select the file, and then choose **Open**.  

11. On the **File to Import** page, choose **Next**.  

12. On the **Certificate Store** page, accept the default selection, and then choose **Next**.  

13. On the **Completing the Certificate Import Wizard** page, choose **Finish**.  

#### To modify the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] configuration file to add certificate information  

1.  Open the ClientUserSettings.config configuration file.  

     The location of this file is Users\\\<*username*>\\AppData\\Roaming\\Microsoft\\[!INCLUDE[navnow](includes/navnow_md.md)].  

     By default, this file is hidden. Therefore, you may have to change your folder options in Windows Explorer to view hidden files.  

2.  Modify the following settings.  

    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |ClientServicesCredentialType|NavUserPassword or Username|The default value is Windows. When you change it to NavUserPassword or Username, client users who connect to the server are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |DnsIdentity|The subject name of the service certificate|The default value is \<identity>.<br /><br /> For this walkthrough, set the key to **NavServiceCert**.|  

3.  Save and close the ClientUserSettings.config file.  

 When you start the client, you are prompted for a valid user name and password for the server domain.  

#### To modify the [!INCLUDE[nav_web](includes/nav_web_md.md)] configuration file to add certificate information  

1.  On the [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, open the [!INCLUDE[nav_web](includes/nav_web_md.md)] folder. By default, the folder is C:\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].  

2.  Open the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)] in a text editor, such as Notepad.  

3.  Find the `<DynamicsNavSettings>` element, and then change the following settings:  

    |Key|New value|Description|  
    |---------|---------------|-----------------|  
    |ClientServicesCredentialType|NavUserPassword or Username|The default value is Windows. When you change it to NavUserPassword or Username, client users who connect to the server are prompted for user name and password credentials. For more information on authentication mechanisms for [!INCLUDE[navnowlong](includes/navnowlong_md.md)], see [Users and Credential Types](Users-and-Credential-Types.md). For information on how to provision users with initial username and password values, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).|  
    |DnsIdentity|The subject name of the service certificate|For this walkthrough, set the key to **NavServiceCert**.|  

4.  Save the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)].  

     For more information about configuring the credential type for the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).
