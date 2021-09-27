---
title: "Walkthrough: Combining Data from Microsoft Dynamics NAV Queries and Pages with Data from Azure DataMarket (OData)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0b5f1e2c-b748-48e2-b201-bc3b02ffe3e1
caps.latest.revision: 28
manager: edupont
---
# Walkthrough: Combining Data from Microsoft Dynamics NAV Queries and Pages with Data from Azure DataMarket (OData)
This walkthrough describes how you can use OData to combine data from [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] with data from Microsoft Azure Markeplace.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] query.  
  
-   Publishing your query as a web service.  
  
-   Publishing a page as a web service.  
  
-   Verifying the availability of the web services that use a browser.  
  
-   Using the PowerPivot add-in for Excel to import data from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services as new worksheets.  
  
-   Connecting to demographic data available from Azure Marketplace.  
  
-   Creating a pivot table in Excel that combines [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data with data from Azure Marketplace.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] with a developer license.  
  
-   [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
-   Microsoft Excel 2013 with Microsoft PowerPivot enabled, or Microsoft Excel 2010 with the PowerPivot add-in for Excel 2010 installed. For more information, see [PowerPivot Download Page](https://go.microsoft.com/fwlink/?LinkId=200002).  
  
-   A Microsoft account for accessing data from Azure Marketplace. For more information about Microsoft account, see the [What is a Microsoft account?](https://go.microsoft.com/fwlink/?LinkId=271494). To obtain a Microsoft account, go to the [sign-up page](https://go.microsoft.com/fwlink/?LinkId=271493).  
  
## Story  
 Victor, the business system developer at [!INCLUDE[demoname](../developer/includes/demoname_md.md)], has been asked by his manager Tim to create a data visualization that will show total sales to customers in different countries/regions, and how those countries/regions align with Key Development Indicators, which are a measure of national/regional affluence. Tim tells Victor that he can find information about Key Development Indicators on zure Marketplace. Victor assesses the assignment and decides that he can use OData web services to bring [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data to Excel, where he can merge it with economic data from Azure Marketplace.  
  
## Creating a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Query  
 You create a query to capture data about sales to individual customers.  
  
> [!NOTE]  
>  For more information about how to create more advanced queries that combine data from multiple [!INCLUDE[prodshort](../developer/includes/prodshort.md)] pages, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md), [Walkthrough: Creating a Query That Uses a Totaling Method and Sorting](Walkthrough--Creating-a-Query-That-Uses-a-Totaling-Method-and-Sorting.md), or [Walkthrough: Creating a Query to Link Three Tables](Walkthrough--Creating-a-Query-to-Link-Three-Tables.md).  
  
#### To create a query to capture data about sales to customers  
  
1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Query**, and then choose **New**.  
  
3.  In Query Designer, on the first line, in the **Data Type** column, choose **DataItem** from the drop-down list box.  
  
4.  In the **Data Source** column, choose the **Lookup** button, choose the **Sales Line** table from the **Table List** window, and then choose the **OK** button.  
  
5.  On the **View** menu, choose **Field Menu**.  
  
6.  Select the following fields. To select multiple fields, hold down the Ctrl key and select all relevant lines.  
  
    -   Document Type  
  
    -   Sell-to Customer No.  
  
    -   Document No.  
  
    -   No.  
  
    -   Quantity  
  
    -   Amount  
  
7.  Choose the **OK** button. When prompted, “Do you want to add the fields that are selected in the field menu?”, choose the **Yes** button.  
  
     You should see the following in Query Designer.  
  
     ![SalesOrderInfo query definition.](media/SalesOrderInfoQuery.JPG "SalesOrderInfoQuery")  
  
8.  On the **File** menu, choose **Save**.  
  
9. In the **Save As** window, in the **ID** field, enter **50005**. In the **Name** field, enter **SalesOrderInfo**. Verify that the **Compiled** check box is selected, and then choose the **OK** button.  
  
    > [!NOTE]  
    >  If **50005** is already being used by another query, you will get an error when you try to save the query. If so, use another ID.  
  
10. In Object Designer, choose query 50005, and then choose **Run**. When you run a query, you can view the data in the dataset.  
  
     ![SalesOrderInfo query result.](media/SalesOrderInfoWithData.JPG "SalesOrderInfoWithData")  
  
11. Close Query Designer and the development environment.  
  
## Publishing a Query and a Page as Web Services  
 You register and publish a web service by using the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)].  
  
1.  In the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] in the **Search** box, enter **Web services**, and then choose **Web Services**.  
  
     The **Web Services** page opens.  
  
