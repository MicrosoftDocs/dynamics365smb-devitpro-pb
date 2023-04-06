---
title: Create XMLports 
description: You can design XMLports to import or export XML documents, variable text files, or fixed-width text files. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: db7e208e-9780-40e2-a2f6-aeee8b7c1923
caps.latest.revision: 11
---
# Creating XMLports in Dynamics NAV
You design XMLports to export data from Microsoft Dynamics NAV tables or import data to a Microsoft Dynamic NAV tables. You can design XMLports to import or export XML documents, variable text files, or fixed-width text files.  
  
### To design an XMLport  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **XMLport**, and then choose the **New** button to open **XMLport Designer**.  
  
3.  On the **View** menu, choose **Properties** to open the **XMLport-Properties** window.  
  
4.  In the **XML-Properties** window, set the [Direction Property](Direction-Property.md). If you want to export data, set the property to **Export**. If you want to import data, set the property to **Import**.  
  
5.  Set the [Format Property \(XMLports\)](Format-Property--XMLports-.md) to the format of the document you want to import or export. You can set the format property to **Xml**, **Variable Text** or **Fixed Text**. By default the format property is set to **Xml**.  
  
6.  If you set the format property to variable text, then do the following:  
  
    1.  Set the following properties. By default these properties are set as shown in the table but you change the values.  
  
        |Property|Value|  
        |--------------|-----------|  
        |[TextEncoding Property \(XMLports\)](TextEncoding-Property--XMLports-.md)|\<MSDOS>|  
        |[FieldDelimiter Property](FieldDelimiter-Property.md)|“|  
        |[FieldSeparator Property](FieldSeparator-Property.md)|,|  
        |[RecordSeparator Property](RecordSeparator-Property.md)|\<NewLine>|  
        |[TableSeparator Property](TableSeparator-Property.md)|\<NewLine>\<NewLine>|  
  
    > [!NOTE]  
    >  If you are importing a text file, you must examine the text file to determine the appropriate values for these properties.  
  
7.  If you set the file format to fixed text, then do the following:  
  
    1.  Set the following properties. By default, these properties are set as shown in the following table but you can change the values.  
  
        |Property|Value|  
        |--------------|-----------|  
        |[TextEncoding Property \(XMLports\)](TextEncoding-Property--XMLports-.md)|\<MSDOS>|  
        |[RecordSeparator Property](RecordSeparator-Property.md)|\<NewLine>|  
        |[TableSeparator Property](TableSeparator-Property.md)|\<NewLine>\<NewLine>|  
  
    > [!NOTE]  
    >  If you are importing a text file, you must examine the text file to determine the appropriate values for these properties.  
  
8.  If you set the file format to XML, then you can set up namespaces by setting the following properties as required:  
  
    -   [Namespaces Property](Namespaces-Property.md)  
  
    -   [DefaultNamespace Property](DefaultNamespace-Property.md)  
  
    -   [UseDefaultNamespace Property](UseDefaultNamespace-Property.md)  
  
     For more information, see [Using Namespaces with XMLports](Using-Namespaces-with-XMLports.md).  
  
9. In **XMLport Designer**, in the first row, in the **Node Name** column, enter a name  
  
    > [!NOTE]  
    >  If the document that you want to import or export is an XML file, then you must enter **Root** in the **Node Name** column. **Root** indicates the beginning of XML documents.  
  
10. In the **Node Type** column, select **Element**.  
  
11. In the **Source Type** column, select **Text**.  
  
     This element represents the start of the document you want to import or export.  
  
12. In the **Data Source** column, verify that the value is the same as the name of the node.  
  
13. In the second row, in the **Node Name** column, enter a name for the table you want to export or import.  
  
14. In the **Node Type** column, select **Element**.  
  
15. In the **Source Type** column, select **Table**.  
  
16. In the **Data Source** column, choose the arrow to open the **Table List**.  
  
17. From the **Table List**, select the table you want to export from or import to.  
  
18. Choose the right arrow to indent the row one time to make the row a subset of the top row.  
  
19. If you want to specify a namespace prefix on the element, do the following:  
  
    1.  Select the element, and then on the **View** menu, choose **Properties**.  
  
    2.  In the **Properties** window, set the **NamespacePrefix** property to the prefix that you want to use.  
  
20. In the next row, in the **Node Type** column, choose **Element**.  
  
21. In the **Source Type** column, select **Field**  
  
22. In the **Data Source** column select the field you want from the **Field Lookup** window.  
  
23. In the **Node Name** column, enter a name for the field. For consistency you can enter the same name as the field you selected.  
  
24. If you want to specify a namespace prefix on the element, do the following:  
  
    1.  Select the element, and then on the **View** menu, choose **Properties**.  
  
    2.  In the **Properties** window, set the **NamespacePrefix** property to the prefix that you want to use.  
  
25. Indent the field row one time to make it a subset of the table row.  
  
26. Repeat steps 20 through 25 to select all the fields you want to export or import.  
  
27. If the format of the file is fixed text, then for each field, set the **Width** property to an appropriate value.  
  
    > [!NOTE]  
    >  If the value of the **Width** property is less the width of a field, the data in the field will be truncated.  
  
28. From the **File** menu, choose the **Save As** button.  
  
29. In the **Save As** window, enter an ID and a name for the XMLport, and verify that **Compile** is selected, and then choose the **OK** button to save the XMLport.  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)   
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)   
 [Using Namespaces with XMLports](Using-Namespaces-with-XMLports.md)
