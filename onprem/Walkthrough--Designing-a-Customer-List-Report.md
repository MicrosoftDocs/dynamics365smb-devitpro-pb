---
title: "Walkthrough: Designing a Customer List Report"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4fdf1f02-5039-444e-aa8e-ac7b9b206629
caps.latest.revision: 47
---
# Walkthrough: Designing a Customer List Report
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], creating new reports is divided into the following phases:  

-   Defining the dataset on which the report is based.  

-   Designing and editing the visual layout of the report by using Visual Studio Report Designer.  

## About This Walkthrough  
 This walkthrough provides an overview of how to create a report that is based on one table with [!INCLUDE[navnow](includes/navnow_md.md)] and design this report using Visual Studio Report Designer. This walkthrough illustrates the following tasks:  

-   Create a report in [!INCLUDE[navnow](includes/navnow_md.md)].  

-   Apply sorting criteria and filters on the report in [!INCLUDE[navnow](includes/navnow_md.md)].  

-   Design the layout of the report in Visual Studio.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnow](includes/navnow_md.md)] with a developer license.  

-   The CRONUS International Ltd. demo data company.  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Defining the Dataset  
 When you create a new report, you must define where the data that the report will display should come from. You define the dataset in [!INCLUDE[navnow](includes/navnow_md.md)] Report Dataset Designer.  

#### To define the dataset  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**, and then choose the **New** button to open the **Report Dataset Designer**.  

3.  In the first row, in the **Data Source** field, choose the **AssistEdit** button. In the **Table List** window, select table 18, **Customer**, and then choose the **OK** button.  

4.  In **Report Dataset Designer**, on the first row, verify that the **Data Type** column is set to **DataItem**.  

5.  On the **View** menu, choose **Field Menu**.  

6.  In the **Field Menu** window, select the **No.**, **Name**, **Address**, **Phone No.**, and **Country/Region Code** fields, and then choose the **OK** button.  

     You can select multiple items by holding down the Ctrl key while you select.  

7.  When prompted to add these fields, choose **Yes**.  

8.  On the **File** menu, choose **Save As**.  

9. In the **Save As** dialog box, in the **ID** field, enter **55551**, and in the **Name** text box, enter **Customer List**.  

10. Make sure the **Compile** check box is selected and choose the **OK** button.  

## Applying Sorting Criteria and Filters  
 Next, you will set the sorting criteria and filters that you want to use in the report. This report will sort the customers in ascending order by customer number. You will also provide filters on the request page that will enable users to filter the data based on the **No.** and **Country/Region code**.  

#### To set the report properties  

1.  In Report Dataset Designer, select the **DataItem** row.  

2.  On the **View** menu, choose **Properties**.  

3.  In the **Properties** window, select the **DataItemTableView** property, and then, to open the **Table View** property window, choose the **Value** field.  

4.  In the **Table View** window, fill in the fields as shown in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Key**|Specify the field to sort the data items by, in this case the **No.** field.|  
    |**Order**|Specify the sort order, in this case **Ascending**.|  

5.  Choose the **OK** button.  

     You will now add filters to the request page that will enable users to filter the data based on the **No.** or **Country/Region Code**, or both by default.  

6.  In the **Properties** window for the **Customer** data item, select the **ReqFilterFields** property, and then choose the **Value** field to open the **Field List** property window.  

7.  In the **Field List** window, specify the two fields that the data can be filtered by as shown in the following table.  

    |Field|  
    |-----------|  
    |**No**|  
    |**Country/Region Code**|  

8.  Choose the **OK** button.  

9. On the **File** menu, choose **Save**.  

10. In the **Save** window, make sure **Compile** is selected, and then choose the **OK** button.  

11. Close the **Properties** window.  

## Designing the Report Layout  
 After you have saved and compiled the report in Report Dataset Designer, you must design the layout in Visual Studio. For this report, you will display all the fields that you selected, and display the company name in a larger font and set it to bold. You will also display the date, time, and username of the person who runs the report.  

#### To design the layout of the report  

1.  On the **View** menu, choose **Layout**.  

     The report opens in Visual Studio. The report layout is empty.  

2.  In Visual Studio, on the **View** menu, choose **Toolbox** to open the toolbox.  

