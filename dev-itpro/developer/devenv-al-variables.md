---
title: AL variables
description: Description of AL user-defined and system-defined variables.
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 01/15/2024
ms.custom: bap-template
author: KennieNP
ms.author: solsen
ms.collection: get-started
---

# AL variables

AL has the following types of variables:

- User-defined variables  
- System-defined variables  

User-defined variables are variables that you define when you create new AL code. You can define variables that are global and apply to all methods in an object, such as a codeunit, or you can define variables that are local and apply to a single method in an object. Both types of user-defined variables are local to the object in which they're defined. These variables can be used to store information at runtime, and the values can be changed as desired.  

System-defined variables are provided by [!INCLUDE[prod_short](includes/prod_short.md)]. These variables are automatically maintained by the system. Some system-defined variables are `Rec`, `xRec`, `CurrPage`, and `CurrReport`. For more information, see [System-defined variables](devenv-system-defined-variables.md). 

At runtime, code is run in methods and triggers, such as in entry-processing code for a table. Before the code is run, values are automatically assigned to the associated system-defined variables, and the values of these variables can be used in triggers and local methods.  

The values of system-defined variables aren't updated when the AL code is being run. Instead, the values are updated before the method or trigger is run.

> [!NOTE]  
> The value in a system-defined variable doesn't propagate backward. A user can't use a system-defined variable to modify the state of the system.

## Variable names

You must follow the following rules and restrictions when you name variables:  

- Variable names must be unique. A codeunit can't contain two user-defined variables with the same name in the same scope. You can have a local variable and a global variable with the same name, but we don't recommend this.  

- Uppercase and lowercase letters aren't distinct. For example, Smith and SMITH refer to the same variable.  

- In AL, you can use special characters such as spaces in the name of a variable (an identifier).  

- The maximum length of a variable name is 128 characters.  

- A variable can't have the same name as an AL method or a reserved word. This applies to both uppercase and lowercase spellings. For example, you can't use `begin` as a valid variable name.  

All characters in your current ANSI character set are valid in variable names except for the following characters:  

