---
title: "Classifying Data in Dynamics 365"
description: Learn about classifying data in Business Central
ms.author: jswymer
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

 

# Classifying Data in [!INCLUDE[d365fin_md](includes/d365fin_md.md)]
[!INCLUDE[d365fin_md](includes/d365fin_md.md)] includes development features for tagging business data with specific classifications. Specifically, this includes data that is stored in table fields of the database and telemetry data that is emitted from the application.    

## About Data Classification
Classifying data serves different purposes. It can make data easier and more efficient to locate and retrieve, and also help to add another layer of protection and security for handling private and sensitive data. It can supplement your process for making the application compliant with legislative and regulatory requirements for collecting, storing, and using personal information. 

> [!IMPORTANT]
> You should consider the data classification features offered in [!INCLUDE[d365fin_md](includes/d365fin_md.md)] as the first layer of classification - done by developers ([!INCLUDE[d365fin_md](includes/d365fin_md.md)]  and partners) on customizations, add-ons, and extensions. The second layer is to classify the sensitivity of the data itself. For more information, see [Classifying Data Sensitivity](devenv-classifying-data-sensitivity.md). It is also important to consider end-users, and how they handle data they provide and that is made available to them.

## <a name="DataClassifications"></a>What are the different data classifications?
The following table describes the different classifications that you can apply to data:

[!INCLUDE[data_classifications](includes/data_classifications.md)] 
  
## Classifying data in tables and fields
Table objects and field controls include the `DataClassification` property that you can use to tag data with one of the classifications previously described.

[!INCLUDE[d365fin_md](includes/d365fin_md.md)] operates with some standard rules for classification:
- When you add a new field to a table, the field is assigned an initial value of **ToBeClassified**.
- FlowField and FlowFilter fields are automatically set to the **SystemMetadata** data classification. This cannot be changed.
- Existing tables and fields (except for FlowFields and FlowFilters) in an application that has been upgraded from a [!INCLUDE[d365fin_md](includes/d365fin_md.md)] version without the `DataClassification` property, will automatically be assigned the **CustomerContent** classification.

>[!IMPORTANT]
> Microsoft is providing this `DataClassification` property as a matter of convenience only. It is your responsibility to classify the data appropriately and comply with any laws and regulations that are applicable to you. Microsoft disclaims all responsibility towards any claims related to your classification of the data.  

For more information about this property, see [DataClassification Property](properties/devenv-dataclassification-property.md).

### Data classification on upgrade
When you upgrade an application from a [!INCLUDE[d365fin_md](includes/d365fin_md.md)] version that does not contain the `DataClassification` property, existing tables and fields (except for FlowFields and FlowFilters) will automatically be assigned the **CustomerContent** classification. You can then access the `DataClassification` property on these tables and fields, and change the classification as needed. FlowFields and FlowFilters will be assigned the **SystemMetadata** classification automatically.

>[!IMPORTANT]
> After upgrade or import of objects, using fob files, that introduce new tables and/or fields, make sure to synchronize new tables and/or fields to enable [Data Sensitivity Classification](devenv-classifying-data-sensitivity.md) by running **SyncAllFields** method in `Data Classification Mgt.` Codeunit (Codeunit 1750). No action is needed when extensions are installed, as installation of extension automatically triggers **SyncAllFields** method. See example below.

Run the script below from Developer Shell:
``` 
Invoke-NAVCodeunit -Tenant <TenantID> -CompanyName <CompanyName> -CodeunitID 1750 -MethodNAme 'SyncAllFields' -ServerIntance <ServerInstance>
```

### Bulk-classifying data
The Field Data Classification report, which is described in the *Viewing current field classifications* section in this topic, provides an overview of the data classifications for fields. The report also lets you assign data classifications for more than one field. For example, this is useful if you are assigning classifications for the first time, or have changed several fields and want to update their classifications. You can bulk-edit classifications only for fields in [!INCLUDE[d365_dev_short_md](includes/d365_dev_short_md.md)]. The script does not update fields in extensions.  

To bulk-edit classifications, export the report to Excel, update the classifications, and then save your changes. Then, in Windows PowerShell, run the following commands to run the `Import-Module` script and set the classifications on the fields.  

To run the script from the default folder on the DVD, run:  

``` 
Import-Module WindowsPowerShellScripts\DataClassification\DataClassification.psm1
``` 

To update the `DataClassification` property, run the following command. Replace \<FilePath\> with the full path to the client files. For example, C:\Program Files\Microsoft Dynamics 365 Business Central\160\RoleTailored Client.  
``` 
Set-FieldDataClassificationFromExcelFile -ExcelFilePath "C:\BC\W1 Fields (Main).xlsx" -SheetName 'Field Data Classification' -RTCFolder "<FilePath>" -DBName BC2 -OutputFolder C:\BC2\Classifications
```  

## <a name="ViewDataClassifications"></a>Viewing current field classifications
To view the data classification on all fields, you can do one of the following:

- From the client, search for and open the **Data Classification Worksheet** page. 
- Create a page that has the virtual table **Field** (ID 2000000041) as its source, and open the page in the client.

## Classifying data in custom telemetry trace events
Custom telemetry trace events are defined by calls to the **SENDTRACETAG** method in the application code. The **SENDTRACETAG** method includes an optional parameter called `DataClassification` that you can use to tag the telemetry trace event with a data classification.

For more information, see [SendTraceTag](methods-auto/session/session-sendtracetag-method.md) and 
[Instrumenting an Application for Telemetry](devenv-instrument-application-for-telemetry.md). 

## See Also
[Data Classification](properties/devenv-dataclassification-property.md)  
[Classifying Data Sensitivity](devenv-classifying-data-sensitivity.md)  

