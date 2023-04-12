---
title: Windows Client Control Add-ins
description: A control add-in is defined as a class in a Visual C\# solution. After developing a control add-in, you build and sign an assembly before you install.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fdc41aa6-5780-4cd7-b22c-994cfd795a93
caps.latest.revision: 40
---
# Creating a Windows Client Control Add-in
You develop [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-ins using the API that is defined in the Microsoft.Dynamics.Framework.UI.Extensibility assembly. A control add-in is defined as a class in a Visual C\# solution. You can include more than one control add-in a single solution. When you have finished developing a control add-in, you build and sign an assembly before you install it on the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 To create a control add-in, you need the following prerequisites:  

-   Microsoft Visual Studio 2005, Microsoft Visual Studio 2008, Visual C\# 2008 Express Edition, Microsoft Visual Studio 2010, or Microsoft Visual Studio 2012.  

-   Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly.  

     The assembly is installed with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. By default, the path of the assembly is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client. For more information, see [Deployment](Deployment.md).  

-   Windows Forms library \(System.Windows.Forms.dll\).  

### To create the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-in  

1.  In Visual Studio, create a Visual C\# project type by using the **Class Library** template.  

2.  In the project, add references to the following assemblies:  

    -   Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly  

         By default, the path of the assembly is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client. This reference is required for all control add-ins.  

    -   [System.Windows.Forms](https://go.microsoft.com/fwlink/?LinkID=152505)  

         Contains classes for creating user interfaces for Windows-based applications.  

     Add additional references as required.  

3.  Open the class.cs file and add the following **using** directives.  

    ```c#  
    using Microsoft.Dynamics.Framework.UI.Extensibility;  
    using Microsoft.Dynamics.Framework.UI.Extensibility.WinForms;  
    using System.Windows.Forms;  
    ```  

     Add additional references as required.  

4.  Declare a class for the control add-in that uses the [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute. Derive the class from an abstract base class and implement the control add-in definition interface, as shown in the following examples.  

    ```c#  
    [ControlAddInExport("MyCompany.MyProduct.MyAddin")]  
    public class MyFieldPopupAddin : WinFormsControlAddInBase, IObjectControlAddInDefinition  
    ```  

    ```c#  
    [ControlAddInExport("MyCompany.MyProduct.MyAddin")]  
    public class MyFieldPopupAddin : StringControlAddInBase  
    ```  

     For information about the base classes and interfaces, see [Client Extensibility API Overview](Client-Extensibility-API-Overview.md).  

     The [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute declares the class in the assembly to be a control add-in that is identified by its [ControlAddInExportAttribute.Name](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute.Name) property, which in this case is `MyCompany.MyProduct.MyAddin` in C\#. Because an assembly can contain more than one control add-in, the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] uses the [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute to differentiate each control add-in that is found in an assembly. The [ControlAddInExportAttribute.Name](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute.Name) is used to register the control add-in in [!INCLUDE[nav_server](includes/nav_server_md.md)].  

    > [!TIP]  
    >  If you give the control add-in the same name as the assembly, then you do not have to install the assembly on the client computer. In this case, you only install the assembly on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. When a client requests the control add-in, [!INCLUDE[nav_server](includes/nav_server_md.md)] will automatically deploy the assembly to the client.  

     For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).  

5.  Implement the abstract base method [WinFormsControlAddInBase.CreateControl](assetId:///M:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.CreateControl) and add code that defines the control add-in.  

    ```c#  
    protected override Control CreateControl()  
           {  
               /// Include control add-in code here.  
           }  
    ```  

6.  Add code to override additional base class members as required for your control add-in.  

     For example, a field control on a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] can have a caption. If you do not want a caption, then override the [WinFormsControlAddInBase.AllowCaptionControl](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.AllowCaptionControl) property and return `false` \(the default value is `true`\).  

    ```c#  
    public override bool AllowCaptionControl  
    {  
    get   
    {   
     return false;  
    }  
    ```  

     The caption will span the caption column and the data column of the page.  

7.  To bind the control add-in to data in the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] database, add the following code that gets or sets the [IValueControlAddInDefinition\<T>.Value](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1.Value) property.  

    ```c#  
    /// Gets a value indicating whether the Value property has  
    /// changed its value.  
    public bool HasValueChanged { get; set; }  

    /// Gets or sets the Value Property.  
    public object Value  
    {  
        get  
        {  
            // Include value handling code here.  
            return null;  
        }  
        set  
        {  
            // Include value handling code here.  

        }  
    }  

    ```  

    > [!NOTE]  
    >  The [Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.StringControlAddInBase](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.StringControlAddInBase) class already overrides the [IValueControlAddInDefinition\<T>.Value](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.IValueControlAddInDefinition`1.Value) property to transfer data between the control add-in and the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

     For more information, see [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md).  

8.  To define events that call the OnControlAddin C/AL trigger of a page field control, add the following C\# code to declare an event handler.  

    ```c#  
    public event ControlAddInEventHandler ControlAddIn;  
    ```  

     Add code to raise the event where appropriate.  

     For more information, see [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md).  

9. To add an event that will be represented by a new trigger in C/AL code of a [!INCLUDE[navnow](includes/navnow_md.md)] page object, use the managed attribute [ApplicationVisibleAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ApplicationVisibleAttribute) and add code for C\# methods and properties.  

    ```c#  
    [ApplicationVisible]  
         public void DrillDown(int nodeId)  
         {  
          …  
         }  

         public int SelectedNode  
         {  
          get {…}  
          set {…}  
         }  

    ```  

     The methods and properties must be public. For more information, see [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  

10. To add a method or property that can be called from the C/AL code of a [!INCLUDE[navnow](includes/navnow_md.md)] page object, use the managed attribute [ApplicationVisibleAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ApplicationVisibleAttribute) and add code for C\# methods and properties.  

    ```c#  
    /// <summary>  
    /// Event will be fired when the AddIn is ready for communication through its API  
    /// </summary>  

    [ApplicationVisible]  
    public event MethodInvoker AddInReady;  

    ```  

     The methods and properties must be public. For more information, see [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  

11. Build and sign the solution.  

## Signing an Assembly That Contains a Control Add-in  
 To use an assembly that contains a control add-in with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], it must be signed. Signing gives the assembly a *public token key*, which is a unique identity that is used to make sure that the control add-in runs code from a trusted assembly. When you register a control add-in in [!INCLUDE[nav_server](includes/nav_server_md.md)], you provide the public token key. At run time, the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] uses the public token key to load the appropriate control add-in.  

 Assemblies are signed with a key file that contains the public key token and an optional password. You can sign an assembly that contains a control add-in by creating a new key file or using an existing one. For more information about how to sign assemblies, see [How to: Sign Assemblies](https://go.microsoft.com/fwlink/?LinkID=151835&clcid=0x409) and [Strong-Name Signing for Managed Applications](https://go.microsoft.com/fwlink/?LinkID=150201&clcid=0x409).  

#### To sign the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] add-in assembly  

1.  Open the project's properties.  

2.  On the **Properties** window, choose the **Signing** tab.  

3.  Select the **Sign the assembly** check box.  

4.  In the **Choose a strong name key file box**, select **New** to create a new key file or **Browse** to use an existing key file.  

5.  Choose the **OK** button.  

 For information about how to determine the public token key, see [How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly](How-to--Determine-the-Public-Key-Token-of-the-Windows-Client-Control-Add-in-and-.NET-Framework-Assembly.md).  

## Example  
 The following code illustrates a control add-in that implements the Microsoft digital ink control on a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] page field. For example, you could use this control add-in on a sales order page to allow customers to sign their sales orders with a tablet PC. The control add-in is designed to bind with a table field in the [!INCLUDE[navnow](includes/navnow_md.md)] database to store and retrieve signatures. Because the signatures are transferred as binary data, the example implements the [Microsoft.Dynamics.Framework.UI.Extensibility.IObjectControlAddInDefinition](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IObjectControlAddInDefinition) interface.  

```c#  
using System;  
using System.Collections.Generic;  
using System.Text;  
using Microsoft.Ink;  
using System.Drawing;  
using Microsoft.Dynamics.Framework.UI.Extensibility;  
using Microsoft.Dynamics.Framework.UI.Extensibility.WinForms;  
using System.Windows.Forms;  

namespace NavInkControl  
{  
    [ControlAddInExport("MyCompany.MyProduct.MyNavInkControlAddin")]  
    public class NavInkContol : WinFormsControlAddInBase, IObjectControlAddInDefinition  
    {  
        InkPicture _inkControl;  
        private bool _loaded = false;  

        /// Creates the control for displaying and adding signatures.  
        protected override Control CreateControl()  
        {  
            _inkControl = new InkPicture();  
            _inkControl.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;  
            _inkControl.MinimumSize = new Size(40, 50);  
            _inkControl.MaximumSize = new Size(Int16.MaxValue, 100);  

            return _inkControl;              
        }  

        #region IObjectControlAddInDefinition Members  

        public event ControlAddInEventHandler ControlAddIn;  

        /// Gets a value indicating whether the Value property instance has changed. true if this instance has changed its value; otherwise, false.  
        public bool HasValueChanged  
        {  
            get { return _inkControl.Ink.Dirty; }  
        }  

        /// Gets or sets the value.  
        public object Value  
        {  
            get  
            {  
                return this._inkControl.Ink.Save();  
            }  
            set  
            {  
                if (value is byte[])  
                {  
                    byte[] data = (byte[])value;  

                /// Specifies that the data loads only once so that data cannot load while the user is drawing.  
                    if (data != null && !this._loaded)  
                    {  
                        this._inkControl.Ink.Load(data);  
                        this._loaded = true;  
                    }  
                }  
            }  
        }  

        #endregion  
    }  
```  

## See Also  
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Client Extensibility API Overview](Client-Extensibility-API-Overview.md)   
 [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md)   
 [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md)
