---
title: Call .NET Framework Types From C/AL Code
description: Call .NET Framework type members, including methods, properties, and constructors, from C/AL code by defining a DotNet type variable that references the .NET Framework assembly.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5900cae9-c742-4c66-812c-ab9a82887eba
caps.latest.revision: 19
---
# Call .NET Framework Types From C/AL Code in Dynamics NAV
You can call .NET Framework type members, including methods, properties, and constructors, from C/AL code. To call members, you define a DotNet type variable that references the .NET Framework assembly type that contains the member and then call the variable from C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object. A .NET Framework interoperability example is included in this topic.  

### To create a variable for a .NET Framework class in an assembly  

1.  If the assembly that you want to reference is a custom assembly and not installed in the global assembly cache, then copy the assembly to the **Add-ins** folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installation folder on the computer running the development environment.  

     By default, the path to the installation folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client or [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client. You can place the assembly in a subfolder.  

     For more information about the global assembly cache, see [Assembly Installation in the GAC](https://go.microsoft.com/fwlink/?LinkID=196848&clcid=0x409) in the MSDN Library.  

    > [!TIP]  
    >  You can install the assembly in the global assembly cache with the GAC utility. For more information, see [Global Assembly Cache Tool](https://go.microsoft.com/fwlink/?LinkID=204215&clcid=0x409) in the MSDN Library.  

2.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open Object Designer, and then open the object that will use .NET Framework interoperability, such as the page or codeunit.  

3.  To open the C/AL code for the object, on the **View** menu, choose **C/AL Code**.  

4.  To create the variable for .NET Framework interoperability, do one of the following steps:  

    -   To create a global variable, on the **View** menu, choose **C/AL Globals**.  

    -   To create a local variable, on the **View** menu, choose **C/AL Locals**.  

        > [!IMPORTANT]  
        >  A local DotNet variable, including any resources that it references, is disposed after its C/AL function is run.  

5.  On the **Variables** tab, in the **Name** field, type a name for the variable.  

6.  Set the **DataType** field to **DotNet**.  

7.  In the **SubType** field, choose the **AssistEdit** button to open the **.NET Type List** window.  

8.  In the **Assembly** field, choose the **AssistEdit** button to open the **Assembly List** window.  

9. If the assembly that you want to reference is in the global assembly cache, then choose the **.NET** tab. If the assembly is in the Add-ins folder of your [!INCLUDE[navnow](includes/navnow_md.md)] installation, then choose the **Dynamics NAV** tab.  

10. In the list of assemblies, select the assembly, and then choose **OK** to return to the **.NET Type List** window.  

     If you do not see the assembly that you want, then make sure that you have installed it correctly. For more information, see step 1 of this procedure.  

11. In the **.NET Type List** window, select the type that contains the member that you want to call from the [!INCLUDE[navnow](includes/navnow_md.md)] object, and then choose **OK**.  

     The **.NET Type List** window displays all available types, including classes, enumerations, structs, and interfaces, which are available in the selected assembly.  

     By default, variables are set to run the assembly instance on [!INCLUDE[nav_server](includes/nav_server_md.md)]. If you want to run the assembly instance on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], see [How to: Set .NET Framework Types to Run on the Microsoft Dynamics NAV Windows Client or Microsoft Dynamics NAV Server Computers](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md).  

### To call methods and properties in a .NET Framework class  

1.  Open the C/AL code for the object.  

2.  On the **View** menu, choose **C/AL Symbol Menu**.  

     You use the **C/AL Symbol Menu** window to help you call members and properties of the .NET Framework class.  

3.  In your C/AL code, add the following code to call the constructor that creates a new instance of the type. If you are calling a static method, then a constructor is not required, and you can skip this step.  

    ```  
    MyVariableName.ConstructorName(arguments);  
    ```  

    -   `MyVariableName` represents the name of the .NET Framework variable.  

    -   `ConstructorName` represents the same as the type name.  

    -   `arguments` represents any parameters that you must set for the constructor.  

4.  Add the following code to call the methods or properties.  

    ```  
    MyVariableName.MethodPropertyName(arguments);  
    ```  

     `MethodPropertyName` represents the name of the method or property that you want to call, and `arguments` represents any arguments of the method or property.  

    > [!IMPORTANT]  
    >  Some types in the [System](https://go.microsoft.com/fwlink/?LinkID=216777&clcid=0x409) namespace of the .NET Framework class library are automatically converted to C/AL types. You cannot assign values to .NET Framework variables for these types. For more information, see [Mapping Between .NET Framework and C/AL Types](Mapping-Between-.NET-Framework-and-C-AL-Types.md).  

    > [!TIP]  
    >  Methods can be overloaded. Therefore see the description at the bottom of the **C/AL Symbol Menu**, which shows the parameter and return types for each method. Also, method and property names that are longer than 128 characters will be truncated, and you cannot compile the [!INCLUDE[navnow](includes/navnow_md.md)] object. For more information, see [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md).  

## Example  
 The following code example uses .NET Framework interoperability to display headlines from the RSS feed https://blogs.msdn.com/inside\_office\_online/rss.xml. This example accesses classes in the **System.XML** assembly that is found in Global Assembly Cache. To implement this example, create a codeunit that has the following local variables:  

 The following code example uses .NET Framework interoperability to display headlines from an RSS feed from the Microsoft Dynamics NAV team blog, which has the following URL:  

 https://feeds.feedburner.com/MicrosoftDynamicsNavTeamBlog?format=xml.  

 This example calls members of the **System.XML** assembly, which is part of the Microsoft .NET Framework class library and is installed in the global assembly cache.  

 To implement this example, you create a codeunit that has the following local variables.  

|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|xml|DotNet|'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlDocument|  
|items|DotNet|'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNodeList|  
|i|Integer||  
|title|DotNet|'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Xml.XmlNode|  

 After you create the codeunit, add the following code to its OnRun trigger:  

```  

xml := xml.XmlDocument();  

xml.Load('https://feeds.feedburner.com/MicrosoftDynamicsNavTeamBlog?format=xml');  

items := xml.SelectNodes('/rss/channel/item');  

FOR i := 0 TO items.Count - 1 DO  
BEGIN  
    title := items.Item(i).SelectSingleNode('title/text()');  

    MESSAGE( title.Value );  
END  

```  

 To see the example in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you can create an action on a page that opens the codeunit.  

## See Also  
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)   
 [Mapping Between .NET Framework and C/AL Types](Mapping-Between-.NET-Framework-and-C-AL-Types.md)   
 [Serializing .NET Framework Types](Serializing-.NET-Framework-Types.md)   
 [Handling Events with Microsoft .NET Framework Interoperability](Handling-Events-with-Microsoft-.NET-Framework-Interoperability.md)
