---
title: "NEXT Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ad51ee4e-6f33-466b-b751-87daf76eb251
ms.author: edupont
---
# NEXT Function (Record)
Steps through a specified number of records and retrieves a record.  

## Syntax  

```  

Steps := Record.NEXT([Steps])  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record from which the search starts.  

 *Steps*  
 Type: Integer  

 Specifies the direction of the search and how many records to step over. This parameter follows the following rules:  

-   \>0  Search *Steps* records forward in the table.  

-   \<0  Search *Steps* records backward in the table.  

-   =0  Stay on the same record in the table.  

 If you do not specify this parameter, then the next record is found.  

## Property Value/Return Value  
 Type: Integer  

 The number of records inspected which meet the criteria of any filters and the current key. This value can be less than *Steps*, depending on the number of records in the table. If the table is empty, then zero is returned and *Record* does not change.  

## Remarks  
 This function locates a record positioned a given number of steps forward or backward from *Record*. Movement through the table is governed by the filters and the current key associated with the records. The fields in *Record* that will be compared with the current key fields must contain appropriate values before the function is called.  

## Example  
 This example requires that you create the following variables in the **C/AL Globals** window.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Count|Integer|Not applicable|  
|CustomerRec|Record|Customer|  

```  
Count := 0;  
IF CustomerRec.FIND('-') THEN  
  REPEAT  
    Count := Count + 1;  
  UNTIL CustomerRec.NEXT = 0;  
```  

 This code uses a **REPEAT UNTIL** loop to count the number of entries in the **Customer** table. The **FIND** function finds the first entry in the table. Each time the **NEXT** function is called, it steps one record forward. When **NEXT** equals zero \(0\), there are no more entries in the table and the loop is exited.  

## See Also  
 [Record Data Type](Record-Data-Type.md)   
 [GET, FIND, and NEXT Functions](GET--FIND--and-NEXT-Functions.md)
