---
title: "Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
author: jswymer
---
# Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint
**Applies to:** [!INCLUDE[navcrete_md](includes/navcrete_md.md)], [!INCLUDE[navcorfu_md](includes/navcorfu_md.md)], [!INCLUDE[nav2017](includes/nav2017.md)]

If you set up a SharePoint site using SharePoint Online or SharePoint on-premises, you can embed [!INCLUDE[navnow](includes/navnow_md.md)] in an app on the site. You can create an app that opens [!INCLUDE[nav_web](includes/nav_web_md.md)] in a new browser tab, and you can display [!INCLUDE[navnow](includes/navnow_md.md)] data in hosted app parts in the SharePoint site. Building and deploying apps for SharePoint requires that you create the app in Visual Studio and add it to the SharePoint site. After you have built your app, you can make it available to other sites, such as subsites in your site collection. For example, if you provide financial services to several customers, you can set up a site collection with a subsite for each subscriber. You can then create and deploy an app for SharePoint that displays each subscriber’s [!INCLUDE[navnow](includes/navnow_md.md)] data in their SharePoint site. You can create an app for SharePoint that will display different pages in [!INCLUDE[nav_web](includes/nav_web_md.md)] as hosted app parts.  

This topic describes the overall configuration of an app for SharePoint that uses [!INCLUDE[navnow](includes/navnow_md.md)] data with examples of what you are likely to have to do.  

