---
title: "Creating and Running Hyperlinks"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 89785500-355e-4971-bd57-0410814d7417
caps.latest.revision: 41
---
# Creating and Running Hyperlinks
Hyperlinks enable users to send or save quick links to specific pages in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, you can create a hyperlink to a specific list page, such as Customers. You can also use hyperlinks to specify parameters, such as server name, server service, or company. You can enter hyperlinks in the Command Prompt window, in a browser window, or directly in the **Run** window. You can also generate hyperlinks programmatically as part of your [!INCLUDE[navnow](includes/navnow_md.md)] functionality.  

## Creating Hyperlinks  
 You can use hyperlinks as URLs or at a command prompt as arguments to the command to start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. At the command prompt, type the name of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] executable and then, in quotation marks, type the hyperlink. For example:  

```  
Microsoft.Dynamics.Nav.Client.exe "DynamicsNAV://MyServer/nav_server_instance/CRONUS International Ltd./RunPage?Page=22"  
```  

 This example specifies a server name, service, company, and page ID. If entered correctly, it opens the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on page 22, the customer list page.  

 An equivalent URL that you could type in a browser’s address bar is:  

```  
DynamicsNAV://MyServer/nav_server_instance/CRONUS%20International%20Ltd./RunPage?Page=22  
```  

 Note that in a URL, you must use encoding for special characters.  

> [!TIP]  
>  You can also use the GETURL function to automatically generate URLs when your code runs. For example, if you want to automatically open a specific page when a trigger is called, you can implement this programmatically by using the GETURL function. The URLs are then generated automatically and the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is automatically inserted. You can generate URLs using this method that will work in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_web](includes/nav_web_md.md)], and in SOAP and OData web services. For more information, see [GETURL Function](GETURL-Function.md).  

### Building a URL  
 When you build a hyperlink URL, you can specify a page, report, query, XMLport, codeunit, table, or node. The following examples illustrate URLs that open objects in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], but you can also generate URLs that open objects in the [!INCLUDE[nav_web](includes/nav_web_md.md)]:  

-   `DynamicsNAV://server/instance/company/runpage?page=22&bookmark=0ABA0700235752C7D1`  

-   `DynamicsNAV://server/instance/company/runreport?report=901`  

-   `DynamicsNAV://server/instance/company/runquery?query=5402`  

-   `DynamicsNAV://server/instance/company/runxmlport?xmlport=5050`  

-   `DynamicsNAV://server/instance/company/runcodeunit?codeunit=5845`  

-   `DynamicsNAV://server/instance/company/navigate?node=Home/Items`  

-   `DynamicsNAV://server/instance/company/RunTable?Table=18`  

 The first three parameters that open a [!INCLUDE[navnow](includes/navnow_md.md)] client URL are reserved for *server*, *service*, and *company*. You can omit certain parameters, in which case default values are assumed, but you must leave the correct number of forward slashes to indicate which parameters you have omitted. If you omit just one of these parameters, then it must be *company*. If you omit two parameters, then they must be *company* and *instance*. You can also omit all three parameters. For example, the following URL assumes the default instance and company on the MyServer server:  

```  
DynamicsNAV://MyServer///RunPage?Page=22  
```  

 You can also specify a server port:  

```  
DynamicsNAV://MyServer:1234///RunPage?Page=22  
```  

 This URL omits *server*, *service*, and *company*:  

```  
DynamicsNAV://///navigate?node=Home/Items  
```  

### Specifying Additional Parameters  
 You can also specify the following additional parameters in a URL.  

|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|Example|  
|---------------|---------------------------------------|-------------|  
|Personalization ID|Specifies the unique identification that is used in personalization to store settings in the **User Metadata** table. If a personalization ID is not found, the page is opened without personalization.|`DynamicsNAV://localhost/DynamicsNAV110/CRONUS%20International%20Ltd./runpage?page=22&personalization=0000232e-0000-001a-0008-0000836bd2d2`|  
|Bookmark|Positions the cursor on a single record in a table.<br /><br /> Only automatically generated bookmarks should be used. If you enter an incorrect bookmark, you will get an error message.|`DynamicsNAV://localhost/DynamicsNAV110/CRONUS%20International%20Ltd./runpage?page=22&bookmark=120000000089083237343`|  
|Mode|Enables you to open a page in a specific mode, which include view, edit, create, select, and delete.|`DynamicsNAV://localhost/DynamicsNAV110/CRONUS%20International%20Ltd./runpage?page=22&mode=View`|  
|Filter|Enables you to open a page with a specific filter applied. In the example, you open the customer list filtered to customer number 10000.|`DynamicsNAV://localhost/DynamicsNAV110/CRONUS%20International%20Ltd./runpage?page=22&$filter='No.'-IS-'10000'`|  

## Understanding Syntax for Creating Hyperlinks  
 The following table shows some examples of hyperlinks and provides information about how to specify parameters.  

