---
title: "Walkthrough: Configuring Web Services to Use SSL (SOAP and OData)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f4e77ab1-7418-46c0-842f-e8b68d927106
caps.latest.revision: 63
manager: edupont
---
# Walkthrough: Configuring Web Services to Use SSL (SOAP and OData)
Secure Sockets Layer \(SSL\) is a cryptographic protocol that helps provide security and data integrity for data communications over a network. By encrypting your [!INCLUDE[navnow](includes/navnow_md.md)] web services using SSL, you make your data and the network more secure and more reliable.  
  
## Microsoft Dynamics NAV Web Services and SSL  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports SSL authentication for SOAP and OData web services. The server authenticates itself to the client, but the client does not authenticate itself to the server. When the web service client connects to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, the server replies by sending its digital certificate to the client. This certificate contains the server's public encryption key and the name of the authority that granted the certificate. The client verifies the certificate using the authority's public key.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   [Configuring Microsoft Dynamics NAV Web Services to Use SSL](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#ConfigureSSL)  
  
-   [Obtaining an SSL Certificate](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#ObtainCert)  
  
-   [Importing the SSL Certificate into the Local Computer Store of the Microsoft Dynamics NAV Server computer](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#Importing)  
  
-   [Granting Permissions to the Certificate's Private Key to Microsoft Dynamics NAV Server](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#GrantingAccess)  
  
-   [Obtaining the Certificate's Thumbprint](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#Thumbprint)  
  
-   [Configuring the Access Control List and the Web Services Ports for SSL](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#ACL)  
  
-   [Verifying the Configuration](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#Verify)  
  
-   [Restart the Microsoft Dynamics NAV Server Instance](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#Restart)  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   The makecert.exe tool \(Certificate Creation Tool\) for creating SSL certificates.  
  
     The makecert.exe generates certificates for testing purposes. It is available with Microsoft Visual Studio and Microsoft Windows SDK. For more information, see [Certificate Creation Tool \(Makecert.exe\)](http://go.microsoft.com/fwlink/?LinkId=202833) in the MSDN Library.  
  
    > [!NOTE]  
    >  The makecert.exe tool is only required if you do not already have an SSL certificate and you want to create a certificate for test purposes.  
  
## Story  
 Victor, who is a business systems developer at [!INCLUDE[demoname](includes/demoname_md.md)], knows that his implementation of web services applications for [!INCLUDE[navnow](includes/navnow_md.md)] is unlikely to pass a company security audit unless he encrypts sensitive data that is transmitted over the company intranet. He decides to protect web services communication with SSL.  
  
##  <a name="ConfigureSSL"></a> Configuring Microsoft Dynamics NAV Web Services to Use SSL  
 The first step is to prepare [!INCLUDE[navnow](includes/navnow_md.md)] to use SSL. This involves configuring the relevant [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to specify SSL.  
  
 You can configure [!INCLUDE[nav_server](includes/nav_server_md.md)] instances with the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) or [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md). For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  
  
 The following procedure uses [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
#### To configure the Microsoft Dynamics NAV Server instance to use SSL  
  
1.  Choose the **Start** button, and in the **Search programs and files** box, type **Microsoft Dynamics NAV Administration**, and then choose the related link.  
  
2.  In [!INCLUDE[nav_admin](includes/nav_admin_md.md)], in the left pane, under **Console Root**, expand the node for the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. This is typically named **Microsoft Dynamics NAV \(Local\)**, which is the local computer.  
  
     The [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the computer appear in the left pane and center panes.  
  
     ![Console root with two server instances](media/ConsoleRootExp.png "ConsoleRootExp")  
  
3.  In the left pane, choose the relevant instance to display settings for that instance in the center pane.  
  
4.  At the bottom of the center pane, choose **Edit**.  
  
5.  To configure SOAP web services to use SSL, expand the **SOAP Web Services** tab, and then select the **Enable SSL** option.  
  
     Make a note of the port that is used by SOAP web services. You will need the port number later on in this walkthrough.  
  
6.  To configure OData web services to use SSL, expand the **OData Web Services** tab, and then select the **Enable SSL** option.  
  
     Make a note of the port that is used by OData web services. You will need the port number later on in this walkthrough.  
  
7.  Choose **Save** at the bottom of the center pane.  
  
8.  In the right pane, under **Actions**, choose **Login Account**.  
  
9. Make a note of the service account information. You will need this information later on in this walkthrough.  
  
##  <a name="ObtainCert"></a> Obtaining an SSL Certificate  
 The certificate is a file that [!INCLUDE[nav_server](includes/nav_server_md.md)] uses to prove its identity and establish a trusted connection with the client that is trying to connect. In a production environment, you obtain an SSL certificate from a certification authority. Some large organizations may have their own certification authorities, and other organizations can request a certificate from a third-party organization. In a test environment, if you do not have certificate, then you can create your own test certificate by using the makecert.exe tool as described in the following procedure.  
  
 In the following procedure, you use the makecert.exe tool to create a test certificate file \(.cer\) with a private key file \(.pvk\), and then generate a personal information file \(.pfx\) from the two files. You will use the .pxf in the next procedure for importing the certificate on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
> [!NOTE]  
>  If you have a certificate, then you can skip this procedure and continue to [Importing the SSL Certificate into the Local Computer Store of the Microsoft Dynamics NAV Server computer](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md#Importing).  
  
#### To create a test SSL certificate using the makecert.exe tool  
  
1.  On the computer that is installed with Microsoft Visual Studio 2012 or Windows SDK, create a folder called *My Certificates* for working with and storing certificates.  
  
     You can work on the same computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] or a different computer.  
  
2.  Open the command prompt as follows:  
  
    |If your computer is installed with|Then|  
    |----------------------------------------|----------|  
    |Microsoft Visual Studio 2012|1.  Choose the **Start** button, choose **All Programs**.<br />2.  Choose **Microsoft Visual Studio**, choose **Visual Studio Tools**, and then right-click **Visual Studio Command Prompt** and choose **Run as Administrator**.|  
    |Microsoft Windows SDK|1.  Choose the **Start** button, choose **All Programs**.<br />2.  Choose **Microsoft Windows SDK**, choose **Microsoft Windows SDK**, and then right-click **Windows SDK Command Prompt** and choose **Run as Administrator**.|  
  
3.  At the command prompt, change to the folder that you created for the certificates. For example, type `cd\My Certificates`, and then press Enter.  
  
4.  To create the SSL certificate with a private key file, type the following command.  
  
    ```  
    makecert -r -pe -n "CN=Nav Test Cert" -b 01/01/2015 -e 01/01/2016 -sv NavTestCert.pvk NavTestCert.cer  
    ```  
  
     A certificate file called NavTestCert.cer and a private key file called NavTestCert.pvk are created in the temporary folder.  
  
    > [!TIP]  
    >  If you are working on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], you can use the following command to create and install the certificate, so you can skip the next procedure for importing the certificate.  
    >   
    >  `makecert -r -pe -n "CN=NavTestCert" -b 01/01/2015 -e 01/01/2016 -ss my -sr localmachine -sky exchange`  
  
5.  To generate a personal information exchange \(.pfx\) file from the NavTestCert.cer and NavTestCert.pvk files, type the following command. Substitute *mypassword* with a password of your own.  
  
    ```  
    pvk2pfx -pvk NavTestCert.pvk -spc NavTestCert.cer -pfx NavTestCert.pfx -po mypassword  
    ```  
  
     This creates a file called NavTestCert.pfx file in the temporary folder. The file is assigned a password of by the `po` option. You will use this password when you import the certificate into the local machine.  
  
6.  If you are not working on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], then copy the .pfx to the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  
  
> [!IMPORTANT]  
>  To avoid validation errors, make sure that the certificate that you create and self-sign has the same name as the host name, which is accessed from all the remote machines. The machine name is specified in “**CN=\<machine name>**”. If you use the *http://hostname:Port/NAVserver/* link to access your Microsoft Dynamics NAV service, then you should specify the –n “CN=hostname” flag to the `makecert` command instead.  
  
##  <a name="Importing"></a> Importing the SSL Certificate into the Local Computer Store of the Microsoft Dynamics NAV Server computer  
 Once you obtain a certificate, you must import it into the local computer store on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]. The certificate file will have the extension .cer or .pfx.  
  
#### To import an SSL certificate into the local computer store  
  
1.  On the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], choose **Start**, and then choose **Run**.  
  
2.  In the **Open** box, type **mmc**, and then choose **OK**.  
  
    > [!NOTE]  
    >  This procedure assumes that you do not already have the Certificates snap-in installed in Microsoft Management Console. If the Certificates snap-in is already installed, skip steps 3 to 7 and go to step 8.  
  
3.  On the **File** menu, choose **Add/Remove Snap-in**.  
  
4.  In the **Add/Remove Snap-in** dialog box, choose **Certificates**, and then choose **Add**.  
  
5.  In the **Certificates snap-in** dialog box, choose **Computer account**, and then choose **Next**.  
  
6.  In the **Select Computer** dialog box, choose **Local computer**, and then choose **Finish**.  
  
7.  In the **Add/Remove Snap-in** dialog box, choose **OK**.  
  
8.  In the left pane of the console, double-click and expand the **Certificates \(Local Computer\)**.  
  
9. Right-click **Personal**, point to **All Tasks**, and then choose **Import**.  
  
10. On the **Welcome to the Certificate Import Wizard** page, choose **Next**.  
  
11. On the **File to Import** page, choose **Browse**, locate your certificate file, for example NavTestCert.pfx.  
  
     If the certificate is in a personal information exchange file \(.pfx\), set the box next to **File name** to **Personal Information Exchange \(\*.pfx;\*.p12\)**, and then browse for the certificate file.  
  
12. Select the certificate file, and then choose **Open**, and then choose **Next**.  
  
13. If prompted for a password, type the password on the **Password** page, and then choose **Next**.  
  
14. On the **Certificate Store** page, choose **Place all certificates in the following store**, and then choose **Next**.  
  
15. Choose **Finish**, and then choose **OK** to confirm that the import was successful.  
  
##  <a name="GrantingAccess"></a> Granting Permissions to the Certificate's Private Key to Microsoft Dynamics NAV Server  
 If the certificate has a private key, then you must give the service account of [!INCLUDE[nav_server](includes/nav_server_md.md)] access to the private key.  
  
#### To grant access to the certificate’s private key to the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
1.  In the left pane of MMC, expand the **Certificates \(Local Computer\)** node, expand the **Personal** node, and then choose the **Certificates** folder.  
  
2.  In the center pane, right-click the certificate that you imported, choose **All Tasks**, and then choose **Manage Private Keys**.  
  
3.  In the **Permissions for private keys** dialog box, choose **Add**.  
  
4.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, in the **Enter the object names to select** box, type the name of the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)], and then choose **OK**.  
  
5.  On the **Security** tab, under **Allow**, select **Full Control** and **Read**, and then choose **OK**.  
  
##  <a name="Thumbprint"></a> Obtaining the Certificate's Thumbprint  
 The thumbprint is a string of hexadecimal characters that identifies the certificate. You use the thumbprint when you configure the web service's port to use the certificate. To perform this task, you continue working in the Certificates snap-in in Microsoft Management Console.  
  
#### To obtain the certificate's thumbprint  
  
1.  In the left pane under **Console Root**, expand the **Certificates \(Local Computer\)** node, expand the **Personal** folder, and then choose the **Certificates** folder  
  
     The center pane displays all the certificates.  
  
2.  Right-click the certificate that you imported, and then choose **Open**.  
  
3.  In the **Certificate** dialog box, choose the **Details** tab.  
  
4.  Scroll through the list of fields, and then choose **Thumbprint**.  
  
5.  Copy the hexadecimal characters from the box, and then paste them in a text editor, such as Notepad. These characters make up the thumbprint.  
  
6.  In the text editor, delete all spaces from the thumbprint string.  
  
     For example, if the thumbprint is `c0 d0 f2 70 95 b0 3d 43 17 e2 19 84 10 24 32 8c ef 24 87 79`, then change it to `c0d0f27095b03d4317e219841024328cef248779`.  
  
7.  Keep the file open or save it. You will use the thumbprint later on.  
  
##  <a name="ACL"></a> Configuring the Access Control List and the Web Services Ports for SSL  
 An access control list \(ACL\) is part of the Windows security infrastructure and features. The ACL controls who can access resources on a computer. For more information, see [Access Control Lists](http://go.microsoft.com/fwlink/?LinkId=177398).  
  
> [!NOTE]  
>  These procedures use the netsh tool \(netsh.exe\) for configuring the HTTP server. The netsh tool is supplied with Windows. By default the netsh tool is located in the c:\\Windows\\System32 folder.  
  
#### To configure the ACL  
  
1.  On the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], open a command prompt as an administrator as follows:  
  
    1.  From the **Start** menu, choose **All Programs**, and then choose **Accessories**.  
  
    2.  Right-click **Command Prompt**, and then choose **Run as administrator**.  
  
2.  At the command prompt, type the following command to change to the Windows\\System32 directory.  
  
    ```  
    cd\Windows\System32  
    ```  
  
3.  To view the ACL for the web services ports to determine if any entries are already using the relevant host name and port, type the following command:  
  
    ```  
    netsh http show urlacl  
    ```  
  
     Each entry is listed by the `Reserved URL` field, which has the format `http://hostname:port`. `hostname` is the name of the computer running the service and `port` is the port number the service runs on. A '`+`' \(plus sign\) in the `Reserved URL` field represents localhost, which indicates the computer that you are working on.  
  
     By default, SOAP and OData web services in [!INCLUDE[navnow](includes/navnow_md.md)] use ports 7047 and 7048, respectively, and connect to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance named[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]. The default reserved URL entries for these services are: `http://+:7047/nav_server_instance/` and `http://+:7048/nav_server_instance/`.  
  
4.  You must delete any entries that use the same port as the SOAP or OData web services.  
  
     To delete an entry, type the following command:  
  
    ```  
    netsh http delete urlacl url=http://hostname:Port/NAVserver/  
    ```  
  
     Substitute `Port` with the port number of the SOAP or OData web service and `NAVserver` with the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
     For example, to delete the default entries for SOAP and OData, use the following two commands:  
  
    ```  
    netsh http delete urlacl url=http://+:7047/nav_server_instance/  
    ```  
  
    ```  
    netsh http delete urlacl url=http://+:7048/nav_server_instance/  
    ```  
  
5.  To register the ports for the SOAP and OData web service with https, type the following command for each service:  
  
    ```  
    netsh http add urlacl url=https://hostname:port/navserver user=DOMAIN\user  
    ```  
  
     Substitute the following options with the proper values:  
  
    |Option|Description|  
    |------------|-----------------|  
    |`hostname`|The name of the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]. Use `+` for localhost.|  
    |`port`|The port that is used by the web service.|  
    |`navserver`|The name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use with the web service. The default is [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].|  
    |`DOMAIN\username`|The domain and user name of the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)]. If the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] is Network Service, then use "NT AUTHORITY\\NETWORKSERVICE".|  
  
     For example, if the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] has the domain *ABC* and the user name *xyz*, and then the command for the SOAP web service is as follows:  
  
    ```  
    netsh http add urlacl url=https://+:7047/nav_server_instance user="NT AUTHORITY\NETWORKSERVICE"  
    ```  
  
     If the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] is Network Service, then the command is as follows:  
  
    ```  
    netsh http add urlacl url=https://+:7047/nav_server_instance user="NT AUTHORITY\NETWORKSERVICE"  
    ```  
  
