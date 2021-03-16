---
title: "Web Client URL"
description: Learn about the URL for opening the Web client. 
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Web Client URL

There are several parameters that you can add to the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] URL to manipulate what is displayed in the client. For example, you can open a specific company, target a specific page, report, or table. The following URL displays page **9305 Sales Order List** for the [!INCLUDE[demoname](includes/demoname_md.md)] company:

```
https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&page=9305  
```

The following URL opens report **5 Receivables – Payables** for the same company:

```
https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&report=5
```  

This article describes how you can construct URLs. A well-constructed URL can be useful for including in other sources, such as emails or Word documents, or sending as hyperlinks to other users.

> [!IMPORTANT]  
> Certain data in the URL, such as filters, could be considered sensitive information. Use discretion if you distribute URLs that contain filters, or if it's possible, exclude this information from the address.  


##  <a name="Syntax"></a> URL Syntax

The [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] URL has the following syntax:

```
https://<hostname>[/<aadtenantid>][/<environmentname>]/?[company=<companyname>]&[page|query|report|table=<ID>]&[tenant=<tenantID>]&[mode=<View|Edit|Create>]&[profile=<profileID>]&[customize]&[bookmark=<bookmark>]&[captionhelpdisabled=<0|1>]&[showribbon=<0|1>]&[shownavigation=<0|1>]&[showuiparts=<0|1>]&[showheader=<0|1>]&[isembedded=1]&[pagesize=<number of lines>]&[redirect<0|1>]&[extension=<extensionID>]
```

<!-- onprem
```
https://<hostname>[/<aad>][/sandbox]/?[company=<companyname>]&[page|report|table=<ID>]&[tenant=<tenantID>]&[mode=<View|Edit|Create>]&[profile=<profileID>]&[bookmark=<bookmark>]&[captionhelpdisabled=<0|1>]&[showribbon=<0|1>]&[shownavigation=<0|1>]&[showuiparts=<0|1>]&[redirect<0|1>]
```
-->

The URL consists of two parts; the hostname part and the query string. The hostname part includes the protocol (https) and the hostname. The query string part includes everything after `<hostname>`. The query string determines what content to target.

### Syntax Key

The following table describes the notation that is used to indicate the syntax.

|Notation|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|--------------|---------------------------------------|
|Text without brackets|Parameters that you must type as shown.|
|`<>`|A placeholder for values that you must supply. Don't include the brackets in the address.|
|`[]`|Optional parameters. Don't include the brackets in the address.|
|`|`|A set of values from which to choose. Use one of the options and don't include `|` in the address.|

<!-- &#124; -->

###  <a name="Building"></a> Building the URL
Use the following guidelines to write URL syntax and create a URL:

- You can place parameters in any order after `/?`. For example, the following URLs will yield the same results.

    ```
    https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&page=9305&mode=View
    ```

    ```
    https://businesscentral.dynamics.com/?page=9305&mode=View&company=CRONUS%20International%20Ltd.
    ```

-   Separate parameters after `/?` with the ampersand symbol (`&`).

-   Use `%20` for any spaces in values, or similar escape sequences for other characters that can't be used in URLs.

-   Enclose values in single quotation marks (`''`) if they're unescaped.

##  <a name="Paramters"></a> URL Parameters

The following table describes the parameters of the URL for displaying a page.

