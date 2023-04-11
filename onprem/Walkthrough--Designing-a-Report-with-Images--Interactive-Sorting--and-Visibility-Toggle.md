---
title: "Walkthrough: Designing a Report with Images, Interactive Sorting, and Visibility Toggle"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c39cb1dd-2c05-4831-af09-765ce9d078a0
caps.latest.revision: 36
---
# Walkthrough: Designing a Report with Images, Interactive Sorting, and Visibility Toggle
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], creating new reports is divided into the following phases:  

-   Defining the data model on which the report is based.  

-   Defining grouping and totaling for the report.  

-   Designing the visual layout of the report.  

 With [!INCLUDE[navnow](includes/navnow_md.md)], you can use Visual Studio Report Designer to design and modify the visual layout of a report.  

## About This Walkthrough  
 This walkthrough provides an overview of how to create a report that displays images, allows interactive sorting, and provides visibility toggling. This walkthrough illustrates the following tasks:  

-   Defining the data model in [!INCLUDE[navnow](includes/navnow_md.md)].  

-   Designing the report layout and adding an image using Visual Studio Report Designer.  

-   Synchronizing the report layout with [!INCLUDE[navnow](includes/navnow_md.md)] and running the report.  

-   Applying interactive sorting to the report layout using Visual Studio Report Designer.  