2.  In the **Web Services** page, choose **New**.  
  
     The **New - Web Services** page opens.  
  
3.  In the **Object Type** column, select **Page**. In the **Object ID** column, enter **21**, and then in the **Service Name** column, enter **Customer**.  
  
4.  Select the **Published** column.  
  
5.  Press the Tab key to move the pointer to a new line in the **New – Web Services** page.  
  
6.  In the **Object Type** column, select **Query**. In the **Object ID** column, enter **50005**, and then in the **Service Name** column, enter **SalesOrderInfo**.  
  
7.  Select the **Published** column.  
  
8.  Choose the **OK** button to exit the **New – Web Services** page.  
  
## Verifying Web Service Availability  
 You should verify that the web services that you just created are available over the Internet. When exposing a web service, you must open the port for consumers of your web service to access it. If necessary, have your system administrator add the port through Windows Firewall on the computer that is running [!INCLUDE[server](../developer/includes/server.md)]. The default port for OData web services is 7048 and can be configured by using [!INCLUDE[admintool](../developer/includes/admintool.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
#### To verify web service availability  
  
1.  Start Internet Explorer.  
  
2.  In the **Address** field, enter a URI in this format: **https://\<Server>:\<WebServicePort>/\<ServerInstance>/OData**.  
  
     For example:**https://localhost:7048/DynamicsNAV72/OData**  
  
     The browser should now show the web services that you have published, in the format of an AtomPub document.  
  
     ![Two web services.](media/TwoWebServices.JPG "TwoWebServices")  
  
    > [!IMPORTANT]  
    >  You may want to modify your Internet Explorer settings to display the actual XML for a feed instead of the feed content that has changed. Choose **Internet Options**, choose **Content**, choose **Feeds and Web Slices**, and then clear the **Turn on feed reading view** check box. Restart Internet Explorer to enable the new setting.  
  
## Importing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data into Excel  
 In this procedure, you import [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web service data into Excel.  
  
#### To import [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data into Excel  
  
1.  Start Microsoft Excel. In Excel, on the **PowerPivot** tab, in the **Data Model** group, choose **Manage** to open the **PowerPivot Window**.  
  
2.  In PowerPivot, on the **Home** tab, choose **Get External Data**, choose **From Data Service**, and then choose **From OData Data Feed**.  
  
3.  In the **Data Feed Url** field, enter the OData URI, such as **https://localhost:7048/DynamicsNAV72/OData**. Choose the **Next** button.  
  
4.  Verify that **Customer** and **SalesOrderInfo** appear in the **Source Table** column. Place a check mark in the left column next to these two rows, and then choose **Finish**.  
  
5.  After you see the **Success** message, choose the **Close** button.  
  
 You should now see data from the Customer page and the SalesOrderInfo query displayed as Excel workbooks. You can switch between pages using the tabs at the bottom of the Excel window.  
  
## Enhancing the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data by Adding a Column  
 Examine the SalesOrderInfo workbook in Excel. Notice that it has a Quantity column and an Amount column. In your final output you may want to show total sales per company, this is the Quantity multiplied by Amount. An easy way to achieve that is to add a column to the workbook that calculates that product.  
  
#### To enhance [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data by adding a column  
  
1.  In the SalesOrderInfo workbook, choose **Add Column**, which is on the right side of the last data column.  
  
2.  Move the pointer down to the first cell in the new column and type an equal sign \(**=**\).  
  
     This indicates that you are creating a formula.  
  
3.  Click the header row of the **Quantity** column.  
  
     This starts to build your formula.  
  
    ```  
    =SalesOrderInfo[Quantity]  
    ```  
  
4.  Type an asterisk \(\*\) at the end of the formula to indicate multiplication.  
  
5.  Click the header row of the **Amount** column.  
  
     This completes the formula.  
  
    ```  
    =SalesOrderInfo[Quantity]*SalesOrderInfo[Amount]  
    ```  
  
    > [!NOTE]  
    >  If you prefer, you can type the complete formula instead of clicking the header row.  
  
6.  Press Return to indicate that the formula is finished.  
  
7.  Right-click the header of **CalculatedColumn1** and choose **Rename Column**.  
  
8.  Type **QuantityByAmount** as the new column name.  
  
9. Save the modified SalesOrderInfo workbook.  
  
## Importing Data from Azure Marketplace  
 The Azure Marketplace is an online market where you can buy and sell finished Software as a Service \(SaaS\) applications and premium datasets. The Azure Marketplace offers many different kinds of data, including demographic, environment, financial, retail, and sports data. In this walkthrough, you use demographic data about development standards in different countries and regions.  
  
#### To import data from Azure DataMarket  
  
1.  In PowerPivot, on the **Home** tab, in the **Get External Data**, choose **From Data Service**, and then choose **From \(Windows\) Azure Marketplace**.  
  
     This opens a web page titled Microsoft Azure Marketplace Catalog which shows the available Azure Marketplace datasets.  
  
2.  Choose **My Data** and use your Microsoft account to create a free Azure Marketplace account.  
  
3.  After you are signed up, choose **Data** to return to the list of available datasets.  
  
4.  In the left panel, choose **Free**, choose **Demographics**, and then scroll down to choose **World Development Indicators**.  
  
5.  Read about the dataset, and then choose **SIGN UP** to subscribe to this data feed. On the **Subscription** page, choose **SIGN UP** again.  
  
6.  On the **Thank You** page, choose **Explore This Dataset**.  
  
     This takes you to a **Build Your Query** page. In the Build Query area on the right side, verify these values:  
  
    -   **Query**: GetCountries  
  
    -   **Format**: Atom  
  
    -   **Language Code**: en  
  
7.  Choose the **Run Query** button.  
  
     You now see a view of the table data. Notice that the table contains two-letter country/region codes, country/region names, and additional data about the countries/regions listed. This data has enough in common with your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data to support a link between the two.  
  
8.  Choose **Export** from the narrow column on the right side of the page. Choose **Excel PowerPivot**, and then choose **Download**.  
  
     In response to the question, **Do you want to open or save ServiceQuery.atomsvc from datamarket.azure.com?**, choose **Open**.  
  
9. In Excel, a dialog box prompts that you select a workbook to import the atom feed to.  
  
     ![Small PowerPivot dialog box.](media/SmallPowerPivotdialogbox.JPG "SmallPowerPivotdialogbox")  
  
     Choose the **OK** button.  
  
10. You are now back in the **Table Import Wizard**. The only thing that you need to set up is your account key.  
  
     Next to the **Account key** field, choose **Find**.  
  
11. Copy the default account key value from the web page.  
  
12. Switch back to the **Table Wizard** and paste the key in the **Account key** field.  
  
13. Choose the **Next** button.  
  
14. Choose the **Finish** button.  
  
15. Choose the **Close** button.  
  
 You now have three workbooks in PowerPivot:  
  
-   **Customer**, which has data from a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page.  
  
-   **SalesOrderInfo**, which has data from a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] query.  
  
-   **World Development Indicators**, which has data from Azure Marketplace.  
  
 These are the data sources that you will work with to create your pivot table.  
  
## Creating Relationships Between Data Sources  
 By creating relationships between your data sources in Excel, you make it possible to display data from multiple sources in the same pivot table.  
  
 Start by creating a relationship between the two [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data sources: the **Customer** page and the **SalesOrderInfo** query. Both sources have a column that identifies the customer number, so this link is straightforward.  
  
 Then create a relationship between the respective columns on the **Customer** tab and on the **World Development Indicators** tab that use two-letter abbreviations to identify countries/regions.  
  
#### To create relationships between data sources  
  
1.  Go to the **SalesOrderInfo** tab in PowerPivot for Excel, right-click the header row for the **Sell\_to\_Customer\_No** column, and then from the list of commands, select **Create Relationship**.  
  
     ![Creating a relationship between two data sources.](media/SellToWithRelationship.JPG "SellToWithRelationship")  
  
2.  In the **Create Relationship** dialog box, in the **Related Lookup Table** field, choose **Customer**.  
  
3.  In the **Related Lookup Column** field, choose **No**.  
  
4.  Choose the **Create** button.  
  
5.  In PowerPivot for Excel, go to the **Customer** tab, right-click the header row for the **Country\_Region\_Code** column, and from the list of commands, select **Create Relationship**.  
  
6.  In the **Create Relationship** dialog box, in the **Related Lookup Table** field, choose **World Development Indicators**.  
  
7.  In the **Related Lookup Column** field, choose **CodeIso2Letter**.  
  
8.  Choose the **Create** button.  
  
## Building a Pivot Table  
 All your previous work comes together as you build a pivot table to integrate data from your sources. Building a pivot table is a way to select and arrange data so that you can highlight and focus on key elements.  
  
#### To build a pivot table  
  
1.  In the PowerPivot ribbon, choose **PivotTable** and then, in the list of commands, choose **PivotTable** again.  
  
     ![PivotTable from the PivotTable menu.](media/Pivot2.JPG "Pivot2")  
  
2.  In the **Create Pivot Table** dialog box, choose the **OK** button to accept the default, **New Worksheet**.  
  
     The pivot table window opens. The **PowerPivot Field List** on the right side lists all of the available columns in all of your data sources.  
  
3.  In the **PowerPivot Field List**, choose **Country\_Region\_Code** from the **Customer** field.  
  
    > [!TIP]  
    >  To quickly find a field in the field list, type part or all of the field name in the **Search** box that is above the list of fields, and then press Enter to highlight the first field that contains the text. You can then choose the right arrow to proceed to the next field, and so on.  
  
4.  In the **Customer** field, choose **No**.  
  
5.  In the **SalesOrderInfo** list, choose **QuantityByAmount**.  
  
     PowerPivot automatically assigns these values to categories in the pivot table. **Country\_Region\_Code** and **No** are categorized as row labels, and **QuantityByAmount** as a sum.  
  
     ![Adding fields to the PivotTable.](media/PivotFields1.JPG "PivotFields1")  
  
     You can design a pivot table by moving values from one to list to another, configuring items in a list, or moving items up or down in a list.  
  
     Here is what the pivot table looks like at this point. Customers are arranged by country/region, with total sales amounts.  
  
     ![PivotTable, first look.](media/PivotTable1.JPG "PivotTable1")  
  
6.  One enhancement is to replace the **Country\_Region\_Code** with the actual name of the country/region, which is available as a field in the **World Development Indicators** field.  
  
     Choose **Name** from the **World Development Indicators** field.  
  
7.  Clear the **Country\_Region\_Code** from the **Customer** field.  
  
8.  Move **Name** up to the top of the **Row Labels** list.  
  
     ![Move Name up.](media/MoveName.JPG "MoveName")  
  
9. Choose **RegionName** from the **World Development Indicators** field, and then move it to the top of the **Row Labels** list.  
  
10. Choose **IncomeLevelName** from the **World Development Indicators** field and then move it to second position in the **Row Labels** list.  
  
     This completes the list of fields. The final list looks like this.  
  
     ![Final pivot field list.](media/FinalPivotListing.JPG "FinalPivotListing")  
  
     The actual pivot table looks like this.  
  
     ![Final pivot table.](media/FinalPivotTabl.JPG "FinalPivotTabl")  
  
11. Save the pivot table as **Customers by Economic Region.xlsx**.  
  
## Next Steps  
 Viktor’s results show that all customers are in countries/regions that are categorized as “High income.” For a different result, open page 22 Customer List in the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] and reassign some companies to countries/regions that are in other income level categories. Then do the following:  
  
1.  Go the Customer workbook in PowerPivot, choose **Refresh**, and then choose **Refresh All**.  
  
2.  Go to your pivot table, choose **Refresh All**, and then choose **Refresh All**.  
  
 Now the final pivot table has a different result, as shown in the following example.  
  
 ![Final pivot table after modification.](media/FinalPivotDoctor.JPG "FinalPivotDoctor")  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)   
 [Web Services Best Practices](Web-Services-Best-Practices.md)   
 [Web Services](Web-Services.md)