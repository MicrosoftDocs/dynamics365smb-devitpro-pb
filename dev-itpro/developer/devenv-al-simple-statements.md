---
title: "AL Simple Statements"
description: "Describes the simple statements in AL for Business Central with examples"
ms.custom: na
ms.date: 06/22/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
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
The following example assigns the return value of the [Open Method (File)](methods-auto/file/file-open-method.md) to a Boolean variable that you have defined.  

```  
OK := TestFile.Open('C:\temp\simple.xml');  
```  

The return value of the `Open` method is optional. If you do not handle the return value in your code, then a run-time error occurs when a method returns **false**. The following example causes a run-time error if the file `C:\temp\simple.xml` cannot be opened.  

```  
TestFile.Open('C:\temp\simple.xml');  
```  

You can handle the return value by using an if-then statement.  

```  
if TestFile.Open('C:\temp\simple.xml') then begin  
  // continue running  
else  
  Error(Text001);  
```  

## Method statements
You use method statements to execute either built-in system methods or user-defined (custom) methods. Method calls may include parameters, which are passed to the method. For more information, see [Calling Methods](devenv-al-methods.md#Callmethod). 

## AssertError statements
You use AssertError statements in test methods to test how your application behaves under failing conditions. The AssertError keyword specifies that an error is expected at run time in the statement that follows the AssertError keyword.  

If a simple or compound statement that follows the AssertError keyword causes an error, then execution successfully continues to the next statement in the test method. You can get the error text of the statement by using the [GetLastErrorText method](methods/devenv-GETLASTERRORTEXT-method.md).  

If a statement that follows the AssertError keyword does not cause an error, then the AssertError statement causes the following error and the test method that is running produces a FAILURE result:  

```
TestAsserterrorFail: FAILURE

An error was expected inside an AssertError statement.
```  

### Example
To create a test method to test the result of a failure of a `CheckDate` method that you have defined, you can use the following code. This example requires that you create a method called `CheckDate` to check whether the date is valid for the customized application.  

```  
InvalidDate := 19000101D;  
InvalidDateErrorMessage := Text001;  
AssertError CheckDate(InvalidDate);  

IF GetLastErrorText <> InvalidDateErrorMessage then
  Error('Unexpected error: %1', GetLastErrorText);  
```  

This example requires the following variables.

```  
var
    InvalidDate : Date;
    InvalidDateErrorMessage : Text; 
    Text001 : Label 'The date is outside the valid date range.';
```  

## With statements (to be deprecated)

> [!IMPORTANT]  
> Using the `with` statement is being deprecated with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] 2020, release wave 2. With this release it will is a warning, which will become an error in a future release. <br>Using `with` statements introduces possible uniqueness collisions when multiple extensions contribute to the same objects because it allows working with members using just simple names instead of qualifying them. To avoid this going forward, we are marking the use of `with`, be it implicit or explicit as warnings. With this release, you can use a quick action to fix these files, as well as suppress obsolete warnings for now. Code that contains `with` statements will, however, need to be refactored before `with` statements are compiled with errors. For more information, see [Deprecating Explicit and Implicit With Statements](devenv-deprecating-with-statements-overview.md). And for information about using directives in code, see [Directives in AL](directives/devenv-directives-in-al.md).

The following syntax shows a with-do statement.  

```  
with <Record> do  
  <Statement>  
```  

When you work with records, addressing is created as record name, dot (period), and field name:  

<*Record*>.<*Field*>  

If you work continuously with the same record, then you can use `with` statements. When you use a `with` statement, you can only specify the record name one time.  

Within the scope of <*Statement*>, fields in <*Record*> can be addressed without having to specify the record name.  

You can nest several `with` statements. If you have identical names, then the inner `with` statement overrules the outer `with` statement.  

### Example  
This example shows two ways to write the same code that creates a record variable that you can commit later.  

```  
CustomerRec."No." := '1234';  
CustomerRec.Name := 'Windy City Solutions';  
CustomerRec."Phone No." := '555-444-333';  
CustomerRec.Address := '1241 Druid Avenue';  
CustomerRec.City := 'Windy City';  
Message('A variable has been created for this customer.');  
```  

This example requires the following variables.

```  
var
    CustomerRec : Record Customer;
```  

The following example shows another way to create a record variable that you can commit later: 

```  
with CustomerRec do begin  
  "No." := '1234';  
  Name := 'Windy City Solutions';  
  "Phone No." := '555-444-333';  
  Address := '1241 Druid Avenue';  
  City := 'Windy City';  
  Message('A variable has been created for this customer.');  
end;  
```  

### Programming conventions  
Within `with-do` blocks, do not repeat the name of the object by using the member variable or method.  

If you nest a `with-do` block within another explicit or implicit `with-do` block, then the `with-do` block that you create within another `with-do` block must always be attached to a variable of the same type as the variable that is attached to the surrounding `with-do` block. Otherwise, it can be difficult to see what variable that a member variable or method refers to. For example, implicit `with-do` blocks occur in table objects and in pages that have been attached to a record.  

#### Example  
The following example demonstrates nested `with-do` blocks. Both `with-do` blocks are attached to a Customer Ledger Entry record variable.  

```  
with CustLedgEntry do begin  
  Insert;  
  ...;  
  with CustLedgEntry2 do begin
    Insert;  
    ...;  
  end;  
end;  
```  

#### Incorrect example  
The following example demonstrates incorrect code in which you cannot directly tell which record variable that the MyField field refers to.  

```  
with CustLedgEntry do begin
  ...;  
  with VendLedgEntry do begin  
    MyField := <Some Value>;  
    ...;  
  end;  
end;  
```  

## See Also

[Control Statements](devenv-al-control-statements.md)  
[Methods](devenv-al-methods.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[AL Essential Methods](devenv-essential-al-methods.md)