---
title: Word Report Layouts on Custom XML Parts
description: Word report layouts are built on custom XML parts for mapping the data into a report when the report is run from the Dynamics NAV client.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8b29a095-5d4b-40de-8498-3f89994c9633
caps.latest.revision: 14
translation.priority.ht: 
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# Custom XML Part Overview for Word Report Layouts in Dynamics NAV
Word report layouts are built on *custom XML parts*. A custom XML part is structured XML that represents the dataset of a [!INCLUDE[navnow](includes/navnow_md.md)] report. The custom XML part is used to map the data into a report when the report is run from a [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
## XML Structure of Custom XML Part  
 A custom XML part for a [!INCLUDE[navnow](includes/navnow_md.md)] report consists of elements that correspond to the data items, columns, and labels that comprise the report's dataset as defined in the Report Dataset Designer in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
 The following table provides a simplified overview of the XML of a custom XML part.  
  
|XML Elements|Description|  
|------------------|-----------------|  
|`<?xml version="1.0" encoding="utf-16"?>`|Header|  
|`<NavWordReportXmlPart xmlns="urn:microsoft-../report/<reportname>/<id>/"`|XML namespace specification. `<reportname>` is the name that is assigned to the report object in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. `<id>` is the ID that is assigned to the report.|  
|`..<Labels>`<br /><br /> `....<ColumnNameCaption>ColumnNameCaption</ColumnNameCaption>`<br /><br /> `....<LabelName>LabelCaption</LabelName>`<br /><br /> `..</Labels>`|Contains all the labels for the report. The element includes labels that are related to columns that have the [IncludeCaption Property](IncludeCaption-Property.md) set to **Yes** and labels that are defined in **Report Label Designer**.<br /><br /> -   Label elements that are related to columns have the format `<ColumnNameCaption>ColumnNameCaption</ColumnNameCaption>`, where `ColumnName` is determined by the column's [Name Property](Name-Property.md).<br />-   Label elements from Report Label Designer have the format `<LabelName>LabelName</LableName`, where `LabelName` is determined by the label's [Name Property](Name-Property.md).<br />-   Labels are listed in alphabetical order.|  
|`..<DataItem1>`<br /><br /> `....<DataItem1Column1>DataItem1Column1</DataItem1Column1>`|Top-level data item and columns. Columns are listed in alphabetical order.<br /><br /> The element names and values are determined by the [Name Property](Name-Property.md) of the data item or column.|  
|`....<DataItem2>`<br /><br /> `......<DataItem2Column1>DataItem2Column1</DataItem2Column1>`<br /><br /> `....</DataItem2>`<br /><br /> `....<DataItem3>`<br /><br /> `......<DataItem3Column1>DataItem3Column1</DataItem3Column1>`<br /><br /> `....</DataItem3>`|Data items and columns that are nested in the top-level data item. Columns are listed in alphabetical order under the respective data item.|  
|`..</DataItem1>`<br /><br /> `</NavWordReportXmlPart>`|Closing element.|  
  
## Custom XML Part in Word  
 In Word, you open the custom XML part in the **XML Mapping** pane, and then use the pane to map elements to content controls in the Word document. The **XML Mapping** pane is accessible from the **Developer** tab \(for more information, see [How to: Show the Developer Tab on the Ribbon](https://go.microsoft.com/fwlink/?LinkID=389631)\).  
  
 The elements in the **XML Mapping** pane appear in a structure that is similar to the XML source. Label fields are grouped under a common **Labels** element and data item and columns are arranged in a hierarchal structure that corresponds to the XML source, with columns listed in alphabetical order. Elements are identified by their name as defined by the Name property in Report Dataset Designer in [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
 The following figure illustrates the simple custom XML part from the previous section in the **XML Mapping** pane of a Word document.  
  
 ![Clip of the XML Mapping pane in word.](media/NAV_ReportLayout_XMLMappingPane.png "NAV\_ReportLayout\_XMLMappingPane")  
  
-   To add a label or field to the layout, you insert a content control that maps to the element in the **XML Mapping** pane.  
  
-   To create repeating rows of columns, insert a **Repeating** content control for the parent data item element, and then add content control for the columns.  
  
-   For labels, the actual text that appears in the generated report is the value of the **Caption** property for the field in the data item table \(if the label is related to the column in the report dataset\) or a label in the Report Label Designer \(if the label is not related to a column in the dataset\).  
  
-   The language of the label that is displayed when you run the report depends on the language setting of the report object. For more information, see [Multiple Document Languages](Multiple-Document-Languages.md) and [Viewing the Application in Different Languages](Viewing-the-Application-in-Different-Languages.md).  
  
 For information about how to open the custom XML part in Word and add fields, see [Managing Report Layouts](managing-report-layouts.md).  
  
## See Also  
 [Managing Report Layouts](managing-report-layouts.md)   
 [Managing Report Layouts](managing-report-layouts.md)   
 [Managing Report Layouts](managing-report-layouts.md)