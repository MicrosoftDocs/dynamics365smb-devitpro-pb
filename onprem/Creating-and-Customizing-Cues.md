---
title: "Creating and Customizing Cues"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Creating and Customizing Cues
This article provides an overview of Cues and the tasks involved in creating and customizing a Cue for displaying on a page the [!INCLUDE[navnow](includes/navnow_md.md)] clients.  
  
> [!NOTE]  
>  For step-by-step instructions on many of the tasks discussed in this topic, see [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md) and [Walkthrough: Creating a Cue Based on a Normal Field and a Query](Walkthrough--Creating-a-Cue-Based-on-a-Normal-Field-and-a-Query.md).  
  
##  <a name="CueDesign"></a> Cue Design Overview 

A Cue can do two things. It can provide a visual representation of aggregated business data, such as the number of open sales invoices or the total sales for the month. It can also promote an action or operation to the user. Cues are interactive, meaning that you can select the Cue to drill down to data or open another page, run code, and more. To accommodate this, there are two types of Cues, field-based Cues and Action Cues, which are illustrated in the following diagram:
*I would be careful on choosing screenshots as we haven't fully completed the changes. Where is this taken from?*

![Cues on the Role Center.](media/Cue-overview-online.png "Cues on the Role Center") 

### Field-based Cues
Field-based Cues display data that is contained in a table field. This can be raw data or caluclated data. There are two layout options for field-based Cues: *normal* and *wide*.

The *normal* layout displays Cues as tiles. With this layout, Cue groups are automatically arranged to fill in the width of the workspace, which means there can be more than one group horizontally across the workspace.

The *wide* layout is designed to display large values, such as montand gives you a way emphasize a group of Cues. Wide and normal Cue groups can be interleaved. However, wide groups that precede all normal groups will appear in their own section of the workspace, and span the entire width - providing space for the large values. Wide groups that are placed after normal groups will behave just like the normal groups. With this in mind, it is good idea to place Cue groups that use the wide layout, above those that use the normal layout.

> [!NOTE]  
>  The wide layout is only supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)].
>
> The Caption and CaptionML properties of the CueGroup control are ignored when the CueGroup layout is wide.

### Action Cues
Action Cues act as links that perform a task or operation, like opening another page, starting a video, targeting an another resource or URL, or running code. Action-based Cues display only as tiles. They will arrange on the workspace just like field-base Cues that use the normal layout.

<!--  have you tested this? I don't think that you can do this??
>[!NOTE]
>You can mix and match field-based and Action Cues in a Cue group. However, do not include Action Cues in a Cue group that uses the wide layout. If you do, the wide layout will be ignored and the Cue group will display in the normal layout. 

--> 
## Creating field-based Cues
The implementation of a Cue involves the following elements:

-   A table object with a field that holds the data that is contained in the Cue at runtime.  
  
