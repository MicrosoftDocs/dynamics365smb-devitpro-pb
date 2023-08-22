---
title: "Walkthrough: Inserting Data from XML Documents to Multiple Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 25a6a189-fd8e-4324-9f29-88af759716db
caps.latest.revision: 23
---
# Walkthrough: Inserting Data from XML Documents to Multiple Tables
XMLports are used to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database to an XML document or import data from an XML document to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The data can be exported from or imported to multiple tables in the database. Exporting data from a [!INCLUDE[navnow](includes/navnow_md.md)] database into XML format enables seamless exchange of information between different computer systems. You only need a basic knowledge of XML to design and work with XMLports.  
  
 XMLports can be called and run from codeunits or run from Object Designer. In this walkthrough, you will create a codeunit to call and run the XMLport. When you create a codeunit, you define the **InStream** object that will import the data and the location where the XML document should be saved.  
  
## About this Walkthrough  
 This walkthrough shows you how to import data from a Sales Order XML document to a [!INCLUDE[navnow](includes/navnow_md.md)] database. The Sales Order XML document contains data that belongs in two different tables in the database because the tables have a header-line relationship. The data is inserted into the appropriate tables. This walkthrough illustrates the following tasks:  
  
-   Creating an XMLport.  
  
-   Creating the codeunit to insert the XML data.  
  
-   Running the XMLport.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Story  
 Simon is a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] A colleague in the Sales Department has shared Sales Order records with Simon. Simon has been asked to import the Sales Order records from an XML document into the appropriate tables in the database. On examining the data in the XML document, Simon realized that the data in the Sales Order document belongs in two different tables, the Sale Header table and the Sales Line table. The tables have a header-lines relationship. Simon’s task is to insert the Sales Header records from the XML document into the Sales Header table and insert the Line records into the Sales Line table. Simon can create an XMLport to import the data into the database and design the XMLport to insert the Header data into the Sales Header table and the Line data into data into the Sales Line table.  
  
## Setting Up the Sample Data  
 In this walkthrough, you import an XML document and insert it into the database. The document contains Sales Order information, which is made up of sales header and sales lines information. The customer named “The Cannon Group PLC” has new sales order information in the sales order document. The sales header information is in the `<Header></Header>` element and the sales line information is in the `<Line></Line>` elements. You create an XMLport that inserts the header data into the Sales Header table and the sales line data into the Sales Line table.  
  
#### To create the XML document  
  
1.  On the c: drive on your computer, create a folder named **Multiple**.  
  
2.  Copy and paste the following XML document into a text file and save it as **NewSalesOrder.xml** in the folder that you just created. Later, you will create a codeunit that looks for this XML file in this folder.  
  
```  
  
<Root>  
 <Header>  
    <DocumentType>Order</DocumentType>  
    <SellToCustomerNo>10000</SellToCustomerNo>  
    <No>1015</No>  
    <BillToName>The Cannon Group PLC</BillToName>  
    <BillToAddress>192 Market Square</BillToAddress>  
    <BillToCity>Birmingham</BillToCity>  
    <BillToContact>Mr. Andy Teal</BillToContact>  
    <BillToCountryRegion />  
    <BillToPostCode>B27 4KT</BillToPostCode>  
    <Line>  
      <DocumentType>Order</DocumentType>  
      <Type>Item</Type>  
      <ItemNo>LS-2</ItemNo>  
      <DocumentNo>1015</DocumentNo>  
      <LineNo>20000</LineNo>  
      <Description>Cables for Loudspeakers</Description>  
      <UnitOfMeasure>BOX</UnitOfMeasure>  
      <Quantity>100</Quantity>  
      <UnitPrice>21.00</UnitPrice>  
    </Line>  
  </Header>  
</Root>  
```  
  
## Creating the XMLport  
 You create the XMLport by designing it in XMLport Designer and setting the properties for the XMLport. You define the nodes of the XML document and specify the tables and fields into which you want to insert the data.  
  
#### To create the XMLport  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **XMLport**, and then choose **New**.  
  
3.  In XMLport Designer, choose an empty row in the designer, and on the **View** menu, choose **Properties**.  
  
4.  In the **XMLport-Properties** window, locate the [Direction Property](Direction-Property.md), choose the drop-down arrow in the **Value** column, and then set it to **Import**.  
  
5.  In the **XMLport-Properties** window, locate the [Format Property \(XMLports\)](Format-Property--XMLports-.md), verify that the **Value** column is set to **Xml**, and then close the **XMLport-Properties** window.  
  
