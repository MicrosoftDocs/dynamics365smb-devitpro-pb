---
title: "AL Simple Statements"
ms.custom: na
ms.date: 06/21/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 471299b6-82cd-41cc-b529-8b60ece530a5
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---



# AL Simple Statements
AL simple statements are single-line statements that are executed sequentially and do not alter the flow of execution of code. This article explains some of the simple statements in AL.   

## Assignment statements
Assignment statements assign a value to a variable. The value that you assign to the variable is an AL expression. It can be a constant or a variable, or it can consist of multiple elements of AL expressions. If you use a method call as the value to assign to a variable in an assignment statement, then the value that is assigned is the return value of the method.  

 You use the ":=" operator for assignment statements.  

### Example  
 The following example assigns a constant integer value to an integer variable that you have defined.  

```  
Count := 1;  
```  

### Example  
 The following example assigns a value that consists of a constant, an operator, and a variable.  

```  
Amount := 2 * Price;  
```  

### Example  
 The following example assigns the return value of the [OPEN Method (File)](methods/devenv-open-method-file.md) to a Boolean variable that you have defined.  

```  
OK := TestFile.OPEN('C:\temp\simple.xml');  
```  

 The return value of the OPEN method is optional. If you do not handle the return value in your code, then a run-time error occurs when a method returns FALSE. The following example causes a run-time error if the file C:\temp\simple.xml cannot be opened.  

```  
TestFile.OPEN('C:\temp\simple.xml');  
```  

 You can handle the return value by using an IF-THEN statement.  

```  
IF TestFile.OPEN('C:\temp\simple.xml') THEN BEGIN  
  // continue running  
ELSE  
  ERROR(Text001);  
```  

## Method statements
You use method statements to execute either built-in system methods or user-defined (custom) methods. Method calls may include parameters, which are passed to the method. For more information, see [Calling Methods](devenv-al-methods.md#CallMethod). 

## ASSERTERROR statements
You use ASSERTERROR statements in test methods to test how your application behaves under failing conditions. The ASSERTERROR keyword specifies that an error is expected at run time in the statement that follows the ASSERTERROR keyword.  

 If a simple or compound statement that follows the ASSERTERROR keyword causes an error, then execution successfully continues to the next statement in the test method. You can get the error text of the statement by using the [GETLASTERRORTEXT method](methods/devenv-GETLASTERRORTEXT-method.md).  

 If a statement that follows the ASSERTERROR keyword does not cause an error, then the ASSERTERROR statement causes the following error and the test method that is running produces a FAILURE result:  

 **TestAsserterrorFail: FAILURE**  

 **An error was expected inside an ASSERTERROR statement.**  

### Example  
 To create a test method to test the result of a failure of a CheckDate method that you have defined, you can use the following code. This example requires that you create a functmethodion called CheckDate to check whether the date is valid for the customized application.  

```  
InvalidDate := 010184D;  
InvalidDateErrorMessage := Text001;  
ASSERTERROR CheckDate(InvalidDate);  
IF GETLASTERRORTEXT <> InvalidDateErrorMessage THEN  
  ERROR('Unexpected error: %1', GETLASTERRORTEXT);  
```  

This example requires the following variables.

```  
var
    InvalidDate : Date;
    CusInvalidDateErrorMessage : Text; 
    Text001 : TextConst 'The date is outside the valid date range.';
```  

## WITH statements
The following syntax shows a WITH-DO statement.  

```  
WITH <Record> DO  
  <Statement>  
```  

 When you work with records, addressing is created as record name, dot \(period\), and field name:  

 <*Record*>.<*Field*>  

 If you work continuously with the same record, then you can use WITH statements. When you use a WITH statement, you can only specify the record name one time.  

 Within the scope of <*Statement*>, fields in *Record*> can be addressed without having to specify the record name.  

 You can nest several WITH statements. If you have identical names, then the inner WITH statement overrules the outer WITH statement.  

### Example  
 This example shows two ways to write the same code that creates a record variable that you can commit later.  

```  
CustomerRec."No." := '1234';  
CustomerRec.Name := 'Windy City Solutions';  
CustomerRec."Phone No." := '555-444-333';  
CustomerRec.Address := '1241 Druid Avenue';  
CustomerRec.City := 'Windy City';  
MESSAGE('A variable has been created for this customer.');  
```  

This example requires the following variables.

```  
var
    CustomerRec : Record Customer;
```  

 The following example shows another way to create a record variable that you can commit later: 

```  
WITH CustomerRec DO BEGIN  
  "No." := '1234';  
  Name := 'Windy City Solutions';  
  "Phone No." := '555-444-333';  
  Address := '1241 Druid Avenue';  
  City := 'Windy City';  
  MESSAGE('A variable has been created for this customer.');  
END;  
```  

### Programming conventions  
 Within WITH-DO blocks, do not repeat the name of the object by using the member variable or method.  

 If you nest a WITH-DO block within another explicit or implicit WITH-DO block, then the WITH-DO block that you create within another WITH-DO block must always be attached to a variable of the same type as the variable that is attached to the surrounding WITH-DO block. Otherwise, it can be difficult to see what variable that a member variable or method refers to. For example, implicit WITH-DO blocks occur in table objects and in pages that have been attached to a record.  

#### Example  
 The following example demonstrates nested WITH-DO blocks. Both WITH-DO blocks are attached to a Customer Ledger Entry record variable.  

```  
WITH CustLedgEntry DO BEGIN  
  INSERT;  
  ...;  
  WITH CustLedgEntry2 DO BEGIN  
    INSERT;  
    ...;  
  END;  
END;  
```  

#### Incorrect example  
 The following example demonstrates incorrect code in which you cannot directly tell which record variable that the MyField field refers to.  

```  
WITH CustLedgEntry DO BEGIN  
  ...;  
  WITH VendLedgEntry DO BEGIN  
    MyField := <Some Value>;  
    ...;  
  END;  
END;  
```  

## See Also
[Control Statements](devenv-al-control-statements.md)  
[Methods](devenv-al-methods.md)  