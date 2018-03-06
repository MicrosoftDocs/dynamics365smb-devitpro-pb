---
title: Viewing Functions and Objects Definition
description: View the definition of a function or object in multiple ways by selecting the item and then choosing Go To Definition in the C/AL Editor.
ms.custom: na
ms.date: 10/20/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e453930e-af9f-446e-aa45-8ed75a684836
caps.latest.revision: 19
manager: edupont
---
# Viewing the Function or Object Definition in Dynamics NAV
You can view the definition of a function or object by selecting the item in the C/AL Editor and then choosing **Go To Definition**. You can also view the definition of a function by selecting it in the **C/AL Globals** window and then choosing **Go To Definition**.  
  
 To go to the definition of a function or object, select or place the cursor anywhere in the function name or object variable name, and then do one of the following:  
  
-   On the **View** menu, choose **Go To Definition**.  
  
-   Right-click the function name or object variable name, and then choose **Go To Definition**.  
  
-   Press Ctrl+F12.  
  
 The following table describes how you can go to the definition of a function or object.  
  
|Starting location|Result|  
|-----------------------|------------|  
|[User-Defined Function from the C/AL Globals Window](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md#BKMK_UserdefinedFunctionFromTheCALGlobalsWindow)|The C/AL Editor goes to the C/AL code that defines the selected function.|  
|[User-Defined Function from the C/AL Editor](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md#BKMK_UserdefinedFunctionFromTheCALEditor)|The C/AL Editor goes to the C/AL code that defines the selected function.|  
|[User-Defined Function from the C/AL Editor for an Object Variable](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md#BKMK_UserdefinedFunctionFromTheCALEditorForAnObjectVariable)|-   The object is opened in the corresponding designer.<br />-   A new C/AL Editor window opens to the C/AL code that defines the selected function.|  
|[System Function from the C/AL Editor](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md#BKMK_SystemFunctionFromTheCALEditor)|If the system function is called on an object variable, such as a record, codeunit, or report, then the object is opened in the corresponding designer. If the system function is not called on an object variable, then nothing occurs.|  
|[Object Variable from the C/AL Editor](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md#BKMK_VariableFromTheCALEditor):<br /><br /> -   Record<br />-   Page<br />-   Report<br />-   Codeunit<br />-   XMLport<br />-   Query|The object is opened in the corresponding designer or editor:<br /><br /> -   Table Designer<br />-   Page Designer<br />-   Report Dataset Designer<br />-   C/AL Editor<br />-   XMLport Designer<br />-   Query Designer **Note:**  If you select a variable that is a fundamental data type, such as Integer or Decimal, then information about the variable is displayed in the status bar.|  
  
## Examples  
 This section shows examples of using the Go To Definition shortcut menu item.  
  
###  <a name="BKMK_UserdefinedFunctionFromTheCALGlobalsWindow"></a> User-Defined Function from the C/AL Globals Window  
 From the **C/AL Globals** window, right-click a user-defined function, and then choose **Go To Definition**.  
  
 ![Go To Definition of a user&#45;defined function](media/GoToDef_.jpg "GoToDef\_")  
  
 The result is that the C/AL Editor jumps to the C/AL code that defines the selected function.  
  
 ![Go To Definition of a user&#45;defined function](media/GoToDef_FromCALGlobals_CALEditor.jpg "GoToDef\_FromCALGlobals\_CALEditor")  
  
###  <a name="BKMK_UserdefinedFunctionFromTheCALEditor"></a> User-Defined Function from the C/AL Editor  
 From the C/AL Editor, right-click a user-defined function, and then choose **Go To Definition**.  
  
 ![Go To Definition from user function in C&#47;AL Editor](media/GotoDef_FromCALEditor_UserFunc.jpg "GotoDef\_FromCALEditor\_UserFunc")  
  
 The result is that the C/AL Editor jumps to the C/AL code that defines the selected function.  
  
 ![Go To Definition from user function in C&#47;AL Editor](media/GoToDef_FromCALEditor_UserFunc_Result.jpg "GoToDef\_FromCALEditor\_UserFunc\_Result")  
  
###  <a name="BKMK_UserdefinedFunctionFromTheCALEditorForAnObjectVariable"></a> User-Defined Function from the C/AL Editor for an Object Variable  
 From the C/AL Editor, right-click a user-defined function that is called on an object variable, and then choose **Go To Definition**.  
  
 ![Go To Definition from user function in C&#47;AL Editor](media/GotoDef_FromCALEditor_UserFunc_Object.jpg "GotoDef\_FromCALEditor\_UserFunc\_Object")  
  
 The result is that the object on which the function is called is opened in the corresponding designer and a new C/AL Editor window opens to the C/AL code that defines the selected function.  
  
 ![Go To Definition from user function in C&#47;AL Editor](media/GotoDef_FromCALEditor_UserFunc_Object_Result.jpg "GotoDef\_FromCALEditor\_UserFunc\_Object\_Result")  
  
###  <a name="BKMK_SystemFunctionFromTheCALEditor"></a> System Function from the C/AL Editor  
 From the C/AL Editor, right-click a system function that is called on an object variable, and then choose **Go To Definition**.  
  
 ![Go To Definition from a system function](media/GotoDef_FromCALEditor_.jpg "GotoDef\_FromCALEditor\_")  
  
 If the system function is called on a record variable, then the table that the record is from is opened in Table Designer.  
  
 ![Go To Definition from system function](media/GoToDef_FromCALEditor_System_RecResult.jpg "GoToDef\_FromCALEditor\_System\_RecResult")  
  
 If the system function is the \<*codeunit*>.RUN function, then the codeunit is opened in a new C/AL Editor window.  
  
 ![Go To Definition from codeunit.RUN function](media/GoToDef_FromCALEditor_System_CodeunitResult.jpg "GoToDef\_FromCALEditor\_System\_CodeunitResult")  
  
 If the system function is called on any other object type variable, then the object is opened in the corresponding designer. For any other system function that is not called on an object variable, nothing occurs.  
  
###  <a name="BKMK_VariableFromTheCALEditor"></a> Object Variable from the C/AL Editor  
 From the C/AL Editor, right-click a variable that is one of the following object types, and then choose **Go To Definition**:  
  
-   Record  
  
-   Page  
  
-   Report  
  
-   Codeunit  
  
-   XMLport  
  
-   Query  
  
 ![Go To Definition from Record variable](media/GoToDef_FromCALEditor_Var.jpg "GoToDef\_FromCALEditor\_Var")  
  
 The object is opened in the corresponding designer:  
  
-   Table Designer  
  
-   Page Designer  
  
-   Report Dataset Designer  
  
-   C/AL Editor  
  
-   XMLport Designer  
  
-   Query Designer  
  
 ![Go To Definition from Record variable](media/GoToDef_FromCALEditor_VarResult.jpg "GoToDef\_FromCALEditor\_VarResult")  
  
## Permissions  
 To go to a definition, you must have the correct permissions. If you do not have permission to view the definition of an object by selecting the object in Object Designer and then choosing **Design**, then you cannot view it with the **Go To Definition** option.