- Control characters (ANSI 0-31, 255)  
- The quotation mark character (") (ANSI 34)  

> [!NOTE]  
> We don't recommend that you use characters that are outside the ASCII characters set, 0-127, because they may display differently on different computers.  

<!-- valid? 
> [!NOTE]  
> [!INCLUDE[prod_short](includes/prod_short.md)] runs on .NET. Therefore, we recommend that you use variable names that are Common Language Specification (CLS)-compliant. For more information, see [Common Language Specification](https://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library. -->

When you name a variable, you can't use special characters unless you enclose the variable name in quotation marks, as in "Customer No.". If you don't use double quotation marks, then the following rules apply:  

- The first character must be one of the following:  
- A letter in the range a…z, A…Z (ASCII 97-122, 65-90)  
- An underscore (ASCII 95)  
- The first character is followed by a maximum of 29 characters, which can be any of the following:  
  - A letter in the range a…z, A…Z (ASCII 97-122, 65-90)  
  - An underscore (ASCII 95)  
  - A digit in the range 0…9 (ASCII 48-57)  

You can include one or more special characters in a variable name in AL. If you include special characters, then the variable name must be enclosed in quotation marks. In this case, the name can contain any mix of letters, digits, and special characters.  

> [!NOTE]  
> The quotation marks aren't part of the variable name but are required to successfully compile the codeunit.

### Examples

The following examples show valid variable names:  

- Customer  
- StockGroup1  
- "@Vendor"  
- "first AddressLine"  
- "Purchase/Sales"  
- "Sales in GBP"  
- "Name with Special Characters1Ñ3"  

The following examples show *incorrect* variable names:  

- 34467  
- 23"Tubes  
- Stock Group4  
- "Sale"s in GBP"  
- \)-Names  
- END  

## Initialization

Variables are automatically initialized before AL code is run. A Boolean variable is set to `false`. Numeric variables are set to the default value zero. Strings (text and code) are initialized to the value '' (an empty string). Date and time variables are set to the undefined time 0T and the undefined date 0D, respectively. Variables of complex data types are also initialized. If a complex data type has multiple components, then each component is initialized to the value that corresponds to the data type for the component.  

System-defined variables are automatically handled and initialized. No actions are required by the user before system-defined variables can be used.  

## Assignment and type conversion

You can assign values in the following ways:  

- By using the assignment operator `:=`, such as `Variable := Expression`. The data type that results from the evaluation of the right side expression must be the same data type as the variable (left operand) or have a data type that can be converted automatically to the data type of the left operand.  

- As parameter assignment, such as `method(Expression)`. The data type that results from the evaluation of the expression must correspond to a specific data type or have a data type that can be converted automatically to the correct data type. For more information about evaluation and type conversion in expressions, see [Type Conversion in AL Expressions](devenv-type-conversion-in-expressions.md).  

Automatic type conversion in assignments occurs when the following events occur:  

- A parameter in a method call doesn't have the correct data type. For example, this can occur if a method that's supposed to be called by using an integer argument is called by using a DateTime argument.  

  > [!NOTE]  
  > If the value can't be converted, then a runtime error occurs. If the value can be converted but overflow occurs, then a runtime error occurs.

- The evaluation of the expression on the right side of an assignment operator `:=` achieves a data type that differs from the data type of the variable on the left side, and the expression can be converted to the data type of the variable.  

Automatic type conversion in assignments can occur between the following numeric data types as long as an overflow doesn't occur:  

- `Byte`  
- `Char`
- `Integer`
- `Decimal`  

Automatic type conversion in assignments can occur between the string data types:  

- `Code`  
- `Text`  

  `Text` can be automatically converted to `BigText`, but a `BigText` variable must be split into smaller parts before it can be converted to `Text`.  

<!-- **CHECK: what about collection types such as List** -->

The same assignment rules apply for arrays in AL. Furthermore, if the left operand in an assignment (the variable) is an array, the dimension or dimensions of the right side expression must correspond to the dimension or dimensions of the variable.  

> [!NOTE]  
> The type conversion that occurs in assignments can cause runtime errors even though the data types are convertible. A runtime error can occur in an assignment if the converted value is outside the valid range for the left side variable. Also, a runtime error can occur if the converted value is outside the valid range for a parameter in a method call.  

### Example 1

<!-- **CHECK: probably not use array in the example as we want them to use collection types instead** -->

The `MyVar` variable is defined as a one-dimensional array with four text type elements that have the maximum length 15. This example shows that a value can be assigned to the second element in the array.  

```AL  
MyVar[2]:= 'Enter your name';  
```  

### Example 2

In the following example, the `Result` variable is an `Option` variable. The `Amount` and `Total` variables are both `Decimal` variables.  

```AL  
var 
    Amount: Decimal;
    Total: Decimal;
    Result: Option;
begin
    Amount := 10;  
    Total := 4;   
    Result := Amount + Total;  
end
```  

This code can always be compiled, but a runtime error occurs if the result of the right-side expression `Amount + Total` exceeds the range that is permitted by the data type of the left-side `Result` variable. For an `Option` variable, the range is the same as the range of an `Integer`, which is from `-2,147,483,647 to 2,147,483,647`. A runtime error also occurs if the result of the right-side expression `Amount + Total` isn't an integer.  

### Valid assignments

The following tables show whether you can assign the value of an expression of a given type to a variable of the same type or to a variable of a different type.  

This table shows the numeric data types.  

||**Char expression**|**Option expression**|**Integer expression**|**BigInteger expression**|**Duration expression**|**Decimal expression**|  
|------|----|----|-----|--------|-----------------------------|----------------------------|  
|**Char variable**|Valid|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  
|**Option variable**|Valid|Valid|Valid except in a `for` statement|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  
|**Integer**|Valid|Valid|Valid|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  
|**BigInteger variable**|Valid|Valid|Valid|Valid|Valid|Valid but overflow might occur|  
|**Duration variable**|Valid|Valid|Valid|Valid|Valid|Valid but overflow might occur|  
|**Decimal variable**|Valid|Valid|Valid|Valid but overflow might occur|Valid but overflow might occur|Valid|  

This table shows the string data types.  

||**Text expression**|**Code expression**|**BigText expression**|  
|------|-------------------------|-------------------------|----------------------------|  
|**Text variable**|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  
|**Code variable**|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  
|**BigText variable**|Valid but overflow might occur|Valid but overflow might occur|Valid but overflow might occur|  

> [!NOTE]  
> You can assign the `BigText` variable with the `BigText` methods. For more information, see [BigText Data Type](methods-auto/bigtext/bigtext-data-type.md).

## See also

[System-defined variables](devenv-system-defined-variables.md)  
[AL method reference](methods-auto/library.md)  
[Properties](properties/devenv-properties.md)  