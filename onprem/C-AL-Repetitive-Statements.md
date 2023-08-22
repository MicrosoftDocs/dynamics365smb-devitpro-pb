---
title: "C/AL Repetitive Statements"
description: "Describing the C/AL repetitive statements."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3e3378be-bfe7-4371-9468-d6a028d5eded
caps.latest.revision: 16
---
# C/AL Repetitive Statements
A repetitive statement is also known as a loop. The following table shows the looping mechanisms in C/AL.  

|Looping mechanism|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------------------|---------------------------------------|  
|FOR|Repeats the inner statement until a counter variable equals the maximum or minimum value specified.|  
|FOREACH|Repeats the inner statement for each element in a .NET Framework collection.|  
|WHILE|Repeats the inner statement as long as the specified condition is **TRUE**. The statement in a loop of this kind is repeated 0 or more times.|  
|REPEAT|Repeats the inner statements until the specified conditions evaluate to **TRUE**. The statements in a loop of this kind are always executed at least one time.|  

## FOR-TO and FOR-DOWNTO Control Structure  
 The following syntax shows the FOR-TO and FOR-DOWNTO statement.  

```  
FOR <Control Variable> := <Start Number> TO <End Number> DO  
  <Statement>  
```  

```  
FOR <Control Variable> := <Start Number> DOWNTO <End Number> DO  
  <Statement>  
```  

 The data type of <*Control Variable*>, <*Start Number*>, and <*End Number*> must be Boolean, number, time, or date.  

 Use FOR-TO and FOR-DOWNTO statements when you want to execute code a specific number of times. The <*Control Variable*> controls the number of times that the code of the inner statement is executed according to the following:  

-   In a FOR-TO loop statement, the <*Control Variable*> value is increased by one after each iteration. The inner <*Statement*> is executed repeatedly until the <*Start Number*> value is greater than the <*End Number*> value.  

-   In a FOR-DOWNTO loop statement, the <*Control Variable*> value is decreased by one after each iteration. The inner <*Statement*> is executed repeatedly until the <*Start Number*> value is less than the <*End Number*> value.  

> [!NOTE]  
>  When the FOR statement is executed, <*Start Number*> and <*End Number*> are converted to the same data type as <*Control Variable*> if it is required. This type conversion can cause a run-time error.  

> [!NOTE]  
>  If the value of the <*Control Variable*> is changed inside the FOR loop, then the behavior is not predictable. Furthermore, the value of the <*Control Variable*> is undefined outside the scope of the FOR loop.  

### Example 1  
 Create the following variable.  

|Variable|Data type|  
|--------|---------|  
|Count|Integer|  

 The following code initiates a FOR loop that uses the integer control variable named Count.  

```  
FOR Count := 1000 TO 100000000000000 DO  
```  

 When this statement is executed, a run-time error occurs because the start and end values are converted to the same data type as the Count control variable. Count has been declared as an integer variable. The end number 100000000000000 is outside the valid range for integers, and an error occurs.  

### Example 2  
 The following example shows how to nest FOR statements.  

 Create the following variables.  

|Variable|Data type|  
|--------|---------|  
|I|Integer|  
|J|Integer|  

 Set the Dimensions property of variable A to 5;7.  

 The following FOR statements could be used to initialize every element in a 5x7 array with the value 23.  

```  
FOR I := 1 TO 5 DO  
  FOR J := 1 TO 7 DO  
    A[I,J] := 23;  
```  

##  <a name="ForEach"></a> FOREACH Control Structure  
 You can use the FOREACH statement to iterate through a .NET Framework collection or array object.  

 The FOREACH statement has the following syntax.  

```  
FOREACH <Element> IN <List> DO  
  <Statement>  
```  

 The ```<List>``` variable must be a **DotNet** data type that is set to .NET Framework collection or array type.  

