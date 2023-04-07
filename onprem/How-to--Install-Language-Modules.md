---
title: "How to: Install Language Modules"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0207827c-4269-4a71-8a1b-e08bd2925cd6
caps.latest.revision: 29
---
# How to: Install Language Modules
To install language modules in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you must first download the language module from [Language Modules for Microsoft Dynamics NAV 2016](https://go.microsoft.com/fwlink/?LinkID=784928) \(requires PartnerSource login\), and then you install the following different components separately:  
  
-   [Server Component](How-to--Install-Language-Modules.md#Server)  
  
-   [Microsoft Dynamics NAV Windows Client Component](How-to--Install-Language-Modules.md#RoleTailored)  
  
-   [Microsoft Dynamics NAV Web Client Component](How-to--Install-Language-Modules.md#WebClient)  
  
-   [Microsoft Office Outlook Component](How-to--Install-Language-Modules.md#Outlook) \(optional\)  
  
-   [Database Component](How-to--Install-Language-Modules.md#Database)  
  
-   [Profiles](How-to--Install-Language-Modules.md#Profiles)  
  
 After you install a language module, you may need to translate additional strings for customized objects in the application.  
  
> [!IMPORTANT]  
>  For mixed language modules to work on your computer, you must install the language pack that corresponds to your regional settings.  
  
 For more information, see the following topics:  
  
-   [How to: Add Translated Strings By Using the Multilanguage Editor](How-to--Add-Translated-Strings-By-Using-the-Multilanguage-Editor.md)  
  
-   [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md)  
  
##  <a name="Server"></a> Server Component  
  
#### To install the server component of a language module  
  
1.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], navigate to the location where you downloaded the language module.  
  
2.  Run the .exe file to unzip the language module files.  
  
3.  In the Server folder, run Server.Local.\<*country/region code*>.\<*language code*>.msi.  
  
4.  In Control Panel, choose **Administrative Tools**, and then choose **Services** to open the Services snap-in.  
  
5.  In the list of services, right-click **Microsoft Dynamics NAV Server**, and then choose **Restart**.  
  
##  <a name="RoleTailored"></a> Microsoft Dynamics NAV Windows Client Component  
  
#### To install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] component of a language module  
  
1.  Confirm that you have installed the server component of the language module before you install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] component.  
  
2.  On the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], navigate to the location where you downloaded the language module.  
  
3.  In the RoleTailoredClient folder, run RoleTailoredClient.Local.\<*country/region code*>.\<*language code*>.msi.  
  
4.  \(optional\) To import a localized chart for a Role Center, do the following:  
  
    1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] client, open Object Designer.  
  
    2.  On the **File** menu, choose **Import**.  
  
    3.  In the **Import Objects** window, browse to the location where you downloaded the language module, navigate to the RoleTailored Client folder, and then navigate to the Charts folder.  
  
    4.  Select the chart that you want to add to a Role Center, and then choose **Open**.  
  
        > [!NOTE]  
        >  By default, this will overwrite an existing chart page with the same ID.  
  
    5.  Personalize a Role Center to use the chart part.  
  
##  <a name="WebClient"></a> Microsoft Dynamics NAV Web Client Component  
  
#### To install the [!INCLUDE[nav_web](includes/nav_web_md.md)] component of a language module  
  
1.  Confirm that you have installed the server component of the language module before you install the [!INCLUDE[nav_web](includes/nav_web_md.md)] component.  
  
2.  On the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], navigate to the location where you downloaded the language module.  
  
3.  In the WebClient folder, run WebClient.Local.\<*country/region code*>.\<*language code*>.msi.  
  
##  <a name="Outlook"></a> Microsoft Office Outlook Component  
  
#### To install the Microsoft Office Outlook component of a language module  
  
1.  On the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], navigate to the location where you downloaded the language module.  
  
2.  In the OutlookAddIn folder, run OutlookAddIn.Local.\<*country/region code*>.\<*language code*>.msi.  
  
##  <a name="Database"></a> Database Component  
  
#### To install the database component of a language module  
  
1.  Verify that the license that you are using allows you to compile objects.  
  
2.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] client, open Object Designer and verify that all objects are compiled.  
  
3.  In Object Designer, choose **All**.  
  
4.  On the **Edit** menu, choose **Select All**.  
  
5.  If you have Microsoft Office 2010 installed, then compile all objects.  
  
    -   On the **Tools** menu, choose **Compile**, and then choose the **Yes** button.  
  
        > [!NOTE]  
        >  If you do not compile objects before you import the language module, you will receive the “Could not load the selected type library” error when you import a language module in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. The error occurs because several objects have a reference to Microsoft Office 2013 components, and these are not present when you have Microsoft Office 2010 installed.  
  
6.  On the **Tools** menu, point to **Language Module**, and then choose **Import**.  
  
7.  In the **Language Module Import** window, browse to the location where you downloaded the language module, navigate to the Database folder, select the .flm file, and then choose **Open**.  
  
8.  With all objects selected, on the **Tools** menu, choose **Compile**.  
  
##  <a name="Profiles"></a> Profiles  
  
#### To import profiles  
  
1.  On the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the **Search** box, enter **Profiles**, and then choose the related link.  
  
2.  Select all profiles, and then choose the **Import Translated Profile Resources From Folder** button.  
  
3.  In the **Browse For Folder** dialog, navigate to the location where you downloaded the language module, select the **Language Module** folder, unzip this folder, then select the **RoleTailoredClient** folder, and then **Profiles**.  
  
4.  Choose the **OK** button to import the translated profiles.  
  
## See Also  
 [Language Modules](Language-Modules.md)   
