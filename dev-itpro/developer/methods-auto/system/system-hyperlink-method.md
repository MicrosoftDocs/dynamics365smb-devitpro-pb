---
title: "System.Hyperlink Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Hyperlink Method
Passes a URL as an argument to an Internet browser, such as Windows Internet Explorer.


## Syntax
```
 System.Hyperlink(URL: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*URL*  
&emsp;Type: [String](../string/string-data-type.md)  
 A URL that is passed to the Internet browser as an argument.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The syntax must be a valid URL, such as *https://www.microsoft.com*, or path to a file on file share, such as *file://d$/myfiles/myfile.txt*. If you want the URL to be configurable, you can get the URL from a field or a variable instead. If you pass an empty string, then no browser window is opened.    

<!-- Windows
If you use this method for an application that runs on the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)], then the default Internet browser that is based on the setting in the system registry is used. If the browser is already running, then a new tab opens in the browser window. If you use this method for an application that runs on the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)], then a new tab in the same browser window that is currently hosting the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] is opened.  
-->

At runtime, a new tab is opened in the same browser window where [!INCLUDE[d365_bus_central_md](../../includes/d365_bus_central_md.md)] is running.

The HYPERLINK function works with different protocols and file types as along as the syntax is valid. When using the *file://* protocol to open a file, the file should be stored on a network file share, not locally; otherwise the file will not open<!--NAV in the [!INCLUDE[nav_web](includes/nav_web_md.md)]-->. Also, certain browsers, including Google Chrome, Mozilla Firefox, block hyperlinks to files from a web page. Therefore, using the *files://* protocol in the HYPERLINK function will not work<!--NAV in the [!INCLUDE[nav_web](includes/nav_web_md.md)]--> with these browsers.  

 The HYPERLINK method does not work on NAS services.  

## Example  
 The following example shows two uses of the HYPERLINK method to open the specified URL in the default browser. In the first line of code, the URL is specified in code. The second line of code illustrates how you can get a URL that is stored in a field on the current table.  

```  
HYPERLINK('https://www.microsoft.com');   
...  
HYPERLINK(Rec.UrlField);  

```  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)