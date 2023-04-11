---
title: "Walkthrough: Creating a Link from a Report to a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: baafbe33-37a8-41e7-a8d8-dd1f90475984
caps.latest.revision: 29
---
# Walkthrough: Creating a Link from a Report to a Page
You can create reports that provide dynamic data with Visual Studio Report Designer and [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. Your reports can include images, graphics, toggles on data columns, interactive sorting, and links to other data in the system. This walkthrough illustrates how to set up a report to include a link to the Customer Card page. When the report is run in preview mode, you can look up any existing customer directly from the report. By including this functionality, you now have a report that is a dynamic list that you can use to drill down into data instead of a report that is a static, printed list.  

## About This Walkthrough  
 The walkthrough provides an overview of how to modify the **Customer – Order Summary** report to include a link to the **Customer** card. This walkthrough illustrates the following tasks:  

-   Enabling hyperlinks on a report.  

-   Adding a link to the customer name on the report using Visual Studio.  

-   Running the modified report.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  

-   The [!INCLUDE[demoname](includes/demoname_md.md)] demo data company.  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Enabling Hyperlinks on a Report  
 Before you can add a link from a report to a page, you must enable hyperlinks on the report. For more information, see [EnableHyperlinks Property](EnableHyperlinks-Property.md).  

#### To enable hyperlinks on a report  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**, select report 107, the **Customer – Order Summary** report, and then choose the **Design** button.  

3.  In Report Dataset Designer, select an empty line.  

4.  On the **View** menu, choose **Properties**.  

5.  In the **Properties** window, in the **EnableHyperlinks** field, select **Yes**.  

6.  On the **File** menu, choose **Save** In the **Save** dialog box, make sure **Compile** is selected and then choose the **OK** button to compile and save the report.  

## Adding a Link to Customer Name in Visual Studio  
 In the following procedure you add a link to the customer name on the report that opens the **Customer** card for the selected customer.  

#### To add a link to customer name in Visual Studio  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], with the **Customer – Order Summary** report open in Report Dataset Designer, on the **View** menu, choose **Layout**.  

2.  In Visual Studio, in the **Body** section of the report, locate the **First\(Name\_Cust\)** text box. The expression for the text box is `=First(Fields!Name_Cust.Value)`.  

    > [!NOTE]  
    >  This report has two rows that contain the **First\(Name\_Cust\)** text box. Only one row is displayed on the report. The row that is displayed depends on whether the user selects the **Show Amounts in LCY** check box in the request page. You must add the link to both of the text boxes that contain the customer name. This walkthrough only describes adding the link to one text box.  

3.  Right-click the text box, and then choose **Properties**.  

4.  In the **Properties** window, select the **Action** tab.  

5.  Select the **Go to URL** check box and enter the following line in the **Select URL** field: `="dynamicsnav://///runpage?page=21&$filter=Customer.'No.'-IS-'''%40" + Fields!No_Cust.Value + "*'''"`  

     This opens page 21, the **Customer Card** page, and filters on which customer card to open.  

6.  In the **Text Box Properties** window, on the **Font** tab, under **Color**, choose **ƒx** to open the expression window.  

7.  Under **Set expression for: Color**, enter **="\#0066dd"**.  

8.  Choose the **OK** button to close both windows.  

9. Save the Report.rdlc file, and then close Visual Studio.  

## Running the Modified Report  
 In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you must now save the modified report and compile it you run it to see the changes.  

#### To run the modified report  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], save the **Customer – Order Summary** report. A message informs you that the .rdlc file for this report has changed and asks if you want to load the changes. Choose **Yes** to save the changes in the database.  

2.  Save and compile the report.  

3.  On the Windows taskbar, choose **Start**, and then choose **Run**.  

4.  In the **Run** window, enter the following text: **dynamicsnav:////runreport?report=107**, and then choose **OK**. For more information about the syntax for running a report from the **Run** window, see [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md).  

5.  Choose **Preview** to view the report. The report shows the order detail \(the quantity not yet shipped\) for each customer in three periods of 30 days each, starting from a selected date. If you select the customer name, then the specific Customer card opens. This makes it possible to drill down into the customer's data.  

## See Also  
 [Walkthrough: Designing a Report with Images, Interactive Sorting, and Visibility Toggle](Walkthrough--Designing-a-Report-with-Images--Interactive-Sorting--and-Visibility-Toggle.md)   
 [Walkthrough: Designing a Customer List Report](Walkthrough--Designing-a-Customer-List-Report.md)