> [!NOTE]  
>  The FOREACH statement is not limited to collections and arrays. You can use it with any .NET Framework object that implements the [M:System.Collection.IEnumerable.GetEnumerator](assetId:///M:System.Collection.IEnumerable.GetEnumerator) method, the [M:System.Collection.IEnumerator.MoveNext](assetId:///M:System.Collection.IEnumerator.MoveNext) method, and the [P:System.Collection.IEnumerator.Current](assetId:///P:System.Collection.IEnumerator.Current) property.  

 The <*Element*> variable must be a data type that is compatible with elements in the .NET Framework collection or array that is specified by the <*List*>.  

### Example 1  
 The following code example iterates through a .NET Framework collection that contains a generic list of elements and returns each element as text in a message.  

 Create the following local variables in a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit.  

|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|mylist|DotNet|System.Collections.Generic.List\`1.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  
|element|DotNet|System.Object.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  

 Add the following C/AL code (for example, on the OnRun trigger of the codeunit).  

```  
// Instantiate the .NET Framework collection object  
mylist := mylist.List();  

// Populate the collection  
mylist.Add('Item 1');  
mylist.Add('Item 2');  
mylist.Add('Item 3');  
mylist.Add('Item 4');  

// Iterate through the collection  
FOREACH element IN mylist DO  
  BEGIN  
    MESSAGE(FORMAT(element));  
  END;  
```  

 Compile and run the codeunit.  

### Example 2  
 The following code example is similar to example 1, except this example iterates on the text string of each element in the .NET Framework collection.  

 Create the following local variables in a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit.  

|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|mylist|DotNet|System.Collections.Generic.List\`1.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  
|txt|Text||  

 Add the following C/AL code to objects \(for example, on the OnRun trigger of the codeunit\).  

```  
// Instantiate the .NET Framework collection object  
mylist := mylist.List();  

// Populate the collection  
mylist.Add('Item 1');  
mylist.Add('Item 2');  
mylist.Add('Item 3');  
mylist.Add('Item 4');  

// Iterate through the collection  
FOREACH txt IN mylist DO  
  BEGIN  
    MESSAGE(txt);  
  END;  
```  

 Compile and run the [!INCLUDE[navnow](includes/navnow_md.md)] object.  

### Example 3  
 The following code example iterates through a .NET Framework collection for a dictionary of keys and values and returns each key/value pair as text in a message.  

 Create the following local variables in a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit.  

|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|mydictionary|DotNet|System.Collections.Generic.Dictionary\`2.'mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  
|element|DotNet|System.Object.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  

 Add the following C/AL code (for example, on the OnRun trigger of the codeunit).  

```  
// Instantiate the .NET Framework collection object  
mydictionary := mydictionary.Dictionary();  

// Populate the collection  
mydictionary.Add(10, '1');  
mydictionary.Add(20, '22');  
mydictionary.Add(30, '333');  
mydictionary.Add(40, '4444');  
mydictionary.Add(50, '55555');  

// Iterate through the collection  
FOREACH element IN mydictionary DO  
  BEGIN  
    MESSAGE(FORMAT(element));  
  END;  

```  

 Compile and run the [!INCLUDE[navnow](includes/navnow_md.md)] object.  

### Example 4  
 The following code example iterates through a .NET Framework array that contains a list of file names from a local directory and returns each file name in a message.  

 Create the following local variables in a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit.  

|Variable|DataType|Subtype|  
|--------------|--------------|-------------|  
|strarray|DotNet|System.Array.'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'|  
|txt|Text||  

 Add the following C/AL code (for example, on the OnRun trigger of the codeunit).  

```  
strarray := Dir.GetFileSystemEntries('C:\\myfiles\');  

FOREACH txt IN strarray DO  
  BEGIN  
    MESSAGE(txt);  
  END;  
```  

 Compile and run the [!INCLUDE[navnow](includes/navnow_md.md)] object.  

## WHILE-DO Control Structure  
 The following syntax shows the WHILE-DO statement.  

```  
WHILE <Condition> DO  
  <Statement>  
```  

 If <*Condition*> is TRUE, then <*Statement*> is executed repeatedly until <*Condition*> becomes FALSE. If <*Condition*> is FALSE from the start, then <*Statement*> is never executed.  

 The WHILE DO statement can be used when some code should be repeated as long as an expression is TRUE.  

### Programming Conventions  
 When there is only one condition, put WHILE and DO on the same line. Put the statements on separate lines and indented by two spaces.  

 When there are multiple conditions, put the conditions on separate lines and indented by two spaces and put DO on a separate line that is aligned with WHILE.  

### Example  

```  
WHILE <expr> DO  
  <Statement>;  
```  

### Example  

```  
WHILE <expr> DO BEGIN  
  <Statement>;  
  <Statement>;  
END;  
```  

### Example  

```  
WHILE <expr> AND   
      <expr> AND  
      <expr>  
DO BEGIN  
  <Statement>;  
  <Statement>;  
END;  
```  

### Example  
 Create the following variable.  

|Variable|Data type|  
|--------|---------|  
|I|Integer|  

 The following C/AL code increases the variable I until it equals 1000 and displays a message when it is finished.  

```  
WHILE I < 1000 DO  
  I := I + 1;  
Message(format(I));  
```  

## REPEAT-UNTIL Control Structure  
 The following syntax shows the REPEAT-UNTIL statement.  

```  
REPEAT  
  <Statements> UNTIL <Condition>  
```  

 <*Statements*> is executed repeatedly until <*Condition*> is TRUE.  

 The REPEAT UNTIL control structure resembles the WHILE control structure. The difference is that because the REPEAT UNTIL statement is executed from left to right, the <*Statements*> is always executed at least one time, regardless of what the <*Condition*> is evaluated to. This contrasts with the WHILE control structure, which performs the evaluation before the <*Statement*> is executed. In the WHILE control structure, if the first evaluation of <*Condition*> returns FALSE, then no statements are executed.  

### Programming Conventions  
 Always put REPEAT on a separate line.  

### Example  

```  
IF x < y THEN BEGIN  
  REPEAT  
    x := x + 1;  
    a := a - 1;  
  UNTIL x = y;  
  b := x;  
END;  
```  

### Example  
 Create the following variables.  

|Variable|Data type|Subtype|  
|--------|---------|-------|  
|Count|Integer||  
|Customer|Record|Customer|  

```  
Count := 0;  
IF Customer.FIND('-') THEN  
REPEAT  
  Count := Count + 1;  
UNTIL Customer.NEXT <= 0;  
Message(’The Customer table contains %1 records.’,Count);  
```  

 This code uses a REPEAT-UNTIL loop to count the number of entries in the Customer table. The FIND function finds the first entry in the table. Each time NEXT is called, it steps one record forward. When NEXT equals 0, there are no more entries in the table. The loop is exited, and a message displays how many entries were found.  

## EXIT Statement  
 The EXIT statement is used to control the flow of the execution. The following syntax shows an EXIT statement.  

```  
EXIT([<Value>])  
```  

 An EXIT statement is used to interrupt the execution of a C/AL trigger. The interruption occurs even when the code is executed inside a loop or a similar structure. The EXIT statement is also used when a local function should return a value.  

 Using EXIT without a parameter in a local function corresponds to using the parameter value 0. The C/AL function will return the value 0 or '' (empty string).  

 A compile-time error occurs if EXIT is called by using a return parameter from either of the following:  

-   System-defined triggers.  

-   Local functions that do not return a value.  

### Example  
 The following example shows the use of the EXIT statement in a local function. Assume that the IF statement is used to detect an error. If the error condition is met, then execution is stopped and the local function returns the error code 1.  

```  
FOR I := 1 TO 1000 DO BEGIN  
  IF Amount[I] < Total[I] THEN  
    EXIT(1);  
  A[I] := Amount[I] + Total[I];  
END;  
```  

## See Also  
 [C/AL Compound Statements](C-AL-Compound-Statements.md)   
 [C/AL Conditional Statements](C-AL-Conditional-Statements.md)   
 [C/AL WITH Statements](C-AL-WITH-Statements.md)   
 [C/AL BREAK Statement](C-AL-BREAK-Statement.md)
