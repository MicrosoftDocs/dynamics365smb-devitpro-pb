---
title: "Updating Custom Report Layouts by Using Upgrade Codeunits"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5e6a0140-2b4f-4c8d-8c33-cf08a00a3dc8
caps.latest.revision: 12
---
# Updating Custom Report Layouts by Using Upgrade Codeunits
You can update custom report layouts by creating upgrade codeunits to handle changes in report datasets that affect the report layouts. Upgrade codeunits enable you to programmatically update multiple custom report layouts in the database to changes in report datasets. Although report layout updates can be done from the [!INCLUDE[navnow](includes/navnow_md.md)] client, there are certain changes to the dataset that require the user to manually modify report layouts before they can be used. These types of changes include, for example, deleted fields or field name conflicts as a result of renaming. Upgrade codeunits enable you handle these breaking changes to report datasets and layouts without requiring end-user interaction.  
  
 To design the report upgrade logic in an upgrade codeunit, you add C/AL code that implements the report upgrade API \(through .NET Framework interoperability\) and a set of functions that are available in codeunit 9651**Document Report Mgt.**. In the [!INCLUDE[navnow](includes/navnow_md.md)] application, codeunit 9651**Document Report Mgt.** is the main component for running and maintaining customized report layouts.  
  
 For general information about upgrade codeunits, see [Upgrade Codeunits](Upgrade-Codeunits.md).  
  
## Report Upgrade API Overview  
 The upgrade and maintenance of report layouts in the databases is controlled by the following .NET Framework assemblies on the [!INCLUDE[nav_server](includes/nav_server_md.md)]:  
  
-   Microsoft.Dynamics.Nav.DocumentReport.dll  
  
-   Microsoft.Dynamics.Nav.Types.Report.dll  
  
### Microsoft.Dynamics.Nav.Types.Report Assembly  
 The Microsoft.Dynamics.Nav.Types.Report assembly contains the following types that you can use to for programmed report layout upgrades in upgrade codeunits.  
  
