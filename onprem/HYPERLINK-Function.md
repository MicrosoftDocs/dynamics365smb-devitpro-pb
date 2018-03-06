---
title: "HYPERLINK Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f5d64ccc-71b4-4820-9ba7-fb054092f4a4
caps.latest.revision: 20
manager: edupont
---
# HYPERLINK Function
Passes a URL as an argument to an Internet browser, such as Windows Internet Explorer.  
  
## Syntax  
  
```  
HYPERLINK(URL)  
```  
  
#### Parameters  
 *URL*  
 Type: Text  
  
 A URL that is passed to the Internet browser as an argument.  
  
## Remarks  
The syntax must be a valid URL, such as *http://www.microsoft.com*, or path to a file on file share, such as *file://d$/myfiles/myfile.txt*. If you want the URL to be configurable, you can get the URL from a field or a variable instead. If you pass an empty string, then no browser window is opened.  
  
If you use this function for an application that runs on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], then the default Internet browser that is based on the setting in the system registry is used. If the browser is already running, then a new tab opens in the browser window. If you use this function for an application that runs on the [!INCLUDE[nav_web](includes/nav_web_md.md)], then a new tab in the same browser window that is currently hosting the [!INCLUDE[nav_web](includes/nav_web_md.md)] is opened.  
  
The HYPERLINK function works with different protocols and file types as along as the syntax is valid. When using the *file://* protocol to open a file, the file should be stored on a network file share, not locally; otherwise the file will not open in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Also, certain browsers, including Google Chrome, Mozilla Firefox, block hyperlinks to files from a web page. Therefore, using the *files://* protocol in the HYPERLINK function will not work in the [!INCLUDE[nav_web](includes/nav_web_md.md)] with these browsers.   
  
The HYPERLINK function does not work on NAS services.  
  
## Example  
 The following example shows two uses of the HYPERLINK function to open the specified URL in the default browser. In the first line of code, the URL is specified in code. The second line of code illustrates how you can get a URL that is stored in a field on the current table.  
  
```  
HYPERLINK('http://www.microsoft.com');   
...  
HYPERLINK(Rec.UrlField);  
  
```  
  
## See Also  
 [APPLICATIONPATH Function](APPLICATIONPATH-Function.md)   
 [GUIALLOWED Function](GUIALLOWED-Function.md)   
 [SLEEP Function](SLEEP-Function.md)   
 [TEMPORARYPATH Function](TEMPORARYPATH-Function.md)