|Parameters|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|Syntax|Example|  
|----------------|---------------------------------------|------------|-------------|  
|Company name|Enables you to switch a company \(case- sensitive\).|**DynamicsNAV:////\<CompanyName>/RunPage?Page=\<pageid>**|`DynamicsNAV:////CRONUS%20International%20Ltd./RunPage?Page=22`|  
|Navigate|Enables users to send or save quick links to specific pages.|**DynamicsNAV://///navigate?node=\<service>**|`DynamicsNAV://///navigate?node=Home/Items`|  
|RunPage|Enables you to run a specific page.|**DynamicsNAV:////runpage?page=\<page id>**|`DynamicsNAV:////runpage?page=42`|  
|Filter|Enables you to run a specific page with a specific filter applied.|**DynamicsNAV////runpage?page=\<page id>&$filter='\<field>'-IS-'\<value>'\[-AND-'\<field>'-IS-'\<value>'\]**|`DynamicsNAV:////runpage?page=22&$filter='No.'-IS-'10000'`|  
|RunReport|Enables you to run a specific report.|**DynamicsNAV:////runreport?report=\<report id>**|`DynamicsNAV:////runreport?report=50000`|  
|RunQuery|Enables you to run the **About This Query** page for a specific query.|**DynamicsNAV:////runquery?query=\<query id>**|`DynamicsNAV:////runquery?query=50000`|  
|RunXMLport|Enables you to run a specific XMLport.|**DynamicsNAV:////runxmlport?xmlport=\<xmlport id>**|`DynamicsNAV:////runxmlport?xmlport=99008500`|  
|RunCodeunit|Enables you to run a specific codeunit.|**DynamicsNAV:////runcodeunit?codeunit=\<codeunit id>**|`DynamicsNAV:////runcodeunit?codeunit=50000`|  
|RunTable|Enables you to run a specific table.|**DynamicsNAV:////runtable?table=\<table id>**|`DynamicsNAV:////runtable?table=18`|  
|Server name|Enables you to switch servers.|**DynamicsNAV://\<ServerName>///RunPage?Page=\<pageid>**|`Microsoft.Dynamics.Nav.Client.exe DynamicsNAV://MyServer///RunPage?Page=22`|  
|Server port|Enables you to specify an optional server port number in the range 1-65535. The default port is 7046.|**DynamicsNAV://\<ServerName>\<:Port>///RunPage?Page=\<pageid>**|`DynamicsNAV://MyServer:1234///RunPage?Page=22`|  
|Service instance|Enables you to specify a Service instance. You can find this value in the CustomSettings.config file. If you specify an instance you must also specify a server.|**DynamicsNAV://\<ServerName>/\<ServiceInstance>//RunPage?Page=\<pageid>**|`Microsoft.Dynamics.Nav.Client.exe DynamicsNAV://MyServer/DynamicsNAV//RunPage?Page=22`|  

### Specifying Encoding in Company Names  
 When you enter a company name at a command prompt, enclose it in quotation marks to make sure that spaces and other special characters are read correctly. For URLs, use percent encoding to handle any characters above 127 in the ASCII character set.  

## Running Hyperlinks  
 The following table shows the different ways in which you can run hyperlinks.  

> [!WARNING]  
>  Some page links are longer than 255 characters, which is the maximum length for the Windows **Run** window. A link longer than 255 characters cannot be run from the **Run** window.  

|Method|To run a hyperlink|  
|------------|------------------------|  
|Run window|Choose **Start**, and then choose **Run**. Enter the hyperlink in the **Run** window. Choose the **OK** button.|  
|Command prompt window|At the command prompt, type the hyperlink directly.|  
|Shortcut|Create a shortcut for the [!INCLUDE[navnow](includes/navnow_md.md)] executable on your desktop.<br /><br /> On the shortcut menu, choose **Properties**, and then enter the hyperlink URL in the **Target** field of the shortcut. Choose the **OK** button, and then start [!INCLUDE[navnow](includes/navnow_md.md)].|  
|Browser window|Use a browser such as Internet Explorer and type the hyperlink URL directly in the address bar. To type hyperlinks in a browser, you must have [!INCLUDE[navnow](includes/navnow_md.md)] installed on your computer.|  
|Web reference for a web service|For more information, see [SOAP Web Services](SOAP-Web-Services.md) and [OData Web Services](OData-Web-Services.md).|  
|Programmatically|Use the GETURL function to generate a URL that opens objects in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_web](includes/nav_web_md.md)], or a SOAP or OData web service and automatically inserts the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration. For more information, see [GETURL Function](GETURL-Function.md).|  

## See Also  
 [Starting the Windows Client at the Command Prompt](Starting-the-Windows-Client-at-the-Command-Prompt.md)   
 [How to: Run Reports](How-to--Run-Reports.md)   
 [GETURL Function](GETURL-Function.md)   
 [SOAP Web Services](SOAP-Web-Services.md)   
 [OData Web Services](OData-Web-Services.md)
