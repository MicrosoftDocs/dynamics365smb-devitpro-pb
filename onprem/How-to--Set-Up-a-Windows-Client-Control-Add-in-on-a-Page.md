---
title: "How to: Set Up a Windows Client Control Add-in on a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8113aa5f-6d1c-4a14-a486-f6691c6f6c36
caps.latest.revision: 21
---
# How to: Set Up a Windows Client Control Add-in on a Page
After you have registered a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in, you can use it on [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages. To use a control add-in on a page, you add it to a field control. Depending on the design of the control add-in, you may also need to follow these steps:  

-   Bind the control add-in field to a data source.  

     Control add-ins can use data from a field in the table that is associated with the page or from a C/AL global variable.  

-   Modify the [OnControlAddin Trigger](OnControlAddin-Trigger.md) to process data that is sent from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

-   Add C/AL code to triggers that call methods and properties in the control add-in.  

## Preparing to Set Up the Control Add-in  

#### To prepare for setting up the control add-in  

1.  If the control add-in uses data from a table that does not exist, then create the table.  

     For more information, see [How to: Create a Table](How-to--Create-a-Table.md).  

2.  If the page to which you want to add the control add-in does not exist, then create the page. As appropriate, associate the page with the table that you created in step 1.  

     For more information, see [How to: Create a Page](How-to--Create-a-Page.md).  

## Setting Up a Control Add-in on a Page Field  

#### To set the ControlAddIn property on a field  

1.  Open the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

2.  On the **Tools** menu, choose **Object Designer**, and then choose the **Page** button.  

3.  Select the page, and then choose the **Design** button.  

4.  In Page Designer, add a field control for the control add-in or use an existing field control.  

5.  Select the field, and then on the **View** menu, choose **Properties**.  

6.  In the **ControlAddIn** property value, choose the up arrow.  

7.  In the **Client Add-in** window, select the control add-in from the **Client Add-in** window, and then choose the **OK** button.  

     For more information, see the [ControlAddin Property](ControlAddin-Property.md).  

8.  To bind the field to data in a table field or C/AL global variable, set the **SourceExpr** property.  

    > [!NOTE]  
    >  If the **SourceExpr** property is set to a C/AL global variable, then in the C/AL code, add code to the OnAfterGetRecord trigger to populate the global variable. For more information, see [OnAfterGetRecord Trigger](OnAfterGetRecord-Trigger.md).  

9. Close the **Properties** window.  

##  <a name="EventTrigger"></a> Modifying the Microsoft Dynamics NAV Windows Client Control Add-in Event Trigger  
 When invoked on a page, a control add-in can raise an event that sends data to [!INCLUDE[nav_server](includes/nav_server_md.md)]. In the C/AL code for the page, the event calls the OnControlAddIn trigger of the field control that is applied with the control add-in. To process the event data, you add C/AL code to the OnControlAddIn trigger. For more information, see [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md).  

#### To add C/AL code to the control add-in event trigger  

1.  On the **View** menu, choose **C/AL Code**.  

2.  In the C/AL Editor, locate the following field control trigger.  

    ```  
    Fieldname - OnControlAddIn(Index : Integer;Data : Text[1024])  
    ```  

     `Fieldname` is the name of the field control that is applied with the control add-in.  

    > [!NOTE]  
    >  If the data type of the field's **SourceExpr** property is **BigText**, then the `Data` attribute is `BigText` instead of `Text[1024]`.  

3.  Add the C/AL code to the trigger.  

4.  Close the C/AL Editor.  

5.  On the **File** menu, choose **Save**, select **Compiled**, and then choose the **OK** button.  

## Calling Control Add-in Methods and Properties From C/AL  
 Control add-ins can expose methods and properties that you can call using C/AL code from triggers on a page to extend the control add-in user interface. To complete this procedure, you must know the method or property names. For more information, see [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  

#### To call a control add-in method or property  

1.  In the C/AL Editor, locate the trigger from which you want to call the method or property.  

    > [!NOTE]  
    >  You cannot call control add-in methods or properties from the OnInit, OnOpenPage, or OnNewRecord triggers.  

2.  Add the C/AL code to the trigger that calls the method or property.  

    -   To call a method, add the following code.  

        ```  
        CurrPage.ControlName.MyMethod(parameter)  
        ```  

    -   To call a property, add the fowlloing code.  

        ```  
        CurrPage.ControlName.MyProperty  
        ```  

     `ControlName` is the name of the field control that is applied with the control add-in. The name is specified by the [Name Property](Name-Property.md). `MyMethod` and `MyProperty` are the names of the method and property of the control add-in to be invoked.  

3.  Save the page.  

## See Also  
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md)   
 [How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md)   
 [ControlAddin Property](ControlAddin-Property.md)
