---
title: "Configuring Dynamics 365 Business Central Web Services to Use SSL (SOAP and OData)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Configuring [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Web Services to Use SSL 
Secure Sockets Layer \(SSL\) is a cryptographic protocol that helps provide security and data integrity for data communications over a network. By encrypting your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services using SSL, you make your data and the network more secure and more reliable.  
  
## Web Services and SSL  
 [!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports SSL authentication for SOAP and OData web services. The server authenticates itself to the client, but the client does not authenticate itself to the server. When the web service client connects to the [!INCLUDE[server](../developer/includes/server.md)] instance, the server replies by sending its digital certificate to the client. This certificate contains the server's public encryption key and the name of the authority that granted the certificate. The client verifies the certificate using the authority's public key.  
  
<!--  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with a developer license.  
  
-   The makecert.exe tool \(Certificate Creation Tool\) for creating SSL certificates.  
  
     The makecert.exe generates certificates for testing purposes. It is available with Microsoft Visual Studio and Microsoft Windows SDK. For more information, see [Certificate Creation Tool \(Makecert.exe\)](https://go.microsoft.com/fwlink/?LinkId=202833) in the MSDN Library.  
  
    > [!NOTE] 
    >  The makecert.exe tool is only required if you do not already have an SSL certificate and you want to create a certificate for test purposes.  

## Story  
 Victor, who is a business systems developer at [!INCLUDE[demoname](../developer/includes/demoname_md.md)], knows that his implementation of web services applications for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is unlikely to pass a company security audit unless he encrypts sensitive data that is transmitted over the company intranet. He decides to protect web services communication with SSL.  
-->
##  <a name="ObtainCert"></a> Obtain an SSL Certificate
  
 The certificate is a file that [!INCLUDE[server](../developer/includes/server.md)] uses to prove its identity and establish a trusted connection with the client that is trying to connect. In a production environment, you obtain an SSL certificate from a certification authority. Some large organizations may have their own certification authorities, and other organizations can request a certificate from a third-party organization.

 <!--In a test environment, if you do not have certificate, then you can create your own test certificate by using the makecert.exe tool as described in the following procedure.  
 
 In the following procedure, you use the makecert.exe tool to create a test certificate file \(.cer\) with a private key file \(.pvk\), and then generate a personal information file \(.pfx\) from the two files. You will use the .pxf in the next procedure for importing the certificate on the computer running [!INCLUDE[server](../developer/includes/server.md)].  
  
> [!NOTE] 
>  If you have a certificate, then you can skip this procedure and continue to [Importing the SSL Certificate into the Local Computer Store of the Microsoft Dynamics NAV Server computer](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData.md#Importing).  

 
#### To create a test SSL certificate using the makecert.exe tool  
  
1.  On the computer that is installed with Microsoft Visual Studio or Windows SDK, create a folder called *My Certificates* for working with and storing certificates.  
  
     You can work on the same computer that is running [!INCLUDE[server](../developer/includes/server.md)] or a different computer.  
  
2.  Open the command prompt as follows:  
  
    |If your computer is installed with|Then|  
    |----------------------------------------|----------|  
    |Microsoft Visual Studio|1.  Choose the **Start** button, choose **All Programs**.<br />2.  Choose **Microsoft Visual Studio**, choose **Visual Studio Tools**, and then right-click **Visual Studio Command Prompt** and choose **Run as Administrator**.|  
    |Microsoft Windows SDK|1.  Choose the **Start** button, choose **All Programs**.<br />2.  Choose **Microsoft Windows SDK**, choose **Microsoft Windows SDK**, and then right-click **Windows SDK Command Prompt** and choose **Run as Administrator**.|  
  
3.  At the command prompt, change to the folder that you created for the certificates. For example, type `cd\My Certificates`, and then press Enter.  
  
4.  To create the SSL certificate with a private key file, type the following command.  
  
    ```  
    makecert -r -pe -n "CN=Nav Test Cert" -b 01/01/2015 -e 01/01/2016 -sv NavTestCert.pvk NavTestCert.cer  
    ```  
  
     A certificate file called NavTestCert.cer and a private key file called NavTestCert.pvk are created in the temporary folder.  
  
    > [!TIP] 
    >  If you are working on the computer running [!INCLUDE[server](../developer/includes/server.md)], you can use the following command to create and install the certificate, so you can skip the next procedure for importing the certificate.  
    >   
    >  `makecert -r -pe -n "CN=NavTestCert" -b 01/01/2015 -e 01/01/2016 -ss my -sr localmachine -sky exchange`  
  
5.  To generate a personal information exchange \(.pfx\) file from the NavTestCert.cer and NavTestCert.pvk files, type the following command. Substitute *mypassword* with a password of your own.  
  
    ```  
    pvk2pfx -pvk NavTestCert.pvk -spc NavTestCert.cer -pfx NavTestCert.pfx -po mypassword  
    ```  
  
     This creates a file called NavTestCert.pfx file in the temporary folder. The file is assigned a password of by the `po` option. You will use this password when you import the certificate into the local machine.  
  
6.  If you are not working on the computer running [!INCLUDE[server](../developer/includes/server.md)], then copy the .pfx to the [!INCLUDE[server](../developer/includes/server.md)] computer.  
  
> [!IMPORTANT] 
>  To avoid validation errors, make sure that the certificate that you create and self-sign has the same name as the host name, which is accessed from all the remote machines. The machine name is specified in “**CN=\<machine name>**”. If you use the *https://hostname:Port/NAVserver/* link to access your Microsoft Dynamics NAV service, then you should specify the –n “CN=hostname” flag to the `makecert` command instead.  
-->
    



##  <a name="Importing"></a> Import the SSL Certificate into the Local Computer Store of the !INCLUDE[server](../developer/includes/server.md)] computer  

Once you obtain a certificate, you must import it into the **Personal** local computer store on the computer running [!INCLUDE[server](../developer/includes/server.md)]. The certificate file will have the extension .cer or .pfx.  
  
1.  On the computer running [!INCLUDE[server](../developer/includes/server.md)] instance, open Microsoft Management Console (mmc), and add the Certificates snap-in. 
2.  In the left pane of the console, double-click and expand the **Certificates \(Local Computer\)**.  
3. Right-click **Personal**, point to **All Tasks**, and then choose **Import**.  
4. Follow the on-screen instructions. When you get to the **File to Import** page, choose **Browse**, locate your certificate file, for example MyBusinessCentralCert.pfx.  
  
    If the certificate is in a personal information exchange file \(.pfx\), set the box next to **File name** to **Personal Information Exchange \(\*.pfx;\*.p12\)**, and then browse for the certificate file.  
5. Select the certificate file, and then choose **Open**, and then choose **Next**.  
6. If prompted for a password, type the password on the **Password** page, and then choose **Next**.  
7. On the **Certificate Store** page, choose **Place all certificates in the following store**, and then choose **Next**, and then follow the on-screen instructions to finish the installation.

  
##  <a name="GrantingAccess"></a> Grant Permissions to the Certificate's Private Key to [!INCLUDE[server](../developer/includes/server.md)]  
 If the certificate has a private key, then you must give the service account of [!INCLUDE[server](../developer/includes/server.md)] access to the private key.  
  
1.  In the MMC, right-click the certificate that you imported, choose **All Tasks**, and then choose **Manage Private Keys**.  
  
3.  In the **Permissions for private keys** dialog box, choose **Add**.  
  
4.  In the **Select Users, Computers, Service Accounts, or Groups** dialog box, in the **Enter the object names to select** box, type the name of the service account for [!INCLUDE[server](../developer/includes/server.md)], and then choose **OK**.  
  
5.  On the **Security** tab, under **Allow**, select **Full Control** and **Read**, and then choose **OK**.  
  
##  <a name="Thumbprint"></a> Get the certificate's thumbprint  
 The thumbprint is a string of hexadecimal characters that identifies the certificate. You use the thumbprint when you configure the web service's port to use the certificate.  
 
  
1.   In the MMC, right-click the certificate that you imported, and then choose **Open**.  
  
3.  In the **Certificate** dialog box, choose the **Details** tab.  
  
4.  Scroll through the list of fields, and then choose **Thumbprint**.  
  
5.  Copy the hexadecimal characters from the box, and then paste them in a text editor, such as Notepad. These characters make up the thumbprint.  
  
6.  In the text editor, delete all spaces from the thumbprint string.  
  
     For example, if the thumbprint is `c0 d0 f2 70 95 b0 3d 43 17 e2 19 84 10 24 32 8c ef 24 87 79`, then change it to `c0d0f27095b03d4317e219841024328cef248779`.

    > [!TIP] 
    >  It is important that the copied thumprint does not contain any invisible extra characters; otherwise you will experience problems when using it later. To avoid this, see [Certificate thumbprint displayed in MMC certificate snap-in has extra invisible unicode character](https://support.microsoft.com/en-au/help/2023835/certificate-thumbprint-displayed-in-mmc-certificate-snap-in-has-extra) 
    

##  <a name="ConfigureSSL"></a> Enable SSL for web services in the [!INCLUDE[server](../developer/includes/server.md)] configuration
  
The first step is to prepare [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to use SSL. This involves configuring the relevant [!INCLUDE[server](../developer/includes/server.md)] instance to specify SSL.

You can configure [!INCLUDE[server](../developer/includes/server.md)] instances with the [Server Administration Tool](../administration/administration-tool.md) or [Business Central Windows PowerShell Cmdlets]((/powershell/dynamics-nav/overview). For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  

   
1.  Open the [!INCLUDE[admintool](../developer/includes/admintool.md)], select [!INCLUDE[server](../developer/includes/server.md)] that you want to modify.

2. Under the **SOAP Web Services** and  **OData Web Services** tabs, set the **Enable SSL** option.

3. Make a note the ports that are used by SOAP and OData and the service account that the server instance is using. 

    You will need the information later. 
  
2.  In [!INCLUDE[admintool](../developer/includes/admintool.md)], in the left pane, under **Console Root**, expand the node for the [!INCLUDE[server](../developer/includes/server.md)] computer. This is typically named **[!INCLUDE[prodlong](../developer/includes/prodlong.md)] \(Local\)**, which is the local computer.  

##  <a name="ACL"></a> Configure the Access Control List and the Web Services Ports for SSL  

An access control list \(ACL\) is part of the Windows security infrastructure and features. The ACL controls who can access resources on a computer. For more information, see [Access Control Lists](https://go.microsoft.com/fwlink/?LinkId=177398).  
  
> [!NOTE] 
>  These procedures use the netsh tool \(netsh.exe\) for configuring the HTTP server. The netsh tool is supplied with Windows. By default the netsh tool is located in the c:\\Windows\\System32 folder.  
  
### Configure the ACL  
  
1.  On the computer running [!INCLUDE[server](../developer/includes/server.md)], open a command prompt as an administrator as follows:  
  
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
  
     Each entry is listed by the `Reserved URL` field, which has the format `https://hostname:port`. `hostname` is the name of the computer running the service and `port` is the port number the service runs on. A '`+`' \(plus sign\) in the `Reserved URL` field represents localhost, which indicates the computer that you are working on.  
  
     By default, SOAP and OData web services in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] use ports 7047 and 7048, respectively, and connect to a [!INCLUDE[server](../developer/includes/server.md)] instance named[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]. The default reserved URL entries for these services are: `https://+:7047/<server instance>/` and `https://+:7048/<server instance>/`.  
  
4.  You must delete any entries that use the same port as the SOAP or OData web services.  
  
     To delete an entry, type the following command:  
  
    ```  
    netsh http delete urlacl url=https://hostname:port/serverinstance/  
    ```  
  
     Substitute `port` with the port number of the SOAP or OData web service and `serverinstance` with the name of the [!INCLUDE[server](../developer/includes/server.md)] instance.  
  
     For example, to delete the default entries for SOAP and OData, use the following two commands:  
  
    ```  
    netsh http delete urlacl url=https://+:7047/<server instance>/  
    ```  
  
    ```  
    netsh http delete urlacl url=https://+:7048/<server instance>/  
    ```  
  
5.  To register the ports for the SOAP and OData web service with https, type the following command for each service:  
  
    ```  
    netsh http add urlacl url=https://hostname:port/serverinstance user=DOMAIN\user  
    ```  
  
     Substitute the following options with the proper values:  
  
    |Option|Description|  
    |------------|-----------------|  
    |`hostname`|The name of the computer running [!INCLUDE[server](../developer/includes/server.md)]. Use `+` for localhost.|  
    |`port`|The port that is used by the web service.|  
    |`serverinstance`|The name of the [!INCLUDE[server](../developer/includes/server.md)] instance to use with the web service. The default is [!INCLUDE[serverinstance](../developer/includes/serverinstance.md)].|  
    |`DOMAIN\username`|The domain and user name of the service account for [!INCLUDE[server](../developer/includes/server.md)]. If the service account for [!INCLUDE[server](../developer/includes/server.md)] is Network Service, then use "NT AUTHORITY\\NETWORKSERVICE".|  
  
     For example, if the service account for [!INCLUDE[server](../developer/includes/server.md)] instance **MyBCServer** has the domain **abc** and the user name **xyz** , and then the command for the SOAP web service is as follows:  
  
    ```  
    netsh http add urlacl url=https://myservercomputer:7047/MyBCServer user="abc\xyz"  
    ```  
  
     If the service account for [!INCLUDE[server](../developer/includes/server.md)] is Network Service, then the command is as follows:  
  
    ```  
    netsh http add urlacl url=https://myservercomputer:7047/MyBCServer user="NT AUTHORITY\NETWORKSERVICE"  
    ```  
  
6.  To verify that your port has been registered, repeat step 3.  
  
### Configure the port to use the SSL certificate  
  
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
    |`id`|A 32-digit hexadecimal number that identifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. The id must be in the format {NNNNNNNN-NNNN-NNNN-NNNN-NNNNNNNNNNNN\). If you do not know the appid, then use any value, such as {00112233-4455-6677-8899-AABBCCDDEEFF}.|  
  
     For example, the following command binds a certificate that has the thumbprint c0d0f27095b03d4317e219841024328cef248779 to port 7047 for all IP addresses:  
  
    ```  
    netsh http add sslcert ipport=0.0.0.0:7047 certhash=c0d0f27095b03d4317e219841024328cef248779 appid={00112233-4455-6677-8899-AABBCCDDEEFF}  
    ```  
  
##  <a name="Restart"></a> Restart the [!INCLUDE[admintool](../developer/includes/admintool.md)] Server Instance  
 You can use the Microsoft Dynamics NAV Server Administration Tool to restart the [!INCLUDE[server](../developer/includes/server.md)] instance.  
  
## Next Steps  
 You can now try out any other SOAP web service and OData walkthroughs with SSL. The only change that is required for using these walkthrough with SSL is that you use "https" instead of "http" in your URLs.  
  
## See Also  
 [Security and Protection](../security/Security-and-Protection.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)