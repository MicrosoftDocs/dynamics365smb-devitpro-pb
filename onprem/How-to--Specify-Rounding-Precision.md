---
title: "How to: Specify Rounding Precision"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 948cdeb0-07cf-4e89-800d-5ead0addd263
caps.latest.revision: 13
---
# How to: Specify Rounding Precision
In Visual Studio Report Designer, you can use the **ROUND** function to round a double-precision floating point value to the nearest integer. However, this function does not have options for changing the precision to which you want to round. For example, you cannot round to the nearest tenth or nearest hundredth of a number, only to the nearest integer. To specify precision when using the **ROUND** function, you must multiply the number by a factor of 10, call the **ROUND** function, and then divide the rounded number by the same factor of 10. The factor that you choose depends on the degree of precision that you want. For example, if you want to round the number 12.3456 to the nearest hundredth, you would multiply 12.3456 by 100 to get 1234.56. Next, call the ROUND function on 1234.56. The **ROUND** function rounds to the nearest integer, resulting in the number 1235. Finally, divide the rounded number, 1235, by the factor, 100, to get 12.35. This result is the same as rounding the original number, 12.3456, to the nearest hundredth.  
  
 To specify precision when you use the **ROUND** function on a client report definition \(RDLC\) report layout, you must do one of the following:  
  
-   Use an expression, such as `=ROUND(100*<Value>)/100` on the value in a text box.  
  
-   Add code to functions that call the **ROUND** function.  
  
 An example of a report in the [!INCLUDE[demolong](includes/demolong_md.md)] that uses the **ROUND** function and specifies a degree of precision is report 111, Customer - Top 10 List.  
  
### To use an expression to specify rounding precision  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select a report that contains a number that you want to round with precision greater than the nearest integer, and then choose **Design**.  
  
3.  In the **View** menu, choose **Layout**.  
  
4.  In Visual Studio, in the Report.rdlc file, right-click the text box with the number that you want to round, and then choose **Expression**.  
  
5.  In the **Expression** window, change the expression to the following.  
  
    ```  
    =ROUND(<MyField.Value>*<Factor>)/<Factor>  
    ```  
  
     In this example, *MyField.Value* is the numerical value that you want to round. *Factor* is a factor of 10, and depends on the degree of precision that you want.  
  
6.  Choose the **OK** button to close the **Expression** window.  
  
7.  Save and compile the report. For more information, see [How to: Integrate Report Dataset Designer and Visual Studio Report Designer](How-to--Integrate-Report-Dataset-Designer-and-Visual-Studio-Report-Designer.md).  
  
### To add code to specify rounding precision  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select a report that contains a number that you want to round with precision greater than the nearest integer, and then choose **Design**.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Visual Studio, in the Report.rdlc file, on the **Report** menu, choose **Report Properties**.  
  
5.  In the **Report Properties** window, select the **Code** tab.  
  
6.  Add the following lines of code to the function in which you want to specify rounding precision. The code that you add may vary, depending on the degree of precision that you want. In this example, the rounding precision is 0.01.  
  
    ```  
    REM Rounding precision = 0.01  
    Return ROUND(100*Pct)/100  
    ```  
  
7.  Save and compile the report. For more information, see [How to: Integrate Report Dataset Designer and Visual Studio Report Designer](How-to--Integrate-Report-Dataset-Designer-and-Visual-Studio-Report-Designer.md).  
  
## Example  
 The following code example shows a function that calls the **ROUND** function and uses the preceding procedure to specify precision.  
  
```  
Shared Pct as Decimal  
Public Function CalcPct(Amount1 as Decimal, Amount2 as Decimal) as Decimal   
   if Amount2 <> 0 then  
      Pct = Amount1 / Amount2 * 100  
   else  
      Pct = 0  
   end if  
   REM Rounding precision = 0.1  
   Return ROUND(10*Pct)/10  
End Function  
```  
  
 The following illustration shows how to call the **CalcPct** function for the value of a text box.  
  
```  
=Code.CalcPct(Sum(Fields!BalanceLCY_Customer.Value), First(Fields!TotalBalance.Value))  
```  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
