---
title: "Classifying Data in [!INCLUDE[d365fin_md](includes/d365fin_md.md)]"
ms.author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---

# Classifying Data in [!INCLUDE[d365fin_md](includes/d365fin_md.md)]
[!INCLUDE[d365fin_md](includes/d365fin_md.md)] includes development features for tagging business data with specific classifications. Specifically, this includes data that is stored in table fields of the database and telemetry data that is emitted from the application.    

## About Data Classification
Classifying data serves different purposes. It can make data easier and more efficient to locate and retrieve, and also help to add another layer of protection and security for handling private and sensitive data. It can supplement your process for making the application compliant with legislative and regulatory requirements for collecting, storing, and using personal information. 

>[!IMPORTANT]
> You should consider the data classification features offered in [!INCLUDE[d365fin_md](includes/d365fin_md.md)] as the first layer of classification - done by developers (Dynamics NAV and partners) on customizations, add-ons, and extensions. The second layer is to classify the sensitivity of the data itself. For more information, see [Classifying Data Sensitivity](classifying-data-sensitivity.md). It's also important to consider end-users, and how they handle data they provide and that is made available to them.

## <a name="DataClassifications"></a>What are the different data classifications?
The following table describes the differents classifications that you can apply to data:

[!INCLUDE[data_classifications](includes/data_classifications.md)] 
  
## Classifying data in tables and fields
Table objects and field controls include the **DataClassification** property that you can use to tag data with one of the classifications previously described.

Dynamics NAV operates with some standard rules for classification:
-   When you add a new field to a table, the field is assigned an initial value of **ToBeClassified**.
-   FlowField and FlowFilter fields are automatically set to the **SystemMetadata** data classification. This cannot be changed.
-   Existing tables and fields (except for FlowFields and FlowFilters) in an application that has been upgraded from a [!INCLUDEnavnow_md] version without the DataClassification property, will automatically be assigned the **CustomerContent** classification.


For more information about this property, see the following articles:

-   [DataClassification Property in AL](developer/properties/devenv-dataclassification-property.md) 
-   [DataClassification Property in C/AL](/dynamics-nav/dataclassification-property)

### Data classification on upgrade
When you upgrade an application from a [!INCLUDE[d365fin_md](includes/d365fin_md.md)] version that does not contain the DataClassification property, existing tables and fields (except for FlowFields and FlowFilters) will automatically be assigned the **CustomerContent** classification. You can then access the **DataClassification** property on these tables and fields, and change the classification as needed. FlowFields and FlowFilters will be assigned the **SystemMetadata** classification automatically.

### Bulk-classifying data
The Field Data Classification report, which is described in the *Viewing current field classifications* section in this topic, provides an overview of the data classifications for fields. The report also lets you assign data classifications for more than one field. For example, this is useful if you are assigning classifications for the first time, or have changed several fields and want to update their classifications. You can bulk-edit classifications only for fields in CSIDE. The script does not update fields in extensions.  

To bulk-edit classifications, export the report to Excel, update the classifications, and then save your changes. Then, in Windows PowerShell, run the following commands to run the Import-Module script and set the classifications on the fields.  

To run the script from the default folder on the DVD, run:  
``` 
Import-Module WindowsPowerShellScripts\DataClassification\DataClassification.psm1
``` 

To update the DataClassification property, run the following command. Replace \<FilePath\> with the full path to the client files. For example, C:\Program Files\Microsoft Dynamics NAV\110\RoleTailored Client.  
``` 
Set-FieldDataClassificationFromExcelFile -ExcelFilePath "C:\NAV\W1 Fields (Main).xlsx" -SheetName 'Field Data Classification' -RTCFolder "<FilePath>" -DBName Navision_NAV2 -OutputFolder C:\Nav2\Classifications
```  


## <a name="ViewDataClassifications"></a>Viewing current field classifications
To view the data classification on all fields, you can do one of the following:

-   From [!INCLUDE[nav_dev_long_md](includes/nav_dev_long_md.md)], in the **Tools** menu, select **Show Field Data Classification**. 
-   From the client, search for and open the **Field Data Classification** page. 
-   Create a page that has the virtual table **Field** (ID 2000000041) as its source, and open the page in the client.

To view the data classification on all tables, create a page that has the virtual table **Table Metadata** (ID 2000000136)  as its source, and open the page in the client.


## Classifying data in custom telemetry trace events
Custom telemetry trace events are defined by calls to the SENDTRACETAG function/method in the application code. The SENDTRACETAG function/method includes an optional parameter called `DataClassification` that you can use to tag the telemetry trace event with a data classification.

For more information, see the following articles:

-   [Instrumenting an Application for Telemetry](instrumenting-application-for-telemetry.md) 
-   [SENDTRACETAG Method (AL)](developer/methods/devenv-sendtracetag-method.md)
-   [SENDTRACETAG Function (C/AL)](/dynamics-nav/sendtracetag-function)

## See Also
[How to: Create a Page to View a Virtual Table](How-to--Create-a-Page-to-View-a-Virtual-Table.md)    