#### DeleteAction Enumeration  
 The *DeleteAction* enumeration determines how content controls for fields \(data items and columns of the report's dataset\) in a report layout are deleted. The following table describes the members of the *DeleteAction* enumeration:  
  
|Member name|Description|  
|-----------------|-----------------|  
|DeleteNode|Deletes the entire XML node that is contained in the content control or the tablix that is associated with the field.|  
|DeleteContent|Deletes the content control that is associated with the field, but leaves a blank text string in the text element \(keep including paragraph formatting\).|  
|DeleteRepeater|Deletes the repeater content control, but leaves the table structure \(rows\) that is contained in the content control or the tablix.|  
|DeleteRepeaterAndContent|Deletes the repeater content control and the table structure that is contained in the control.|  
|ReplaceWithText|Deletes the content control for the field and replaces it with a text constant.|  
  
#### IReportUpgradeSet Interface  
 The IReportUpgradeSet interface provides an interface to the object that stores all changes that must be applied to a specific report layout in the current database.  
  
 **Properties**  
  
 The following table describes the properties of the *IReportUpgradeSet* interface.  
  
|Property name|Type|Description|  
|-------------------|----------|-----------------|  
|ReportId|Integer|Gets the ID of the application report object that pertains to set of changes.|  
|ErrorCount|Integer|Gets the number of errors that occurred during the upgrade.|  
|ChangeCount|Integer|Gets the number of changes that are required for the report layout as a result of dataset changes.|  
|ChangeList|IList|Gets the list of changes to report layouts.|  
  
 **Methods**  
  
 The following table describes the methods of the *IReportUpgradeSet* interface. You use the methods to specify whether to delete or modify the content controls for data items and columns \(fields\) in a report layout. The behavior is controlled by the *DeleteAction* enumeration parameter.  
  
|Method name|Description|  
|-----------------|-----------------|  
|DeleteField|Deletes a content control for data field or label field from the report layout that is associated with a column in the dataset. The method can completely remove the content control or it can replace it with a text constant as specified by the *DeleteAction* enumeration parameter.<br /><br /> `void DeleteField(string name, string parentPath, DeleteAction action, string replacement);`|  
|DeleteDataItem|Deletes the content control from the report layout that references a data item in the dataset. The content control is deleted according to the behavior that is specified by the *DeleteAction* enumeration parameter. This pertains to Word layout types only.<br /><br /> `void DeleteDataItem(string name, string parentPath, DeleteAction action);`|  
|ChangeField|Renames a content control for data field or label field. You can also use this method to move the content control to a different XML path in the dataset.<br /><br /> `void ChangeField(string fromName, string toName, string fromParent, string toParent);`|  
|ChangeDataItem|Rename a control for a data item, and optionally move it to a different XML path in the dataset. This pertains to Word layout types only.<br /><br /> `void ChangeDataItem(string fromName, string toName, string fromParent, string toParent);`|  
  
 All methods with matching names and paths will overwrite existing change definitions in the collection for the same item.  
  
 **Parameters**  
  
 The following table describes the parameters of the *IReportUpgradeSet* interface methods.  
  
|Parameter name|Type|Description|  
|--------------------|----------|-----------------|  
|name|String|The name of the data item, column, or label in the dataset.|  
|fromName|String|Original name of the data item, column, or label in the dataset.|  
|toName|String|New name of the data item, column, or label in the dataset.|  
|parentPath|String|Path of the data item that contains the data item or field. The path is the hierarchy of the data item which contains the data item or field. The path is used to identify the content control's data bindings in Word report layouts.|  
|fromParent|String|Original parent path that you want to change.|  
|toParent|String|New parent path. If this parameter is left empty, then this parameter uses the value of the *fromParent* by default.|  
|Replacement|String|Text constant to use in place of the deleted field in the layout.|  
  
### Microsoft.Dynamics.Nav.DocumentReport Assembly  
 The Microsoft.Dynamics.Nav.DocumentReport assembly contains several types for creating and managing report layouts. With regards to upgrading report layouts, only the *ReportUpgradeCollection* class is relevant.  
  
#### ReportUpgradeCollection Class  
 The *ReportUpgradeCollection* class stores sets of changes that have been calculated or specified for reports in the current database.  
  
 The ReportUpgradeCollection class has only the *AddReport* method. This method adds a new report to the upgrade collection.  
  
 `public IReportUpgradeSet AddReport(int reportId)`  
  
 This method instantiates a new object for the report ID that is specified by the *reportId* parameter. If the report already exists in the collection, the existing object will be returned.  
  
## Custom Report Layout Upgrade Example  
 This example illustrates how you can update custom report layouts to dataset changes by using C/AL code, the report update API, and upgrade codeunits. This example will update a custom report layouts for report ID 1306 **Mini Sales - Invoice**. The following table describes the changes to the report dataset and how to the handle the updates in the custom report layouts:  
  
|Dataset change|Report Layout Update|  
|--------------------|--------------------------|  
|Removed the **CompanyIBAN** column|Remove the content control and text for the associated field in the report layout.|  
|Removed the **Unit Price** column|Remove the associated field control in the report layout and replace it with the text "deleted".|  
|Removed the **Quantity\_ShipmentLine** column|Remove the associated field control and replace it with the text "Deleted".|  
|Renamed the **VariantCode\_AssemblyLine** column to **VariantCode\_NewAssemblyLine**.|Rename the **VariantCode\_AssemblyLine** field to **VariantCode\_NewAssemblyLine**.|  
  
> [!TIP]  
>  This example is based on the codeunit 104060 Report Layout Upgrades that is available in the Upgrade800800.fob file of the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] upgrade toolkit.  
  
#### To create the upgrade codeunit  
  
1.  Create a codeunit and set the [SubType Property \(Codeunit\)](SubType-Property--Codeunit-.md) to **Upgrade**.  
  
2.  Create a new local function called **UpgradeReportLayout**, and then do the following:  
  
    -   Define a parameter that has the name **TestMode** and datatype **Boolean**.  
  
    -   Define the following variables:  
  
        |Name|DataType|SubType|  
        |----------|--------------|-------------|  
        |ReportUpgradeSet|DotNet|Microsoft.Dynamics.Nav.Types.Report.IReportUpgradeSet.'Microsoft.Dynamics.Nav.Types.Report, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'|  
        |ReportUpgradeCollection|DotNet|Microsoft.Dynamics.Nav.DocumentReport.ReportUpgradeCollection.'Microsoft.Dynamics.Nav.DocumentReport, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'|  
        |DeleteAction|DotNet|Microsoft.Dynamics.Nav.Types.Report.ReportChangeOptions+DeleteAction.'Microsoft.Dynamics.Nav.Types.Report, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'|  
        |DocumentReportMgt|Codeunit|Document Report Mgt.|  
  
