---
title: "Working [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] URL"
ms.custom: na
ms.date: 03/03/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Web Client URL
There are several parameters that you can add to the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] URL to manipulate what is displayed in the client, such as opening a specific company, or targeting a specific page, report, or table. For example, the following URL displays page **9305 Sales Order List** for the [!INCLUDE[demoname](includes/demoname_md.md)] company:

```
https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&page=9305  
```
The following URL opens report **5 Receivables – Payables** for the same company:
```  
http://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&report=5   
```  

This article describe how you can constuct URLs, which can be useful for including in other sources, such as emails or Word documents, or sending as hyperlinks to other users.

> [!IMPORTANT]  
>  Certain data in the URL, such as filters, could be considered sensitive information. Use discretion if you distribute URLs that contain filters, or if it is possible, exclude this information from the address.  

<!--This topic includes the following sections:  

-   [Example](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md#Example)  

- [Page Address Syntax](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md#Syntax)

- [Building the Page Address](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md#Building)

- [URL Parameters](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md#Paramters)

- [Filtering Data on the Page](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md#Filtering)  -->
 

##  <a name="Syntax"></a> URL Syntax  
The [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] URL has the following syntax:

```
https://<hostname>[/<aadtenantid>][/sandbox]/?[company=<companyname>]&[page|report|table=<ID>]&[mode=<View|Edit|Create>]&[profile=<profileID>]&[bookmark=<bookmark>]&[captionhelpdisabled=<0|1>]&[showribbon=<0|1>]&[shownavigation=<0|1>]&[showuiparts=<0|1>]&[redirect<0|1>]
```

<!-- onprem
```
https://<hostname>[/<aad>][/sandbox]/?[company=<companyname>]&[page|report|table=<ID>]&[tenant=<tenantID>]&[mode=<View|Edit|Create>]&[profile=<profileID>]&[bookmark=<bookmark>]&[captionhelpdisabled=<0|1>]&[showribbon=<0|1>]&[shownavigation=<0|1>]&[showuiparts=<0|1>]&[redirect<0|1>]
```
-->

The URL consists of two parts, the hostname part and the query string. The hostname part includes the protocol (https) and the hostname. The query string part includes everything after `<hostname>`. The query string determines what content to target.


### Syntax Key
The following table describes the notation that is used to indicate the syntax.

|Notation|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|--------------|---------------------------------------|
|Text without brackets|Parameters that you must type as shown.|
|`<>`|A placeholder for values that you must supply. Do not include the brackets in the address.|
|`[]`|Optional parameters. Do not include the brackets in the address.|
|`|`|A set of values from which to choose. Use one of the options and do not include `|` in the address.|

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

-   Use `%20` for any spaces in values, or similar escape sequences for other characters which cannot be used in URLs.

-   Enclose values in single quotation marks (`''`) if they are unescaped.

##  <a name="Paramters"></a> URL Parameters
 The following table describes the parameters of the URL for displaying a page.

|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|---------------|---------------------------------------|
|`https`|Specifies the Internet protocol to use. Only `https` is supported.|
|`hostname`|Specifies the hostname for [!INCLUDE[d365fin_md](includes/d365fin_md.md)], for example, `businesscentral.dynamics.com`. |
|`aadtenantid`|Specifies the unique identifier for an Azure Active Directory (AAD) tenant. The value can be formatted as a GUID or domain name. This is useful to those who work across multiple AAD organizations, such as delegated administrators, support personnel or external accountants, because it allows explicitly targeting an AAD tenant. If this is omitted, you will be directed to the primary AAD tenant or the same AAD tenant that you are currently signed in to.|
|`sandbox`|Specifies that the URL should target the the Dynamics 365 Business Central sandbox environment instead of a production environment.|
|`company`|The name of the company in [!INCLUDE[d365fin_md](includes/d365fin_md.md)] which you want to target.<br /><br /> If you only have one company, then you can omit this parameter.|
|`page`|Opens a page object.|
|`report`|Opens a report object.|
|`table`|Opens a table object. This requires special permissions. For more information about opening a table, see [Viewing Table Data](devenv-view-table-data.md).|
|`ID`|The ID of the page, report, or table to open. |
|`mode`|Specifies the mode in which to display the page.<br /><br />- `View`<br /> The page can only be viewed. The user cannot change data on the page. **Note:** Worksheet page types only display in the edit mode, even if the value is set to `View`.<br /><br />- `Edit`<br /> The user can change data on the page. **Note:** To use the edit mode, the [Editable Property](properties/devenv-editable-property.md) of the page in Page Designer must be set to **Yes**. This mode is not supported for pages of the type List, RoleCenter, and CardPart. If you set the value to `Edit`, pages of these types still display in the view mode. For List type pages, the user can modify the list by choosing **Edit List** on the page.<br /><br />-  `Create`<br />Opens a blank page that enables the user to create a new item.<br /><br />**Note:** The `Create` mode is not supported for pages of the type CardPart, List, ListPart, RoleCenter, and Worksheet. For pages of the type CardPart, List, and ListPart, the page displays in the view mode. Do not use this mode for Worksheet pages; otherwise you will get an error when you try to open the page.|
|`profile`|Specifies the ID of the profile to open.|
|`bookmark`|Specifies a record in the underlying table of the page. The value of a bookmark is an alphanumeric string of characters, for example, `27%3bEgAAAAJ7CDAAMQA5ADAANQA4ADkAMw%3d%3`.<br /><br /> For the page types Card, CardPart, and Document, the bookmark specifies the record that is shown in the page. For page types List, ListPart, and Worksheet, the bookmark specifies the record that is selected in the list on the page.<br /><br /> **Important:**  Bookmarks are generated automatically. You can only determine a value for the bookmark by displaying the page in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] and looking at its address. Therefore, a bookmark is only relevant when the address you are working with has been copied from another instance of the page in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)].|
|`captionhelpdisabled`|Specifies that the ability to look up Help by selecting a field caption is disabled.<br /><br />If you want the Help look up from the field captions, either omit this parameter or set its value to `0`, such as `captionhelpdisabled=0`. <br /><br />If you do not want the Help lookup from field captions, set the value to `1`, such as `captionhelpdisabled=1`.<br /><br /> **Note:** The parameter needs to be added at the first request when the user logs on to take effect, adding the parameter on an existing session has no effect.|
|`showribbon`|Specifies whether to show the Action bar on the specified page when it opens.<br /><br />If you want the Action bar, either omit this parameter or set its value to `1`, such as `showribbon=1`.<br /><br />If you do not want the Action bar, set the value to `0`, such as `showribbon=0`.<br /><br />**Note:** This parameter only works for pages of the list page type.|
|`shownavigation`|Specifies whether to show the navigation bar when the specified page opens. <br /><br />If you want the navigation bar, either omit this parameter or set its value to `1`, such as `shownavigation=1`.<br /><br />If you do not want the navigation bar, set the value to `0`, such as `shownavigation=0`.<br /><br />**Note:** This parameter only works for pages of the list page type.|
|`showuiparts`|Specifies whether to show UI parts when the specified page opens. The default value, if the parameter is not specified, is `1` which displays the UI parts. Use the value `0` to not show UI parts.<br /><br />If you want the UI parts, either omit this parameter or set its value to `1`, such as `showuiparts=1`.<br /><br />If you do not want the UI parts, set the value to `0`, such as `showuiparts=0`.<br /><br /> **Note:**  This parameter only works for pages of the list page type.|
|`redirect`|Specifies whether users are presented with an option to download the [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] when they open the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] in a mobile browser in order to improve the user experience.<br /><br />If you do not want to give users this option, set the value to `0`, such as `redirect=0`.<br /><br />|
|`extension`|Specifies the unique identifier (ID) of an extension that is deployed on the tenant. This parameter is mainly used during the development of the specified extension in a non-production environment. When this parameter is set, only the specifed extension is available in the client; all other extensions are ignored and not visible. This enables you to isolate and focus on the behavior of the specified extension only.<br /><br />An extension ID is a 32-digit GUID, such as `72CC5E27-BD97-4271-AF55-F77E4471E493`. You set this parameter using the format `extension={GUID}`, for example:<br /><br />`&extension={72CC5E27-BD97-4271-AF55-F77E4471E493}`<br /><br />You can determine an extension ID by opening the extension in Visual Studio Code and looking in the app.json file, or by running the [Get-NAVAppManifest cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.tools/Get-NAVAppManifest) on the extension package.|

<!--
|`tenant`|Specifies the ID of the tenant to connect to. You must provide this parameter when [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)] is deployed in multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance that the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).|
-->

