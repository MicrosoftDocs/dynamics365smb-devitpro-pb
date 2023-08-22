---
title: "Walkthrough: Exporting Data from Tables to CSV Files"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8f4088b4-2834-45be-ad55-ce31d0e52db7
caps.latest.revision: 10
---
# Walkthrough: Exporting Data from Tables to CSV Files
XMLports are used to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database to a file or import data from a file to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The file format can be an XML file, text file, or a comma separated value \(CSV\) file. Exporting data from your [!INCLUDE[navnow](includes/navnow_md.md)] database into one of these file formats enables seamless exchange of information between different computer systems. In this walkthrough, you will export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database to a CSV file. For information about how to export data to XML file format, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md).  
  
 XMLports can be called and run from codeunits or run from Object Designer. In this walkthrough, you will run the XMLport in Object Designer. For information about how to run XMLports from codeunit, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md).  
  
## About This Walkthrough  
 This walkthrough shows you how to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] table to a CSV file. This walkthrough illustrates the following tasks:  
  
-   Designing an XMLport that exports data from a database to a CSV file.  
  
-   Compiling and saving the XMLport.  
  
-   Running the XMLport in Object Designer.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnow](includes/navnow_md.md)] installed with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)] installed.  
  
## Story  
 Viktor, a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] has been asked to export records from the **Item** table to a CSV file. The records will include only the **No.**, **Description**, **Shelf Number**, and **Unit price** fields. The information will be shared with other colleagues who work on a different computer system. The CSV file can be used by any computer system in the company. Viktor can use XMLports to convert the records in the table to a CSV file format that can easily be shared with colleagues.  
  
## Designing the XMLport  
 You create an XMLport by designing it in XMLport Designer and setting the properties. You define the table and fields that you want to export in XMLport Designer. You then compile and save the XMLport.  
  
#### To create the XMLport  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **XMLport**, and then choose **New** to open a new XMLport Designer.  
  
3.  In XMLport Designer, select an empty row.  
  
4.  On the **View** menu, choose **Properties** to open the **XMLport-Properties** window.  
  
5.  In the **XMLport-Properties** window, locate the [Direction Property](Direction-Property.md), choose the arrow in the value column, and then set the **Value** column to **Export**.  
  
6.  In the **XMLport-Properties** window, locate the [Format Property \(XMLports\)](Format-Property--XMLports-.md) property, and then set the **Value** column to **Variable Text**.  
  
    > [!WARNING]  
    >  When you export variable text files, the text in the fields will use as much space as needed to hold the all of the text.  
  
7.  Verify that the [FieldDelimiter Property](FieldDelimiter-Property.md) is set to a quotation mark \(“\). This character marks the start and the end of each field. This is the default field delimiter.  
  
8.  Verify that the [FieldSeparator Property](FieldSeparator-Property.md) is set to a comma \(,\). This is the default field separator.  
  
9. Accept the default value for the [RecordSeparator Property](RecordSeparator-Property.md). The default is a new line separator.  
  
     You can change the default values of the properties that you have just set to any character. However, for this walkthrough accept the default values.  
  
10. Close the **XMLport-Properties** window.  
  
11. In XMLport Designer, in the first row, in the **Node Name** column, enter **ItemsFile**.  
  
12. In the **Node Type** column, verify that **Element** is selected.  
  
13. In the **Source Type** column, verify that **Text** is selected. This node represents the start of the text file.  
  
14. In the second row, in the **Node Name** column, enter **Item**.  
  
15. In the **Node Type** column, verify that **Element** is selected.  
  
16. In the **Source Type** column, choose the drop-down arrow, and then select **Table**. This node represents a record in the **Item** table.  
  
17. In the **Data Source** column, choose the drop-down arrow, select the **Item** table \(27\) from the **Table List** window, and then choose the **OK** button. The data will be exported from the **Item** table.  
  
18. Select the **Item** row and then use the right arrow to indent the row one time to make it a subset of the **ItemsFile** element.  
  
     The next step is to select the fields that you want to export.  
  