|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|---------------|---------------------------------------|
|`https`|Specifies the Internet protocol to use. Only `https` is supported.|
|`hostname`|Specifies the hostname for [!INCLUDE[d365fin_md](includes/d365fin_md.md)], for example, `businesscentral.dynamics.com`. |
|`<aadtenantid>`|Specifies the unique identifier for an Azure Active Directory (AAD) tenant. The value can be formatted as a GUID or domain name. It's useful to people who work across multiple AAD organizations, such as delegated administrators, support personnel, or external accountants. It allows explicitly targeting an AAD tenant. If this parameter is omitted, you'll be directed to the primary AAD tenant or the same AAD tenant that you're currently signed in to.|
|`<environmentname>`|(online only) Specifies the display name of sandbox or production environment to target.|
|`company`|The name of the company in [!INCLUDE[d365fin_md](includes/d365fin_md.md)] that you want to target.<br /><br /> If you only have one company, then you can omit this parameter.|
|`page`|Opens a page object.|
|`query`|Opens a query object. **Note:** The [TopNumberOfRows property](properties\devenv-topnumberofrows-property.md) is ignored when the query opens in the browser.|
|`report`|Opens a report object.|
|`table`|Opens a table object. Opening a table requires special permissions. For more information about opening a table, see [Viewing Table Data](devenv-view-table-data.md).|
|`ID`|The ID of the page, report, or table to open. |
|`tenant`|(on-premises only) Specifies the ID of the tenant to connect to. Use this parameter when [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] is deployed in multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance that the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md).|
|`mode`|Specifies the mode in which to display the page when it opens. Once the page opens, you can switch modes as usual, unless restricted by the page itself. <br /><br />- `View`<br /> The page can only be viewed. The user can't change data on the page. **Note:** Worksheet page types only display in the edit mode, even if the value is set to `View`.<br /><br />- `Edit`<br /> The user can change data on the page. **Note:** To use the edit mode, the [Editable Property](properties/devenv-editable-property.md) of the page in Page Designer must be set to **Yes**. This mode isn't supported for pages of the type List, RoleCenter, and CardPart. If you set the value to `Edit`, pages of these types still display in the view mode. For List type pages, the user can modify the list by choosing **Edit List** on the page.<br /><br />-  `Create`<br />Opens a blank page that enables the user to create a new item.<br /><br />**Note:** The `Create` mode isn't supported for pages of the type CardPart, List, ListPart, RoleCenter, and Worksheet. For pages of the type CardPart, List, and ListPart, the page displays in the view mode. Don't use this mode for Worksheet pages; otherwise you'll get an error when you try to open the page.|
|`profile`|Specifies the ID of the profile to open, such as `accountant` or `order processor`.<br /><br />It's possible for two or more profiles have the same ID. Profiles can have a scope of either system or tenant. Also, tenant profiles can be either user-defined (added by using the **Profiles** page in the client) or extension-based (added by an extension). Among these different types, the IDs of some profiles might be the same. If there's more than one profile with the same ID as you provide, the profile is selected as follows:<ol><li>If there's a matching system profile, it's used.</li><li>If there's a matching user-defined tenant profile, it's used.</li><li>If there's only one matching extension-based profile, it's used.</li><li>If there are two or more extensions-based profiles with the same ID, then the error message `More than one profile has the ID '<ID>' within the Tenant scope.` appears. In this case, you can't use the `profile` parameter for this profile.</li></ol> |
|`customize`|Opens the profile for customization, enabling you to change the layout of pages as seen by users of the profile. If you omit the `profile`, then the default profile opens. For more information, see [Customizing the Workspace for Profiles (Roles)](/dynamics365/business-central/ui-personalization-manage)  in the [!INCLUDE[prod_short](includes/prod_short.md)] Application Help.|
|`bookmark`|Specifies a record in the underlying table of the page. The value of a bookmark is an alphanumeric string of characters, for example, `27%3bEgAAAAJ7CDAAMQA5ADAANQA4ADkAMw%3d%3`.<br /><br /> For the page types Card, CardPart, and Document, the bookmark specifies the record that is shown in the page. For page types List, ListPart, and Worksheet, the bookmark specifies the record that is selected in the list on the page.<br /><br /> **Important:**  Bookmarks are generated automatically. You can only determine a value for the bookmark by displaying the page in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] and looking at its address. So, a bookmark is only relevant when the address you're working with was copied from another page instance.|
|`captionhelpdisabled`|Specifies that the ability to look up Help by selecting a field caption is disabled.<br /><br />If you want the Help look up from the field captions, either omit this parameter or set its value to `0`, such as `captionhelpdisabled=0`. <br /><br />If you don't want the Help lookup from field captions, set the value to `1`, such as `captionhelpdisabled=1`.<br /><br /> **Note:** For this parameter to take effect, add it at the first request when the user signs in. Adding the parameter on an existing session has no effect.|
|`showribbon`|Specifies whether to show the action bar on pages when they open. To show the action bar, omit this parameter or use `showribbon=1`. To hide the action bar, use `showribbon=0`.<br /><br />When you hide the action bar, it will remain hidden as you move to different pages, until you refresh or reload the browser or use `showribbon=1` in the URL. Once you move to another page, the parameter is no longer shown in the URL, even though it's still in effect.|
|`shownavigation`|Specifies whether to show the navigation bar when the specified page opens. To show the navigation bar, omit this parameter or use `shownavigation=1`. To hide the navigation bar, use `shownavigation=0`.<br /><br />When you hide the navigation bar, it will remain hidden as you move to different pages, until you refresh or reload the browser or set `shownavigation=1` in the URL. Once you move to another page, the parameter is no longer shown in the URL, even though it's still in effect.|
|`showuiparts`|Specifies whether to show UI parts when the specified page opens. To show parts, omit this parameter or use `showuiparts=1`. To hide parts, use `showuiparts=0`. <br /><br />This parameter only affects parts that are shown in FactBoxes. Once you move to another page, the parameter is cleared.|
|`showheader`|Specifies whether to show the **Dynamics 365 Business Central** header and its functionality. To show the header, omit this parameter or use `showheader=1`. To hide the header, use `showheader=0`. <br /><br >The header is the bar at the top of pages. It gives access to the general functionality like **Tell Me**, **Notifications**, **My Settings**, and more. When the header is hidden, functionality that has a keyboard shortcut, like **Tell Me**, is still accessible by the shortcut. The parameter is preserved when you move to other pages and if you refresh or reload the browser. <br /><br >**Note:** Introduced in Business Central 2020 release wave 1, update 16.2.|
|`isembedded`|Specifies to open the [!INCLUDE[nav_web](includes/nav_web_md.md)] in the embedded mode. To set the embedded mode, use `isembedded=1`. <br /><br /> This parameter is intended for use when [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in another web application, like SharePoint. The embedded mode hides the **Dynamics 365 Business Central** header and adjusts how navigation works to suit the web application. For more information, see [Embedding Business Central Web Client in Other Websites](devenv-embed-web-client-pages-in-websites.md).|  
|`pagesize`|Specifies the number of lines to display in a list. For example, `pagesize=10` specifies that 10 lines will be displayed. The default value, if the parameter isn't specified, is `20`<br /><br /> The parameter applies only to pages that contain a `repeater` control.  It's intended for use when [!INCLUDE[nav_web](includes/nav_web_md.md)] is embedded in another web application, like SharePoint. For more information, see [Embedding Business Central Web Client in Other Websites](devenv-embed-web-client-pages-in-websites.md).|  
|`redirect`|Specifies whether users are presented with an option to download the [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] when they open the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] in a mobile browser to improve the user experience.<br /><br />If you don't want to give users this option, set the value to `0`, such as `redirect=0`.<br /><br />|
|`extension`|Specifies the unique identifier (ID) of an extension that is deployed on the environment. This parameter is typically used during the development of the specified extension in a non-production environment. When this parameter is set, only the specified extension is available in the client, and the client opens in Designer. All other extensions are ignored and not visible. This parameter enables you to isolate and focus on the behavior of the specified extension only.<br /><br />An extension ID is a 32-digit GUID, such as `72CC5E27-BD97-4271-AF55-F77E4471E493`. You set this parameter using the format `extension={GUID}`, for example:<br /><br />`&extension={72CC5E27-BD97-4271-AF55-F77E4471E493}`<br /><br />You can determine an extension ID by opening the extension in Visual Studio Code and looking in the app.json file. Or, you can run the [Get-NAVAppManifest cmdlet](/powershell/module/microsoft.dynamics.nav.apps.tools/Get-NAVAppManifest) on the extension package.|

