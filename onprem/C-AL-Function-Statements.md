---
title: "C/AL Function Statements"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 65df44e6-e734-43c8-bb31-4b7afe749cbd
caps.latest.revision: 6
manager: edupont
---
# C/AL Function Statements
You use function statements to execute either built-in system functions or user-defined functions. Function calls may include parameters, which are passed to the function.  

 If you assign the return value of a function call to a variable, then you use the function statement as part of an assignment statement.  

 Triggers are C/AL elements that consist of an event and a function. Triggers execute a function when a certain event occurs. For more information, see [Triggers Overview](Triggers-Overview.md) and [Triggers](Triggers.md).  

## Example  
 The following example calls the [INIT Function \(Record\)](INIT-Function--Record-.md) on a record variable. This example requires that you create the following variable.  

|Name|DataType|Subtype|  
|----|--------|-------|  
|CustomerRecord|Record|Customer|  

```  
CustomerRecord.INIT;  
```  

## Example  
 The following example calls the [CALCDATE Function (Date)](CALCDATE-Function--Date-.md) and assigns the return value to a variable. The CALCDATE function has two parameters. This example uses the DateExpression and ReferenceDate variables in the function call. The values of the variables are passed to the CALCDATE function.  

 This example requires that you create the following variables.  

|Name|DataType|Length|  
|----------|--------------|------------|  
|DateExpression|Text|30|  
|ReferenceDate|Date||  
|NewDate|Date||  

```  
DateExpression := '<-7D>'  
ReferenceDate := 112509D;  
NewDate := CALCDATE(DateExpression, ReferenceDate);  
```  

 After you run the code in this example, the NewDate variable represents the date November 18, 2009.  

## See Also  
 [C/AL Functions](C-AL-Functions.md)   
 [Triggers](Triggers.md)   
 [C/AL Simple Statements](C-AL-Simple-Statements.md)
