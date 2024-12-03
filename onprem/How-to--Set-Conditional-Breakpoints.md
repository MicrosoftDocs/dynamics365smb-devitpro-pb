---
title: "How to: Set Conditional Breakpoints"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: bdb46bc8-3887-4b73-9aaa-d9010dc7fa00
caps.latest.revision: 10
---
# How to: Set Conditional Breakpoints
You can define a condition on a breakpoint. If the condition is true, then code execution breaks at the breakpoint. If the condition is false, then code execution continues. The condition can include any variables or fields that are currently in scope. You can compare a variable or a field to another variable or field, or you can compare a variable or field to a literal value. If you compare to a literal value, then the variable or field that you use in the breakpoint condition must be of one of the following data types:  
  
-   BigInteger  
  
-   Boolean  
  
-   Code  
  
-   Decimal  
  
-   Integer  
  
-   Option  
  
-   Text  
  
 The following operators are supported in breakpoint conditions:  
  
-   =  
  
-   \<>  
  
-   \<  
  
-   >  
  
-   \<=  
  
-   >=  
  
### To set a conditional breakpoint  
  
1.  In the **Debugger** window, do one of the following:  
  
    -   On the **Home** tab, in the **Breakpoints** group, choose **Set/Clear Condition**. In the **Debugger Breakpoint Condition** window, enter a condition.  
  
    -   On the **Home** tab, in the **Breakpoints** group, choose **List**. In the **Debugger Breakpoint List** window, enter a condition in the **Condition** column.  
  
2.  Enter any conditional statement that uses variables that are in scope, constants, and supported operators.  
  
    > [!NOTE]  
    >  If you clear an existing condition, then that breakpoint is no longer a conditional breakpoint.  
  
3.  Choose **OK** to close the **Debugger Breakpoint List** window. A plus sign is added to the red dot that is displayed in the margin.  
  
## Example  
 In this example, you want to set a breakpoint to debug an application. This application processes invoices in a loop, but it stops responding on a particular invoice. You set a breakpoint on the first line of code in the loop, and then you set the following condition on the breakpoint.  
  
```  
SalesInvoiceHeader."No." = '103007'  
```  
  
## See Also  
 [Breakpoints](Breakpoints.md)