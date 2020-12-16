---
title: "Linking to the Dynamics 365 [!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)]"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
ms.author: jswymer
---
# Linking to the Dynamics 365 Business Central App
The protocol handler for the [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] lets you construct a URL for starting the app on a device, such as a phone or tablet. You can then distribute this URL by e-mail or from a Web page to the users.  
  
The [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] URL is based on the *ms-businesscentral* URI scheme, which is registered automatically when the app is installed. Invoking a URL based on this scheme will start the app with the provided parameters.  
  
## Constructing the URL  
To construct a URL, start with *ms-businesscentral* scheme, and then add additional parameters as needed. Some parameters are required and others are optional. 

<!-- pointing to your [!INCLUDE[navnow](includes/navnow_md.md)] Web server.-->  
  
The structure of a [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] link is very similar to links for the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], and has the following syntax:  

<!-- 

```
ms-businesscentral://<hostname>[:<port>]
[/<instance>]/[?<parameter>=<value>[&<parameter>=<value>]]
```
-->

```
ms-businesscentral://[<hostname>][/<aadtenantid>][/sandbox]/[?<parameter>=<value>[&<parameter>=<value>]]
```

`[]` indicates an optional parameter; all other parameters are required.

`<>`indicate values that you must supply. Do not include the brackets in the address.

## Parameters
The following table describes the parameters for the main part of the URL, which are the parameters up to and including  <!--`[/<port>]/` `[/<instance>]/`--> `[/sandbox]/`.

