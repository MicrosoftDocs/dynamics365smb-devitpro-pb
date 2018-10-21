---
title: "Delete Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Delete Method
Deletes a record in a table.

## Syntax
```
[Ok := ]  Table.Delete([RunTrigger: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to run the AL code in the OnDelete Trigger. If this parameter is true, then the code in the OnDelete trigger is executed. If this parameter is false, then the code in the OnDelete trigger is not executed. The default value is false. This parameter is optional.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The current key and any filters on the record do not affect this operation. The record to delete is identified by the values in its primary key.  
  
 If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  
  
 **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  
  
 **Enter your changes again in the updated window, or start the interrupted activity again.**  
  
 In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], we have restricted the [MODIFY Method \(Record\)](devenv-MODIFY-Method-Record.md), [RENAME Method \(Record\)](devenv-RENAME-Method-Record.md), and **DELETE** Method \(Record\) so that the end-user receives the following run-time error in these certain situations:  
  
 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  
  
 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [GET Method \(Record\)](devenv-GET-Method-Record.md) to refresh the record with the latest version. The second example illustrates this situation.  
  
## Example  
 The first two lines of code in this example do not use the return value from the **DELETE** method. This means that a run-time error occurs if the record to be deleted cannot be found.  
  
 The next lines of code show how you can handle errors using the return value.  
  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The customer has been deleted.|  
|Text001|The customer could not be found.|  
  
```  
// Without using the return value:  
CustomerRec."No." := '100';  
CustomerRec.DELETE;  
// Using the return value:  
CustomerRec."No." := '100';  
IF CustomerRec.DELETE THEN  
  MESSAGE(Text000)  
ELSE  
  ERROR(Text001);  
```  
  
## Example  
 This example shows that you get an error if you attempt to delete a record after a newer version of the record has been written and committed to the database. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec1|Record|Customer|  
|CustomerRec2|Record|Customer|  
  
 In this example, you get a copy of a record from the **Customer** table and put it into the CustomerRec1 variable, then you modify the record. Next, you get a copy of the same record from the **Customer** table and put it into the CustomerRec2 variable. You modify the record and commit the changes to the database. Now the CustomerRec1 variable is out-of-date with the value in the database. If you were allowed to modify the database using the CustomerRec1 record, then the changes that you made with CustomerRec2 would be overwritten by the values in the CustomerRec1 variable. [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] does not allow you to delete a record using an old version of the record.  
  
> [!NOTE]  
>  If you do not call the **COMMIT** method in this example, then you do not receive an error.  
  
```  
CustomerRec1.LOCKTABLE;  
CustomerRec1.GET('10000');  
CustomerRec1."Address 2" := 'Suite 101';  
CustomerRec1.MODIFY;  
  
CustomerRec2.GET('10000');  
CustomerRec2."Phone No.":= '206-555-0109';  
CustomerRec2.MODIFY;  
  
COMMIT;  
  
CustomerRec1.DELETE;  
```  
  
 If you run this code example, then you get the following error:  
  
 **Unable to change an earlier version of the Customer record. The record should be read from the database again. This is a programming error.**  
  
 **Identification fields and values:**  
  
 **No.='10000'**  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)