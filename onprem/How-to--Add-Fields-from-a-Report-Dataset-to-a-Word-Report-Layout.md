---
title: Add Fields from Report Dataset to Word Report Layout
description: A report dataset consist of fields that display labels, data and images. Learn how to add fields of a report dataset to an existing Word layout of a report.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ea719bd-b8d3-4bef-81d2-4d7784294a8d
caps.latest.revision: 5
---
# How to Add Fields from Report Dataset to Word Report Layout in Dynamics NAV
A report dataset can consist of fields that display labels, data, and images. This topic describes procedure for adding fields of a report dataset to an existing Word layout of a report. You add fields by using the Word custom XML part for the report and adding content controls that map to the fields of the report dataset. For more information about custom XML parts, see [Custom XML Part Overview for Word Report Layouts](Custom-XML-Part-Overview-for-Word-Report-Layouts.md).  
  
##  <a name="OpenXMLPart"></a> To display the Custom XML part for the Report in Word  
  
1.  Open the Word report layout document in Word for editing.  
  
2.  Show the **Developer** tab in the ribbon of Word.  
  
     By default, the **Developer** tab is not shown in the ribbon. For more information, see [How to: Show the Developer Tab on the Ribbon](https://go.microsoft.com/fwlink/?LinkID=389631).  
  
3.  On the **Developer** tab, choose **XML Mapping Pane**.  
  
4.  In the **XML Mapping** pane, in **the Custom XML Part** list, choose the XML part for [!INCLUDE[navnow](includes/navnow_md.md)] report. The name of the XML part has the following format:  
  
     urn:microsoft-dynamics-nav/reports/*report\_name*/*ID*  
  
     *report\_name* is the name that is assigned to the report as specified by the report's [Name Property](Name-Property.md).  
  
     *ID* is the identification number of the report.  
  
     After you select the XML part, the XML Mapping pane displays the labels and field controls that are available for the report.  
  
### To add a label or data field  
  
1.  Place your pointer in the document where you want to add the control.  
  
2.  In the **XML Mapping** pane, right-click the control that you want to add, choose **Insert Content Control**, and then choose **Plain Text**.  
  
    > [!IMPORTANT]  
    >  Do not choose **Rich Text** because rich text controls are not fully supported. If you use a rich text control, content might not be displayed correctly.  
  
     You cannot add a field by manually typing the dataset field name in the content control. You must use the **XML Mapping** pane to map the fields.  
  
### To add repeating rows of data fields to create a list  
  
1.  If not already existing, add a table row that includes a column for each field that you want repeated.  
  
     This row will act as a placeholder for the repeating fields.  
  
2.  Select the whole row.  
  
3.  In the **XML Mapping** pane, right-click the control that corresponds to the report data item that contains the fields that you want repeated, choose **Insert Content Control**, and then choose **Repeating**.  
  
4.  Add the repeating fields to the row as follows:  
  
    1.  Place your pointer in a column.  
  
    2.  In the **XML Mapping** pane, right-click the control that you want to add, choose **Insert Content Control**, and then choose **Plain Text**.  
  
        > [!IMPORTANT]  
        >  Do not choose **Rich Text** because rich text controls are not fully supported. If you use a rich text control, content might not be displayed correctly.  
  
    3.  For each field, repeat steps a and b.  
  
## Adding Image Fields  
 A report dataset can include a field that contains an image, such as a company logo or a picture of an item. To add an image from the report dataset, you insert a **Picture** content control.  
  
 Images align in the top-left corner of the content control and resize automatically in proportion to fit the boundary of the content control.  
  
> [!IMPORTANT]  
>  You can only add images that have a format \(such as .bmp, .jpeg, and .png file types\), which that is supported by Word. If you add an image that has a format that is not supported by Word, you will get an error when you run the report from the [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
#### To add an image  
  
1.  Place your pointer in the document where you want to add the control.  
  
2.  In the **XML Mapping** pane, right-click the control that you want to add, choose **Insert Content Control**, and then choose **Picture**.  
  
3.  To increase or decrease the image size, drag a sizing handle away from or towards the center of the content control.  
  
## See Also  
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)   
 [How to: Modify a Word Report Layout](How-to--Modify-a-Word-Report-Layout.md)   
 [How to: Create a Word Report Layout for a Report](How-to--Create-a-Word-Report-Layout-for-a-Report.md)
