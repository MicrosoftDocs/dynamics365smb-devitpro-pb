---
title: "Avoiding Run-Time Errors"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 17b4afad-07bd-47bc-a4fb-621eb33808ce
caps.latest.revision: 10
---
# Avoiding Run-Time Errors
Run-time errors occur during program execution. These errors are not detected by the compiler because the code is syntactically correct.  

## Run-Time Error Example  
 An example of a run-time error is a statement that causes division by zero. In the following statement, the syntax is correct, but the statement may cause a division by zero error if the variable `SecondNumber` is assigned a value of 0.  

```  
Ratio := FirstNumber / SecondNumber;  
```  

 The common trait of these errors is that the code works correctly many times, but fails in others. The risk is that because there is nothing syntactically wrong with the code, the error might occur when the program is already being used. Unless you handle the run-time error in your code, default messages will appear.  

## How to Avoid Run-Time Errors  
 The following guidelines recommend ways to avoid run-time errors. The conditions under which run-time errors occur depend on the context of your application.  

 For example, if you use the [GET Function \(Record\)](GET-Function--Record-.md) to locate a record, then we recommend that you handle the risk that a run-time error occurs when no record is found. If you are sure that the specific context prevents this situation, then you can omit handling a possible run-time error. For example, the context could be that you verify the existence of a record before you call the GET function.  

 There are two categories of run-time errors:  

-   Errors that are related to the use of data types.  

-   Errors that occur if a function is unsuccessful doing what it is supposed to do.  

 You can prevent some errors from occurring. Other errors cannot always be avoided, but you can write code that shields the user from the error. Instead of the default error handling, which displays a message, closes the page that was active when the error occurred, and rolls back any changes to the database, you can write an error handler that, for example, displays a message that explains why the error occurred and gives the user an opportunity to correct the input that caused the error.  

### Data Type-Related Errors  
 The easiest way to avoid data type-related errors is to use the correct data types. You can avoid errors such as the type conversion errors and overflow errors by using the correct data types.  

 An example of data type-related errors for integer and decimal data types is division by zero errors. You can avoid division by zero errors in several ways, depending on the context where the code fragment is used. If the user enters the denominator \(the `SecondNumber` variable\) in a text box immediately before the evaluation of the statement, then you can test the value of `SecondNumber` before you perform the division and reject a value of 0 \(zero\).  

```  
IF SecondNumber <> 0 THEN  
  Ratio := FirstNumber / SecondNumber  
ELSE  
  MESSAGE(‘SecondNumber must not be 0’);  
```  

 If `SecondNumber` is a field in a database table and it should never be allowed to have a value of 0 \(zero\), then the best place to perform this check is in the `OnValidate` trigger of the field. This enables you to make sure that a value of 0 \(zero\) can never be entered in the field.  

### Other Run-time Errors  
 Any function that does not accomplish what it is intended to do can cause a run-time error. For example, the GET function, which is used to locate a record in a table according to criteria that you specify, can cause a run-time error in some instances.  

 The syntax of the GET function is:  

 `[Ok :=] Record.GET([Value1], [Value2 ],...)`  

 The return value of the function is `Ok`, a Boolean. If a record is found, then the return value is **true**; otherwise, it is **false**. This return value is optional, as indicated by the square brackets. If you do not use the return value and the requested record cannot be found, then a run-time error occurs and a system-generated error message is displayed. However, if you use the return value, then it is assumed that you handle any errors.  

 The [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md) provides information about how C/AL functions handle errors. You can also use the syntax description in the Symbol Menu to verify whether a function returns a value called `Ok`  

 If you use the return value in either of the following examples, then you shield the user from a run-time error.  

 **Example 1**  

```  
IF NOT Customer.GET(“No.”) THEN  
  Customer.INIT;  
```  

 **Example 2**  

```  
IF NOT Customer.GET(“No.”) THEN BEGIN  
  MESSAGE(‘Customer %1 not found.’, “No.”);  
  EXIT;  
END;  
```  

 In the first example, if a customer record with the given number \(**No.**\) cannot be retrieved, then an \(empty\) record is initialized. In the second example, the user is notified that the record cannot be found and the trigger from where the `GET` function was called is exited. These examples are only general guidelines. You must consider how to handle situations such as these in the context of your own application.  

## Finding and Correcting Run-time Errors  
 To determine the cause of a run-time error, you must know the sequence of events that led to the error. The sequence of events should include the following:  

-   What the user was doing at the time of the error.  

-   What values the user entered.  

-   What record caused the error.  

 If the error was caused by a calculation that failed to check whether a division by zero was about to be performed, then you can find the statement that led to the error. However, if the circumstances that led to the error are more complex and you cannot determine the exact location of the error, then you can use the [!INCLUDE[navnow](includes/navnow_md.md)] debugger.  

## See Also  
 [Debugging](Debugging.md)
