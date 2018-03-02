---
title: "GETURL Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 507fd5c0-c6db-4ae0-b2b2-ff5039c6c9a6
caps.latest.revision: 12
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETURL Method
Generates a URL for the specified client target that is based on the configuration of the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance.  

 If the code runs in a multitenant deployment architecture, the generated URL will automatically apply to the tenant ID of the current user.  

## Syntax  

```  
[String :=] GETURL(ClientType[, Company][, Object Type][, Object Id][, Record/RecordRef][, UseFilters])  
```  

#### Parameters  
 *ClientType*  
 Value: CURRENTCLIENTTYPE \(or Current\), DEFAULTCLIENTTYPE \(or Default\), Windows, Web, SOAP, or OData  

 Specifies the client that you want to generate the URL for. This parameter is required. If you want to generate a URL that depends on the client that the user is accessing the URL from, choose **Current**. The following table describes the options.  

|Option|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|**CURRENTCLIENTTYPE**<br /><br /> or<br /><br /> **ClientType::Current**|The URL is generated based on the client that invokes the code, provided that this is one of the client types that are specified in this list. If the URL is requested by another client type, such as a NAS session, [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] generates a URL based on the default client that is specified for the relevant [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance. **Note:**  If you specify current as the client type, the URL cannot be consumed by an OData web service.|  
|**DEFAULTCLIENTTYPE**<br /><br /> or<br /><br /> **ClientType::Default**|The URL is generated based on the default client that is specified for the relevant [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance.|  
|**ClientType::Web**|The URL is generated based on a request from the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)].|  
|**ClientType::Desktop**|The URL is generated based on a request from the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] desktop app.|  
|**ClientType::Tablet**|The URL is generated based on a request from the [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] app.|  
|**ClientType::Phone**|The URL is generated based on a request from the [!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)] app.|  
|**ClientType::SOAP**|The URL is generated based on a request from a SOAP web service.|  
|**ClientType::OData**|The URL is generated based on a request from an OData web service.|  

<!--NAV
|**ClientType::Windows**|The URL is generated based on a request from the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)].|  
|**ClientType::Desktop**|The URL is generated based on a request from the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] running the [!INCLUDE[nav_uni_app](../includes/nav_uni_app_md.md)].|  
-->

> [!WARNING]  
>  A runtime error occurs if the *ClientType* is set to **SOAP** or **OData** but the specified object type and ID has not been published as a web service.  

 *Company*  
 Type: Text  

 Specifies the company that the URL must contain. If you do not specify a company, the URL will run in the user’s current company.  

 *ObjectType*  
 Value: Table, Page, Report, Codeunit, Query, or XMLport  

 Specifies the object type that the URL must open. If you specify an object type, you must also specify an object ID in the *ObjectId* parameter. Otherwise, the user will see a runtime error.  

 If you set the *ObjectType* parameter to **Page**, you can also specify a record variable in the *Record* parameter.  

 *ObjectId*  
 Type: Integer  

 Specifies the ID of the specified object type that the URL must open.  

 *Record/RecordRef*  
 Type: Record or RecordRef variable  

 The Record or RecordRef variable that specifies which record to open.  

 *UseFilters*  
 Type: Boolean  

 Specifies whether to include filters that are defined on the object as a text string in the URL.  

## Property Value/Return Value  
 Type: String  

## Remarks  
 The GETURL method generates a URL to open a specific page, for example, or to read [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] data from a web service. The generated URL includes settings from the configuration of the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance which the code that uses the method runs in. This means that you can use the GETURL method to generate URLs that are generic. The URLs are generated based on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] configuration for the user who is accessing the code that generates the URL. If you specify a company, then the URL applies to that company only. Also, in a multitenant deployment, the URLs are tenant-specific. The URL will only allow access to the requested object if the user has permission to access to the object.  

> [!WARNING]  
>  GETURL returns an empty string if the specified parameters result in values that are not valid, and if the URL cannot be generated for other reasons. If the method returns an empty string, you can use the GETLASTERRORTEXT method to troubleshoot. For more information, see [GETLASTERRORTEXT Method](devenv-GETLASTERRORTEXT-Method.md).  

 For example, you can write code that will open page 21 in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]. In that case, you call the GETURL method that has the relevant parameters, and when the code runs, the name of the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance and the server name are extracted automatically. The following table describes the basic URLs that you get with the simplest use of the GETURL method by writing `url := GETURL(ClientType::Default), 'demoname';`.  