3.  From the **Toolbox**, drag a **Table** control to the report layout.  

     The table has only three columns, therefore, you will add two more columns to accommodate all the fields in the dataset.  

4.  Select the third column, open the shortcut menu, choose **Insert Column**, and then choose **Right** to add a new column. Repeat to add another column.  

     The next step is to populate the table with the data from the dataset.  

#### To populate the list with data from the dataset  

1.  On the **View** menu, choose **Report Data**.  

2.  In the **Report Data** window, under **Datasets**, and under **DataSet\_Result**, select each field and drag them from the dataset to the second row of the **Data** section of the report layout as described in the following table.  

    |Field|Column|  
    |-----------|------------|  
    |**No\_Customer**|First|  
    |**Name\_Customer**|Second|  
    |**Address\_Customer**|Third|  
    |**PhoneNo\_Customer**|Fourth|  
    |**CountryRegionCode\_Customer**|Fifth|  

3.  From the Toolbox, drag three text boxes and put them above the table in the report designer. These text boxes will display the date and time, the username, and the company name.  

4.  Select the first text box, open the shortcut menu, and then choose **Expression** to open the **Expression Properties** window.  

5.  Under **Category**, choose **Built-in Fields**, double-click **ExecutionTime**, and then choose the **OK** button.  

     This expression displays the time the report was executed.  

6.  Select the second text box, open the shortcut menu, and then choose **Expression** to open the **Expression Properties** window.  

7.  Under **Category**, choose **Built-in Fields**, double-click **UserID**, and then choose the **OK** button.  

     This expression displays the user ID of the user who runs the report.  

8.  Select the third text box, open the shortcut menu, and then choose **Text Box Properties** to open the **Text Box Properties** window.  

9. On the **General** tab, in the **Value** field, enter the company name. For this walkthrough, you can enter **CRONUS International Ltd.**.  

10. In the **Textbox Properties** window, on the **Font** tab, set the font size to a larger font, such as **14pt**, and under **Style**, select **Bold**, and then choose the **OK** button.  

     You will format the text boxes for the field captions in the table to display in bold font.  

11. On the report layout, resize the three text boxes to an appropriate size.  

12. Select the **No Customer** caption text box, and choose **Text Box Properties** to open the properties window.  

13. On the **General** tab, in the **Value** field, change the value to **Customer No**.  

14. On the **Font** tab, and under **Style**, select **Bold**, and then choose the **OK** button.  

15. Set the remaining caption text boxes to bold.  

16. Save the Report.rdlc file, and then close Visual Studio.  

## Loading the Design Changes from Visual Studio and Running the Report  
 Now you will load the changes that you made in Visual Studio to [!INCLUDE[navnow](includes/navnow_md.md)] to apply the changes to the Customer List report.  

#### To load the design changes from Visual Studio and run the report  

1.  In [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], close Report Dataset Designer. A message informs you that the .rdlc file for this report has changed and asks if you want to load the changes. Choose **Yes** to save the changes in the database.  

2.  In the **Save Changes** window, make sure **Compile** is selected, and then choose **Yes** to save the report.  

3.  In Object Designer, select the report \(55551\) and choose **Run**. The request page is displayed.  

4.  In the request page, on the **Customer** tab, set the **Country/Region Code** filter to a country/region code and choose **Preview** to view the report. The report displays all the customers in the country/region code you selected.  

     You can filter the report by **No.** or **Country/Region Code** or both.  

## Next Step  

-   Now you have created a report that lists customers by customer number or country/region code, and you have added changes to the report layout in Visual Studio. The next step is to add the customer list report to a page in the [!INCLUDE[rtc](includes/rtc_md.md)] from where it can be run. For more information, see [How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md).  

## See Also  
 [How to: Make a Report Available from a Page](How-to--Make-a-Report-Available-from-a-Page.md)   
 [Walkthrough: Creating a Link from a Report to a Page](Walkthrough--Creating-a-Link-from-a-Report-to-a-Page.md)   
 [Walkthrough: Designing a Report with Images, Interactive Sorting, and Visibility Toggle](Walkthrough--Designing-a-Report-with-Images--Interactive-Sorting--and-Visibility-Toggle.md)