6.  In **XMLport Designer**, in the first row, in the **Node Name** column, enter **Root**. In the **Node Type** column, verify that **Element** is selected. In the **Source Type** column, verify that **Text** is selected. This node represents the beginning of the XML document.  
  
7.  In the second row, in the **Node Name** column, enter **Header**. In the **Node Type** column, choose **Element**. In the **Source Type** column, choose the drop-down arrow, and then choose **Table**. This node represents a Sales Header record in the XML document.  
  
8.  In the second row, in the **Data Source** column, choose the up arrow, choose the **SalesHeader**  table \(36\) from the **Table List** window, and then choose the **OK** button. The data will be imported into the **Sales Header** table.  
  
9. Choose the **Header** row and use the right arrow to indent the row once to place it under the **Root** element.  
  
     The next step is to map the nodes in the XML document to fields in the **Sales Header** table.  
  
10. In the next empty row under the **Header** row, in the **Node Type** column, choose **Element**, and in the **Source Type** column, choose **Field**.  
  
11. In the **Data Source** column, choose the up arrow, choose the **Document Type** field from the **Field Lookup** window, and then choose the **OK** button.  
  
12. In the **Node Name** column, enter a name for the field. For example, you can enter **DocumentType**. You can enter any name but because of consistency you might want to enter the name of field you choose.  
  
    > [!NOTE]  
    >  The name that you enter in the **Node Name** column cannot contain spaces. White space in the name results in a compile error.  
  
13. Choose the **DocumentType** row and use the right arrow to indent the field once to make it a subset of the **Header** element.  
  
14. Repeat steps 10 through 13 to map the fields you want to import. For this walkthrough choose the following fields.  
  
    |Node Name|Node Type|Source Type|Data Source|  
    |---------------|---------------|-----------------|-----------------|  
    |DocumentType|Element|Field|Sales Header::Document Type|  
    |SellToCustomerNo|Element|Field|Sales Header::Sell-to Customer No.|  
    |No|Element|Field|Sales Header::No.|  
    |BillToName|Element|Field|Sales Header::Bill-to Name|  
    |BillToAddress|Element|Field|Sales Header::Bill-to Address|  
    |BillToCity|Element|Field|Sales Header::Bill-to City|  
    |BillToContact|Element|Field|Sales Header::Bill-to Contact|  
    |BillToCountryRegion|Element|Field|Sales Header::Bill-to Country/Region Code|  
    |BillToPostCode|Element|Field|Sales Header::Bill-to Post Code|  
  
     You have mapped the nodes in the **Header** element in the XML document to the fields in the Sales Header table. Next, you map the **Line** node in the XML document to the Sales Line table.  
  
15. In the next empty row, in the **Node Name** column, enter **Line**, and in the **Node Type** column, choose **Element**, and then in the **Source Type** column, choose the drop-down arrow and then choose **Table**. This node represents a Sales Line record in the XML document.  
  
16. In the **Data Source** column, choose the up arrow, choose the **Sales Line** table \(37\) from the **Table List** window, and then choose the **OK** button.  
  
     The next step is to map the nodes that you want to import.  
  
17. In the next empty row under the **Line** row, in the **Node Type** column, choose **Element**, and in the **Source Type** column, choose **Field**.  
  
18. In the **Data Source** column, choose the up arrow, choose **\<Sales Line>\(Sales Line\)** from the first column in the **Field Lookup** window, choose the **Document Type** field from the second column of the **Field Lookup** window, and then choose the **OK** button.  
  
19. In the **Node Name** column, enter a name for the field. For example, you can enter **DocumentType**.  
  
20. Choose the **DocumentType** row and use the right arrow to indent the field once to make it a subset of the **Line** element.  
  
21. Repeat steps 17 through 20 to map the nodes that you want to import. For this walkthrough map the following fields.  
  
    |Node Name|Node Type|Source Type|Data Source|  
    |---------------|---------------|-----------------|-----------------|  
    |DocumentType|Element|Field|Sales Line::Document Type|  
    |Type|Element|Field|Sales Line::Type|  
    |ItemNo|Element|Field|Sales Line::No.|  
    |DocumentNo|Element|Field|Sales Line::Document No.|  
    |LineNo|Element|Field|Sales Line::Line No.|  
    |Description|Element|Field|Sales Line::Description|  
    |UnitOfMeasure|Element|Field|Sales Line::Unit of Measure|  
    |Quantity|Element|Field|Sales Line::Quantity|  
    |UnitPrice|Element|Field|Sales Line::Unit Price|  
  
     The design of the XMLport shows that the data in the XML document has been mapped to database tables that have a header-line relation. The XMLport must insert the header information before inserting the line information. You must set the properties to achieve this.  
  
