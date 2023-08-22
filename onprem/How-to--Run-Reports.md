---
title: "How to: Run Reports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8162ff34-d59f-4771-b942-702d3027cf05
caps.latest.revision: 28
---
# How to: Run Reports
You can run reports:  
  
-   From the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
-   From the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
-   From Object Designer.  
  
-   At the command prompt with command-line arguments.  
  
-   From the **Run** window with command-line arguments.  
  
-   From a web browser window with command-line arguments.  
  
### To run a report from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
-   Add an action for running the report to a page. For more information, see [How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md).  
  
### To run a report from the [!INCLUDE[nav_web](includes/nav_web_md.md)]  
  
-   Do one of the following:  
  
    -   Open a report directly by using its Internet address. For more information, see [Opening a Report in the Microsoft Dynamics NAV Web Client by Using a URL](Opening-a-Report-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md)  
  
    -   Add an action for running the report to a page. For more information, see [How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md).  
  
### To run a report from Object Designer  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**.  
  
3.  Select the report that you want to run, and then choose **Run**.  
  
## Running Reports Using Command-Line Arguments  
 To run a report using command-line arguments, you must know the ID of the report. By using command-line arguments, you have various options for opening the [!INCLUDE[rtc](includes/rtc_md.md)] and pages and reports in different modes. For example, you can specify a specific server or specific language, or you can create hyperlinks to specific reports. For more information, see [Starting the Windows Client at the Command Prompt](Starting-the-Windows-Client-at-the-Command-Prompt.md) and [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md).  
  
 When you run a report using command-line arguments, you can filter the data in the report by adding a filter string to the command. The filter string has the following format:  
  
```  
&filter=<table>.<field>:<value>  
```  
  
 To specify the table, you use the **Name** value of the data item.  
  
 To specify the field, use the field name. If the field name contains special characters, then you must enclose it in quotation marks by using the URI escape sequence %22.  
  
 The colon operator separates the two parts of the filter string.  
  
 To specify the value, you can either use a single value or a comparison operator and a value. The following are valid comparison operators:  
  
-   > \(greater than\)  
  
-   >= \(greater than or equal to\)  
  
-   \< \(less than\)  
  
-   \<= \(less than or equal to\)  
  
-   \<> \(not equal to\)  
  
 The wildcard character \* is permitted in the value.  
  
 You can specify multiple filter strings by concatenating them. For example, the following command filters on cities that begin with M and names that begin with A.  
  
```  
DynamicsNAV:////runreport?report=101&filter=Customer.City:G*&filter=Customer.Name:C*  
```  
  
#### To run a report at the command prompt  
  
1.  At the command prompt, change to the [!INCLUDE[rtc](includes/rtc_md.md)] directory with the following cd command:  
  
     cd "[!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client"  
  
2.  Type the following command:  
  
     **Microsoft.Dynamics.Nav.Client.exe DynamicsNAV:////runreport?report=** *\<ReportID>* **\[&filter=** *\<table>* **.** *\<field>* **:** *\<value>* **\]**  
  
     Replace *\<ReportID>* with the report ID that you want to run. If you want to filter the data, then replace *\<table>*, *\<field>*, and *\<value>* with the appropriate values.  
  
#### To run a report from the Run window  
  
1.  In Windows, on the taskbar, choose **Start** and then choose **Run**.  
  
2.  In the **Run** window, enter the following command: **DynamicsNAV:////runreport?report=***\<ReportID>***\[&filter=***\<table>***.***\<field>***:***\<value>***\]**  
  
     Replace *\<ReportID>* with the report ID that you want to run. If you want to filter the data, then replace *\<table>*, *\<field>*, and *\<value>* with the appropriate values.  
  
3.  Choose **OK** to run the report.  
  
#### To run a report from a web browser window  
  
1.  Open a web browser window.  
  
2.  In the address bar, enter the following command: **DynamicsNAV:////runreport?report=***\<ReportID>***\[&filter=***\<table>***.***\<field>***:***\<value>***\]**  
  
     Replace *\<ReportID>* with the report ID that you want to run. If you want to filter the data, then replace *\<table>*, *\<field>*, and *\<value>* with the appropriate values.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
