---
title: "Resolving Compilation Errors When Converting a Microsoft Dynamics NAV 2013 Database"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ea75b39-cf7d-4c88-868b-86fa0be2426b
caps.latest.revision: 4
---
# Resolving Compilation Errors When Converting a Microsoft Dynamics NAV 2013 Database
If you converted a [!INCLUDE[nav7long](includes/nav7long_md.md)] database, then after the database conversion has completed, you will receive compilation errors in several standard [!INCLUDE[navnow](includes/navnow_md.md)] objects. The following table provides guidance to help you resolve these errors.  

|Object Type|Object ID|Object Name|Compilation Status|Solution|  
|-----------------|---------------|-----------------|------------------------|--------------|  
|Table|5540|Timeline Event|Error|Update the **Subtype** property of the variables that reference the **DataVisualization** add-in with references to the new version of the add-in.|  
|Table|5541|Timeline Event Change|Error|Update the **Subtype** property of the variables that reference the **DataVisualization** add-in with references to the new version of the add-in.|  
|Codeunit|9180|Generic Chart Mgt.|Error|Remove the code line that refers to the **Company** field. This field is obsolete.|  
|Codeunit|9500|Debugger Management|Error|Remove the code lines that refer to the **User SID** field. This field is obsolete.|  
|Page|692|Import Style Sheet|Error|Rename the `ObjectType` global variable to `ObjType`. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], `ObjectType` is a reserved word in C/AL.|  
|Page|693|Program Selection|Error|Rename the `ObjectType` global variable to `ObjType`. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], `ObjectType` is a reserved word in C/AL.|  
|Page|5540|Item Availability by Timeline|Error|Update the **Subtype** property of the variables that refer to the **DataVisualization** add-in with references to the new version of the add-in.|  
|Page|9170|Profile Card|Error|Remove the **Owner ID** column from the page. This field is obsolete.|  
|Page|9171|Profile List|Error|Remove the **Owner ID** column from the page. This field is obsolete.|  
|Page|9182|Generic Charts|Error|Remove the code line that refers to the **Company** field. Remove the **Company** column from the page. This field is obsolete.|  
|Page|9183|Generic Chart Setup|Error|Remove the **Company** column from the page. This field is obsolete.|  
|Page|9500|Debugger|Error|Remove the code lines that refer to the **User SID** field. This field is obsolete.|  
|Page|9503|Debugger Watch Value FactBox|Error|Remove the code lines that refer to the **User SID** field. This field is obsolete.|  
|Page|9504|Debugger Code Viewer|Error|Remove the code lines that refer to the **User SID** field. This field is obsolete.<br /><br /> Rename the `ObjectType` global variable to `ObjType`. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], `ObjectType` is a reserved word in C/AL.|  
|Page|9505|Debugger Breakpoint List|Error|Remove the **User SID** field from the expression in the **SourceTableView** property. Remove the code lines that refer to the **User SID** field. This field is obsolete.|  
|Table|79|Company Information|Warning|Several warnings. See the solution in the following section.|  
|Codeunit|40|LogInManagement|Warning|See the solution in the following section.|  
|Codeunit|43|LanguageManagement|Warning|See the solution in the following section.|  

 The following 3 sections provide before and after code that will help you resolve the warnings you receive when you compile the objects.  

## Before and After Code for Warnings in Table 79  
 The following table describes the before and after code that will help you resolve the warnings that you receive when you compile table 79 **Company Information**.  

 **Before**  

```  
LOCAL PROCEDURE GetDatabaseIndicatorText@9(IncludeCompany@1003 : Boolean) : Text[250];  
VAR  
  Session@1000 : Record 2000000009;  
  Text@1002 : Text[1024];   
BEGIN  
  Session.SETRANGE("My Session",TRUE);  
  Session.FINDFIRST;  
  Text := Session."Database Name" + ' - ' + Session."Host Name";  
  IF IncludeCompany THEN  
    Text := COMPANYNAME + ' - ' + Text;  
  IF STRLEN(Text) > 250 THEN  
    EXIT(COPYSTR(Text,1,247) + '...');  
  EXIT(Text)  
END;  
```  

 **After**  

```  
LOCAL PROCEDURE GetDatabaseIndicatorText@9(IncludeCompany@1003 : Boolean) : Text[250];  
VAR  
  ActiveSession@1000 : Record 2000000110;  
  Text@1002 : Text[1024];   
BEGIN  
  ActiveSession.SETRANGE("Server Instance ID",SERVICEINSTANCEID);  
  ActiveSession.SETRANGE("Session ID",SESSIONID);  
  ActiveSession.FINDFIRST;  
  Text := ActiveSession."Database Name" + ' - ' + ActiveSession."Server Computer Name";   
  IF IncludeCompany THEN  
    Text := COMPANYNAME + ' - ' + Text;  
  IF STRLEN(Text) > 250 THEN  
    EXIT(COPYSTR(Text,1,247) + '...');  
  EXIT(Text)  
END;  
```  

## Before and After Code for Codeunit 40  
 The following tables describe the before and after code that will help you resolve the warnings that you receive when you compile codeunit 40 **LogInManagement**.  

|||  
|-|-|  
|Before|`User@1003 : Record 2000000120;`|  
|After|`User@1003 : Record 2000000120 SECURITYFILTERING(Filtered);`|  

|||  
|-|-|  
|Before|`Language.SETRANGE("STX File Exist",TRUE);`|  
|After|`Language.SETRANGE("Localization Exist",TRUE);`|  

## Before and After Code for Codeunit 43  
 The following table describes the before and after code that will help you resolve the warnings that you receive when you compile codeunit 43 **LanguageManagement**.  

|||  
|-|-|  
|Before|`Language.SETRANGE("STX File Exist",TRUE);`|  
|After|`Language.SETRANGE("Localization Exist",TRUE);`|  

## See Also  
 [Converting a Database](Converting-a-Database.md)
