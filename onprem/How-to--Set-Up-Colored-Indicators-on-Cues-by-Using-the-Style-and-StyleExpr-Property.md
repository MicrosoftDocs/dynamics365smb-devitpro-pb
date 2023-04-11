---
title: "How to: Set Up Colored Indicators on Cues by Using the Style and StyleExpr Property"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6e6b736f-49d0-48d4-87a0-22ddc70784e4
caps.latest.revision: 11
---
# How to: Set Up Colored Indicators on Cues by Using the Style and StyleExpr Property
You can configure a cue with a colored indicator that appears along its top border to provide a visual indication to users about the value of data in the cue. You can configure the indicator to behave in the following ways.  

-   The indicator has a static color.  

     In this case, the indicator appears with a specified color at all times. For more information, see [Configuring Static Color Indication on a Cue](How-to--Set-Up-Colored-Indicators-on-Cues-by-Using-the-Style-and-StyleExpr-Property.md#StaticColor).  

-   The indicator changes color conditionally, based on the data in the cue.  

     This is the most typical behavior. When the data in the cue hits a specified value, the indicator changes color. There are 4 colors to choose from, which enables you to configure different colors for different data intervals. For more information, see [Configuring Conditional Color Indication on a Cue](How-to--Set-Up-Colored-Indicators-on-Cues-by-Using-the-Style-and-StyleExpr-Property.md#ConditionColor).  

 You set up the indicator by using the [StyleExpr Property](StyleExpr-Property.md) and [Style Property](Style-Property.md) for the field that defines the cue and, in most cases, by adding AL code to the page object.  

 The following table describes the values of the **Style** property and the corresponding indicator color. You will need to know these values for whichever behavior that you implement.  

|Value|Color|  
|-----------|-----------|  
|**Standard**|None \(uses the background color of cue\)|  
|**Favorable**|Green|  
|**Unfavorable**|Red|  
|**Ambiguous**|Yellow|  
|**Subordinate**|Grey|  

##  <a name="StaticColor"></a> Configuring Static Color Indication on a Cue  
 Use the following procedure to configure a colored indicator on the cue that appears at all times.  

#### To configure a static color on a cue  

1.  Open the page in Page Designer.  

2.  Select the field that you want to format, and on the **View** menu, choose **Properties**.  

3.  Set the **Style** property value to one of the formats that are described in the preceding table.  

4.  Set the **StyleExpr** property value to **true**.  

##  <a name="ConditionColor"></a> Configuring Conditional Color Indication on a Cue  
 To configure the indicator to change color conditionally based on the data in the cue field, you use a combination of AL code and the **StyleExpr** property and/or **Style** property. In the AL code of the page which contains the cue, you add code that evaluates the cue field's data and sets a variable based on the evaluation. A typical place to add the code is on [OnAfterGetRecord Trigger](OnAfterGetRecord-Trigger.md). The variable can have a data type of **Boolean**, **Codeunit**, or **Text**. You will use the variable on the **StyleExpr** property of the cue field to determine which color to apply to the indicator. The data type that you use for the variable will depend on what you want to achieve, and it will also influence the configuration. The following table describes the differences when using a Boolean data type compared to a Text or Codeunit data type.  

|Variable Data Type|Description|  
|------------------------|-----------------|  
|Boolean|If you use a Boolean variable, you can only configure one color condition for the cue. When the **StyleExpr** property set to a variable that has a Boolean data type, and the variable is **true**, then indicator uses the color that is specified by **Style** property value.|  
|Text or Codeunit|If you use a Text or Codeunit variable, you can configure up to four different color conditions for the indicator.<br /><br /> When the **StyleExpr** property is set to a variable of the Text or Codeunit data type, the **Style** property is not used. Instead, the variable must be explicitly set in AL code to one of the following values that specify the color: **Favorable**, **Unfavorable**, **Ambiguous**, and **Subordinate**. These values correspond to the values of the Style property.|  

#### To configure color indication by using a Boolean variable  

1.  Add AL code that evaluates the cue field data and sets a Boolean variable to **true** when the data meets the conditions for which you want to apply the indicator.  

     For example, page **9060 SO Processor Activities** in the [!INCLUDE[demolong](includes/demolong_md.md)] contains the cue field **"Sales Quotes - Open"**. You want the indicator to turn red when the number of open sales quotes exceeds 10. To do this, you can add a variable called **ColorVar** that has the data type Boolean, and then add the following code to the **OnAfterGetRecord** trigger.  

    ```  
    IF ("Sales Quotes - Open" > 10) THEN  
        ColorVar := TRUE;  
    ```  

2.  Set the cue field's **StyleExpr** property to the variable.  

     For the example in the step 1, you set the property to ColorVar.  

3.  Set the **Style** property on the cue field to the value that corresponds to the color indication that you want.  

     For the example, you set the value **Unfavorable** to configure the color to red.  

#### To configure color indication by using a Text or Codeunit variable  

1.  Add AL code that evaluates the cue field data and sets a Text or Codeunit variable to one of the following values for each condition that you want color indication: **Favorable**, **Unfavorable**, **Ambiguous**, and **Subordinate**. For the corresponding colors for these values, see the table in the introduction of this topic  

     For example, page **9060 SO Processor Activities** in the [!INCLUDE[demolong](includes/demolong_md.md)] contains the cue field **"Sales Quotes - Open"**. You want the indicator to have the following color conditions:  

    -   Green when the number of open sales quotes is 10 or less  

    -   Yellow when open sales quotes is greater than 10  

    -   Red when open sales quotes is greater than 20  

     To do this, you can add a variable called **ColorVar** that has the data type Text or Codeunit, and then add the following code to the **OnAfterGetRecord** trigger.  

    ```  
    IF ("Sales Quotes - Open" <= 10) THEN  
        ColorVar := 'Favorable'  
    ELSE IF("Sales Quotes - Open" > 20) THEN  
        ColorVar := 'Unfavorable'  
    ELSE ("Sales Quotes - Open")  
        ColorVar := 'Ambiguous';  
    ```  

2.  Set the cue field's **StyleExpr** property to the variable.  

     For the example in the step 1, you set the property to **ColorVar**.  

## See Also  
 [Style Property](Style-Property.md)   
 [StyleExpr Property](StyleExpr-Property.md)   
 [IncludeInDataSet Property](IncludeInDataSet-Property.md)
