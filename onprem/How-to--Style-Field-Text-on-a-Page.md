---
title: "How to: Style Field Text on a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6221826a-8c26-42c0-b1cb-affdf81dbfaa
caps.latest.revision: 20
---
# How to: Style Field Text on a Page
A page field control includes the [Style Property](Style-Property.md) that you use to format the text that displays in a page field. The **Style** property has ten values that apply different formats to field text.  

 The following table describes the values and the corresponding format.  

|Value|Format|  
|-----------|------------|  
|**Standard**|Standard|  
|**StandardAccent**|Blue|  
|**Strong**|Bold|  
|**StrongAccent**|Blue + Bold|  
|**Attention**|Red + Italic|  
|**AttentionAccent**|Blue + Italic|  
|**Favorable**|Bold + Green|  
|**Unfavorable**|Bold + Italic + Red|  
|**Ambiguous**|Yellow|  
|**Subordinate**|Grey|  

 By using the field's [StyleExpr Property](StyleExpr-Property.md), you can specify whether formatting is applied to the field based on the field’s data.  

## Always Applying a Format to Text in a Page Field  
 Use the following procedure to apply formatting to field text on a page at all times.  

#### To format field text  

1.  Open the page in Page Designer.  

2.  Select the field that you want to format, and on the **View** menu, choose **Properties**.  

3.  Set the **Style** property value to one of the formats that are described in the preceding table.  

4.  Set the **StyleExpr** property value to **True**.  

## Applying Conditional Formatting to Text in a Page Field Control  
By using a page field's **StyleExpr** property, you can apply the format that is specified by the **Style** property to a field based on the field's data. For example, you can display text in red if the value of the field is a negative number, italic red if an item is low in stock, or bold green to indicate a favorable value, such as a high credit limit.  

To set up this formatting, you define a Boolean variable and add C/AL code to the page that evaluates the field's data. The C/AL code should return the Boolean variable as **True** when the data meets the conditions for which you want to apply the formatting. You then set the variable on the field's **StyleExpr** property.  

#### To define a variable to use to format field text  

1.  Open the page in Page Designer.  

2.  On the **View** menu, choose **C/AL Globals**.  

3.  Define the variable, and then set the **DataType** to **Boolean**.  

4.  On the **View** menu, choose **Properties** to open the variable's properties, and then set the **IncludeInDataSet** to **Yes**.  

    > [!NOTE]  
    >  If the [IncludeInDataSet Property](IncludeInDataSet-Property.md) is not set to **Yes**, then when you run the page, you will receive an error that states that the identifier variable could not be found.  

5.  On the **View** menu, choose **C/AL Code**, and then add C/AL code that sets the variable.  

    > [!NOTE]  
    >  The variable must evaluate to **True**.  

#### To set the variable to the StyleExpr property of the page field  

1.  In Page Designer, select the field that you want formatted, and open the **Properties** window.  

2.  Set the **Style** property value to one of the formats that are described at the beginning of this topic.  

3.  Set the **StyleExpr** property value to the variable that you defined in the previous procedure.  

## See Also  
 [Style Property](Style-Property.md)   
 [StyleExpr Property](StyleExpr-Property.md)   
 [IncludeInDataSet Property](IncludeInDataSet-Property.md)
