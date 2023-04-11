---
title: "Creating and Modifying Codeunits"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e779fc93-c423-4c18-bdb8-60febc2ce959
caps.latest.revision: 22
---
# Creating and Modifying Codeunits
You use Object Designer to create a new codeunit, and you use the C/AL Editor to modify an existing codeunit.  

 For more information about how to create a codeunit, see [How to: Create a Codeunit](How-to--Create-a-Codeunit.md). For more information about how to modify a codeunit, see [How to: Modify an Existing Codeunit](How-to--Modify-an-Existing-Codeunit.md).  

## Working in the C/AL Editor  
 When you work in the C/AL Editor, you can use the **C/AL Symbol Menu** window, which helps you use C/AL functions that are available. From the **C/AL Symbol Menu** window, you can get Help about all C/AL functions. To view Help for a function, select the C/AL function name in the rightmost column, and then press F1.  

 You can open multiple codeunits. Each time that you create a new codeunit or open an existing one, the codeunit is displayed in a separate window. You can then use standard functions to find code or move and paste lines of code among the codeunits. In the development environment, you can use the **Edit** menu or the buttons on the toolbar to access the editing functions. On the **Edit** menu, you can collapse the triggers to hide the code or expand them to show the code.  

> [!NOTE]  
>  To collapse or expand a trigger, select the **+** or **–** icon next to the trigger and press the Spacebar.  

 You can also use the following keyboard shortcuts.  

|Keyboard shortcut|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------------------|---------------------------------------|  
|Ctrl+Z|Cancels the last edit.|  
|Ctrl+X|Deletes the selected text and puts it in the Clipboard.|  
|Ctrl+C|Copies the selected text to the Clipboard.|  
|Ctrl+V|Pastes the text from the Clipboard to the codeunit at the cursor position.|  
|Ctrl+A|Selects all text in the current row.|  
|Ctrl+F|Opens the **Find** window to search for text.|  
|Ctrl+H|Opens the **Replace** window to search for text and replace it with other text.|  
|Ctrl+M|Toggles between expanding and collapsing the triggers.|  
|Shift+Ctrl+M|Collapses all the triggers and hides all the code.|  
|F3|Inserts a new line.|  
|F4|Deletes a line.|  

## Defining Variables, Text Constants, and Functions  
 After you create a new codeunit, then you must define the global variables, text constants, and functions that you need in the codeunit. To define these elements, in the C/AL Editor, on the **View** menu, choose **C/AL Globals**. In the **C/AL Globals** window, you must choose whether to add a global variable, a text constant, or a function. For more information, see the following topics:  

-   [How to: Add a Global Variable to a Codeunit](How-to--Add-a-Global-Variable-to-a-Codeunit.md)  

-   [How to: Add a Text Constant to a Codeunit](How-to--Add-a-Text-Constant-to-a-Codeunit.md)  

-   [How to: Add a Function to a Codeunit](How-to--Add-a-Function-to-a-Codeunit.md)  

## Using the C/AL Symbol Menu Window  
 When you write C/AL code in the C/AL Editor, you can use the **C/AL Symbol Menu** window to get an overview of the following:  

-   All variables that are defined in the codeunit.  

-   All available C/AL functions.  

 The **C/AL Symbol Menu** window is divided into the following columns:  

-   The first column lists the names of the variables, if you have defined any, and the function categories.  

-   The second column lists the subcategories, such as **Functions**, **Properties**, **Fields**, **Keys**, and **Options**.  

-   The third column lists the items in the subcategory that you selected.  

 For example, if you select a record variable in the first column and select **Keys** in the second column, then the third column displays the keys for the table that the record is from.  

 You can see the syntax and other information, such as the **Caption** property, that corresponds to the field name that you have selected, in the lower-left corner of the window.  

 In some cases, such as when a control on a page is a subpage or when a field is a BLOB field, there are more than three columns in the **C/AL Symbol Menu** window.  

 In the **C/AL Symbol Menu** window, choose the **OK** button or the **Apply** button to paste the syntax description into the C/AL Editor. If you choose the **OK** button, then the **C/AL Symbol Menu** window is closed automatically. If you choose the **Apply** button, then the window stays open.  

 For more information, see [C/AL Functions](C-AL-Functions.md).  

## Compiling and Saving Codeunits  
 Before you can run the functions in a codeunit, you must save and compile the code. When you compile the code, the syntax of the statements are checked. If the compiler finds any errors in the code it displays an error message. For more information about how to compile the code in a codeunit, see [How to: Compile the Code in a Codeunit](How-to--Compile-the-Code-in-a-Codeunit.md). For more information about how to save a codeunit, see [How to: Save a Codeunit](How-to--Save-a-Codeunit.md).  

## See Also  
 [Understanding Codeunits](Understanding-Codeunits.md)   
 [Using Codeunits](Using-Codeunits.md)   
 [Walkthrough: Using Codeunits](Walkthrough--Using-Codeunits.md)
