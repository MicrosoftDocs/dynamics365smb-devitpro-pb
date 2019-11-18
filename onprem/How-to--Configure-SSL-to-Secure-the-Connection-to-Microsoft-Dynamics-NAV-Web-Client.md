---
title: Secure Web Client - SSL Configuration
description: Learn how to secure Dynamics NAV data that is transmitted over the internet by enabling Secure Sockets Layer on the connection to Web Client.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8079f309-e5ca-4d23-a6b9-412892a565ad
caps.latest.revision: 23
author: jswymer
---
# Configuring SSL to Secure the Connection to Dynamics NAV Web Client
We recommend that you secure [!INCLUDE[navnow](includes/navnow_md.md)] data that is transmitted over the Internet by enabling Secure Sockets Layer \(SSL\) on the connection to [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 *SSL* is a web protocol that encrypts data that is transmitted over a network to make the data and the network more secure and reliable. A website that is enabled with SSL uses Hypertext Transfer Protocol Secure \(HTTPS\) instead of Hypertext Transfer Protocol \(HTTP\) as a communication protocol. Enabling SSL on a website requires that an SSL certificate is installed on the web server. An SSL certificate is a small file that the web server uses to prove its identity and establish a trusted connection with the browser that is trying to access [!INCLUDE[nav_web](includes/nav_web_md.md)]. When a browser connects to the [!INCLUDE[nav_web](includes/nav_web_md.md)], the web server replies by sending its certificate to the browser. This certificate contains the web server's public encryption key and the name of the authority that granted the certificate. The browser verifies the certificate using the authority's public key.  
  
 To configure SSL, you must follow these steps.  
  
-   [Obtaining an SSL Certificate](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md#Cert)  
  
-   [Adding an HTTPS Binding That Uses the Certificate on the Microsoft Dynamics NAV Web Client Site](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md#Binding)  
  
-   [Redirecting HTTP to HTTPS (Optional)](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md#Redirect)  
  
> [!NOTE]  
>  You can configure SSL for the [!INCLUDE[nav_web](includes/nav_web_md.md)] when you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. For more information, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).  
  
##  <a name="Cert"></a> Obtaining and Installing an SSL Certificate  
 In a production environment, you should obtain an SSL certificate from a certification authority. Some large organizations may have their own certification authorities, and other organizations can request a certificate from a third-party organization. In a test environment or development environment, you can create your own self-signed certificate.  
  
### To create a self-signed SSL certificate  
  
1.  To open Internet Information Services \(IIS\) Manager, search for **inetmgr**.  
  
2.  In Internet Information Services Manager, in the **Connections** pane, choose the top-level node for the server.  
  
3.  On the **Home** page, under **IIS**, choose **Server Certificates**, and then in the **Actions** pane, choose **Open Feature**.  
  
4.  On the **Server Certificates** page, in the **Actions** pane, choose **Create Self-Signed Certificate**.  
  
5.  In the **Specify Friendly Name** dialog box, type a brief name for the certificate, and then choose the **OK** button.  
  
     The new certificate appears on the **Server Certificates** page.  
  
##  <a name="Binding"></a> Adding an HTTPS Binding That Uses the Certificate on the Microsoft Dynamics NAV Web Client Site  
 After you get the certificate, you add a binding to the https protocol on the website. When you add the binding, you associate it with the certificate.  
  
#### To add an https binding with the certificate to the website  
  
1.  Open Internet Information Services \(IIS\) Manager.  
  
2.  In the **Connections** pane, expand the **Sites** node, and then choose the [!INCLUDE[nav_web](includes/nav_web_md.md)] site to which you want to add the binding.  
  
     By default, the site has the name **[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client**.  
  
3.  In the **Actions** pane, choose **Bindings**.  
  
4.  In the **Site Bindings** dialog box, choose **Add**.  
  
5.  In the **Add Site Binding** dialog box, set the **Type** field to **https**.  
  
     You can use the default port 443 or change it to another port. If you change it to another port, you will have to provide the port number in the URL when you try to open the client.  
  
6.  Set the **SSL certificate** field to the certificate that you obtained or created for the site.  
  
7.  Choose the **OK** button, and then choose the **Close** button.  
  
##  <a name="Redirect"></a> Redirecting HTTP to HTTPS \(Optional\)  
 To ensure that users always access the site that is secured with SSL, you can automatically redirect HTTP requests to HTTPS. This means that users do not have to explicitly include https in the URL in the browser. For example, the nonsecure URL of the [!INCLUDE[nav_web](includes/nav_web_md.md)] could be https://MyWebclient:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)] and the secure URL could be https://MyWebclient:443/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]. If a user types https://MyWebclient:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)], the browser automatically redirects to **https://MyWebclient:443/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]**.  
  
 There are different ways to redirect HTTP requests to HTTPS. The following procedure describes how to redirect HTTP requests to HTTPS by installing the Microsoft Application Request Routing for IIS 7 and modifying the web.config file for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
#### To redirect HTTP to HTTPS  
  
1.  Download and install Microsoft Application Request Routing for IIS. You can use one of the following links:  
  
    -   [Microsoft Application Request Routing Version 2 for IIS 7 \(x64\)](https://go.microsoft.com/fwlink/?LinkID=265360)  
  
    -   [Microsoft Application Request Routing Version 2 for IIS 7 \(x86\)](https://go.microsoft.com/fwlink/?LinkID=265361)  
  
2.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the web.config file for the web server instance for [!INCLUDE[nav_web](includes/nav_web_md.md)]. Use a text editor, such as Notepad.  
  
     The web.config file is located in the physical path of the web application on IIS. By default, the path is %systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\WebClient. For example, the folder for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] application is %systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\WebClient.  
  
3.  In the `<system.webServer>` element, add the following elements.  
  
    ```  
    <rewrite>  
      <rules>  
        <rule name="Redirect to HTTPS">  
          <match url="(.*)" />  
          <conditions>  
            <add input="{HTTPS}" pattern="off" ignoreCase="true" />  
          </conditions>  
          <action type="Redirect" url="https://{SERVER_NAME}/{R:1}" redirectType="SeeOther" />  
        </rule>  
      </rules>  
    </rewrite>  
  
    ```  
  
4.  Save the web.config file.  
  
## See Also  
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)