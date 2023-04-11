---
title: "Walkthrough: Creating a Link from a Report to a Report"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9d74d7e1-2409-4c2a-96f1-280a4d47c7f1
caps.latest.revision: 23
---
# Walkthrough: Creating a Link from a Report to a Report
This walkthrough illustrates how to set up a report to include a link from the **Customer - Top 10 List** report to the **Customer - Detail Trial Bal.** report. When you run the **Customer - Top 10 List** report in preview mode and show balance data, you can choose either a value in the **Balance \(LCY\)** column or a section of the pie chart to view detailed balance information. By including this functionality, you now have a dynamic report that enables you to drill down into data.  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   Enabling hyperlinks on a report.  

-   Adding a link from the **Balance** text box on the report to another report.  

-   Formatting the **Balance** text box to indicate that it is a link.  

-   Adding a link from the pie chart to another report.  

-   Running the modified report.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  

-   The [!INCLUDE[demolong](includes/demolong_md.md)].  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Enabling Hyperlinks on a Report  
 Before you can add a link from a report to another report, you must enable hyperlinks on the report. For more information, see [EnableHyperlinks Property](EnableHyperlinks-Property.md).  

#### To enable hyperlinks on a report  

1.  In the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Development Environment, on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**, select report 111, the **Customer - Top 10 List** report, and then choose **Design**. The Report Dataset Designer window opens.  

3.  In Report Dataset Designer, select an empty row.  

4.  On the **View** menu, choose **Properties**.  

5.  In the **Report - Properties** window, in the **EnableHyperlinks** field, set the **Value** field to **Yes**.  

6.  From the **File** menu, choose **Save**, and in the **Save** dialog box, make sure **Compile** is selected and choose **OK** to compile and save the report.  

7.  Close the **Properties** and the **Report Dataset Designer** windows.  

## Adding a Link from the Balance Text Box  
 In the following procedure, you add a link from the balance text box in report 111, the Customer - Top 10 List report to report 104, the Customer Detail Trial Bal. report.  

#### To add a link from the Balance Field  

1.  In Object Designer, choose **Report**, select report 111, the **Customer - Top 10 List** report, and then choose **Design**.  

2.  On the **View** menu, choose **Layout**. Visual Studio opens.  

     If you are opening Visual Studio from [!INCLUDE[navnow](includes/navnow_md.md)] for the first time you will choose your development environment. Otherwise, skip the next step.  

3.  In the **Choose Your Development Default Environment** window, select **General Settings** and choose **Start Visual Studio**.  

4.  In Visual Studio, choose the Report.rldc file to open it, and then in the **Body** section of the report, locate the **BalanceLCY\_Customer** text box. The value of the text box is `=Fields!BalanceLCY_Customer.Value`. You can confirm this value by selecting the text box and viewing the **Value** property in the Visual Studio **Properties** window.  

5.  Select the text box, and then from the shortcut menu, choose **Text Box Properties**.  

6.  In the **Text Box Properties** window, choose the **Action** tab.  

7.  Select the **Go to URL** check box and enter the following expression in the **Select URL** text box below the **Go to URL** check box:  

    ```  
    ="dynamicsnav:////runreport?report=104&filter=Customer.%22No.%22:"+Fields!No_Customer.Value  
    ```  

     For more information about creating filters in a URL to run a report, see [How to: Run Reports](How-to--Run-Reports.md).  

8.  Choose **OK** to close the window.  

9. On the **File** menu, choose **Save Report.rdlc** to save the report in Visual Studio.  

## Formatting the Balance Text Box  
 After adding the link from the balance text box to report 104, you may want to change the format of the balance text box to indicate that the data in the text box is a link. The following steps illustrate how to format the text box.  

#### To format the Balance text box  

1.  In Visual Studio, in the **Body** section of the report, select the **BalanceLCY\_Customer** text box.  

2.  On the **View** menu, choose **Properties Window**.  

3.  In the **Properties** window, in the **Color** field, select **Blue**. Expand **Font** and set  **Text Decoration**, to **Underline**.  

4.  Save the report in Visual Studio.  

## Adding a Link from a Pie Chart  
 The following steps add a link from the data in the pie chart to report 111.  

#### To add a link from a pie chart  

1.  In Visual Studio, select the pie chart, and then, from the shortcut menu, choose **Series Properties**.  

2.  In the **Series Properties** window, select the **Action** tab, then select **Go to URL** and enter the following expression in the **Select URL** text box below the **Go to URL** check box:  

    ```  
    ="dynamicsnav:////runreport?report=104 &filter=Customer.%22No.%22:"+Fields!No_Customer.Value  
    ```  

     For more information about creating filters in a URL to run a report, see [How to: Run Reports](How-to--Run-Reports.md).  

3.  Choose the **OK** button to close the **Series Properties** window.  

4.  In Visual Studio, on the **File** menu, choose **Save Report.rldc** to save and then close the report in Visual Studio.  

## Running the Modified Report  
 In the development environment, you must now save the modified report and compile it before it you can run it.  

#### To run the modified report  

1.  In the development environment, save the **Customer - Top 10 List** report.  

     A message informs you that the .rdlc file for this report has changed and asks if you want to load the changes. Choose **Yes** to save the changes in the database.  

2.  In the **Save** window, verify that the **Compiled** check box is selected, and then choose **OK**.  

3.  In the development environment , select the **Customer - Top 10 List** report and choose **Run**. The **Edit-Customer- Top 10 List** page for report 111 opens in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

4.  Under **Options**, in the **Show** drop-down list box, select **Balance \(LCY\)** and in the **Chart Type** drop-down list box, select **Pie chart**.  

5.  Choose **Preview** to view the report. The report lists the top 10 list of customers. Notice that the **Balance \(LCY\)** column is formatted as a hyperlink. If you select the pie chart, you will notice that the chart is also formatted as hyperlink.  

6.  Choose a value in a **Balance \(LCY\)** column. The **Customer - Detail Trial Bal.** report for the specified customer opens.  

7.  Choose a sector in the pie chart that represents a customer. The **Customer - Detail Trial Bal.** report for the specified customer opens.  

     Alternatively, you can run the report from the **Run** window.  

8.  On the Windows taskbar, choose **Start**, and then choose **Run**.  

9. In the **Run** window, enter the following text: **dynamicsnav:////runreport?report=111**, and then choose the **OK** button.  

## See Also  
 [Walkthrough: Creating a Link from a Report to a Page](Walkthrough--Creating-a-Link-from-a-Report-to-a-Page.md)   
 [Report Design Walkthroughs](Report-Design-Walkthroughs.md)