-   A page object that contains the table field and displays the Cue in the [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
-   Logic that calculates the data to display in the Cue at runtime.  
  
    The logic can consist of a combination of C/AL and [!INCLUDE[navnow](includes/navnow_md.md)] objects, such as tables, queries, and codeunits. How and where you implement the logic will depend on whether the Cue is based on a FlowField or Normal field and what you want to achieve.  
  
#### Supported data types  
You can only base Cues on integer and decimal data types. Other data types are not supported and will not display in a Cue.  
  
#### FlowFields versus normal fields  
A Cue can be based on a FlowField or Normal field. If you base the Cue on a FlowField, then you add the logic that calculates the data for the Cue to the [CalcFormula Property](CalcFormula-Property.md) of the FlowField. If you use a Normal field, then you will typically add the logic that calculates the Cue data to a C/AL trigger or function. Unlike a FlowField, where data is extracted from tables, a Normal field enables you to extract data from other objects such as queries.  
  
###  <a name="CreateTable"></a> Create a table for Cue data  
The first thing that you must do is to create a table that contains fields that will hold the calculated data to display in the Cues at runtime.  
  
1.  Create a table.

    If you already have a table for your Cues, go to the next step. 

2.  Add fields for the Cue data  

    For each Cue that you want to display on the page, you must add a **Field** control in the table. When you add the **Field** control, specify the following properties:  
  
    - Set the [Data Type Property](Data-Type-Property.md) to **Decimal**, **Integer**, or **Text**, depending on the type of data the Cue will display. 

    - Set the [FieldClass Property](FieldClass-Property.md) to **FlowField** or **Normal**.  
  
      If field is a FlowField, then set the [CalcFormula Property](CalcFormula-Property.md) to calculate the Cue data. For more information, see and [How to: Create, View, and Edit a Calculation Formula](How-to--Create--View--and-Edit-a-Calculation-Formula.md).  
  
3.  Add a primary key field for FlowFields  

    A table must have at least one data field. Because a **FlowField** is based on a calculation, it not considered an actual data field. Therefore, if the Cue table only includes FlowFields, you must add "dummy" primary key field that does not yield any data.  
  
    To add primary key, for example, add a field with the name **Primary Key**, and then set its data type to **Code**.  

###  <a name="CreatePage"></a> Add the Cues to a Page object   
After you have a table for holding the Cue data, you create a page that you associate the table, and then add Cue fields on the page. Typically, you will create Card Part type page that will be part of the Role Center page.

Cues are arranged into one or more groups on the page. Each group will have its own caption.  

1. Create a page that has the [SourceTable property](sourcetable-property.md) set to the Cue data table.
2. To define a Cue group, add a control that has the Type **Group** and the Subtype **CueGroup**.
3. Under the **Group** control, for each Cue that you want to display, add a **Field** control.

   The following figure illustrates the Page Designer for a page that contains three field-based Cues.  
  
    ![Page Designer showing Cues.](media/O365-activities-cues-clip.png "Page Designer showing Cues")  

4. If you want to set the CueGroup to use the wide layout, set the [Layout property](layout-property.md) to **Wide**.

5. Repeat steps 2-4 for each additional CueGroup.

4. Initialize the Cue fields.  

    You must initialize the Cue fields on the page. To do this, for example, you can add the following C/AL code to the [OnOpenPage Trigger](OnOpenPage-Trigger.md).  
  
    ```  
    RESET;  
    IF NOT GET THEN BEGIN  
      INIT;  
      INSERT;  
    END;  
    ```  

## Creating Action Cues
Similar to field-based Cues, Action Cues can be grouped together, under a common caption, by using the **CueGroup** subtype control. The difference is that instead adding field controls under the **CueGroup** subtype control, you create Action Cues by adding actions to the control **CueGroup** subtype control. 

1. Develop or locate the functionality that you want to Action Cue to perform.

  For example, create the page object that you want the Action Cue to open, add C/AL code that you want the Action to run, find the URL to the video.

2. Open the page on which you want to display the Action Cues.

   For example, this could be the page that you created in the previous task.
3. In the location where you want the Action Cue group, add a control that has the Type **Group** and the Subtype **CueGroup**.
4. In the **View** menu, select **Control Actions**.
5. Add a control that has the **Type** set to **Action**.

    The following figure illustrates the Page Designer for a page that contains three field-based and two Action Cues at the bottom.  
  
    ![Page Designer showing Cues.](media/O365-activities-cues-with-actions-clip.png "Page Designer showing Cues")  

6. Configure the control to the desired operation.

  For example, if it should open a page, set the control's [RunObject property](runobject-property.md) to the appropriate page. Or, set it to call a function or method.


## Customizing a Cue  
 This section contains information about how you can change the appearance of the Cues.  
  
###  <a name="SpecifyImage"></a> Specifying an Image on the Cue  
 You can specify an image to display on the Cue or you can choose not to display an image at all.  You can select from several available images.  
  
 For more information, see [How to: Set Up an Image on a Cue](How-to--Set-Up-an-Image-on-a-Cue.md).  
  
###  <a name="DrillDown"></a> Setting up a Drill Down Page on the Cue  
You can set up a Cue to link to a page that displays details about the transactions that make up the data in the Cue. This page is referred to as a *drill down page*. For example, if the Cue displays the number of open sales orders, then you can set up the Cue to link to list page that includes the sales orders. The page opens when a user selects the Cue.  
  
 To set up a drill down page, you can do one of the following:  
  
-   Set the [DrillDown Property](DrillDown-Property.md) of the Cue field on the page to the ID of the page that you want to open from the Cue.  
  
-   You can add code to the [OnDrillDown Trigger](OnDrillDown-Trigger.md) of the Cue field on the page that contains the Cue.  
  
     The OnDrillDown trigger takes precedent over the DrillDown property.  
  
> [!NOTE]  
>  When the Cue is on a Role Center page type, an item that links to the drill down page will automatically appear in the navigation pane of the Role Center under **Home** if the navigation pane contains an entity of the same type. For example, if you have a Cue named **Sales Return Orders – Open**, this item will be added to the **Sales Return Orders** in the navigation pane.  
  
###  <a name="FormatData"></a> Formatting the Data in the Cue  
 If the data type on the Cue is a decimal, then you can change how the data is displayed, including converting amounts and unit amounts to another currency, specifying the number of decimal places and thousand separator, and adding characters before or after the value.  
  
 For more information, see the [Formatting the Data in a Field](Formatting-the-Data-in-a-Field.md).  
  
###  <a name="AddAction"></a> Adding an Action to the Cue  
 When the Cue is displayed in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] client, you can add an action next to the Cue that opens a related task. For example, if the Cue displays the open sales orders, then you can add an action the opens the Sale Order card page for creating a new sales order.  
  
 To set up an action, open the page that contains the Cue in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and then add a **Control** action on the **CueGroup** control that contains the Cue field. Set the [RunObject Property](RunObject-Property.md) of the action to the object, such as a page, that you want to target.  
  
> [!NOTE]  
>  This is not supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)] or [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].  
  
###  <a name="SetupIndicator"></a> Setting up Colored Indicators on Cues  
 You can set up Cues to include a colored bar along the top border, which changes color based on the data in the Cue.  
  
 For more information, see [Setting Up Colored Indicators on Cues](Setting-Up-Colored-Indicators-on-Cues.md).  
  
## See Also  
 [Setting Up Cues](Setting-Up-Cues.md)   
 [FlowFields](FlowFields.md)
