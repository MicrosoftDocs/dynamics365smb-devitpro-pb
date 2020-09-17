---
title: "AL Control Statements"
ms.custom: na
ms.date: 08/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# AL Control Statements

AL code consists of one or more statements, which are executed sequentially in top-down order. However, you will often need to control the direct top-down flow of the execution. One or more statements may have to be repeated more than once, or you may have to make the execution of a certain statement conditional. To do this, you use control structures.  

The control structures in AL are divided into the following main groups, as described in this article:  

- [AL Compound Statements](devenv-al-control-statements.md#al-compound-statements)  
- [AL Conditional Statements](devenv-al-control-statements.md#al-conditional-statements)  
- [AL Repetitive Statements](devenv-al-control-statements.md#al-repetitive-statements)  

> [!NOTE]  
> In the following sections conventions for how to structure and align AL code are presented to introduce best practices. In many cases the structure is not necessary to get the code to compile, but rather to improve readability.

## AL compound statements

In some cases, the AL syntax only lets you use a single statement. However, if you have to execute more than one simple statement, the statements can be written as a compound statement by enclosing the statements between the `begin` and `end` keywords.  

```  
begin  
    <Statement 1>;  
    <Statement 2>;  
    ..  
    <Statement n>;  
end;  
```  

The individual statements are separated by a semicolon. In AL, a semicolon is used to separate statements and not, as in other programming languages, as a terminator symbol for a statement. Nevertheless, an extra semicolon before an end does not cause an error because it is interpreted by the compiler as an empty statement.  

## Blocks  

The begin-end structure is also called a *block*. Blocks can be very useful to refer to the other control structures in AL.  

When begin follows then, else, or do, it should be on the same line and preceded by one space character.  

### Example  

```  
if (x = y) and (a = b) then begin  
    x := a;  
    y := b;  
end;   
```  

### Example  

```  
if (xxx = yyyyyyyyyy) and   
    (aaaaaaaaaa = bbb)  
then begin  
    x := a;  
    x := y;  
    a := y;  
end else begin  
    y := x;  
    y := a;  
end;  
```  

## AL conditional statements

You use conditional statements to specify a condition and one or more commands to execute if the condition is evaluated as true or false. There are two types of conditional statements in AL:  

- if-then-else, where there are two choices  
- case, where there are more than two choices  

### If-then else statements

if-then-else statements have the following syntax.  

```  
if <Condition> then  
    <Statement1>  
[else  
    <Statement2>]  
```  

If *`<Condition>`* is true, then *`<Statement1>`* is executed. If *`<Condition>`* is false, then *`<Statement2>`* is executed.  

The square brackets around else *`<Statement2>`* mean that this part of the statement is optional. The else statement is used when different actions are executed depending on how *`<Condition>`* is evaluated.  

You can build more complex control structures by nesting if-then-else statements. The following example is a typical if-then-else statement.  

```  
if <Condition1> then   
    if <Condition2> then   
        <Statement1>   
    else  
        <Statement2>  
```  

If *`<Condition1>`* is false, then nothing is executed. If *`<Condition1>`* and *`<Condition2>`* are both true, then *`<Statement1>`* is executed. If *`<Condition1>`* is true and *`<Condition2>`* is false, then *`<Statement2>`* is executed.  

> [!NOTE]  
> A semicolon in front of an else statement is not allowed.  

Reading several nested if-then-else statements can be very confusing but generally, an else statement belongs to the last if statement that lacks an else statement.  

#### Programming conventions  

- If and then should be on the same line. else should be on a separate line.

- If there are many or long expressions, then should be on a new line and be aligned with if.  

- When you write if expressions with then and else parts, write them so that the then result is more probable than the else one.  

- If the last statement in the then part of an if-then-else statement is an exit or an error, do not continue with an else statement.  

#### Example  

```  
if x = y then  
    x := x + 1  
else  
    x := -x - 1;  
```  

#### Example  

```  
if (xxxxxxxxxx = yyy) and   
    (aaa = bbbbbbbbbb)  
then  
    x := a  
else  
    y := b;  
```  

#### Example  

```  
if x <> y then  
    exit(true);  
x := x * 2;  
y := y - 1;  
```  

#### Incorrect example  

```  
if x < y then  
    exit(true)  
else begin  
    x := x * 2;  
    y := y - 1;  
end;  
```  

#### Example  
The following example shows an if-then statement without the optional else statement.  

```  
if Amount < 1000 then  
    Total := Total + Amount;  
```  

#### Example  
The following example shows a nested if-then-else statement.  

```  
...  
if Amount < 1000 then begin  
    if I > J then  
        Max := I  
    else  
        Max := J;  
    Amount := Amount * Max;  
    end  
else  
...  

```  

### Case statements  
Case statements have the following syntax.  

```  
case <Expression> of  
    <Value set 1>:  
        <Statement 1>;  
    <Value set 2>:  
        <Statement 2>;  

    <Value set n>:  
        <Statement n>;  
    [else  
        <Statement n+1>]  
end;  
```  

In this definition, *`<Expression>`* cannot be a record and *`<Value set>`* must be an expression or a range.  

Case statements are also called multiple option statements and are typically used when you must choose between more than two different actions. The method of the case statement is as follows:  

- The *`<Expression>`* is evaluated, and the first matching value set executes the associated statement, if there is one.  

- If no value set matches the value of the expression and the optional else part has been omitted, then no action is taken. If the optional else part is used, then the associated statement is executed.  

The data type of the value sets must be the same as the data type of *`<Expression>`* or at least be convertible to the same data type.  

In most cases, the data type of the value sets are converted to the date type of the evaluated expression. The only exception is if the evaluated expression is a Code variable. If the evaluated expression is a Code variable, then the value sets are not converted to the Code data type.  

> [!NOTE]  
> This type conversion can cause an overflow at run time if the resulting data type cannot hold the values of the datasets.  

For more information about Code variables, see [Code Data Type](datatypes/devenv-code-data-type.md).  

#### Programming conventions

When you use a case statement, indent the value sets by four character spaces. If you have two or more value sets on the same line, then separate them by commas without spaces. The last value set on a line is immediately followed by a colon without a preceding space. The action starts on the line after the value set and is further indented by four character spaces. If there is a begin, then it should be put on a separate line unless it follows else. If a begin follows an else, then it should be on the same line as else.  

If there are more than two alternatives, use a case statement. Otherwise, use an if-then-else statement.  

#### Example

```  
case Field of  
    Field::A:  
        begin  
            x := x + 1;  
            y := -y - 1;  
        end;  
    Field::B:  
        x := y;  
    Field::C,Field::D:  
        y := x;  
    else begin  
        y := x;  
        a := b;  
    end;  
end;  
```  

#### Example  
The following AL code prints various messages depending on the value of *Number*. If the value of *Number* does not match any of the entries in the case structure, then the else entry is used as the default.  
 

```  
case Number of  
    1,2,9:  
        message('1, 2, or 9.');  
    10..100:  
        message('In the range from 10 to 100.');  
    else  
        message('Neither 1, 2, 9, nor in the range from 10 to 100.');  
end;  
```

#### Example  
The following AL code shows how value sets in a case statement are evaluated if the expression is a Code data type.

```  
MyCode := 'ABC';  
case MyCode of  
    'abc':  
        message('This message is not displayed.');   
    'def':  
        message('This message is not displayed.');  
    else  
      message('The value set does not match the expression.');
end;
```

This example requires that you create the following code data type variable.

```
var
    MyCode : Code[10];
```  

The value set 'abc' is not converted because the evaluated expression MyCode is a code variable.  

## AL repetitive statements

A repetitive statement is also known as a loop. The following table shows the looping mechanisms in AL.  

|Looping mechanism|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------------------|---------------------------------------|  
|for|Repeats the inner statement until a counter variable equals the maximum or minimum value specified.|  
|foreach|Repeats the inner statement for each statement in a List, XmlNodeList, XmlAttributeCollection, or JsonArray.|
|while|Repeats the inner statement as long as the specified condition is **true**. The statement in a loop of this kind is repeated 0 or more times.|  
|repeat|Repeats the inner statements until the specified conditions evaluate to **true**. The statements in a loop of this kind are always executed at least one time.|  


### For-to and for-downto control structure  

The following syntax shows the for-to and for-downto statement.  

```  
for <Control Variable> := <Start Number> to <End Number> do  
    <Statement>  
```  

```  
for <Control Variable> := <Start Number> downto <End Number> do  
    <Statement>  
```  

 The data type of *`<Control Variable>`*, *`<Start Number>`*, and *`<End Number>`* must be Boolean, number, time, or date. 

 Use for-to and for-downto statements when you want to execute code a specific number of times. The <*Control Variable*> controls the number of times that the code of the inner statement is executed according to the following:  

- In a for-to loop statement, the *`<Control Variable>`* value is increased by one after each iteration. The inner *`<Statement>`* is executed repeatedly until the `*<Start Number>`* value is greater than the `*<End Number>*` value.  

- In a for-downto loop statement, the *`<Control Variable>`* value is decreased by one after each iteration. The inner *`<Statement>`* is executed repeatedly until the *`<Start Number>`* value is less than the *`<End Number>`* value.  

> [!NOTE]  
> When the for statement is executed, *`<Start Number>`* and *`<End Number>`* are converted to the same data type as *`<Control Variable>`* if it is required. This type conversion can cause a run-time error.  

> [!NOTE]  
> If the value of the *`<Control Variable>`* is changed inside the for loop, then the behavior is not predictable. Furthermore, the value of the *`<Control Variable>`* is undefined outside the scope of the for loop.  

#### Example 1  
The following code initiates a for loop that uses the integer control variable named Count.  

```  
for Count := 1000 to 100000000000000 do  
```  

This example requires the following Integer data type variable.  
```  
var
    Count : Integer;
```  

When this statement is executed, a run-time error occurs because the start and end values are converted to the same data type as the Count control variable. Count has been declared as an integer variable. The end number 100000000000000 is outside the valid range for integers, and an error occurs.  

#### Example 2  
 The following example shows how to nest for statements.  

 Set the Dimensions property of variable A to 5;7.  

 The following for statements could be used to initialize every element in a 5x7 array with the value 23.  

```  
for I := 1 to 5 do  
    for J := 1 to 7 do  
        A[I,J] := 23;  
```  

This example requires the following Integer data type variables.  
```  
var
    I : Integer;
    J : Integer;
```  

### Foreach control structure
You can use the foreach statement to iterate through List, XmlNodeList, XmlAttributeCollection, and JsonArray expressions.
The foreach statement has the following syntax.

```  
foreach <Element> in <List> do
    <Statement>  
```  
The *`<List>`* variable must be of the List, XmlNodeList, XmlAttributeCollection, or JsonArray type. The *`<Element>`* variable must be a data type that is compatible with elements specified by the *`<List>`*.  

The following code example iterates through a list of customer names and returns each customer name in a message.
```  
procedure PrintCustomerNames(customerNames : List of [Text]);
var
    customerName : Text;
begin
    foreach customerName in customerNames do
        message(customerName);
end;

```  

### While-do control structure  

The following syntax shows the while-do statement.  

```  
while <Condition> do  
    <Statement>  
```  

If *`<Condition>`* is true, then *`<Statement>`* is executed repeatedly until *`<Condition>`* becomes false. If *`<Condition>`* is false from the start, then *`<*Statement>`* is never executed.  

The while do statement can be used when some code should be repeated as long as an expression is true.  

#### Programming conventions  

When there is only one condition, put while and do on the same line. Put the statements on separate lines and indented by two spaces.  

When there are multiple conditions, put the conditions on separate lines and indented by two spaces and put do on a separate line that is aligned with while.  

#### Example  

```  
while <expr> do  
    <Statement>;  
```  

#### Example  

```  
while <expr> do begin  
    <Statement>;  
    <Statement>;  
end;  
```  

#### Example  

```  
while <expr> and   
      <expr> and  
      <expr>  
do begin  
    <Statement>;  
    <Statement>;  
end;  
```  

#### Example  
The following AL code increases the variable I until it equals 1000 and displays a message when it is finished.  

```  
while I < 1000 do  
    I := I + 1;  
message(format(I));  
```  

This example requires the following integer data type variable.  

```  
var  
    I : integer
```

### Repeat-until control structure  
The following syntax shows the repeat-until statement.  

```  
repeat  
    <Statements> until <Condition>  
```  

 *`<Statements>`* is executed repeatedly until *`<Condition>`* is true.  

 The repeat until control structure resembles the while control structure. The difference is that because the repeat until statement is executed from left to right, the *`<Statements>`* is always executed at least one time, regardless of what the *`<Condition>`* is evaluated to. This contrasts with the while control structure, which performs the evaluation before the *`<Statement>`* is executed. In the while control structure, if the first evaluation of *`<Condition>`* returns false, then no statements are executed.  

#### Programming conventions  
 Always put repeat on a separate line.  

#### Example  

```  
if x < y then begin  
    repeat  
        x := x + 1;  
        a := a - 1;  
    until x = y;  
        b := x;  
end;  
```  

#### Example  
This code uses a repeat-until loop to count the number of entries in the Customer table.

```  
Count := 0;  
if Customer.find('-') then  
repeat  
    Count := Count + 1;  
until Customer.next <= 0;  
message('The Customer table contains %1 records.',Count);  
```  
This example requires the following variables.
```  
var
    Count : Integer;
    Customer : Record Customer;  
```  
The FIND method finds the first entry in the table. Each time NEXT is called, it steps one record forward. When NEXT equals 0, there are no more entries in the table. The loop is exited, and a message displays how many entries were found.  

### Exit statement  

The exit statement is used to control the flow of the execution. The following syntax shows an exit statement.  

```  
exit([<Value>])  
```  

 An exit statement is used to interrupt the execution of a AL trigger. The interruption occurs even when the code is executed inside a loop or a similar structure. The exit statement is also used when a local method should return a value.  

 Using exit without a parameter in a local method corresponds to using the parameter value 0. The AL method will return the value 0 or '' (empty string).  

 A compile-time error occurs if exit is called by using a return parameter from either of the following:  

- System-defined triggers.  

- Local methods that do not return a value.  

#### Example  
 The following example shows the use of the exit statement in a local method. Assume that the if statement is used to detect an error. If the error condition is met, then execution is stopped and the local method returns the error code 1.  

```  
for I := 1 to 1000 do begin  
    if Amount[I] < Total[I] then  
        exit(1);  
    A[I] := Amount[I] + Total[I];  
end;  
```  

## Break statement
You use the break statement to terminate the iterative statement in which it appears.  

```  
break;  
```  

 You typically use the break statement in the repeating statements such as for, <!--NAV forEACH, -->while, or repeat to stop an iteration or loop when certain conditions are met.  

> [!NOTE]  
> The break statement is different than the [Break Method \(Report, XMLport\)](methods/devenv-break-method-report-xmlport.md). Although both stop an iteration or loop, the break method will also terminate the trigger in which it is run.  

## Example  
 The following AL code increases the variable I by one for each iteration, and terminates the iteration when I equals 10.  

```  
while Count < 1000 do
    begin
    Count := Count + 1;
    message(FORMAT(Count));
    if Count = 10 then
        break;
    end; 
end; 
 
```  

This example requires the following integer data type variable.  

```  
var  
    I : integer
```

## See Also

[Programming in AL](devenv-programming-in-al.md)  
[AL Simple Statements](devenv-al-simple-statements.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[AL Essential Methods](devenv-essential-al-methods.md)