|Parameter|Description| Example |
|---------|-----------|---------|
|hostname|Domain name for the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] solution or IP address of the computer/server that hosts it. This is required for an ISV Embed solution. For standard Business Central, you use `businesscentral.dynamics.com` or you can omit this parameter.| `ms-businesscentral://businesscentral.dynamics.com/`<br /><br />`ms-businesscentral:///`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/`| 
|aadtenantid|The unique identifier for an Azure Active Directory (AAD) tenant. The value can be formatted as a GUID or domain name. This is useful to those who work across multiple AAD organizations, such as delegated administrators, support personnel or external accountants, because it allows explicitly targeting an AAD tenant. If this is omitted, you will be directed to the primary AAD tenant or the same AAD tenant that you are currently signed in to.|`ms-businesscentral://businesscentral.mysolution.com/mysolutionaadtenant.onmicrosoft.com`|
|sandbox|Specifies that the URL should target the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] sandbox environment instead of a production environment.|`ms-businesscentral:/businesscentral.dynamics.com/sandbox/`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/sandbox/`|  


<!-- 
|hostname|The onprem computer name, domain name or IP address of the computer/server that hosts the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] solution.| `ms-businesscentral://businesscentral.mysolution.com`<br /><br />`ms-businesscentral://192.168.0.254/`| 
|port|The port number on which your [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] solution runs. If not provided, the standard SSL port \(443\) is used.| `ms-businesscentral://businesscentral.mysolution.com:80/`<br /><br />`ms-businesscentral://192.168.0.254:80/`  |
|instance|The <!-  [!INCLUDE[nav_web_server_instance_md](includes/dnav_web_server_instance_md.md)] instance [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] web server that you want to connect to.| `ms-businesscentral://businesscentral.mysolution.com:80/myserverinstance/`<br /><br />`ms-businesscentral://192.168.0.254:80/myserverinstance/`|
|Instance|The [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance that you want to connect to.| `dynamicsnav110`|

-->
The following table describes the optional parameters that are indicated by `[?<parameter>=<value>[&<parameter>=<value>]]` in the syntax. These parameters are referred to as the *query parameters*.

|Parameter|Description| Example |
|---------|-----------|---------|  
|page    |The ID of the page that you want to open directly.|`ms-businesscentral:///?page=21`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?page=21`|
|bookmark|    The bookmark of the record you want to open. The value of a bookmark is an alphanumeric string of characters, for example, `19%3bGwAAAAJ7BDEAMAAwADA%3d`.<br /><br /> For the page types Card, CardPart, and Document, the bookmark specifies the record that is shown in the page. For page types List, ListPart, and Worksheet, the bookmark specifies the record that is selected in the list on the page.<br /><br /> **Important:**  Bookmarks are generated automatically. You can only determine a value for the bookmark by displaying the page in the client and looking at its address. Therefore, a bookmark is only relevant when the address you are working with has been copied from another instance of the page.|`ms-businesscentral:///?bookmark=19%3bGwAAAAJ7BDEAMAAwADA%3d`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?bookmark=19%3bGwAAAAJ7BDEAMAAwADA%3d`|
|filter    |The filter you want to apply to the page.<br /><br />The filter parameter enables you to display only records from the underlying table of the page that have specific values for one or more fields.    For more information about filters, see [Filtering Data on the Page](devenv-web-client-urls.md#Filtering).|`ms-businesscentral:///?page9305&filter='No.'%20IS%20'1001'`<br /><br />`ms-businesscentral:///?page9305&filter='Sell-to-Customer-No.'%20IS%20'10000'%20AND%20'Location-Code'%20IS%20'BLUE'`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?page9305&filter='No.'%20IS%20'1001'`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?page9305&filter='Sell-to-Customer-No.'%20IS%20'10000'%20AND%20'Location-Code'%20IS%20'BLUE'`|
|profile|Specifies the ID of the profile to open, such as `accountant` or `order processor`.<br /><br />Be aware that it is possible for two or more profiles have the same ID. Profiles can have a scope of either system or tenant. In addition, tenant profiles can be either user-defined (added by using the **Profiles** page in the client) or extension-based (added by an extension). Among these different types, the IDs of some profiles might be the same. When there is more than one profile with the same ID as the one you provide, the process for launching the profile is as follows:<ol><li>If there is a matching system profile, it is used.</li><li>If there is a matching user-defined tenant profile, it is used.</li><li>If there is only one matching extension-based profile, it is used.</li><li>If there are two or more extensions-based profiles with the same ID, then the error message `More than one profile has the ID '<ID>' within the Tenant scope.` appears. In this case, you cannot use the `profile` parameter for this profile.</li></ol> |`ms-businesscentral:///?profile=BUSINESS%20%MANAGER`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?profile=BUSINESS%20%MANAGER`|
|`customize`|Opens the profile for customization, enabling you to change the layout of pages as seen by users of the profile. If you omit the `profile`, then the default profile opens. For more information, see [Customizing the Workspace for Profiles (Roles)](https://docs.microsoft.com/dynamics365/business-central/ui-personalization-manage)  in the [!INCLUDE[prod_short](includes/prod_short.md)] Application Help.|
|company|The company that you want to open in the client. If not provided, the default company is used. CRONUS%20International%20Ltd.|`ms-businesscentral:///?'company=CRONUS%20International%20Ltd.'`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?'company=CRONUS%20International%20Ltd.'`|
|mode|Whether the page opens in view, edit, or create mode. `view` only lets you see the data on the page, not modify data. `edit` lets you to modify data on the page. `create` lets you to modify data on the page and add new entities. |`ms-businesscentral:///?page=21&mode=create`<br /><br />`ms-businesscentral://businesscentral.mysolution.com/?page=21&mode=create`|


<!-- 
|tenant    |The ID of the tenant that you want to connect to. If not provided, the default tenant is used.|`ms-businesscentral:///?tenant=mytenant2-1`|
-->

The query parameters can be in any order. However, the first parameter must be preceded by the `?` symbol, and any additional parameters must be preceded by the `&` symbol.

<!-- 
> [!NOTE]  
> It is not possible to specify which client/device type to open up the URL in; the last used client will open up when clicking the URL.
-->

<!-- add for onprem
The URL `ms-businesscentral:///?page=21` or `ms-dynamicsnav:///?page=21` will open the server that you last connected to on the specified page.  -->


<!-- Add this as note in onprem
 
[!IMPORTANT]  
The *ms-businesscentral or ms-dynamicsnav * scheme only translates to a secure server connection. Therefore the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] must be exposed through an https connection. For more information, see [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client]. 
-->

<!--   
## Adding a user name to the URL  
 The *ms-businesscentral* scheme also supports sending the user name in the URL for pre-filling the user name. The password must be entered by the user. To send the user name, you must URL encode the value and prefix the server address by using *\<encoded username>@*. Examples are as follows:  

-   *ms-businesscentral://demouser%40mycompany.com@myserver/myinstance/*  
  
-   *ms-businesscentral://user1:@myserver/myinstance/*
  
*ms-businesscentral://demouser%40businesscentral.dynamics.com

*ms-businesscentral://demouser%40businesscentral.mysolution.com@myserver/myinstance/* 

*ms-businesscentral://user1:@myserver/myinstance/*  
  


-   *ms-dynamicsnav://demouser%40mycompany.com@myserver/myinstance/*  
  
-   *ms-dynamicsnav://user1:@myserver/myinstance/*  

  
> [!IMPORTANT]  
>  We recommend that you do not share a user name in the URL. This technique should only be used in demonstration scenarios and other instances where the accidental sharing of a URL will not compromise the system.  

-->
  
## See Also  
 [Web Client URL](devenv-web-client-urls.md)    
[Introducing the Business Central Mobile App](devenv-introducing-business-central-mobile-app.md) 