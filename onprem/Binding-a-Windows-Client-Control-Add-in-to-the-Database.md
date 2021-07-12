---
title: "Binding a Windows Client Control Add-in to the Database"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6a587bf8-4eeb-40e9-809a-95643842e90f
caps.latest.revision: 24
manager: edupont
---
# Binding a Windows Client Control Add-in to the Database
Similar to other field controls on a page, a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in can bind with data in the [!INCLUDE[navnow](includes/navnow_md.md)] database. This lets you create control add-ins that can display and update data in the database. Data binding is accomplished through [!INCLUDE[nav_server](includes/nav_server_md.md)] with the [SourceExpr Property](SourceExpr-Property.md) of the field control that is applied with the control add-in, as shown in the following illustration.  

 ![RoleTailored client control add&#45;in data binding.](media/NAVRTCContolAddinDataBinding.png "NAVRTCContolAddinDataBinding")  

 The control add-in must implement the [Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition\<T>](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1) interface that exposes the [IValueControlAddInDefinition\<T>.Value](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1.Value) property as shown in the following example for a DateTime data type.  

```c#  
[ControlAddInExport("MyControlAddIn")]  
public class MyControlAddIn : IValueControlAddInDefinition<DateTime>  
{  
    ...  
}  

```  

 When a control add-in is instantiated on a page, the **SourceExpr** property value is passed to the control add-in [IValueControlAddInDefinition\<T>.Value](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1.Value) property. The **SourceExpr** property can be a field or row in a database table or a C/AL global variable.  

> [!NOTE]  
>  The **SourceExpr** property value can be passed to the [IValueControlAddInDefinition\<T>.Value](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1.Value) property multiple times as long as a page is open, depending on application code or state in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 For more information about how to implement the [Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition\<T>](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1) interface, see [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md).  

 For more information about how to set the **SourceExpr** property for a control add-in, see [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md).  

## Supported Data Types  
 A control add-in can bind with several data types from the database. Each data type in C/AL maps to a corresponding .NET Framework data type in the control add-in as listed in the following table.  

|C/AL data type|Control add-in data type|  
|---------------------|-------------------------------|  
|BigInteger|[Int64](assetId:///T:System.Int64)|  
|BigText|[String](assetId:///T:System.String)|  
|BLOB|[Object](assetId:///T:System.Object)|  
|Boolean|[Boolean](assetId:///T:System.Boolean)|  
|Byte|[Byte](assetId:///T:System.Byte)|  
|Char|[Char](assetId:///T:System.Char)|  
|Code|[System.String](assetId:///T:System.String)|  
|Date|[DateTime](assetId:///T:System.DateTime)|  
|DateFormula|[String](assetId:///T:System.String)|  
|DateTime|[DateTime](assetId:///T:System.DateTime)|  
|Decimal|[Decimal](assetId:///T:System.Decimal)|  
|Duration|[TimeSpan](assetId:///T:System.TimeSpan)|  
|Guid|[Guid](assetId:///T:System.Guid)|  
|Integer|[Int32](assetId:///T:System.Int32)|  
|Option|[Int32](assetId:///T:System.Int32)|  
|RecordID|[String](assetId:///T:System.String)|  
|Text|[String](assetId:///T:System.String)|  
|Time|[DateTime](assetId:///T:System.DateTime)|  

## Data Mapping and Multiple Data Types  
 The mapping between the C/AL data type of the page control and the .NET Framework data type occurs when the control add-in is instantiated on a page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For example, if a page contains a control that uses a Date data type in C/AL and the control add-in implements the Boolean data type \(`IValueControlAddInDefinition<Boolean>`\), then an error occurs.  

 A control add-in can support multiple .NET Framework data types by implementing the [Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition\<T>](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1) interface for each data type. For example, to support both a string and an integer data type, include the following code.  

```c#  
public class MyControlAddIn : IValueControlAddInDefinition<String>, IValueControlAddInDefinition<Int32>  

```  

## See Also  
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Client Extensibility API Overview](Client-Extensibility-API-Overview.md)   
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)
