---
title: "C/AL Comments"
description: "Describing the C/AL comments."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 14dbf038-ca14-49a3-9252-9f1deb74d0e6
caps.latest.revision: 8
---
# C/AL Comments
You can insert comments about your C/AL code or comment out parts of your code to prevent execution. The following are the two ways to insert comments in C/AL:  
  
-   Use "//" to insert a single line comment.  
  
     When the "//" symbol is encountered in your code, the rest of the line is interpreted as a comment.  
  
     You can add and remove comment marks manually or use the **Comment Selection** and **Uncomment Selection** options in the **Edit** menu. The **Comment Selection** and **Uncomment Selection** options enable you to comment or uncomment multiple lines of code all at once.  
  
    -   To comment lines of code, select the lines, and then, in the **Edit** menu, choose **Comment Selection.**  
  
    -   To uncomment lines of code, select the lines, and then choose **Uncomment Selection**.  
  
        > [!NOTE]  
        >  To use the **Uncomment Selection**, all the lines of code that you select must have comment marks.  
  
-   Use "{" and "}" to mark the start and end, respectively, of a block of comments.  
  
 You can nest any number of comments. In such cases, the comment runs from the first comment start to the last comment end.  
  
## Example 1  
  
```  
{  
This is a sample comment which is ignored by the C/AL compiler  
}  
```  
  
## Example 2  
  
```  
// This is also a sample comment which is ignored by the C/AL compiler  
```  
  
## Example 3  
  
```  
{ This comment { is partly inside } another comment }  
```  
  
## Example 4  
 This example shows what you should not do.  
  
```  
A := 34;  
B := 56;      {******************  
C := 345;      * Don’t do this! *  
D := 781;      ******************}  
```  
  
 Because the comment is to the right of the C/AL statements, the system assumes that the third and fourth lines are part of the comment. That is, only A and B are assigned values, while C and D are not. Instead you should use single line comments.  
  
```  
A := 34;  
B := 56;       //*******************  
C := 345;      //* Do it this way! *  
D := 781;      //*******************  
```