|Client|URL|  
|------------|---------|  
|[!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]|https://yourfinancialURL/?company='[!INCLUDE[demoname](../includes/demoname_md.md)]|  
|[!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)]|ms-financials://*server*:*port*/*instance*?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|[!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)]|ms-financials://yourfinancialURL?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|[!INCLUDE[d365fin_md](../includes/d365fin_md.md)] Desktop client|ms-dynamicsnav://yourfinancialURL?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|OData|https://yourfinancialURL/OData/Company\('[!INCLUDE[demoname](../includes/demoname_md.md)]'\)/|  
|SOAP|https://yourfinancialURL/WS/[!INCLUDE[demoname](../includes/demoname_md.md)]|  

<!--NAV |[!INCLUDE[nav_windows](../includes/nav_windows_md.md)]|DynamicsNAV://*server*:*port*/*instance*//[!INCLUDE[demoname](../includes/demoname_md.md)]|
|[!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]|https://*server*:*port*/*instance*/WebClient?company='[!INCLUDE[demoname](../includes/demoname_md.md)]'/|  
|[!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)]|ms-financials://*server*:*port*/*instance*?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|[!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)]|ms-financials://*server*:*port*/*instance*?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|[!INCLUDE[d365fin_md](../includes/d365fin_md.md)] Desktop client|ms-dynamicsnav://*server*:*port*/*instance*?company=’ [!INCLUDE[demoname](../includes/demoname_md.md)]’|  
|OData|https://*server*:*port*/*instance*/OData/Company\('[!INCLUDE[demoname](../includes/demoname_md.md)]'\)/|  
|SOAP|https://*server*:*port*/*instance*/WS/[!INCLUDE[demoname](../includes/demoname_md.md)]|  
  -->
 In the example, an empty string for the company name is included for clarity. But an even simpler use of GETURL is to only specify the client type as in `url := GETURL(ClientType::Default);`.  

 URLs for opening a page or a report are available from the About this Page windows. <!--Links For more information, see [Using About This Page and About This Report](Using-About-This-Page-and-About-This-Report.md). --> 

## Example  
 The following code example illustrates how you can use the GETURL method to generate a URL that will open page 21 in the client that the current user is using.  

```  
Cust.Get(10000);  
url := GETURL(CURRENTCLIENTTYPE, 'COMPANYNAME', ObjectType::Page, 21, Cust);  

// Alternatively, you can use the following code:  
//Cust.Get(10000);  
//url := GETURL(ClientType::OData, COMPANYNAME, ObjectType::Page, 21, Cust);  
```  

 When the code runs, a different URL is generated, depending on the client that is using the URL. If the code is run in the context of a SOAP web service, it has a different syntax than if it runs in the context of the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)]. The following table describes the syntax of the generated URL for each client type.  

|Client|URL|  
|------------|---------|  
|[!INCLUDE[nav_windows](../includes/nav_windows_md.md)]|DynamicsNAV://*server*:*port*/*instance*/*company*/runpage?page=21&bookmark=*bookmark*|  
|[!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]|https://*server*:*port*/*instance*/?*company*&page=21&bookmark=*bookmark*|  
|OData|Not applicable because the client type is set to Current, which is not supported for Odata web services.|  
|SOAP|Not applicable because the URL for SOAP web services does not support filtering for the record.|  

 The current version of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] cannot generate a URL for an OData client if the client type is set to **Current**. However, the following code example illustrates a similar scenario for opening page 21 and specifying the record so that the URL can be consumed by an OData web service:  

```  
Cust.Get(10000);  
url := GETURL(ClientType::OData, COMPANYNAME, ObjectType::Page, 21, Cust);  
```  

 In this example, the following URL is generated for OData web services:  

 https://*server*:*port*/*instance*/OData/Company\('*company*'\)/Customer\('10000'\)  

 In this example, it is assumed that page 21 is published as an OData web service with the name Customer.  

 The following code example illustrates a similar scenario for opening page 21 and not specifying the record so the URL can be consumed by a SOAP web service:  

```  
url := GETURL(CURRENTCLIENTTYPE, COMPANYNAME, ObjectType::Page, 21);  

// Alternatively, you can use the following code:  
//url := GETURL(ClientType::Current, COMPANYNAME, ObjectType::Page, 21);  
```  

 In this example, the following URL is generated for SOAP web services:  

 https://*server*:*port*/*instance*/WS/*company*/Page/Customer  

## See Also  
 <!--Links [How to: Copy the URL to Open a Page or Report](How-to--Copy-the-URL-to-Open-a-Page-or-Report.md)   
 [How to: Publish a Web Service](How-to--Publish-a-Web-Service.md)   
 [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md) -->  
 [HYPERLINK Method](devenv-HYPERLINK-Method.md)   
 [CURRENTCLIENTTYPE Method](devenv-CURRENTCLIENTTYPE-Method.md)   
 [DEFAULTCLIENTTYPE Method](devenv-DEFAULTCLIENTTYPE-Method.md)