3.  Add the following code to the **UpgradeReportLayout** function.  
  
    ```  
  
    // Instantiate the ReportUpgradeCollection variable  
    ReportUpgradeCollection := ReportUpgradeCollection.ReportUpgradeCollection;  
  
    // Calculate the set of changes for all layouts in the current database  
    DocumentReportMgt.CalculateUpgradeChangeSet(ReportUpgradeCollection);  
  
    // Example code snippet for applying a "breaking" change to a report design.  
    // The example uses report 1306 Mini Sales - Invoice.  
    ReportUpgradeSet := ReportUpgradeCollection.AddReport(1306);  
    IF NOT ISNULL(ReportUpgradeSet) THEN BEGIN  
      // Delete the text content control for the CompanyIBAN column and replace with empty text string)  
      ReportUpgradeSet.DeleteField('CompanyIBAN',  
                                   '/Header',  
                                   DeleteAction.DeleteContent,  
                                   '');  
      // Delete the text content control for the UnitPrice and replace the control with the text Deleted.  
      ReportUpgradeSet.DeleteField('UnitPrice',  
                                   '/Header/Line',  
                                   DeleteAction.ReplaceWithText,  
                                   'Deleted');  
      // Delete the control containing the field.  
      ReportUpgradeSet.DeleteField('Quantity_ShipmentLine',  
                                   '/Header/Line/ShipmentLine',  
                                   DeleteAction.DeleteNode,  
                                   '');  
      // Rename the VariantCode_AssemblyLine field  
      ReportUpgradeSet.ChangeField('VariantCode_AssemblyLine',  
                                   'VariantCode_NewAssemblyLine',  
                                   '/Header/Line/AssemblyLine',  
                                   '/Header/Line/AssemblyLine');  
    END;  
  
    // Apply the upgrade steps to the report layouts  
    DocumentReportMgt.ApplyUpgradeToReports(ReportUpgradeCollection,TestMode);  
  
    ```  
  
     The UpgradeReportLayout function instantiates a report upgrade collection object and calculates the change set based on the current report dataset designs and the XML documents that are stored with the custom report layouts in the application database. Then, it adds additional changes to the custom report layouts for report 1306, including deleting fields and renaming a field.  
  
     Finally, the *DocumentReportMgt.ApplyUpgradeToReports* method applies all the updates to report layouts in the current database. If the *TestMode* parameter is **True**, the layout changes are only tested and will not be committed to the database.  
  
4.  Add a function called **TestLaypoutUpgrade** and set the [FunctionType Property \(Upgrade Codeunits\)](FunctionType-Property--Upgrade-Codeunits-.md) to **CheckPrecondition**. Add the following code:  
  
    ```  
    UpgradeReportLayout(FALSE);  
    ```  
  
     The defines a CheckPrecondition function type, which is the first function that is executed when the codeunit is run. This function will test the report layout changes before they are applied to the layouts in the database. If an error occurs when this function is run, then the changes are not applied.  
  
5.  Add a function called RunLayoutUpgrade and set the [FunctionType Property \(Upgrade Codeunits\)](FunctionType-Property--Upgrade-Codeunits-.md) to **UpgradePerDatabase**. Add the following code:  
  
    ```  
    UpgradeReportLayout(TRUE);  
    ```  
  
     This function is run after the CheckPrecondition function to perform the upgrade the report layouts.  
  
6.  Save and compile the codeunit.  
  
7.  Perform a data upgrade to run the upgrade codunit.  
  
     Open [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] as an administrator. On the **Tools** menu, choose **Data Upgrade**, and then choose **Start** and follow the instructions.  
  
    > [!NOTE]  
    >  You can also perform the data upgrade by running the [Start-NavDataUpgrade cmdlet](https://go.microsoft.com/fwlink/?LinkID=401404) from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  
  
## See Also  
 [Updating Report Layouts to Dataset Changes](Updating-Report-Layouts-to-Dataset-Changes.md)   
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)   
 [Designing RDLC Report Layouts](Designing-RDLC-Report-Layouts.md)