22. From XMLport Designer, choose the **Line** row, and from the **View** menu, choose **Properties**.  
  
23. In the **Line-Properties** window, locate the [LinkTableForceInsert Property](LinkTableForceInsert-Property.md) and set its value to **Yes**.  
  
24. Locate the [LinkTable Property](LinkTable-Property.md), in the **Value** column choose the up arrow to open the **Table List** window, and then choose **Sales Header**.  
  
25. Locate the [LinkFields Property](LinkFields-Property.md) and choose the **AssistEdit** button in the **Value** column to open the **DataItem Link** window.  
  
26. In the **DataItem Link** window, in the **Field** column, choose the up arrow to open the **Sales Line – Field List** window, choose **Document No.**, and then choose the **OK** button.  
  
27. In the **DataItem Link** window, in the **Reference Field** column, choose the up arrow to open the **Sales Header – Field List** window, choose **No.**, and then choose the **OK** button. Choose the **OK** button to close the **DataItem Link** window.  
  
28. From the **File** menu, choose **Save As**.  
  
29. In the **Save As** window, enter **50002** in the **ID** text box and enter **MultipleTables** in the **Name** text box. Verify that **Compile** is selected, and then choose the **OK** button.  
  
    > [!NOTE]  
    >  You use the name of the XMLport later in the codeunit.  
  
30. Close XMLport Designer.  
  
## Creating the Codeunit to Insert the XML Data  
 After you have created the XMLport, you create the codeunit that imports the data.  
  
#### To create the codeunit  
  
1.  In Object Designer, choose **Codeunit**, and then choose **New** to open the **C/AL Editor**.  
  
2.  On the **View** menu, choose **C/AL Globals**.  
  
3.  On the **Variables** tab, in the **Name** column, enter **SalesOrderXmlFile** and in the **DataType** column, choose the drop-down arrow, and then choose **Text**. This variable represents the XML file that you will import.  
  
4.  In the second row, in the **Name** column, enter **XmlStream** and in the **DataType** column, choose the drop-down arrow, and then choose **InStream**. This variable represents the data stream from the XML document to the table.  
  
5.  In the third row, in the **Name** column, enter **IsImported** and in the **DataType** column, choose the drop-down arrow, and then choose **Boolean**. This variable indicates whether the import succeeded. Close the **C/AL Globals** window.  
  
6.  In the **C/AL Editor**, in the **OnRun** trigger, add the following code.  
  
    ```  
    SalesOrderXmlFile := 'C:\Multiple\NewSalesOrder.xml';  
    UPLOADINTOSTREAM('Import','',' Xml Files (*.xml)|*.xml',SalesOrderXmlFile,XmlStream);  
    IsImported := XMLPORT.IMPORT(XMLPORT::MultipleTables, XmlStream);  
    IF (IsImported = TRUE) THEN  
      MESSAGE('The import from XML is complete.')  
    ELSE  
      MESSAGE(GETLASTERRORTEXT);  
  
    ```  
  
     The code uses the [UPLOADINTOSTREAM Function \(File\)](UPLOADINTOSTREAM-Function--File-.md) to send a file from the client to the server. The file is an XML file named NewSalesOrder.xml, which is located in a folder named Multiple on the C: drive. The [IMPORT Function \(XMLport\)](IMPORT-Function--XMLport-.md) imports the data by using the specified XMLport. A message is displayed at the end of the export to indicate that the import is complete. If the import fails, then an error message is displayed. This message is not required but it lets the user know that something actually happened.  
  
7.  Close the **C/AL Editor** and choose **Yes** at the prompt. In the **Save AS** dialog box, in the ID text box, enter **50003**, in the name text box enter **ImportMultiple**, make sure **Compile** is selected, and then choose the **OK** button.  
  
## Running the XMLport  
 After the XMLport is created and the codeunit is written, run the codeunit to import the data.  
  
#### To Run the XMLport  
  
1.  In Object Designer, choose the **ImportMultiple** codeunit \(50003\), which is the codeunit that you just created, and then choose **Run**. The client opens and a message indicating that the export is complete is displayed.  
  
2.  After the export is complete, in Object Designer, choose **Table**, select the **Sales Header** table, and then choose the **Run** button. Verify that the new record is included in the table.  
  
3.  Similarly, run the **Sales Line** table and verify that the new record is included in the table.  
  
## See Also  
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)
