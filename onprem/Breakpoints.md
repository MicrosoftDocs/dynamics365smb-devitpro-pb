---
title: "Breakpoints"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 52eb9384-166a-4425-94e7-a75cbcec1c90
caps.latest.revision: 33
---
# Breakpoints
You can break code execution of the session that you are debugging by:  

-   Setting a breakpoint on a line of code.  

-   Specifying a break on the next statement.  

-   Specifying a break on errors.  

-   Specifying a break on record changes.  

 You can set breakpoints before you start a debugging session or when you are debugging. Breakpoints and break rules are applied immediately in the session to which the debugger is attached.  

 After the breakpoint is hit, you use the debugger to execute C/AL code one line at a time. This procedure is called *stepping*. The **Code Tracking** group on the **Home** tab provides three actions for stepping:  

-   **Step Into**  

-   **Step Over**  

-   **Step Out**  

 **Step Into** and **Step Over** differ in how they handle function calls. Either command instructs the debugger to execute the next line of code. If the line contains a function call, **Step Into** executes only the call itself and then stops at the first line of code inside the function. **Step Over** executes the function and then stops at the first line outside the function. Use **Step Into** if you want to look inside the function call. Use **Step Over** if you want to avoid stepping into functions.  

 Use **Step Out** when you are inside a function call and want to return to the calling function. **Step Out** resumes execution of your code until the function returns and then breaks at the return point in the calling function.  

 The **Running Code** group on the **Home** tab provides the **Continue** action. **Continue** executes code until the next breakpoint or until execution ends.  

 You can inspect the contents of global variables, local variables, system variables, parameters, and text constants at each step. You can see whether the actual values that are displayed differ from the values that you expected when you designed the application.  

 For more information about user account requirements for setting breakpoints, see [Development Environment \(C/SIDE\)](Development-Environment--C-SIDE-.md).  

## Break on Lines of Code  
 If you set a breakpoint on a line of C/AL code, then execution breaks before the first statement on the line is executed. If you set a breakpoint on a line of code that does not have a C/AL statement, then the breakpoint is automatically set on the next statement. If you set a breakpoint on a line of code that exceeds the number of lines of code in the object, then the breakpoint is set on the last line of code. You can set a condition on a breakpoint on a line of code so that execution breaks only if the condition is met. For more information, see the following topics:  

-   [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md)  

-   [How to: Manage Breakpoints from the Debugger Code Viewer](How-to--Manage-Breakpoints-from-the-Debugger-Code-Viewer.md)  

-   [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)  

## Break on Next Statement  
 If the debugger is attached to a session, then you can specify a break on the next statement that is executed in that session. There are three scenarios for specifying a break on the next statement:  

-   The debugger is attached to a session, but no action is running in [!INCLUDE[navnow](includes/navnow_md.md)]. You want to debug a specific task. Before you begin that task, you set the debugger to break on the next statement.  

-   The debugger is attached to a session, and [!INCLUDE[navnow](includes/navnow_md.md)] is running some code. You want to debug this code that is currently running. You set the debugger to break on the next statement so that it breaks into this code.  

-   You want to debug from the beginning of a session. You activate the debugger and then select **Debug Next** in the **Session List** page, and then set the debugger to break on the next statement.  

 For more information, see [How to: Break on the Next Statement](How-to--Break-on-the-Next-Statement.md).  

## Break on Errors  
 You can specify that the debugger breaks execution if it encounters an error. If you specify that the debugger breaks on errors, then it breaks both on unhandled errors and on errors that you handle in C/AL code. For more information about how to handle errors, see [Avoiding Run-Time Errors](Avoiding-Run-Time-Errors.md).  

 When the debugger breaks on an error, you can inspect variables and parameters and you can review the error message for the current error. These inspection steps can help you determine the cause of the error.  

 For more information, see [How to: Break on Errors](How-to--Break-on-Errors.md).  

## Break on Record Changes  
 You can specify that the debugger breaks execution before a change to a record occurs. If you specify that the debugger breaks on record changes, then it breaks before creating, updating, or deleting a record. The following table shows each record change and the C/AL functions that cause each change.  

|Record change|C/AL functions|  
|-------------------|---------------------|  
|Create a new record|[INSERT Function \(Record\)](INSERT-Function--Record-.md)|  
|Update an existing record|[MODIFY Function \(Record\)](MODIFY-Function--Record-.md), [MODIFYALL Function \(Record\)](MODIFYALL-Function--Record-.md), [RENAME Function \(Record\)](RENAME-Function--Record-.md)|  
|Delete an existing record|[DELETE Function \(Record\)](DELETE-Function--Record-.md), [DELETEALL Function \(Record\)](DELETEALL-Function--Record-.md)|  

 For more information, see [How to: Break on Record Changes](How-to--Break-on-Record-Changes.md).  

## Conditional Breakpoints  
 You can specify conditions for breakpoints so that execution breaks only if the condition is true. For example, if an application iterates through a list of customers and you want to break execution at customer 10000, then you can specify the condition "Customer No." = '10000'. For more information, see [How to: Set Conditional Breakpoints](How-to--Set-Conditional-Breakpoints.md).  

## Enabling and Disabling Breakpoints  
 You can enable or disable the breakpoints in your breakpoint list. When you create a new breakpoint, it is enabled by default. If you disable a breakpoint, then execution does not break at that point in the code, but the breakpoint remains in your breakpoint list so that you can enable it again later. For more information, see the following topics:  

-   [How to: Manage Breakpoints from the Debugger Breakpoint List](How-to--Manage-Breakpoints-from-the-Debugger-Breakpoint-List.md)  

-   [How to: Manage Breakpoints from the Debugger Code Viewer](How-to--Manage-Breakpoints-from-the-Debugger-Code-Viewer.md)  

-   [How to: Manage Breakpoints from the Development Environment](How-to--Manage-Breakpoints-from-the-Development-Environment.md)  

## Storing Breakpoints  
 Breakpoints are stored immediately when you add or change them. They are stored privately for each user.  

 Breakpoints on lines of code are preserved in your breakpoint list when you start a new debugging session.  

 Breakpoints on lines of code are stored in table **2000000100, Debugger Breakpoint**.  

 Breaks on the next statement, breaks on errors, or breaks on record changes are stored in table **2000000073, User Personalization**. These breaks are not added to the breakpoint list.  

## See Also  
 [Debugging](Debugging.md)
