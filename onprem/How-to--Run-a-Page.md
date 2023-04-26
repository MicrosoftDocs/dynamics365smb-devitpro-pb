---
title: "How to: Run a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 441db9f0-d70b-4ec7-bb8c-cddccf6cf032
caps.latest.revision: 24
---
# How to: Run a Page
When you are developing pages, you may want to see how the pages look in the [!INCLUDE[rtc](includes/rtc_md.md)]. You can run and view a page from Object Designer, or you can use command-line arguments at the command prompt, in the **Run** window, or in a browser. For each method, the [!INCLUDE[rtc](includes/rtc_md.md)] starts and opens the selected page. For command-line arguments, you have various options for opening the [!INCLUDE[rtc](includes/rtc_md.md)] and its pages in different modes. For example, you can specify a specific server or specific language, or you can create hyperlinks to specific pages in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. For more information, see [Starting the Windows Client at the Command Prompt](Starting-the-Windows-Client-at-the-Command-Prompt.md) and [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md).  
  
> [!NOTE]  
>  ConfirmationDialog pages cannot be run and previewed by using the methods described in this topic. You can only view ConfirmationDialog pages by invoking them in the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
### To run a page from Object Designer  
  
1.  Open the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
2.  On the **Tools** menu, choose **Object Designer**, and then choose **Page**.  
  
3.  Select the page that you want to view, and then choose **Run**.  
  
### To run a page at the command prompt  
  
1.  At the command prompt, change to the RoleTailored Client directory of the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] installation on your computer. By default, the directory is:

    [!INCLUDE[navnow_x86install_md](includes/navnow_x86install_md.md)]\RoleTailored Client  
   
2.  Type the following command:  
  
    ```  
    Microsoft.Dynamics.Nav.Client.exe Dynamicsnav:////runpage?page=nn  
    ```  
  
     Substitute *nn* with the ID of the page that you want to view.  
  
3.  Press ENTER.  
  
     The RoleTailored client opens and displays the page.  
  
### To run a page from the Run window  
  
1.  On the taskbar, choose **Start**, and then choose **Run**.  
  
2.  In the **Run** window, type the following command:  
  
    ```  
    Microsoft.Dynamics.Nav.Client.exe Dynamicsnav:////runpage?page=nn  
    ```  
  
     Substitute *nn* with the ID of the page that you want to view.  
  
3.  Choose **OK**.  
  
     The RoleTailored client opens and displays the page.  
  
### To run a page from a browser  
  
1.  Open the browser.  
  
2.  In the address bar, type the following command:  
  
    ```  
    Dynamicsnav:////runpage?page=nn  
    ```  
  
     Substitute *nn* with the ID of the page that you want to view.  
  
3.  Press **Go**.  
  
     The RoleTailored client opens and displays the page.  
  
## See Also  
 [Starting the Windows Client at the Command Prompt](Starting-the-Windows-Client-at-the-Command-Prompt.md)   
 [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md)
