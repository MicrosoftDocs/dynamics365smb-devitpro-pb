---
title: "AL Complex Types"
description: "Working with complex types in AL for Business Central"
ms.custom: na
ms.date: 02/16/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: esbenk
---

# AL Complex Types

[!INCLUDE[2021_releasewave1.md](../includes/2021_releasewave1.md)]

With the latest version of [!INCLUDE[prod_short](includes/prod_short.md)], it is possible to return most types from procedures - both user-defined types and most built-in types.

As an example, the below method will take a name, and return the first customer record that matches the name. The signature specifies the return type at the end of the procedure declaration, and the procedure exits by returning the found customer record.

```al
/// <summary> 
/// Get the first customer with name starting with <paramref name="Name"/> 
/// </summary> 
/// <param name="Name">Name filter</param> 
/// <returns>First customer</returns> 

procedure GetCustomerByName(Name: Text): record Customer;

var

    Customer: record Customer;

begin

    Customer.SetFilter(Name, '@' + Name + '*');
    Customer.FindFirst();

    exit(Customer);

end;
```
 
It is also possible to use a named return value. Internally, the exit-statement causes an assignment to an allocated return value. The assignment will have a small performance cost based on the type. Since the record type is treated as a value-type it is better.  

```al
procedure GetCustomerByName(Name: Text) Customer: record Customer; 

begin 

   Customer.SetFilter(Name, '@' + Name + '*'); 

   Customer.FindFirst(); 

end; 

```
 
The method `GetCustomerByName()` returns a Customer record. It can be used as you would expect: 

```al
// Get the first customer with name starting with 'spo' 

Customer := GetCustomerByName('spo'); 
```

The returned value does not have to be used in an assignment statement. It can be used as part of an expression like: 

```al
// Use the returned value as an expression. 

DoSomethingWithSales(GetCustomerByName('spo').GetSalesLCY()); 
```
 
This is not only for user-defined types like records, codeunits, etc., but also for built-in types. For example, when using the [HttpClient Data Type](methods-auto/httpclient/httpclient-data-type.md), it is possible to write code like illustrated below.

```al

/// <summary> 
/// Returns a bing-ready HttpClient 
/// </summary> 
/// <returns>Bing HttpClient</returns> 
procedure GetBingClient() Result: HttpClient;

begin

    Result.SetBaseAddress('https://www.bing.com');

end;

/// <summary> 
/// Get the response from a request to bing. 
/// </summary> 
/// <returns>The response message</returns> 

procedure GetBingResponse() Response: HttpResponseMessage

begin

    GetBingClient().Get('', Response)

end;

/// <summary> 
/// Get the response from www.bing.com as an html-string.  
/// </summary> 
/// <returns>string with html</returns> 
procedure GetBingHtml() Result: Text;

begin

    GetBingResponse().Content().ReadAs(Result);

end;
```

## See Also

[Programming in AL](devenv-programming-in-al.md)  
[AL Simple Statements](devenv-al-simple-statements.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[AL Essential Methods](devenv-essential-al-methods.md)  
[HttpClient Data Type](methods-auto/httpclient/httpclient-data-type.md)