<!--
|`tenant`|Specifies the ID of the tenant to connect to. You must provide this parameter when [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] is deployed in multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance that the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).|
-->

<!-- For more information about framing the Web client, see [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md).-->

## <a name="Filtering"></a> Filtering Data on the Page

You can filter the data that is displayed in the page by using the filter parameter. The filter parameter let you display specific records from the underlying table of the page.

### Example

 The following address displays data in page 9305 only for the customer who has the **Sell-to Customer No.**=10000 and the **Location Code**=Blue.

```
https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&page=9305&filter='Sell-to Customer No.' IS '10000' AND 'Location Code' IS 'BLUE'  
```

### Filter Syntax

The filter has the following syntax.

```
&filter='<field>' IS '<value>'[ AND '<field>' IS '<value>']  
```

Include a space or `%20` before and after the `IS`and `AND` operators. You can add the filter anywhere in the address after `/?`.

<!-- 
> [!TIP]
>  The filter syntax for a page in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] is the same as a page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], which you can see by choosing the **Copy Link to Page** action on the **Application** menu in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].
-->

### Filter Parameters

The following table describes the filter parameters.

|Parameter|Description|
|---------------|-----------------|
|`field`|The name of the table field on which to filter.|
|` IS `|Specifies the equal operator.|  
|`value`|The value of the table field on which to filter.|
|` AND `|Use this parameter to specify more than one filter. It specifies an "and" operator for adding additional filters. Place ` AND ` between each additional filter.<br /><br /> To be included in the page data, the table record must match values for all fields in the filter.|

## See Also
[Viewing Table Data](devenv-view-table-data.md)  
