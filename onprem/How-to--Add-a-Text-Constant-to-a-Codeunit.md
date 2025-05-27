---
title: Add Text Constant to Codeunit
description: This article describes how to add a text constant to a codeunit. Start by selecting the C/AL Editor and then choose the C/AL Globals. 
ms.date: 10/01/2018
ms.topic: article
ms.assetid: b05d4942-6240-4c3f-9fe9-bf6333525f32
caps.latest.revision: 12
---
# How to Add a Text Constant to a Codeunit in Dynamics NAV
To add a text constant to a codeunit, use the following procedure.  
  
### To add a text constant  
  
1.  Select the C/AL Editor, choose **View**, and then choose **C/AL Globals**.  
  
    > [!NOTE]  
    >  For more information about how to open the C/AL Editor, see [How to: Modify an Existing Codeunit](How-to--Modify-an-Existing-Codeunit.md).  
  
2.  In the **C/AL Globals** window, choose the **Text Constants** tab.  
  
3.  In the first available **Name** field, enter the name of the new text constant.  
  
    > [!NOTE]  
    >  There is no naming convention for the text constants. We recommend that you use the unique ID for the name, as described in steps 4 and 5.  
  
4.  Select the line in which you entered the name of the new text constant, and on the **View** menu, choose **Properties**. A unique ID number has been automatically assigned to the text constant in the **ID** field.  
  
5.  Copy the ID number from the **Properties** window to the **Name** field in the **C/AL Globals** window. For example, if the ID number is 1001, specify **Text1001**, in the **Name** field.  
  
6.  In the **ConstValue** field, choose the **AssistEdit** button.  
  
7.  In the **Multilanguage Editor** window, enter **ENU** for the language and then enter the text. For more information, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md)  
  
    > [!NOTE]  
    >  If you set the application language to English \(United States\) before opening Object Designer, you can enter the message string directly into the **ConstValue** field in the C/AL Globals window. Open the Multilanguage Editor to be sure that the text is saved as English \(United States\).  
  
8.  In the C/AL Editor, copy the name of the text constant to the place where you want the text value to appear.  
  
## Example  
 In this example, Text1001 is a number that is available in the text constants number series for that object.  
  
```  
IF FileName = ' ' THEN  
  ERROR(Text1001);  
```  
  
 In the C/AL Editor, when you move the cursor into the new text constant, you see its contents in the status bar.  
  
## See Also  
 [Codeunits](Codeunits.md)