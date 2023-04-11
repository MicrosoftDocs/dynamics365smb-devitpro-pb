---
title: "Walkthrough: Importing Data from Text Files to Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 244bd4b3-172d-45cf-b346-cf61e7edf59a
caps.latest.revision: 9
---
# Walkthrough: Importing Data from Text Files to Tables
XMLports are used to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database to a file or import data from a file to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The file format can be an XML document, fixed width text file, or CSV \(Comma Separated Value\) file. Exporting or importing data by using these file formats enables seamless exchange of data between different computer systems. When importing files to a [!INCLUDE[navnow](includes/navnow_md.md)] database, you can replace an entire record or update specific fields in records that already exist in the database. You can also automatically save the data you are importing or you can manipulate the data in code before you save it.  
  
 In this walkthrough, you will import data from a fixed width text file to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The text file contains data will be used to update specific fields in an existing record. The data in text file will be automatically saved into the database. For information about how to export data to XML file format, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md). For information about how to export CSV files, see [Walkthrough: Exporting Data from Tables to CSV Files](Walkthrough--Exporting-Data-from-Tables-to-CSV-Files.md).  
  
 XMLports can be called and run from codeunits or run from Object Designer. In this walkthrough, you will run the XMLport from Object Designer. For information about how to run XMLports from codeunits, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md).  
  
## About This Walkthrough  
 This walkthrough shows you how to import data from a fixed width text file and update existing records in a [!INCLUDE[navnow](includes/navnow_md.md)] table. The walkthrough illustrates the following tasks:  
  
-   Designing an XMLport that imports data from a fixed width text file to a [!INCLUDE[navnow](includes/navnow_md.md)] table.  
  
-   Setting properties to update existing records.  
  
-   Compiling and saving the XMLport.  
  
-   Running the XMLport in Object Designer.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Story  
 Viktor is a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] Viktor’s manager has informed him that the marketing department has changed the unit price of the loud speakers in their inventory and requesting that the current unit prices in the database should be replaced with the new prices. The loud speaker information is located in the **Item** table. The marketing department provided the new prices in a text file. The file contains only item number values for the **No.** field, which is the primary key, and the new unit prices. The text file is in a fixed width text file format. Viktor’s task is to import the data in the text file into the Item table and update the unit price field. Viktor knows that he can accomplish the task by designing an XMLport that can import the data from the text file and set properties to update the existing record in the table.  
  
 The text file that the marking department provided resembles the following. You will use this file in the walkthrough.  
  
```  
  
LS-100      30.00  
LS-120      88.88  
LS-150      130.00  
LS-75       80.00  
LS-81       89.89  
LS-10PC     59.59  
```  
  
 The first column is the data in the **No.** field, and the second column is the data that will be used to update the **Unit Price** field. You can view and confirm the current prices for the loud speakers in the **Item** table before the records are updated. For information about how to view table data, see [How to: View and Sort Table Data](How-to--View-and-Sort-Table-Data.md).  
  
## Designing the XMLport  
 You create an XMLport by designing it in XMLport Designer and setting properties. You define the table and fields that you want to import data to in XMLport Designer. You then compile and save the XMLport.  
  
#### To create the XMLport  
  
1.  Copy and paste the text file into a text editor such as Notepad, give it a name, and save it on your computer.  
  
2.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
3.  In Object Designer, choose **XMLport**, and then choose the **New** button.  
  
4.  In XMLport Designer, in the first row, in the **Node Name** column, enter a name. You can enter any name but for this walkthrough you can enter **ItemPrices**.  
  
5.  In the **Node Type** column, verify that **Element** is selected.  
  
6.  In the **Source Type** column, verify that **Text** is selected. This node represents the start of the text file.  
  
7.  In the second row, in the **Node Name** column, enter **ItemRecord**.  
  
8.  In the **Node Type** column, verify that **Element** is selected.  
  
9. In the **Source Type** column, select **Table** from the drop-down list. This node represents a record in the **Item** table.  
  
10. In the **Data Source** column, choose the up arrow, select the **Item** table \(27\) from the **Table List** window and then choose the **OK** button. The data will be imported to the **Item** table.  
  
11. Select the **ItemRecord** row and use the right arrow button to indent the row one time to make it a subset of **ItemsPrice** element.  
  
     The next step is to select the fields that you want to import and update. The text file contains only data that belongs in the **No.** field and the **Unit Price** field, so you will select those two fields.  
  
12. In the next empty row under the **ItemRecord** row, in the **Node Type** column, select **Element**.  
  
13. In the **Source Type** column, select **Field**.  
  
