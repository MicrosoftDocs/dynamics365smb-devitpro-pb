---
title: "Deploying Microsoft Dynamics NAV Using ClickOnce"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0a6f16fb-07fe-4c2f-9986-5633d31d1c60
caps.latest.revision: 42
manager: edupont
---
# Deploying [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] Using ClickOnce
This article contains instructions for deploying the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] using the ClickOnce deployment technology. ClickOnce allows you to deploy web applications by choosing a link on a web page. ClickOnce is a component of the Microsoft .NET Framework.  
  
## ClickOnce installation from the end-user's perspective  
As an administrator, you wll provide end users with a link to the ClickOnce deployment source, which can point to a file share or a website. The end user will choose the link to the application to install [!INCLUDE[navnow](includes/navnow_md.md)].

-   The ClickOnce runtime opens with a confirmation dialog box, which asks whether to install the application and includes an **Install** and **Don't Install** button.  
  
-   If the user chooses the **Install** button, ClickOnce downloads all the necessary files to a local folder on their computer.  
  
-   When the download is complete, ClickOnce starts the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], and also installs a program shortcut on the **Start** menu of the computer.  
  
-   The next time that the user want to run the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], they can either select the link again, or you select the shortcut on the **Start** menu. In either case, ClickOnce will check if there is a newer version available, which the user will have the option to install.  
  
No configuration of the ClientUserSettings.config file is needed during install or after install as this is set up as part of the ClickOnce deployment.  
  
## Benefits of a ClickOnce deployment  
 ClickOnce has the following benefits:  
  
-   Allows for a centralized configuration. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] configuration file (ClientUserSettings.config) that is installed with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] contains several settings that must be adjusted for the specific installation, such as the server address and the authentication type to use. By using ClickOnce, you can control the ClientUserSettings.config centrally and push it out to the client computers. Configuration is not required on the individual client computer. If you make a mistake, or if the settings have to change, such as if you want to move the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to a different computer, then you can create an updated configuration file by using the upgrade capability.  
  
-   Allows for bundled add-ins. By using ClickOnce, you can easily deploy your own assemblies and third-party add-in assemblies. You do not have to copy add-in files after the installation.  
  
-   You can have side-by-side installations. You cannot have two MSI-based [!INCLUDE[nav_windows](includes/nav_windows_md.md)]s on the same computer. A ClickOnce-deployed [!INCLUDE[nav_windows](includes/nav_windows_md.md)] does not interfere with other ClickOnce-deployed [!INCLUDE[nav_windows](includes/nav_windows_md.md)]s. This makes it easy to run against different servers from the same computer. For example, you could have two [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installations, one for a production server and one for a test server. This also means that you can run different versions of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] side-by-side, which is not possible with MSI.  
  
-   Multiple languages can be included in the same installer. By using ClickOnce, you can decide which files, such as language resource files and Help files, that you want to include in the deployment. End users will not be aware of the difference between installing an EN-US-only version and a version with several additional languages.  
  
-   Administrator permissions are not required. By using ClickOnce, a typical Windows user can install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The prerequisites for installation require administrator permissions. These prerequisites have to be installed one time on the computer, after which any user can install and upgrade the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
-   ClickOnce supports a seamless upgrade. End users will hardly notice when the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is upgraded.  
  
The result should be that end users can install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] without relying on partners or super users to do it for them.  
  