-   Resynchronizing the report layout with [!INCLUDE[navnow](includes/navnow_md.md)] and running the report.  

 For more information about how to design the layout of a report by using Visual Studio, see [Defining a Report Layout \(Visual Studio Report Designer\)](https://go.microsoft.com/fwlink/?LinkID=133192).  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnow](includes/navnow_md.md)] with a developer license.  

-   The CRONUS International Ltd. demo data company.  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Defining the Data Model  
 When you create a new report, you must define where the data that the report will display should come from. You define the data model in [!INCLUDE[navnow](includes/navnow_md.md)].  

#### To define the data model  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Report**, and then choose **New** to open the **Report Dataset Designer** window.  

3.  In the first row, in the **Data Source** field, select table 27, choose the **AssistEdit** button. In the **Table List** window, select table 27, **Item** , and then choose the **OK** button.  

4.  In **Report Dataset Designer**, on the first row, verify that the **Data Type** column is set to **DataItem**.  

5.  On the **View** menu, choose **Field Menu**.  

6.  In the **Field Menu** window, select the **No.**, **Description**, and **Picture** fields, and then choose the **OK** button.  

     You can select multiple items by holding down the Ctrl key while you select.  

7.  When prompted to add these fields, choose **Yes**.  

8.  On the **File** menu, choose **Save As**.  

9. In the **Save As** dialog box, in the **ID** field, enter **50000**, and then in the **Name** text box, enter **ItemReport**.  

10. Make sure **Compile** is selected, and then choose the **OK** button.  

## Designing the Report Layout and Adding an Image  
 Now that you have defined the data model for the report in [!INCLUDE[navnow](includes/navnow_md.md)], you can design and refine the layout in Visual Studio.  

#### To design the report layout and add an image in Visual Studio  

1.  On the **View** menu, choose **Layout**.  

     The report opens in Visual Studio. The report layout is empty.  

2.  In Visual Studio, on the **View** menu, choose **Toolbox** to open the toolbox.  

3.  From the **Toolbox**, drag a **Table** control to the report designer.  

4.  On the **View** menu, choose **Report Data**. The **Report Data** window opens.  

5.  From the **Report Data** window, under **Datasets**, and under **DataSet\_Result**, drag the **No\_Item** field to the first column, second row of the table in the **Data** section of the report layout.  

6.  Under **Datasets**, and under **DataSet\_Result**, drag the **Description\_Item** field to the second column and second row of the table in the **Data** section.  

7.  From the **Toolbox**, drag an **Image** control to the third column, second row of the table. The **Image Properties** window opens.  

8.  In the **Image Properties** window, on the **General** tab, in the **Select the image source**, choose **Database**.  

     When you change the source, the values in the MIMEType property change.  

    |Property|Setting|  
    |--------------|-------------|  
    |Source \(On the **General** tab, under **Select the image source**\)|Database|  
    |Value \(On the **General** tab, under **Use this field**\)|\[Picture\_Item\] **Note:**  This is the **Name** of the Item.Picture column in Report Dataset Designer.|  
    |MIMEType \(On the **General** tab, under **Use this MIME Type**\)|image\\bmp|  

9. On the General tab, in the **Use this field** field, choose **ƒx** to open the expression window for the picture field and then verify that the **Set expression for: value** text box contains the following value: **=Fields\!Picture\_Item.Value**. Choose the **OK** button to close the windows.  

10. In the **Image Properties** window, on the **General** tab, in the **Use this MIME type** field, choose **image/bmp**.  

     This value is only available if the image source is set to **Database**.  

11. Optionally, resize the data row of the table to the appropriate size for the pictures.  

12. In the third column, first row of the table, enter **Picture**. This is the caption of the column.  

13. In the **File** menu, choose **Save Report.rdlc**, and then close Visual Studio.  

## Synchronizing and Running the Report  
 Now you will load the changes that you made in Visual Studio to [!INCLUDE[navnow](includes/navnow_md.md)] to synchronize the two versions of the ItemReport.  

#### To synchronize and run the report  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], close **ItemReport** in Report Dataset Designer. A message informs you that the .rdlc file for this report has changed and asks if you want to load the changes. Choose **Yes** to save the changes in the database.  

2.  In the **Save Changes** window, make sure **Compile** is selected and then choose **Yes** to save the report.  

3.  In the Object Designer, select the report \(50000\) and choose **Run**.  

4.  Choose **Preview** to view the report. The report displays all in the items table.  

5.  Close the report and run the report again.  

6.  You can filter the report to only view items that have a picture associated with them by setting a filter for picture field.  

     In the request page for the **Item Report**, under **Show results**, choose **Add Filter**. In the **Where** drop-down list box, select **Picture**, and in the **Enter Value** text box, enter **1**. Choose **Preview**. Now, only items that have pictures are displayed.  

7.  Close the report.  

## Setting Up Interactive Sorting and Visibility Toggle  
 Now you will add interactive sorting to the **ItemReport**. Interactive sorting will enable users to interactively change the sort order for the data columns. By using the sort control button in the column header on the report, the user can change the sort order between ascending and descending.  

#### To set up interactive sorting and visibility toggle  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Object Designer, select the **ItemReport** report and then choose **Design** to open it in Report Dataset Designer.  

2.  On the **View** menu, choose **Layout**. The report opens in Visual Studio.  

3.  Select the **No Item** text box in the first row, first column, open the shortcut menu, and then choose **Text Box Properties**.  

4.  In the **Text Box Properties** window, choose the **Interactive Sorting** tab.  

5.  Select the **Enable interactive sort action for this text box** check box.  

6.  In the **Sort by** drop-down list box, select **\[No\_Item\]** from the list, choose **ƒx** to open the expression window, and then verify that the **Set expression for: SortExpression** text box contains the following value: **=Fields\!No.Item.Value**. Choose the **OK** button.  

7.  Choose **OK** to close the **Change interactive sort options for this text box** window.  

8.  Select the **Description\_Item** text box in the first row, second column, open the shortcut menu, and then choose **Text Box Properties**.  

9. In the **Text Box Properties** window, choose the **Interactive Sorting** tab.  

10. Select the **Enable interactive sort action for this text box** check box.  

11. In the **Sort by** drop-down list box, select **\[Description\_Item\]** from the list, choose **ƒx** to open the **Expression** window, and then verify that the **Set expression for: SortExpression** text contains the following value: **=Fields\!Description\_Item.Value**. Choose the **OK** button.  

12. Choose **OK** to close the **Text Box Properties** window.  

13. Open the shortcut menu for the **Image** field in the second row, third column, and select **Image Properties**.  

14. In the **Image Properties** window, on the **Visibility** tab, select the **Display can be toggled by this report item** check box, and then, in the field, choose **Textbox1**.  

15. Choose the **OK** button.  

16. On the **File** menu, choose **Save Report.rdlc** and close Visual Studio.  

## Resynchronizing and Running the Report  
 After you have applied the latest changes to the report in Visual Studio, you will load the changes that you made in [!INCLUDE[navnow](includes/navnow_md.md)] to synchronize the two versions of the **ItemReport**. After the changes have been loaded, you can run the report to see the interactive sorting functionality.  

#### To resynchronize and run the report  

1.  Switch to the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  

2.  If the **ItemReport** report is open in Report Dataset Designer, then close it. A message informs you that the .rdlc file for this report has changed and asks if you want to load the changes. Choose **Yes** to save the changes in the database.  

3.  In the **Save Changes** window, make sure **Compile** is selected and choose **Yes** to save the report.  

4.  In Object Designer, select the report, and then choose **Run**.  

     Alternatively, you can run the report using the **DynamicsNAV:////runreport?report=50000** command from the Windows start menu.  

5.  Choose **Preview** to view the report. You can use interactive sorting for the **No Item** and **Description Item** columns. You can also collapse each item to hide the picture.  

## See Also  
 [Report Design Walkthroughs](Report-Design-Walkthroughs.md)
