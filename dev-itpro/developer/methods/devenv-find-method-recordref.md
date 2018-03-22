---
title: "FIND Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 73ef42a1-f928-4093-b6f2-9144e822be2b
caps.latest.revision: 17
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIND Method (RecordRef)
Finds a record in a table based on the values stored in the key fields.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.FIND([Which])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you want to find a record.  
  
 *Which*  
 Type: Text or code  
  
 Specifies how to perform the search. The table will be searched until the record is found or there are no more records. Each character in the string can be present only one time. You can use the following characters:  
  
-   =  search for a record that equals the key values \(default\)  
  
-   >  search for a record that is larger than the key values  
  
-   \<  search for a record that is less than the key values  
  
-   +  search for the last record in the table \(+ can only be used alone\)  
  
-   -  search for the first record in the table \(- can only be used alone\)  
  
 You can combine the '=', '\<', and '>' characters.  
  
 If this parameter contains '=', '>', or '\<', then you must assign value to all fields of the current and primary keys before you call FIND.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and the record cannot be found, a run-time error occurs. If you include a return value, it is assumed that you will handle any errors.  
  
## Remarks  
 FIND retrieves the first record that meets the conditions set by the *Which* parameter and the filters associated with the record. The search path reflects the sort order defined by the current key. If the current key is not the primary key, there is a chance that several records might have the same values in current key fields. If this occurs, the sort order defined by the primary key is used as the search path.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable named CustomerRecref. The value for the field 1 \(No.\) is set to a specified record. In this example, the field is set to record 40000. The code uses the FIND method to find the record that matches. 40000 in the table. If the record is found, the number, name, address and city of the customer are displayed in message boxes. The values in the fields are retrieved by using the [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md). This example requires that you create the following global variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varCustomerNo|Code|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The customer was found.\\|  
|Text001|Customer No. %1 is:\\%2|  
|Text002|Sorry, that customer could not be found.|  
  
```  
varCustomerNo := '40000';  
CustomerRecref.OPEN(18);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.VALUE := varCustomerNo;  
IF CustomerRecref.FIND('=') THEN BEGIN  
  MESSAGE(Text000 + Text001,  CustomerRecref.FIELD(1), CustomerRecref.FIELD(2));  
  MESSAGE('Address: %1, %2',  CustomerRecref.FIELD(5),  CustomerRecref.FIELD(7));  
END  
ELSE  
  MESSAGE(Text002);  
  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)