## Getting Started  
If you already have a site available on SharePoint Online, you can deploy your first app to that. Alternatively, sign up for a free trial Office 365 plan. We recommend that you use a plan such as Office 365 Enterprise E1 as your test site, or that you sign up for a trial developer plan. A trial plan includes an administrative account which you will use to set up the app in the SharePoint site. For example, if your Office 365 site is *Solutions.onmicrosoft.com*, your administrative account can be *admin@solutions.onmicrosoft.com*. For more information, see [Select an Office 365 plan for business](http://go.microsoft.com/fwlink/?LinkId=309050).  

If you want to use your app in a SharePoint on-premises deployment, you must choose a solution that meets your requirements. For example, the App Catalog is not available in all SharePoint 2013 on-premises solutions.  

You will also need tools to create the actual app. We recommend that you use Visual Studio 2012 or later that also includes the Microsoft Office Developer Tools. Although you to write some code to create the app, Visual Studio includes project templates for creating apps for SharePoint, which makes it less complex. For more information, see [Microsoft Office Developer Tools for Visual Studio](http://go.microsoft.com/fwlink/?LinkId=309049) online.  

## Registering the App in SharePoint  
Before you can install the app on a SharePoint site, the app must be registered in SharePoint. Registering an app generates an app identity, which includes the following information: client ID, display name of the app, app domain where the app is hosted, and in some cases, a redirect URI associated with the app. You will use some of the app identity information when you create the app.  

There are five ways that you can register an app. The way that you choose to register your app depends on your scenario and environment. For more information, see [Guidelines for registering apps for SharePoint 2013](http://go.microsoft.com/fwlink/?LinkID=301252) in the MSDN Library.  

For example, with the deployment scenario that is discussed in this guide, you will only install your apps on your own SharePoint sites. Therefore, you can manually register the app by using appregnew.aspx. To do this, you must access the appregnew.aspx page for your subscription, as described in the following procedure.  

#### To register an app using the appregnew.aspx  

1.  Go to the appregnew.aspx page for your subscription, such as `https://MyTenant.sharhepoint.com/_layouts/15/appregnew.aspx`, where `https://MyTenant.sharhepoint.com` is the URL of your SharePoint site.  

2.  Fill out the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**App Id**|A GUID, such as *2de23703-bbb9-4542-970d-84b6e5597f53*. This is also referred to as the client ID.<br /><br /> This is generated when you choose the **Generate** button.|  
    |**App Secret**|A base-64 encoded string, such as *xvVpG0AgVIJfch6ldu4dLUlcZyysmGqBRbpFDu6AfJw=*. This is also referred to as the client secret.<br /><br /> This is generated when you choose the **Generate** button.|  
    |**Title**|The name of the app, which will be shown to users of your site, such as **Financial App by Solutions**.|  
    |**App Domain**|The host name for your [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], such as *www.solutions.com*. If you have deployed the [!INCLUDE[nav_web](includes/nav_web_md.md)] on a local machine, you can also enter the machine name.|  
    |**Redirect URI**|The URI for signing in to your [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], such as **https://www.solutions.com/DynamicsNAV** or **https://MyComputer/DynamicsNAV**.|  

3.  Choose the **Create** button to register the app.  

## Developing the App in Visual Studio  
With Visual Studio and the Microsoft Office Developer Tools, you can create an app for SharePoint. This topic provides the general instructions for creating a provider-hosted app. For more information, see [How to: Create a basic provider-hosted app](http://go.microsoft.com/fwlink/?LinkId=308938) and [Build apps for SharePoint](http://go.microsoft.com/fwlink/?LinkId=308937) in the MSDN Library.  

### Create the App in Visual Studio  
You create an app for SharePoint using the **App for SharePoint** project template in Visual Studio. The app that you create must be a provider-hosted app for SharePoint.  

##### To create a provider-hosted app in Visual Studio  

1.  In Visual Studio, create a new C# project that uses the **App for SharePoint 2013** project template.  

2.  When you create the project, specify the name and location of the SharePoint site as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**What is the name of your app for SharePoint?**|Specify a name, such as **NAVSharePointApp**.<br /><br /> The name that you specify here is not the name that displays to users of the SharePoint site.|  
    |**What SharePoint site do you want to use for debugging your app?**|Specify the developer site that is part of your Office 365 plan. For example, if your Office 365 plan is *Solutions.onmicrosoft.com*, your developer site can be *Solution.sharepoint.com*. **Note:**  This must be a developer site in order for Visual Studio’s F5 deployment to work. F5 depends on the side-loading feature in SharePoint, which is only available on developer sites.|  
    |**How do you want to host your app for SharePoint?**|Choose **Provider-Hosted**.|  

3.  When you are done, a new solution is created in Visual Studio, which you can see in **Solution Explorer.** The solution contains two projects: a SharePoint App project called *\<project name>* and an ASP .NET Web project called *\<project name>*Web, where *\<project name>* is the project name that you specified when you created the project.  

    1.  The SharePoint App project will be used to generate the app package that you will upload to SharePoint. The project contains the following files:  

        -   AppIcon.png  

             You can replace this file to use an image that is more relevant for your app.  

        -   AppManifest.xml  

             The app manifest describes the app.  

    2.  The ASP .NET Web project will not be used because it is not required to build an app that uses [!INCLUDE[navnow](includes/navnow_md.md)] data. Therefore, you can delete this project.  

### Modify the App Manifest  
After you create the app, you modify settings in the app manifest for the app, which includes setting the app ID and start page URL. The start page URL specifies the URL of the Microsoft Dynamics NAV Web client but it is also used in multitenant [!INCLUDE[nav_server](includes/nav_server_md.md)] deployments to specify whether the app can be used by a specific tenant only or by all tenants that are mounted against a Microsoft Dynamics NAV Server instance.  

##### To modify the appmanifest.xml  

1.  In Visual Studio, open the AppManifext.xml file to view the code.  

2.  To set up the app, set the `StartPage` element and `RemoteWebApplication` element as described in the following table.  

    |Element|Description|  
    |-------------|-----------------|  
    |`StartPage`|Set this element to the URL of the [!INCLUDE[nav_web](includes/nav_web_md.md)] and append the URL with the *{StandardTokens}* parameter. For example, if the URL of the [!INCLUDE[nav_web](includes/nav_web_md.md)] is *https://www.solutions.com/DynamicsNAV/WebClient*, then set the element to *https://www.solutions.com/DynamicsNAV/WebClient/?{StandardTokens}*.<br /><br /> If the [!INCLUDE[nav_web](includes/nav_web_md.md)] is deployed in a multitenant environment, then include the *tenant* parameter in the URL to specify which tenants the app applies to. You can configure that app to apply to a specific tenant or all tenants as follows:<br /><br /> -   To apply the app to a specific tenant only, set the *tenant* parameter to the ID of the tenant, such as *https://www.solutions.com/DynamicsNAV/WebClient/?tenant=tenant1*. In this example, the tenant ID is *tenant1*. The value of the tenant parameter must be included in tenant's list of alternative IDs.<br />     Alternatively, if you have configured the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] to accept host names, you can specify the host name in the URL. For more information, see [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md).<br />-   To apply the app to all tenants, set the tenant parameter to *{HostUrl}*, such as *https://www.solutions.com/DynamicsNAV/WebClient/?tenant={HostUrl}* .<br />     When the app accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)], *HostUrl* is automatically replaced by the SharePoint site address where the app is installed. Because the SharePoint site is tenant-specific, this parameter identifies the tenant.<br />     You must include all SharePoint site addresses that can access a tenant in the tenant's list of alternative IDs. **Note:**  For more information about how to set alternate IDs for tenants, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md).|  
    |`RemoteWebApplication`|Set the value of the *ClientId* parameter to App ID that was assigned when you registered the app.|  

     The following code example illustrates the content of an AppManifest.xml file:  

    ```  
    <?xml version="1.0" encoding="utf-8" ?>  
    <App xmlns="http://schemas.microsoft.com/sharepoint/2012/app/manifest"  
         Name="NAVSharePointApp"  
         ProductID="{335df4e8-93b1-4205-8504-001aa934b01e}"  
         Version="1.0.0.0"  
         SharePointMinVersion="15.0.0.0"  
    >  
      <Properties>  
        <Title>Financial App by Solutions</Title>  
        <StartPage>https://www.solutions.com/DynamicsNAV/WebClient/?{StandardTokens}</StartPage>  
      </Properties>  

      <AppPrincipal>  
        <RemoteWebApplication ClientId="2de23703-bbb9-4542-970d-84b6e5597f53"/>  
      </AppPrincipal>  
    </App>  
    ```  

     We recommend that you do not set up permissions that your app for SharePoint will request from the user at installation time.  

### Adding Web Parts to the App  
Optionally, you can add client web parts to the project and configure them to show specific [!INCLUDE[navnow](includes/navnow_md.md)] pages in [!INCLUDE[nav_web](includes/nav_web_md.md)]. This means that the [!INCLUDE[navnow](includes/navnow_md.md)] pages will display inside the SharePoint pages. When you create a client web part, you can specify URLs that display a page without displaying the ribbon or UI parts. As a result, the page will appear to be just another app part on the SharePoint site, but it is the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md)  

To add web parts to the app, add an item of type **Client Web Part \(Host Web\)** to the project in Visual Studio. Specify that it must use an existing web page, and then specify use a URL such as **https://www.solutions.com/DynamicsNAV/WebClient/default.aspx?mode=View&isembedded=1&page=9301&shownavigation=0&showribbon=0&showuiparts=0&pagesize=7&SPHostUrl={HostUrl}**.  

You can choose to convert the query parameters of the URL into properties on the web part, which will enable you to configure the same web part differently when inserting it on different SharePoint pages. To do this, you modify the Elements.xml file for the web part. In the Elements.xml file, the `Src` attribute of the `Content` element specifies the URL of the page of the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For each parameter of the URL that you want to make a property, replace its value with a property name that has the format `_PropertyName_`, and then add a corresponding `Property` element in the `Properties` element. For example, the following code illustrates the content of the Elements.xml file for a web part for page 9301 of the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

```  
<?xml version="1.0" encoding="utf-8"?>  
<Elements xmlns="http://schemas.microsoft.com/sharepoint/">  
  <ClientWebPart Name="ListPart" Title="Microsoft Dynamics NAV List Part" Description="List from Microsoft Dynamics NAV" DefaultWidth="800" DefaultHeight="300" >  

    <Content Type="html" Src="https://www.solutions.com/DynamicsNAV/WebClient/default.aspx?mode=View&isembedded=1&page=9301&shownavigation=0&showribbon=0&showuiparts=0&pagesize=7&SPHostUrl={HostUrl}" />  

    <Properties>  
    </Properties>  
  </ClientWebPart>  
</Elements>  
```  

The following code illustrates how to change the Elements.xml file to include properties for the `page` and `pagesize` parameters.  

```  
<?xml version="1.0" encoding="utf-8"?>  
<Elements xmlns="http://schemas.microsoft.com/sharepoint/">  
  <ClientWebPart Name="ListPart" Title="Microsoft Dynamics NAV List Part" Description="List from Microsoft Dynamics NAV" DefaultWidth="800" DefaultHeight="300" >  

    <Content Type="html" Src="https://www.solutions.com/DynamicsNAV/WebClient/default.aspx?mode=View&isembedded=1&page=_PageId_&shownavigation=0&&pagesize=_PageSize_&SPHostUrl={HostUrl}" />  

    <Properties>  
        <Property  
               Name="PageId"  
               Type="int"  
               RequiresDesignerPermission="true"  
               DefaultValue="9301"  
               WebCategory="Microsoft Dynamics NAV"  
               WebDisplayName="Page number.">  
        </Property>  
        <Property  
               Name="PageSize"  
               Type="int"  
               RequiresDesignerPermission="true"  
               DefaultValue="7"  
               WebCategory="Microsoft Dynamics NAV"  
               WebDisplayName="Number of rows to show.">  
        </Property>  
    </Properties>  
  </ClientWebPart>  
</Elements>  

```  

## Installing the App on your SharePoint Site  
When you have created app in Visual Studio, you can press F5, and Visual Studio will deploy the app to SharePoint and install it on the SharePoint site that you chose for the project.  

> [!IMPORTANT]  
>  In this scenario, you must use a developer subscription of SharePoint Online. Visual Studio makes use of the SharePoint side-loading feature for uploading and installing the app, and this feature is only available in developer subscriptions.  

You must sign in to \<site name>.sharepoint.com as the administrator for the site. For example, the URL for the team site for an Office 365 developer site is https://*\<site name>*.sharepoint.com/\_layouts/15/start.aspx\#/SitePages/DevHome.aspx. The .app file that was built by Visual Studio is added to the Apps in Testing section. When you choose the app, you are directed to the [!INCLUDE[nav_web](includes/nav_web_md.md)], and you are signed in automatically.  

### Adding an App from the App Catalog  
You can also choose to only publish the project in Visual Studio. Then, you must manually deploy the app file that Visual Studio builds to SharePoint’s App Catalog. From the app catalog, the app can be added to any site that is part of your SharePoint organization.  

If the SharePoint site has subsites, you can deploy the app to the subsites, or you can let users add the app manually, provided they have permission to add apps to their site. If you upload the [!INCLUDE[navnow](includes/navnow_md.md)] app to the App Catalog, it is automatically available for users to install when they browse apps under **From Your Organization**. When the app has been installed, users can choose the app and be directed to the [!INCLUDE[nav_web](includes/nav_web_md.md)] where they are signed in automatically.  

If you want to preconfigure your users’ sites, you can deploy the app to one or more site templates. For more information, see the **Deploy a custom app** section in [Use the App Catalog to make custom business apps available for the SharePoint Online environment](http://go.microsoft.com/fwlink/?LinkId=309795) in the SharePoint Online admin center.  

In both cases, you can provide the users with SharePoint sites that give them access to view and modify [!INCLUDE[navnow](includes/navnow_md.md)] data and any other information that you want them to have access to. You can choose to combine this with the document library functionality in SharePoint so that documents that are exported from [!INCLUDE[navnow](includes/navnow_md.md)] are stored on the SharePoint site. <!-- For more information about storing documents to SharePoint, see [Integrating with Office 365 and SharePoint Online](Integrating-with-Office-365-and-SharePoint-Online.md).-->  

## See Also  
 [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)   
 [Integrating Microsoft Dynamics NAV in SharePoint Sites](Integrating-Microsoft-Dynamics-NAV-in-SharePoint-Sites.md)   
 [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)   
 [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md)   
 [Troubleshooting: Microsoft Dynamics NAV and SharePoint](Troubleshooting--Microsoft-Dynamics-NAV-and-SharePoint.md)   
 [Select an Office 365 plan for business](http://go.microsoft.com/fwlink/?LinkId=309050)   
 [How to: Create a basic provider-hosted app](http://go.microsoft.com/fwlink/?LinkId=308938)   
 [Use the App Catalog to make custom business apps available for your SharePoint Online environment](http://go.microsoft.com/fwlink/?LinkId=309795)