19. In the next empty row below the **Item** row, in the **Node Type** column, select **Element**.  
  
20. In the **Source Type** column, select **Field**.  
  
21. In the **Data Source** column, choose the up arrow, select the **No.** field from the **Field Lookup** window, and then choose the **OK** button.  
  
22. In the **Node Name** column, enter a name for the field. For example, you can enter **No**. This column represents the fields in the record. You can enter any name but because of consistency you might want to enter the name of field that you select.  
  
    > [!NOTE]  
    >  The name that you enter in the **Node Name** column cannot contain spaces. White space in the name will create a compile error.  
  
23. Select the **No.** row and use the right arrow to indent the field one time to make it a subset of the **Item** element.  
  
24. Repeat steps 19 through 23 to select additional fields that you want to export. For this walkthrough you can select the following fields.  
  
    |Node Name|Node Type|Source Type|Data Source|  
    |---------------|---------------|-----------------|-----------------|  
    |No.|Element|Field|Item::No.|  
    |Description|Element|Field|Item::Description|  
    |ShelfNumber|Element|Field|Item::Shelf No.|  
    |UnitPrice|Element|Field|Item::Unit Price|  
  
25. On the **File** menu, choose **Save As**.  
  
26. In the **Save As** window, enter **50003** in the **ID** text box, and then enter **ItemsXMLport** in the **Name** text box. By default, this name will be used as the name of the file.  
  
27. Verify that **Compiled** is selected and then choose the **OK** button.  
  
28. Close XMLport Designer.  
  
## Running the XMLport  
 After the XMLport is created you run it in Object Designer  
  
#### To run the XMLport from Object Designer  
  
1.  In Object Designer, select the XMLport that you just created \(50003\), and then choose the **RUN** button. The **Edit-ItemsXMLport** page is displayed.  
  
2.  On the **Edit-ItemsXMLport** page, choose the **OK** button. The **Export File** dialog box is displayed.  
  
3.  In the **Export File** dialog box, choose the **Save** button. The **Export** window opens.  
  
4.  In the **Export** window, browse to the location on your computer where you want to save the file.  
  
5.  Verify that the **File name** text box is set to the name of your XMLport and then verify that in the **Save as type** drop-down box, **Text Files \(\*.txt,\*.csv\)** is selected.  
  
6.  Choose the **Save** button to export and save the file.  
  
    > [!NOTE]  
    >  On the **Edit-ItemsXMLport** request page, you can set filters to select specific records that you want to export.  
  
7.  After the export is complete, browse to the location where you saved the file and open it. Note that all the records in the table are separated by a new line and each field in the record is delimited by using quotation marks \( “\) and separated by a comma \(,\). Depending on the regional setting of the [!INCLUDE[nav_server](includes/nav_server_md.md)], the data in the unit price field may contain a comma. If you delimit the data in the fields, the data is easier to identify and read. You can change the field separator.  
  
     The following CSV file shows and example of the file that is exported from the **Item** table.  
  
    ```  
  
    "1000","Bicycle","F4","4,000.00"  
    "1001","Touring Bicycle","F5","4,000.00"  
    "1100","Front Wheel","F6","1,000.00"  
    "1110","Rim","F1","0.00"  
    "1120","Spokes","A1","0.00"  
    "1150","Front Hub","F7","500.00"  
    "1151","Axle Front Wheel","A2","0.00"  
    "1155","Socket Front","A3","0.00"  
    "1160","Tire","A4","0.00"  
    "1170","Tube","A5","0.00"  
    "1200","Back Wheel","F9","1,200.00"  
    "1250","Back Hub","F10","1,100.00"  
    "1251","Axle Back Wheel","A6","0.00"  
    ```  
  
## Next Steps  
 You might want to try importing a CSV file into the **Item** table. For information about how to import data into a database, see [Walkthrough: Inserting Data from XML Documents to Multiple Tables](Walkthrough--Inserting-Data-from-XML-Documents-to-Multiple-Tables.md).  
  
## See Also  
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)