14. In the **Data Source** column, choose the up arrow, select the **No.** field from the **Field Lookup** window, and then choose the **OK** button.  
  
15. In the **Node Name** column, enter a name for the field. For example, you can enter **No.**. This column represents the **No.** field in the record. You can enter any name but because of consistency you might want to enter the name of field that you select.  
  
    > [!NOTE]  
    >  The name that you enter in the **Node Name** column cannot contain spaces. White space in the name will result in a compile error.  
  
16. Select the **No.** row and use the right arrow button to indent the field one time to make it a subset of the **Item** element.  
  
17. In the next empty row under the **Item** row, in the **Node Type** column, select **Element**.  
  
18. In the **Source Type** column, select **Field**.  
  
19. In the **Data Source** column, choose the arrow, select the **Unit Price.** field from the **Field Lookup** window, and then choose the **OK** button.  
  
20. In the **Node Name** column, enter a name for the field. For example, you can enter **UnitPrice**.  
  
21. Verify that the **UnitPrice** row is indented one time to make it a subset of the **Item** element.  
  
### Setting Properties to Import and Update Data  
 The next step is to set properties for the XMLport and fields you want to update.  
  
##### To set properties  
  
1.  In Object Designer, select an empty row, and on the **View** menu, choose **Properties** to open the **XMLport-Properties** window.  
  
2.  In the **XMLport-Properties** window, locate the [Direction Property](Direction-Property.md), choose the arrow in the **Value** column and then set value to **Import**. This defines the XMLport to import.  
  
3.  In the **XMLport-Properties** window, locate the [Format Property \(XMLports\)](Format-Property--XMLports-.md) property, and then set the **Value** column to **Fixed Text**. Data in fixed width text files use a specified amount of space.  
  
4.  Select the **ItemRecord** row, and on the **View** menu, choose **Properties**.  
  
5.  In the **ItemRecord - Properties** window, locate the [AutoSave Property](AutoSave-Property.md), and then verify that the **Value** column is set to **Yes**. This allows the data to be automatically saved to the table.to the table.  
  
6.  Locate the [AutoUpdate Property](AutoUpdate-Property.md), and then set the **Value** column to **Yes**. This allows the data in the unit price field to be updated.  
  
7.  Select the **No.** row, and then on the **View** menu, choose **Properties**.  
  
8.  In the **No. - Properties** window, locate the [Width Property \(XMLport\)](Width-Property--XMLport-.md), and then set the **Value** column to **8**. This defines the width of the **No.** field in the file.  
  
9. Select the **UnitPrice** row, and on the **View** menu, choose **Properties**.  
  
10. In the **Unit Price - Properties** window, locate the [Width Property \(XMLport\)](Width-Property--XMLport-.md), and then set the Value column to **10**. This defines the width of the data in the file.  
  
    > [!NOTE]  
    >  The width that you enter must be equal or greater than the width of the data with most characters in the column. If the width of the data in the column is less than the width you specified, then the extra space is ignored.  
  
## Compiling and Saving the XMLport  
 After designing an XMLport, you must compile it, give it a name and ID, and then save it.  
  
#### To compile and save the XMLport  
  
1.  On the **File** menu, choose **Save As**.  
  
2.  In the **Save As** window, enter **50004** in the **ID** text box and then enter a name for the XMLport. For example, you can enter **NewItemPrice** in the **Name** text box.  
  
3.  Verify that the **Compiled** check box is selected and then choose the **OK** button.  
  
## Running the XMLport  
 In this walkthrough, you will run the XMLport from Object Designer and select the file you want to import from your computer.  
  
#### To run the XMLport from Object Designer  
  
1.  In Object Designer, select the XMLport you just created \(50003\), and then choose the **Run** button. The **Edit-NewItemPrice** page is displayed.  
  
2.  On the **Edit - NewItemPrice** page, choose the **OK** button. The **Import** window is displayed.  
  
3.  From the **Import** window, browse to the location on your computer where the file that you want to import is located.  
  
4.  Choose the file and then choose the **Open** button to import the file to the database.  
  
5.  Verify that the **Unit Price** fields in the records have been updated.  
  
    > [!NOTE]  
    >  You can write code in the [OnBeforeModifyRecord Trigger](OnBeforeModifyRecord-Trigger.md) in the C/AL code editor to indicate that the records have been updated.  
  
## Next Steps  
 You might want to try importing a CSV file or exporting a fixed width text file. For information about how to import CSV files, see [Walkthrough: Exporting Data from Tables to CSV Files](Walkthrough--Exporting-Data-from-Tables-to-CSV-Files.md).  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)   
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)
