---
title: "SAVEASXML Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a6fb4865-6ed5-4111-a5e6-9a7671bfbbfa
caps.latest.revision: 18
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASXML Method
Saves the resulting dataset of a query as an .xml file.  

 The following code shows the syntax of the **SAVEASXML** method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.  

## Syntax  

```  
[Ok :=] QueryVariable.SAVEASXML(FileName)  
```  

```  
[Ok :=] QUERY.SAVEASXML(Number, FileName)  
```  

#### Parameters  
 *QueryVariable*  
 Type: Query  

 A variable that specifies the query object to save as an .xml file.  

 *Number*  
 Type: Integer  

 The ID of the query object that you want to save as an .xml file. If the query that you specify does not exist, then a run-time error occurs.  

 *FileName*  
 Type: Text  

 The path and name of the file that you want to save the query to.  

## Return Value  
 Type: Boolean  

 **true** if the query dataset was saved; otherwise, **false**.  

 If you omit this optional return value and if the query cannot be saved as an .xml file, then a run-time error occurs that states that the query cannot be saved. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the query is not saved as an .xml file.  

## Remarks  
 When the **SAVEASXML** method is called, the dataset is generated and then saved in XML format in the file and location that is designated by the *FileName* parameter.  

 The **SAVEASXML** method can be called at any place in the code and does not require that the **CLOSE**, **OPEN**, or **READ** methods are called before it. When the **SAVEASXML** method is called, a new instance of the query is created. The query is implicitly opened, read, and closed. If there is currently a dataset in the opened state when the **SAVEASXML** method is called, then that instance is closed. This means that the following code is unauthorized because the query is not open on the second **READ** call.  

```  
Query.OPEN;  
Query.READ;  
Query.SAVEASXML('c:\test.xml');  
Query.READ;   
```  

 The correct code for this example is as follows.  

```  
Query.OPEN;  
Query.READ;  
Query.SAVEASXML('c:\test.xml');  
Query.OPEN;  
Query.READ;   
```  

## Example  
 The following example shows how to save a query with the name **My Customer Query** as an .xml file. The file is given the name **myquery.xml** and is saved on the c: drive of the computer running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

 This example requires that you create the following variables and text constant.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|OK|Boolean|Not applicable|  
|MyCustomerQuery|Query|My Customer Query|  

|Text constant name|ENU Value|  
|------------------------|---------------|  
|Text000|Query was not saved.|  

```  
OK := MyCustomerQuery.SAVEASXML('c:\myquery.xml');  
IF NOT OK THEN  
  ERROR(Text000);  
```  

 If the file cannot be saved, then the follow message appears:  

 **Query not saved.**