There are some limitations of a ClickOnce-installed [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information, see [Limitations of ClickOnce Installed on the Microsoft Dynamics NAV Windows Client](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md#Limitations).  
  
## Technical Overview of ClickOnce  
ClickOnce is a standard .NET technology that has existed since .NET Framework 2.0. The instructions in this article are meant to help you start working with ClickOnce deployment, however ClickOnce has additional features that are not described in this article.  
  
The file structure of a ClickOnce deployment is as follows:  
  
-   Assuming that you have a folder that contains your application files, such as the EXE, DLLs, configuration files, and other files that your application needs, the files should be organized in subfolders as appropriate for your application to work correctly.  
  
-   You create an XML file, usually called the *application manifest*. This file should be suffixed with .manifest, and added in the root of your application folder. The application manifest file contains metadata about your application including a list of all the files, which file is the main executable file, and so on.  
  
-   You create another XML file, usually called the *deployment manifest*. This file should be suffixed with .application, and added to the directory outside the root of your application folder. The deployment manifest has a link to the application manifest. It also has information about the application, such as a product name, version number, and so on. This information will be shown in locations such as the **Start** menu and in **Add or Remove Programs**.  
  
 When a user installs the application, he runs the deployment manifest, and then ClickOnce will automatically install the application.  
  
## Prepare Users Computers by Installing .NET Framework 4.6.1
The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] requires .NET Framework 4.6.1. Depending on the version of Windows, .NET 4.6.1 Framework might already be installed. If not, then you have two options:

1.  Users themselves install .NET 4.6.1 Framework on their computers from the ClickOnce online installation web page.

    The ClickOnce online installation web page includes a link to download .NET Framework 4.6.1. However, using this option requires that users have administrative rights on their computers. 

2. An administrator installs install .NET 4.6.1 Framework on users computers. 

    For more information about how to install .NET 4.6.1 Framework, see [Install the .NET Framework for developers](https://go.microsoft.com/fwlink/?LinkId=272382).   
  
<!-- -   The install experience can be improved for the end user by providing a solution that packages the Microsoft Report Viewer with the ClickOnce installation. Microsoft Report Viewer requires Microsoft System CLR Types for SQL Server 2014. Microsoft Certified Partners may download and redistribute the Microsoft Report Viewer 2015 Redistributable Package and Microsoft System CLR Types for SQL Server 2014 from the Microsoft Download Center. You can download Microsoft Report Viewer at [Microsoft Report Viewer 2015 RUNTIME](https://go.microsoft.com/fwlink/?LinkID=536665). Microsoft System CLR Types for SQL Server 2014 is available as part of the Microsoft SQL Server 2014 Feature Pack, which you can download at [Microsoft SQL Server 2016 Feature Pack](https://go.microsoft.com/fwlink/?linkid=857649).  

 Microsoft System CLR Types for SQL Server 2016 is available as part of the Microsoft SQL Server 2016 Feature Pack, which you can download at [Microsoft SQL Server 2016 Feature Pack](https://go.microsoft.com/fwlink/?linkid=857649).

    > [!NOTE]  
    >  The Microsoft Report Viewer is an optional component. If it is not installed, the end user will get an error message when trying to print or preview reports in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. All other functionality in the client will not be affected.

  
 Installing these prerequisites requires administrative rights on the computer. If the end users are not already administrators on their computers, then an administrator or a super user must first install the prerequisites on the computer. After that is complete, any user on the computer can install, uninstall, and upgrade the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Administrative rights are not needed for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  


Windows operating systems are subject to compliance with the Supplemental Redist License located at [Microsoft Download Center](https://go.microsoft.com/fwlink/?LinkID=262161&clcid=0x409). 
--> 
  
### Deploying Using ClickOnce Hosted on a File Share  
It is easier to host a ClickOnce deployment on a file share than it is to host on a web server. Hosting on a web server is basically the same, except that you may need to make some adjustments to IIS.  
  
Follow these steps to host on a file share:  
  
1.  Install Manifest Generation and Editing Tool (mage.exe) on your computer.

    The mage.exe is installed with Visual Studio, Windows Software Development Kit (SDK) for Windows 8 or 8.1, and Windows 10 SDK. Microsoft Windows SDK for Windows 7 and the .NET Framework 4. The SDK contains a utility named mage.exe, which is required in several of the following steps.
  
    The mage.exe utility should be located in the equivalent of the following location:  
  
    `C:\\Program Files \(x86\)\\Microsoft SDKs\\Windows\\v10.0A\\Bin\\NETFX 4.6.1 Tools`  
  
2.  (Optional) Obtain a code signing certificate. This is a certificate that is issued by a certification authority, and will enable you to sign the application in such a way that end users can see that the application is published by the expected provider and, for example, not by a phisher.  
  
    1.  If you do not already have a code signing certificate, you will have to obtain one from one of the certification authorities. For a list of certification authorities, see [Microsoft Technet](https://go.microsoft.com/fwlink/?LinkId=262163).  
  
    2.  You can also create a test certificate and use it for testing. For more information, see [How to: Create Your Own Test Certificate](https://msdn.microsoft.com/library/ff699202.aspx) or [New-SelfSignedCertificate](/powershell/module/pkiclient/new-selfsignedcertificate).  
  
    3.  For information about when it is acceptable to skip this step, see [Security Considerations](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md#Security).  
  
3.  Install the ClickOnce Installer Tools:
    1.  On the [!INCLUDE[navnow](includes/navnow_md.md)] installation media (DVD), run setup.exe.
    2.  Choose **Custom** installation option, choose **ClickOnce Installer Tools**, and follow the instructions.
    
    The files will be installed in [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\ClickOnce Installer Tools.  
  
4.  Perform a typical installation of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] as follows:  
  
    1.  Run setup.exe to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].
    
        If not already installed, you will also need to install the [!INCLUDE[nav_server](includes/nav_server_md.md)] and database components that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] connect to.

        Do not install unnecessary client components, such as the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] and the Excel add-in. These add to the download size, and contain special file types that can create problems for a ClickOnce deployment. For example, the Web.config file installed with the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] can create problems when it is hosted on a web server.
  
    2.  Install relevant language packs.  
  
    3.  Add additional add-ins, if you have any.  
  
    4.  Run the client, and make sure that everything works as expected.  
  
     Now you have the files that you know will work, and which you want to deploy on end user computers.  
  
5.  Copy the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] files to a file share:

    1.  Create a file share, for example, that has the name *\\\\fileshare\\clickonce*.  
  
    2.  Create a folder in the file share, such as *\\\\fileshare\\clickonce\\Deployment\\ApplicationFiles*.  
  
    3.  Copy all the files from [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client to this new folder.  
  
        > [!IMPORTANT]  
        >  Microsoft.Dynamics.Nav.Client.exe and Microsoft.Dynamics.Nav.Client.x86.exe have the same assembly identity name, so you must copy only one of these executables. You can choose either file.  
  
    4.  Move ClientUserSettings.config to that folder.  
  
         This file typically installs to the equivalent of C:\\Program Data\\Microsoft\\Microsoft Dynamics NAV\\NNN\\, or C:\\Users\\*user name*\\AppData\\Roaming\\Microsoft\\Microsoft Dynamics NAV\\NNN\\, where NN is the version number such as 90, 100 or 110. The exact location depends on your operating system.  
  
6.  Copy the template files. The ClickOnce Installer Tools installation contains template files that will be useful starting points.  
  
    Copy the files in [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\ClickOnce Installer Tools\\TemplateFiles to *\\\\fileshare\\clickonce*.  
  
<!-- 7.  The [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Windows client requires Microsoft Report Viewer 2015 for viewing and printing a report, along with and Microsoft System CLR Types for SQL Server 2014. Therefore, these are a prerequisite installation in the ClickOnce scenario.  
  
     Both are available on the Microsoft Download Center. You can download Microsoft Report Viewer at [Microsoft Report Viewer 2015 RUNTIME](https://go.microsoft.com/fwlink/?LinkID=536665). Microsoft System CLR Types for SQL Server 2014 is available as part of the Microsoft SQL Server 2014 Feature Pack, which you can download at [Microsoft SQL Server 2014 Feature Pack](https://go.microsoft.com/fwlink/?LinkID=536666).  
  
     Microsoft Report Viewer 2015 is available on download at [https://go.microsoft.com/fwlink/?LinkID=536665](https://go.microsoft.com/fwlink/?LinkID=536665).  -->
  
7.  Update the application manifest. The application manifest lists the files that are part of the installation.  
  
    1.  Open a command prompt using the **Run as administrator** option, and change the directory to *C:\\fileshare\\clickonce\\Deployment\\ApplicationFiles*.  
  
    2.  Use mage.exe to update the manifest file to have the correct files as shown in the following code example.  
  
         `mage.exe -Update Microsoft.Dynamics.Nav.Client.exe.manifest -FromDirectory .`  
  
        > [!IMPORTANT]  
        >  You must specify the fully qualified path to mage.exe, such as `"C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\Bin\NETFX 4.6.1 Tools\mage.exe"`.  
        
        The *FromDirectory* parameter will include all files in all subdirectories found within the specified directory. If no directory is specified, such as in the example, mage.exe uses the current directory and subdirectories. For more information, see [Mage.exe](https://msdn.microsoft.com/library/acz3y3te\(v=vs.110\).aspx) in the MSDN Library.  
  
        ClickOnce does not support having the same assembly duplicated in different folders. If you receive an error, then you will have to remove one of the copies, either in the manifest file or on disk, and then run the mage.exe again. The copy of OpenXML.dll in Add-Ins folder will not be needed in a ClickOnce deployment, therefore you can delete it.  
  
8. Review the application manifest.

    Open Microsoft.Dynamics.Nav.Client.exe.manifest in a text editor, like Notepad. You do not have to change anything in this file, but you should be aware of what it looks like. The application manifest has an identity \(assembly.assemblyIdentity\), which is referred to by the deployment manifest. This can be any string, and it will not be shown to end users. Note the version number, which will be used in upgrade scenarios.  
  
9. (Optional) Sign the application manifest. If you do not sign the manifest, the user will get a security warning when he installs, because the publisher, who is you, cannot be verified. This means that the end user cannot distinguish between your application and malware. If you sign the manifest, the user will see that the application is coming from your company, and he will trust it. If you have the code signing certificate PartnerCodeSigningCertificate.cer and the private key PartnerPrivateKey.pvk, run the following commands.  
  
     `cert2spc PartnerCodeSigningCertificate.cer PartnerSoftwarePublisherCertificate.spc`  
  
     `pvk2pfx -spc PartnerSoftwarePublisherCertificate.spc -pvk C:\PrivateFolder\PartnerPrivateKey.pvk -pfx PartnerPersonalInformationExchange.pfx`  
  
     `mage.exe -sign Microsoft.Dynamics.Nav.Client.exe.manifest -certfile PartnerPersonalInformationExchange.pfx`  
  
     Now the application manifest is signed. If you modify it, you will have to sign it again. For information about when it is acceptable to skip this step, see [Security Considerations](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md#Security).  
  
10. Update the deployment manifest.  
  
    1.  At the command promt, change the directory to ClickOnce *Deployment* folder, for example, *C:\\fileshare\\clickonce\\Deployment*.  
  
    2.  Run this command to change the link to the application manifest and update its hash value.  
  
         `mage.exe -update Microsoft.Dynamics.Nav.Client.application -appmanifest ApplicationFiles\Microsoft.Dynamics.Nav.Client.exe.manifest -appcodebase \\fileshare\clickonce\Deployment\ApplicationFiles\Microsoft.Dynamics.Nav.Client.exe.manifest`  
  
    3.  Open Microsoft.Dynamics.Nav.Client.application file in a text editor, like Notepad, and do the following:  
  
        1.  In the `<assemblyIdentity>` element, set the `name` parameter. For example, you could add the customer’s name to the name, and if you deploy a test and a production server for the customer, then you could add **production** or **test** to the name. You should never change this value after end users have used it to install the [!INCLUDE[navnow](includes/navnow_md.md)] client. The value will not be shown to end users.  
  
        2.  In the `<description>` element, change the parameters as appropriate. For example, you could change the `asmv2:publisher` parameter to be "Microsoft Corporation and \<your company name>", and change the `asmv2:product` parameter to be "[!INCLUDE[navnowlong](includes/navnowlong_md.md)] for \<customer name>". These are the names that the end user will see.  
  
        3.  In `<deploymentProvider>` element, change the link of the `codebase` parameter to *\\\\fileshare\\clickonce\\Deployment\\Microsoft.Dynamics.Nav.Client.application*. As you can see, it is now pointing to itself so that it is possible to check for updates.  
  
11. Optionally, sign the deployment manifest. This is similar to the application manifest.  
  
     `mage.exe -sign Microsoft.Dynamics.Nav.Client.application -certfile PartnerPersonalInformationExchange.pfx.`  
  
     After the deployment manifest is signed, if you modify it, you will have to sign it again. For information about when it is acceptable to skip this step, see [Security Considerations](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md#Security).  
  
12. Now you should be done with your ClickOnce deployment, so you can test the ClickOnce deployment. To do this, run the Microsoft.Dynamics.Nav.Client.application in the file share, for example, by choosing *\\\\fileshare\\clickonce\\Deployment\\Microsoft.Dynamics.Nav.Client.application*.  
  
    > [!NOTE]  
    >  Do not run the deployment from *C:\\fileshare\\clickonce\\Deployment\\Microsoft.Dynamics.Nav.Client.application*. This will give you an error that the deployment and application are in different security zones.  
  
13. Verify that everything works as expected. The ClickOnce files are typically installed under C:\\Users\\*user name*\\AppData\\Local\\Apps. In the next step, you will have to know where these files are installed, so locate the files by searching for **Microsoft.Dynamics.Nav.Client.exe** under that folder or by typing: **dir /s Microsoft.Dynamics.Nav.Client.exe**.  
  
14. As a final verification, we recommend that you compare the files that were installed by ClickOnce, in the folder you searched for, to the files that were installed by the MSI installer in *C:\\Program Files\\...*. There will be some differences. For example, there will be multiple manifest files in the ClickOnce folder. You should review these differences and make sure they are as expected. For example, if you see a .DLL file in one folder, but not the other, this could cause an error.  
  
 In addition to creating the installer itself, you should require end users to read and accept Microsoft’s software license terms \(SLT\) as part of the installation experience.  
  
### Deploying Using ClickOnce Hosting on a Web Server  
Hosting on a web server is similar to hosting on a file share. Using the steps outlined in the previous section, you should note that the two links in the deployment manifest should point to the *https://* address, instead of a *\\\\fileshare* address. This is the only change that you need to make to the files.  
  
All the logic needed for requesting user permissions to install or check for upgrades happens on the client computer. The web server works like a file repository.  
  
 The only problem with web server hosting is that web servers use different file types differently. For example, by default a file that has the .config extension will not be able to be downloaded from a web server. The web server will restrict access to it. To work around this, you can create a web.config file in the folder that contains the application files, with contents similar to the following.  
  
```  
<?xml version="1.0" encoding="UTF-8"?>  
<configuration>  
  <system.webServer>  
    <directoryBrowse enabled="true" />  
    <staticContent>  
      <mimeMap fileExtension=".config" mimeType="application/x-msdownload" />  
      <mimeMap fileExtension=".tlb" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".olb" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".pdb" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".hh" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".xss" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".xsc" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".stx" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".msc" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".flf" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".rdlc" mimeType="application/x-msdownload"/>  
      <mimeMap fileExtension=".sln" mimeType="application/x-msdownload"/>  
</staticContent>  
    <security>  
      <requestFiltering>  
        <fileExtensions>  
          <remove fileExtension=".config" />  
        </fileExtensions>  
      </requestFiltering>  
    </security>  
  </system.webServer>  
</configuration>  
```  
  
 You should start with an empty .config file, and then use trial-and-error to add the necessary rules, until ClickOnce can download all the files. If ClickOnce cannot download the files, a report will show which file and which extension is the problem.  
  
### Requiring End Users to Read and Accept Software License Terms  
 End users who install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] are required to accept the Microsoft software license terms. By using the traditional [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installer, this occurs as part of the installation process. However, by using ClickOnce deployment, this cannot occur as part of the installation process, and it must therefore occur before the ClickOnce process is started.  
  
 If you decide to deploy the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] using ClickOnce, then it is your responsibility that end users accept the Microsoft software license terms before the installation. We recommend that you also require end user acceptance of your software license terms and any third-party software license terms that are part of the ClickOnce deployment.  
  
 To help you with this process, you can use the **NAVClientInstallation.html** template web page that was installed as part of the ClickOnce Installer Tools. When you try to open that file, you must select the **Accept** check boxes before you can install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You can design your own web page, as long as the process for the end user is the same. The end user cannot install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] until he has accepted the software license terms.  
  
### Upgrading to a New Version of the [!INCLUDE[navnow](includes/navnow_md.md)] Client  
 If you want to push a new version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] out to end users, you must do the following:  
  
-   Produce a new ApplicationFiles folder. Follow the process that you used to create the first version, but assign a larger version number to the application manifest. You can replace the old application files in *\\\\fileshare\\clickonce\\Deployment\\ApplicationFiles*, or you can put the new files in a new directory, such as *\\\\fileshare\\clickonce\\Deployment\\ApplicationFiles2*. Make sure to run `mage.exe -update` to update the application manifest's file list and hash values. Run `mage.exe -sign` to sign the application manifest.  
  
-   Run `mage.exe -update` to update the deployment manifest's reference to the application manifest as well as its hash value. Update the deployment manifest's version number. Run `mage.exe -sign` to sign the deployment manifest.  
  
 The upgrade check is based on the deployment manifest’s `version`. This is the version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that will be installed if a user installs [!INCLUDE[navnow](includes/navnow_md.md)] for the first time. The deployment manifest also contains a `minimumRequiredVersion`. If a previously installed [!INCLUDE[nav_windows](includes/nav_windows_md.md)] has a version that is less than `minimumRequiredVersion`, then the user is forced to upgrade the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. This will appear similar to the following.  
  
```  
<assemblyIdentity name="Microsoft Dynamics NAV" version="11.0.0.0" … />  
  <deployment install="true" minimumRequiredVersion="11.0.0.0">  
    <subscription>  
      <update>  
        <beforeApplicationStartup />  
      </update>  
    </subscription>  
```  
  
 The `<update>` tag determines when the upgrade check is performed. In the example earlier in this section, `beforeApplicationStartup`was specified, which means the upgrade check will be performed before the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] starts and the user will experience a short delay every time that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is started. If you want the upgrade check to be performed in the background every time that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is started, then use the following setting.  
  
```  
<update>  
        <expiration maximumAge="0" unit="days" />  
      </update>  
  
```  
  
 With this setting, the user will be able to run the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] without any delay. In the background, ClickOnce will check if the current version is too low. ClickOnce will enforce the upgrade the next time that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] starts. If you want to check for updates, such as every 14 days, then add `maximumAge=”14”`.  
  
 The application manifest version number can be changed independently of the deployment manifest version number. If you change the version number in the deployment manifest, but keep referring to the same version of the application manifest, then the user will experience that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is upgraded, but nothing will occur because the new version of the deployment manifest will still point to the same application version. For example, this can be useful if you want to change the frequency of the upgrade checks or change the text in the **Start** menu.  
  
###  <a name="Security"></a> Security Considerations  
 Installing any application on the local computer requires that you consider whether it is safe to do this. For a ClickOnce deployment of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], here are some recommended security measures that you should consider:  
  
-   **Internal deployment** - If you host the ClickOnce deployment on an internal file share or website, we recommend that you sign the ClickOnce deployment so that end users will not see an **Unknown publisher** message during installation. However, it is also acceptable not to sign the ClickOnce deployment.  
  
-   **Public deployment** - If you host the ClickOnce deployment in a public location, we recommend that you sign the ClickOnce deployment and host it on a secure website \(*https://*\). Taking these precautions will reduce the risk of end users installing applications from bad sources and locations.  
  
###  <a name="Limitations"></a> Limitations of ClickOnce Installed on the Microsoft Dynamics NAV Windows Client  
 The following are limitations of ClickOnce installed on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
 **Command-line arguments** - ClickOnce installed on the [!INCLUDE[navnow](includes/navnow_md.md)] client cannot be run with custom command-line arguments. For example, this affects the following scenarios:  
  
-   An end user cannot specify the Home page.  
  
-   An end user cannot specify a profile. He can only use his default profile.  
  
-   An end user cannot disable personalization. An administrator can disable personalization on a profile.  
  
-   An administrator cannot configure profiles. He should use the MSI-installed client for this task.  
  
-   An end user cannot run in full-screen mode.  
  
-   An end user cannot disable the navigation pane.  
  
 **Hyperlinks** - The protocol handler *dynamicsnav://* is not registered during ClickOnce installation, which means that the [!INCLUDE[navnow](includes/navnow_md.md)] client cannot be activated by choosing a hyperlink. This could impact the following scenarios:  
  
-   End users cannot send each other links to specific pages.  
  
-   An end user cannot use the link on a OneNote page.  
  
-   An end user cannot use the link on a report.  
  
-   The debugger cannot be started.  
  
 **External components calling the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]** - A ClickOnce-installed [!INCLUDE[nav_windows](includes/nav_windows_md.md)] will be installed in a randomly generated folder, and when it is upgraded to a new version, it will be installed a new randomly generated folder. This means that external components will not be able to detect where the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] executable is located. This could impact the following scenarios:  
  
-   An end user can send a list page to Excel, but cannot refresh data from the Excel application.  
  
-   Third-party applications cannot start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
## See Also  
 [Deployment](Deployment.md)   
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)   
 [Installation Options](Installation-Options.md)