<!-- For more information about framing the Web client, see [Embedding Microsoft Dynamics NAV Web Client Pages in Other Websites](Embedding-Microsoft-Dynamics-NAV-Web-Client-Pages-in-Other-Websites.md).-->

## <a name="Filtering"></a> Filtering Data on the Page
You can filter the data that is displayed in the page by using the filter parameter in the address. The filter parameter enables you to display only records from the underlying table of the page that have specific values for one or more fields.

### Example
 The following address displays data in page 9305 only for the customer who has the **Sell-to Customer No.**=10000 and the **Location Code**=Blue.

```
https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.&page=9305&filter='Sell-to-Customer-No.'-IS-'10000'-AND-'Location-Code'-IS-'BLUE'  
```

### Filter Syntax
The filter has the following syntax.

```
&filter='<field>'-IS-'<value>'[-AND-'<field>'-IS-'<value>']  
```

You can add the filter anywhere in the address after `/?`.

<!-- 
> [!TIP]
>  The filter syntax for a page in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] is the same as a page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], which you can see by choosing the **Copy Link to Page** action on the **Application** menu in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].
-->

### Filter Parameters
The following table describes the filter parameters.

|Parameter|Description|
|---------------|-----------------|
|`field`|The name of the table field on which to filter.|
|`-IS-`|Specifies the equal operator.|  
|`value`|The value of the table field on which to filter.|
|`-AND-`|Use this parameter to specify more than one filter. It specifies an “and” operator for adding additional filters. Place `-AND-` between each additional filter.<br /><br /> To be included in the page data, the table record must match values for all fields in the filter.|

## See Also
[Viewing Table Data](devenv-view-table-data.md)  
