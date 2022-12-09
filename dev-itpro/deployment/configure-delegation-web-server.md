---
title: Configure Web Client Delegation
description: The client device, Web Client and Server are on separate computers. Web Client performs actions on behalf of client device called impersonation process.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Configuring Delegation for Business Central Web Server

When the client device, [!INCLUDE[webserver](../developer/includes/webserver.md)], and [!INCLUDE[server](../developer/includes/server.md)] are on separate computers, the client device interacts with [!INCLUDE[server](../developer/includes/server.md)] through the computer that is running [!INCLUDE[webserver](../developer/includes/webserver.md)]. [!INCLUDE[webserver](../developer/includes/webserver.md)] is performing actions on the client device's behalf. This process is known as *impersonation*. Impersonation cannot be used across multiple computers, so you must set up delegation from [!INCLUDE[webserver](../developer/includes/webserver.md)] to [!INCLUDE[server](../developer/includes/server.md)]. Delegation occurs when [!INCLUDE[webserver](../developer/includes/webserver.md)] forwards a request from a device request to the [!INCLUDE[server](../developer/includes/server.md)] service so that the [!INCLUDE[server](../developer/includes/server.md)] service can impersonate the device.  
  
- [Delegating Access from the Web Server to the Server Instance](configure-delegation-web-server.md#Delegate)  
- [Configuring Kernel Mode Authentication on the Web Server](configure-delegation-web-server.md#Kernel)  
- [Registering Service Principal Names for Server Instance](configure-delegation-web-server.md#RegisterSPN)
  
    This last task only applies to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version 20 and earlier, and only if the service account for [!INCLUDE[server](../developer/includes/server.md)] isn't configured to register SPNs automatically.  

##  <a name="Delegate"></a> Delegating Access from the Web Server to [!INCLUDE[server](../developer/includes/server.md)]

Configuring delegation means explicitly configuring the computer that is running [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] to delegate its access to the [!INCLUDE[server](../developer/includes/server.md)] on behalf of the device that is trying to connect to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. To make the access more secure, you specify delegation to a specific service on a specific server. This is known as *constrained delegation*.  
  
> [!NOTE]  
> You must run the following procedure on a domain controller computer or on a computer that is installed with Active Directory Domain Services tools.  
  
### Delegate access to [!INCLUDE[server](../developer/includes/server.md)]  
  
1. On the domain controller computer for your network, or on a computer that is installed with Active Directory Domain Services tools, choose **Start**, and then choose **Run**.  
  
2. In the **Open** field, type **dsa.msc**.  
  
    This opens the **Active Directory Users and Computers** utility.  
  
3. Expand the node for the domain where you have installed the [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For this example, the domain is **Corp**.  
  
4. Select the **Computers** node. Right-click the computer that is running the [!INCLUDE[!INCLUDE[webserver](../developer/includes/webserver.md)], and then choose **Properties**.  

5. On the **Delegation** tab, choose **Trust this user for delegation to specified services only**, and then choose **Use Kerberos only**.  

    > [!NOTE]  
    > The **Use Kerberos Only** option does not work for some network configurations with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. If you get a server error when you try open the [!INCLUDE[webserver](../developer/includes/webserver.md)], then disable the **Use Kerberos Only** option and see whether this fixes the error. For more information about this error, see [Troubleshooting: A server error occurred and the content cannot be displayed](/dynamics-nav/Troubleshooting--A-server-error-occurred-and-the-content-cannot-be-displayed).  
  
6. You must add the following service entries for the computer that is running [!INCLUDE[server](../developer/includes/server.md)], where **BCSERVER** indicates the name of the computer that is running [!INCLUDE[server](../developer/includes/server.md)]. The service entries depend on your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version.

    Version 21 and later:

    |Service type|User or computer|Port|  
    |------------------|----------------------|----------|  
    |http|BCSERVER||  

    Version 20 and earlier:

    |Service type|User or computer|Port|  
    |------------------|----------------------|----------|  
    |DynamicsNAV|BCSERVER|7046|  
    |HOST|BCSERVER||  
  
7. In the **Add Services** window, choose **Users or Computers**.  
  
8. In the **Enter the object names to select** box, type the name of the computer that is running [!INCLUDE[server](../developer/includes/server.md)], in this case BCSERVER, and then choose the **OK** button.  
  
9. In the list of available services, select **HOST**, and then choose the **OK** button.  
  
10. To add the DynamicsNAV service, select **Expanded**, and then choose **Add**.  
  
11. In the Enter the object names to select box, type the name of the user that is running the [!INCLUDE[server](../developer/includes/server.md)], and then choose the **OK** button.  
  
12. Choose the **OK** button to close the dialog box.  
  
## <a name="Kernel"></a> Configuring Kernel Mode Authentication on the [!INCLUDE[webserver](../developer/includes/webserver.md)]

By default, Windows authentication on the [!INCLUDE[webserver](../developer/includes/webserver.md)] site on IIS is set to use kernel mode authentication. Kernel-mode authentication improves authentication performance. However, when you are using delegation with Kerberos, you must either disable kernel mode or configure it to use the credentials of the application pool of [!INCLUDE[webserver](../developer/includes/webserver.md)]; otherwise, authentication will fail and [!INCLUDE[webserver](../developer/includes/webserver.md)] will not be able to connect to [!INCLUDE[server](../developer/includes/server.md)]. This is because kernel mode authentication runs under the machine account of the computer that is running IIS and the [!INCLUDE[!INCLUDE[webserver](../developer/includes/webserver.md)], while the [!INCLUDE[webserver](../developer/includes/webserver.md)] runs under the user account of the user trying to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  
  
As a best practice, you should configure kernel mode authentication to use the application pool credentials, as described in option 1 that follows.  
  
### Option 1: Configure Kernel Mode Authentication to use the Application Pool Credentials (recommended)
  
1. On the computer that you installed [!INCLUDE[!INCLUDE[webserver](../developer/includes/webserver.md)], open the applicationHost.config file for Internet Information Services in a text editor, such as Notepad. By default, the file is located in *c:\\Windows\\System32\\inetsrv\\config*.  
  
2. Locate the `<location path="Microsoft Dynamics 365 Business Central Web Client">` element.  
  
3. Change the `<windowsAuthentication enabled="true">` element to the following.  
  
    ```xml
    <windowsAuthentication enabled="true" useAppPoolCredentials="true" />  
    ```  
  
4. Save the file.  
  
5. Restart IIS. To restart IIS in a command prompt, do the following:  
  
    1. On the **Start** menu, choose **Run**.  
  
    2. In the **Open** box, type **cmd**, and then choose the **OK** button.  
  
    3. At the command prompt, type **iisreset**, and then press Enter.  
  
    > [!TIP]  
    >  You can also restart IIS using Internet Information Services Manager, if you have it installed.  
  
### Option 2: Disable configure Kernel Mode Authentication  
  
1. Open Internet Information Services Manager.  
  
    On the **Start** menu, in the **Search Programs and Files** box, type **inetmgr**, and then press Enter.  
  
2. In the **Connections** pane, expand **Sites**, and then select **[!INCLUDE[prod_long](../developer/includes/prod_long.md)] Web client**.  
  
3. In the **IIS** section, double-click **Authentication**.  
  
4. In the **Authentication** pane, choose **Windows Authentication**, and then choose **Advanced Settings**.  
  
5. Clear the **Enable Kernel-mode authentication** box, and then choose the **OK** button.  

## <a name="RegisterSPN"></a> Registering Service Principal Names for [!INCLUDE[server](../developer/includes/server.md)]

> [!NOTE]
> This section only applies to Business Central 2022 release wave 1 (version 20) and earlier. SPNs aren't support in later versions.

When [!INCLUDE[server](../developer/includes/server.md)] is using a dedicated domain user account as its logon account, then you must register service principal names \(SPN\) for the [!INCLUDE[server](../developer/includes/server.md)] on the domain user account to make delegation work. An SPN is the name by which a client uniquely identifies an instance of a service, using the account under which the service runs. To register SPNs, you used the setspn command-line tool that is available in Windows Server 2008 and Windows 7.  
  
> [!NOTE]  
> You do not have to perform this task if the domain user account has permissions to register SPNs. In this case, SPNs for [!INCLUDE[server](../developer/includes/server.md)] will be automatically registered when [!INCLUDE[server](../developer/includes/server.md)] instance starts and then unregistered when the [!INCLUDE[server](../developer/includes/server.md)] instance stops. For information about how to configure the service account to register SPNs, see [Provisioning the Service Account](provision-server-account.md).  
  
### Create a service principal name
  
1. Using any computer in the network, open a command prompt as an administrator. To do this, choose **Start**, and then in the search window, type **Command Prompt**. Right-click **Command Prompt**, and then choose **Run as administrator**.  
  
2. To view the registered SPNs for [!INCLUDE[server](../developer/includes/server.md)] on the domain account, type the following command.  
  
    ```dos
    setspn -l domain\username  
    ```  
  
    To view the registered SPNs for a specific computer, type the following command.  
  
    ```dos  
    setspn -l domain\computername$  
    ```  
  
3. At the command prompt, create an SPN for the [!INCLUDE[server](../developer/includes/server.md)] service using the following syntax.  
  
    ```dos  
    setspn -A DynamicsNAV/FullyQualifiedDomainNameOfServer:Port Domain\User  
    ```  
  
     Replace *FullyQualifiedDomainNameOfServer*, *Port*, and *Domain\\ServiceAccountUserName* with the appropriate values.  
  
     For example, if **BCSERVER** is the name of the computer that is running [!INCLUDE[server](../developer/includes/server.md)], the actual command has the following format.  
  
    ```dos  
    setspn -A DynamicsNAV/BCSERVER.corp:7046 corp\bcdomainuser  
    ```   
## See Also  
 [Business Central Web Server Overview](web-server-overview.md)   
 [Installing Business Central in a Two Computer Environment](deploy-two-computer-environment.md)   
 [Installing Business Central in a Three Computer Environment](deploy-three-computer-environment.md)