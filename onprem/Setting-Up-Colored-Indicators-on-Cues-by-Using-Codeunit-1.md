---
title: "Setting Up Colored Indicators on Cues by Using Codeunit 1"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dc009e79-2dcf-41c6-8d83-85e225879a91
caps.latest.revision: 8
---
# Setting Up Colored Indicators on Cues by Using Codeunit 1
Codeunit 1 Application Management includes the **GetCueStyle** trigger that enables you to set up Cues with indicators that change color based on the value in the Cue.  
  
 The **GetCueStyle** trigger provides a more dynamic way of setting up colored indicators than using the Style and StyleExpr field properties. For example, the [!INCLUDE[demolong](includes/demolong_md.md)] uses the **GetCueStyle** trigger, together with various pages, tables and codeunits, to give end-users the capability to set up colored indicators directly from the [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
## GetCueStyle Trigger Overview  
 By default, **GetCueStyle** trigger has the following definition in codeunit **1 Application Management**.  
  
 `GetCueStyle(TableId : Integer;FieldNo : Integer;CueValue : Decimal) : Text`  
  
 The GetCueStyle trigger is called when the page that contains the Cue is run.  
  
> [!IMPORTANT]  
>  The trigger is only called if the **Style** and **StyleExpr** properties are set to their default values \<None> and \<FALSE> respectively. If you set these parameters to any value other than the default values, then the **GetCueStyle** trigger is not called and the Cue indicator is configured according to the **Style** and **StyleExpr** properties.  
  
### Parameters  
 The following table describes the parameters of the **GetCueStyle** trigger.  
  
|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|TableId|The ID of the table object that contains the field that holds the Cue value.|  
|FieldNo|The number that is assigned to the table field. This is specified by the field's [Field No. Property](Field-No.-Property.md).|  
|CueValue|The calculated value in the Cue that is stored in the table field at runtime.|  
  
### Return Value  
 The **GetCueStyle** trigger returns a value that has the data type **Text**. To set the colored indicator, you add C/AL code that sets the return value to one of the following values.  
  
|Value|Color|  
|-----------|-----------|  
|**Standard**|None \(uses the background color of cue\)|  
|**Favorable**|Green|  
|**Unfavorable**|Red|  
|**Ambiguous**|Yellow|  
|**Subordinate**|Grey|  
  
## Example  
 To illustrate the use of the **GetCueStyle** trigger, consider a simple example where you have a Cue on the Role Center that displays the number of open sales quotes. You want to set up the indicator to change color according to the following characteristics:  
  
-   Green when the number of open sales quotes is less than or equal to 10  
  
-   Yellow when open sales quotes is greater than 10  
  
-   Red when open sales quotes is greater than 20  
  
 To do this, in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], you modify the **GetCueValue** trigger in codeunit **1 Application Management**. First, you assign the return value the name **Color**, and then you add the following code to the trigger.  
  
```  
IF (CueValue <= 10) THEN  
    Color := 'Favorable'  
ELSE IF(CueValue > 20) THEN  
    Color := 'Unfavorable'  
ELSE   
    Color := 'Ambiguous';  
```  
  
 To see how you can achieve the same results by using the **Style** and **StyleExpr** properties for comparison, see [How to: Set Up Colored Indicators on Cues by Using the Style and StyleExpr Property](How-to--Set-Up-Colored-Indicators-on-Cues-by-Using-the-Style-and-StyleExpr-Property.md).  
  
> [!NOTE]  
>  This is a simple example to illustrate how to use the **GetCueSetup** trigger to configure colored indicators on a Cues. This example sets up the colored indicators to behave the same for Cues on all Role Centers. In a production environment, you will typically add logic that sets the colored indicators differently for each Cue.  
  
### Example from [!INCLUDE[demolong](includes/demolong_md.md)]  
 [!INCLUDE[demolong](includes/demolong_md.md)] includes the following objects that enable the customization of indicators from the [!INCLUDE[navnow](includes/navnow_md.md)] client. You can use this implementation for your solution as-is or modify it as required.  
  
|[!INCLUDE[navnow](includes/navnow_md.md)] object|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|Codeunit **9701 Cue Setup**|This codeunit is called from the **GetCueStyle** trigger in codeunit **1 Application Management** and sets the color of the Cue indicators at runtime.|  
|Page **9701 Cue Setup Administration**|This page is used to set up indicators on Cues that are available in the [!INCLUDE[navnow](includes/navnow_md.md)] database. From this page you can set up an indicator for the entire company or for specific users only. This page is typically used by an administrator to specify default settings for the indicators. If the page that contains the Cues is set up with the an action that accesses that opens page **9702 Cue Setup End User**, then a user can change or personalize the indicator on a Cue.|  
|Page **9702 Cue Setup End User**|This page is used by the end user to personalize the indicators that appear on a page of the [!INCLUDE[navnow](includes/navnow_md.md)] client, such as the Role Center.|  
|Table **9701 Cue Setup**|This table stores the customization settings for the individual Cues.|  
  
## See Also  
 [Creating and Customizing Cues](Creating-and-Customizing-Cues.md)   
 [Setting Up Colored Indicators on Cues](Setting-Up-Colored-Indicators-on-Cues.md)
