---
title: Create Codeunits to Run XMLports
description: This topic explains how to create codeunits to run XMLports. Before you create a codeunit, you must first design and save the XMLport. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 5912941e-bce2-44a0-ad79-6fd747be18b4
caps.latest.revision: 9
---
# Creating Codeunits to Run XMLports
After creating an XMLport, you can create a codeunit to run the XMLport or run it from Object Designer. For more information about how to run XMLports from Object Designer, see [How to: Run an XMLport from Object Designer](How-to--Run-an-XMLport-from-Object-Designer.md). This topic shows you how to create codeunits to run XMLports. Before you create a codeunit, you must first design and save the XMLport. For more information about how to design an XMLport, see [How to: Create XMLports](How-to--Create-XMLports.md).  
  
 The basic steps for creating codeunits for export or import are similar. However, the specific code that you write is slightly different.  
  
 To create a codeunit, you:  
  
-   Define the location where the XML document will be exported to or imported from.  
  
-   Create the data stream to output or input the data.  
  
-   Use the appropriate XMLport function to call the XMLport.  
  
-   Close the XML document after the export or import is completed.  
  
### To create a codeunit to run XMLports  
  
1.  In Object Designer, select **Codeunit**, and then choose the **New** button to open the **C/AL Editor**.  
  
     You declare variables to represent the XML document that you want to work with, which is the data file that XMLport will use.  
  
2.  Open the **C/AL Globals** window and declare a variable that represents the XML document. Set the **DataType** to **File**.  
  
3.  Declare a second variable that represents the data stream that will be exported or imported.  
  
4.  If the data stream is for exporting data, set the **DataType** to **OutStream**, otherwise set it to **InStream**.  
  
5.  In the **C/AL Editor**, in the **OnRun** trigger, add the following lines of code if the XMLport is for exporting data.  
  
    ```  
    varXmlFile.CREATE(“FilePath\myXmlfile.xml”);  
    varXmlFile.CREATEOUTSTREAM(varOutputStream);  
    XMLPORT.EXPORT(XMLPORT::XMLportName, varOutputStream);  
    varXmlFile.CLOSE;  
  
    ```  
  
     The [CREATE Function \(File\)](CREATE-Function--File-.md) creates the XML file that will contain the exported data. The [CREATEOUTSTREAM Function \(File\)](CREATEOUTSTREAM-Function--File-.md) creates the output stream for the XML file. The [EXPORT Function \(XMLport\)](EXPORT-Function--XMLport-.md) uses the output stream and the name of the specified XMLport to export the data to the XML file.  
  
     If the XMLport is designed for importing data, add the following lines of code.  
  
    ```  
    varXmlFile.OPEN(“FilePath\myXmlfile.xml”);  
    varXmlFile.CREATEINSTREAM(varInputStream);  
    XMLPORT.IMPORT(XMLPORT::XMLportName, varInputStream);  
    varXmlFile.CLOSE;  
  
    ```  
  
     The [OPEN Function \(File\)](OPEN-Function--File-.md) opens the XML file that contains the data that you want to import. The [CREATEINSTREAM Function \(File\)](CREATEINSTREAM-Function--File-.md) creates the input stream for the XML file. The [IMPORT Function \(XMLport\)](IMPORT-Function--XMLport-.md) uses the input stream and the name of the specified XMLport to import the data from the XML file to the [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
     The following table shows the variables that are used in the code.  
  
    |Variable|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |--------------|---------------------------------------|  
    |varXmlFile|Represents the XML file to create for export or open for import.|  
    |MyXmlfile|The name of the XML file that the exported data will be saved as or the name of the XML file to open for export.|  
    |FilePath|The path or the location of the XML file that you want to work with, for example, C:\\Myfolder\\MyXmlfile.xml.<br /><br /> When exporting data, the code will save the XML file to this location. When importing data, the code will look for the XML file to import from this location.|  
    |varOutputStream|The output stream that the XMLport uses when exporting data.|  
    |varInputStream|The input stream that the XMLport uses when importing data.|  
    |XMLportName|The name of the XMLport to use.|  
  
6.  Close the **C/AL Editor**. In the **Save As** dialog box, in the **ID** textbox, enter an ID for the codeunit. In the **Name** text box, enter a name for the codeunit. Verify that the **Compile** check box is selected and then choose the **OK** button.  
  
## See Also  
 [How to: Create XMLports](How-to--Create-XMLports.md)   
 [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md)