6.  To verify that your port has been registered, repeat step 3.  
  
#### To configure the port to use the SSL certificate  
  
1.  At the command prompt, type the following command to view the current port configurations:  
  
    ```  
    netsh http show sslcert  
    ```  
  
     All port bindings to SSL certificates are listed. Each entry is indicated by the `IP:port` field, where `IP` is the IP address that uses the port \(0.0.0.0 indicates all IP addresses\) and `port` is the port number.  
  
2.  If SSL is already configured on the address and port that you want to use for SOAP or OData web services, then use the following command to delete the entry:  
  
    ```  
    netsh http delete ssl ipport=ipaddress:port  
    ```  
  
     Substitute `ipaddress` and `port` with the IP address and port number of the entry that you want to delete.  
  
     For example, to delete the entry on the default SOAP port, use the following command:  
  
    ```  
    netsh http delete ssl ipport=0.0.0.0:7047  
    ```  
  
3.  To bind an SSL certificate to the SOAP or OData web service port, use the following command:  
  
    ```  
    netsh http add sslcert ipport=ipaddress:port certhash=thumbprint appid={id}  
    ```  
  
     Substitute the following options with the proper values:  
  
    |Option|Description|  
    |------------|-----------------|  
    |`ipaddress`|The IP address that can use the web service. Use `0.0.0.0` to include all IP addresses.|  
    |`port`|The port that is used by the web service.|  
    |`thumbprint`|The certificate thumbprint that you pasted to NotePad previously.|  
    |`id`|A 32-digit hexadecimal number that identifies the [!INCLUDE[navnow](includes/navnow_md.md)] application. The id must be in the format {NNNNNNNN-NNNN-NNNN-NNNN-NNNNNNNNNNNN\). If you do not know the appid, then use any value, such as {00112233-4455-6677-8899-AABBCCDDEEFF}.|  
  
     For example, the following command binds a certificate that has the thumbprint c0d0f27095b03d4317e219841024328cef248779 to port 7047 for all IP addresses:  
  
    ```  
    netsh http add sslcert ipport=0.0.0.0:7047 certhash=c0d0f27095b03d4317e219841024328cef248779 appid={00112233-4455-6677-8899-AABBCCDDEEFF}  
    ```  
  
##  <a name="Restart"></a> Restart the Microsoft Dynamics NAV Server Instance  
 You can use the Microsoft Dynamics NAV Server Administration Tool to restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
#### To restart [!INCLUDE[nav_server](includes/nav_server_md.md)]  
  
1.  In [!INCLUDE[nav_admin](includes/nav_admin_md.md)], in the left pane, under **Console Root**, choose the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  
  
2.  In the center pane, choose the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you have configured, and then in the right pane under **Actions**, choose **Restart**.  
  
3.  After the instance restarts, close [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
##  <a name="Verify"></a> Verifying the Configuration  
 You should now be able to use web services that are encrypted with SSL. To verify this, type the following URL in the address bar for your browser.  
  
 `https://localhost:7047/nav_server_instance/WS/services`  
  
 The page lists any web services that have been published.  
  
## Next Steps  
 You can now try out any other SOAP web service and OData walkthroughs with SSL. The only change that is required for using these walkthrough with SSL is that you use "https" instead of "http" in your URLs.  
  
## See Also  
 [Security and Protection](Security-and-Protection.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)