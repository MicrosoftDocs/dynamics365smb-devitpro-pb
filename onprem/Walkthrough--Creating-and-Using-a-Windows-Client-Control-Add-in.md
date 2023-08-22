---
title: "Walkthrough: Creating and Using a Windows Client Control Add-in"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 670a6589-05e7-4289-9bb4-a3c0015f2442
caps.latest.revision: 51
---
# Walkthrough: Creating and Using a Windows Client Control Add-in
The following walkthrough demonstrates how to develop a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] add-in and use it on a [!INCLUDE[nav_windows](includes/nav_windows_md.md)] page. Add-ins are Microsoft .NET Framework assemblies that enable you to add custom functionality to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. An API lets you develop add-ins without having to access the [!INCLUDE[navnow](includes/navnow_md.md)] source code.  

> [!NOTE]  
>  With [!INCLUDE[navsicily](includes/navsicily_md.md)] you can develop control add-ins that are displayed on both [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md).  

 In a typical business scenario, .NET Framework developers create add-ins using Microsoft Visual Studio Express, Visual Studio 2008, Visual Studio 2010, or Visual Studio 2012. Implementers of [!INCLUDE[navnow](includes/navnow_md.md)] solutions then use the add-ins on [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages.  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   [Creating an Add-in with Visual Studio](#CreatingAddIn).  

-   [Copying the Add-in Assembly to the Microsoft Dynamics Windows Client](#CopyAddin).  

-   [Registering the Add-in in Microsoft Dynamics NAV](#RegisterAddin).  

-   [Setting Up the Add-in on a Page](#SetupAddin).  

### Roles  
 This walkthrough demonstrates tasks performed by the following user roles:  

-   Microsoft .NET Framework developer  

-   [!INCLUDE[navnow](includes/navnow_md.md)] developer and IT Professional  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

-   [!INCLUDE[demolong](includes/demolong_md.md)]  

-   Microsoft Visual Studio Express, Microsoft Visual Studio 2008, Microsoft Visual Studio 2010, or Microsoft Visual Studio 2012.  

-   Microsoft .NET Strong Name Utility \(sn.exe\). This is included with Visual Studio SDKs.  

     By default, the Microsoft .NET Strong Name Utility is located in C:\\Program Files \(x86\)\\Microsoft SDKs\\Windows\\v7.0A\\Bin\\NETFX 4.0 Tools.  

-   Experience using Visual Studio.  

## Story  
 Simon, a software developer working for [!INCLUDE[demoname](includes/demoname_md.md)] has been told that users of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] want a way to see all the content of page fields when the content extends beyond the field size. Simon decides to create an add-in that can be applied on a field that enables the user to select the field to display its full content. Fields that have add-ins are displayed in blue. When the user selects the field, a pop-up window opens that shows all of the field's content.  

##  <a name="CreatingAddIn"></a> Creating an Add-in with Visual Studio  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes the Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly that defines the model for creating [!INCLUDE[nav_windows](includes/nav_windows_md.md)] add-ins. The [!INCLUDE[navnowlong](includes/navnowlong_md.md)] API provides the binding mechanism between the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] add-in and the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] framework.  

#### To create the add-in  

1.  In Visual Studio, on the **File** menu, choose **New**, and then choose **Project**.  

2.  Under **Installed Templates**, choose **Visual C\#**, and then choose **Class Library**.  

3.  In the **Solution Name** text box, enter the name of your solution. For example, you can enter **MyCompany.MyProduct.RtcAddins** and then choose the **OK** button.  

     Yow will add references to the following assemblies:  

    1.  `Microsoft.Dynamics.Framework.UI.Extensibility.dll`  

    2.  `System.Windows.Forms`  

    3.  `System.Drawing`  

4.  In Solution Explorer, right-click your project, and then choose **Add Reference**.  

5.  In the **Add Reference** window, on the **Browse** tab, navigate to the location of the Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly on your computer and then choose the **OK** button. By default, the path of the assembly is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client.  

    > [!IMPORTANT]  
    >  The assembly cannot be placed outside of the RoleTailored Client folder.  

6.  In Solution Explorer, choose **Reference**, and on the shortcut menu, choose **Add Reference**.  

7.  In the **Add Reference** window, choose the **.NET** tab, then under **Component Name**, choose `System.Windows.Forms`, and then choose the **OK** button.  

     The namespace contains classes for creating user interfaces for Windows-based applications.  

8.  Repeat the previous step and add a reference to the `System.Drawing` namespace. This namespace provides access to basic graphics functionality.  

9. Open the Class1.cs file and add the following **using** directives.  

    ```c#  
    using Microsoft.Dynamics.Framework.UI.Extensibility;  
    using Microsoft.Dynamics.Framework.UI.Extensibility.WinForms;  
    using System.Windows.Forms;  
    using System.Drawing;  
    ```  

10. In the ClassLibrary1 namespace, add the following code to declare a new class named **MyFieldPopupAddin** for the add-in.  

    ```c#  
    [ControlAddInExport("MyCompany.MyProduct.FieldPopupAddin")]  
    public class MyFieldPopupAddin : StringControlAddInBase  
    {   
    }  
    ```  

     The class uses the [ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute and derives from the [Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.StringControlAddInBase](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.StringControlAddInBase) class and [Microsoft.Dynamics.Framework.UI.Extensibility.IStringControlAddInDefinition](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IStringControlAddInDefinition) interface. The [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute declares the class in the assembly to be a control add-in that is identified by its [ControlAddInExportAttribute.Name](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute.Name) property, which is `MyCompany.MyProduct.FieldPopupAddin`. Because an assembly can contain more than one control add-in, the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] uses the [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute to differentiate each control add-in that is found in an assembly.  

    > [!NOTE]  
    >  You will use the name `MyCompany.MyProduct.FieldPopupAddin` later in the walkthrough when you register the add-in in [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. When naming the control add-in, it is good practice to follow the .NET Framework naming convention for classes, which is *CompanyName.ProductName.ControlName*.  

     The [Microsoft.Dynamics.Framework.UI.Extensibility.IStringControlAddInDefinition](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IStringControlAddInDefinition) interface determines how data transfers to and from the add-in and how events are raised to call triggers on the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

11. In the `MyFieldPopupAddin` class, add the following code to implement the abstract [WinFormsControlAddInBase.CreateControl](assetId:///M:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.CreateControl) method and define the add-in functionality.  

    ```c#  
    /// Defines the text box control.  

        protected override Control CreateControl()  
        {  
            TextBox control = new TextBox();  

            control.MinimumSize = new Size(50, 0);  
            control.MaximumSize = new Size(500, Int32.MaxValue);  

            control.BackColor = Color.LightBlue;  
            control.Font = new Font("Tahoma", 9, FontStyle.Bold);  
            control.DoubleClick += control_DoubleClick;          

            return control;  
        }  
    /// Raises an event when the user double-clicks the text box.  
        private void control_DoubleClick(object sender, EventArgs e)  
        {  
            int index = 0;  
            string data = this.Control.Text;  
            this.RaiseControlAddInEvent(index, data);  

        }  

    ```  

    > [!NOTE]  
    >  If you want to create an add-in that spans both the caption column and the data column of the page, override the [IWinFormsControlAddIn.AllowCaptionControl](assetId:///P:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.IWinFormsControlAddIn.AllowCaptionControl) property and return `false` \(default value is `true`\).  

 An assembly must be signed that can be used in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You will now sign the assembly.  

#### To sign the assembly  

1.  In Visual Studio, on the **Project** menu, choose **MyCompany.MyProduct.RtcAddins properties**.  

2.  In the **Properties** window, choose **Signing**, and then select the **Sign the assembly** check box.  

3.  In the **Choose a strong name key file** drop-down list, select **New**.  

4.  In the **Key file name** text box, enter **RtcAddins** and clear the **Protect my key file with a password** check box.  

     In this walkthrough, you will not protect the key file with a password. However, you can choose whether to use a password. For more information, see [Strong-Name Signing for Managed Applications](https://go.microsoft.com/fwlink/?LinkID=150201&clcid=0x409).  

5.  Choose the **OK** button.  

6.  In Solution Explorer, choose the Class1.cs file to open it. Notice the RtcAddins.snk file that is added in Solution Explorer.  

7.  On the **Build** menu, choose **Build \<Your Solution>** to build the project. Verify that the build succeeds. In this example, your solution is **MyCompany.MyProduct.RtcAddins**.  

##  <a name="CopyAddin"></a> Copying the Add-in Assembly to the Microsoft Dynamics Windows Client  
 After you build the add-in, you copy the output assembly file to the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

#### To copy the add-in assembly to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

1.  On the development computer, locate and copy the add-in assembly file \(.dll file\) in the add-in project's output folder.  

     By default, this folder is C:\\ Documents\\Visual Studio\\Projects\\\[Your Addin Project\]\\\[Your Class Library\]\\bin\\Debug. In this case, the location of the assembly is C:\\ \\Documents\\Visual Studio 2012\\Projects\\MyCompany.MyProduct.RtcAddins\\ MyCompany.MyProduct.RtcAddins\\bin\\Debug.  

2.  On the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], paste the assembly in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]\\Add-ins folder in the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation folder.  

     By default, the path of this folder is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  

##  <a name="RegisterAddin"></a> Registering the Add-in in Microsoft Dynamics NAV  
 To register an add-in, you include it on the **Control Add-ins** page in [!INCLUDE[navnow](includes/navnow_md.md)]. To include an add-in on the page, you must provide the following information:  

-   Control Add-in name.  

     The control add-in name is determined by the [Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExportAttribute) attribute value of add-in class definition that you specified when you created the control add-in. The name in this walkthrough is `MyCompany.MyProduct.FieldPopupAddin`, as shown in the following code snippet from interface definition.  

    ```c#  
    [ControlAddInExport("MyCompany.MyProduct.FieldPopupAddin")]  
    public class MyFieldPopupAddin : StringControlAddInBase  
    ```  

-   Public key token.  

     This is a 16-character key that is given to the assembly when it is signed and built in Visual Studio. You can determine the public token key by running the Microsoft .NET Strong Name Utility \(sn.exe\) on the assembly. You must run the utility from the Visual Studio command prompt. The sn.exe utility is available with the Visual Studio 2008, Visual Studio 2010 SDKs, and Visual Studio 2012.  

#### To determine the public key token for the add-in  

1.  On the Windows taskbar, choose **Start**, choose **All Programs**, choose **Microsoft Visual Studio 2012**, choose **Visual Studio Tools**, and then choose **Visual Studio Command Prompt \(2012\)** to open the command prompt.  

2.  At a command prompt, change to the directory that contains the assembly that you copied.  

     For example, [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  

3.  Type the following command.  

    ```  
    sn -T <assembly>  
    ```  

     Replace `<assembly>` with the assembly name, such as `ClassLibrary1.dll`.  

4.  Press Enter and note the public token key that is displayed.  

#### To include the add-in on the Control Add-ins page  

1.  In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the **Search** box, enter **Control Add-ins**, and then choose the relevant link.  

2.  On a new row, in the **Control Add-ins** page, enter the **Control Add-in name**, and the **Public Key Token**.  

     In this walkthrough, the add-in name is **MyCompany.MyProduct.FieldPopupAddin**.  

3.  Choose the **OK** button to close the **Control Add-ins** page.  

##  <a name="SetupAddin"></a> Setting Up the Add-in on a Page  
 In this section, you will modify the **Customer Card** page to use the new add-in on the name field. This involves the following tasks:  

-   Setting the [ControlAddin Property](ControlAddin-Property.md) of the field to the add-in.  

-   Setting the [OnControlAddin Trigger](OnControlAddin-Trigger.md).  

     In the **C/AL Editor**, you set the trigger that is called when a user selects the field to open a pop-up window. When a field is double-clicked, the add-in raises the [IEventControlAddInDefinition.ControlAddIn](assetId:///E:Microsoft.Dynamics.Framework.UI.Extensibility.IEventControlAddInDefinition.ControlAddIn) event, which in turn calls the trigger.  

#### To set the ControlAddIn property on the field  

1.  In [!INCLUDE[navnow](includes/navnow_md.md)], in Object Designer, choose **Page**.  

2.  Select page 21, **Customer Card**, and then choose **Design**.  

3.  In the Page Designer, in the **Name** column, select the **Name** field, and then on the **View** menu, choose **Properties**.  

4.  In the **\<Name> Properties** window, in the **Property** column, locate **ControlAddIn**.  

5.  In the **Value** column, choose the up arrow, and then select **MyCompany.MyProduct.FieldPopupAddin** from the **Client Add-in** window. Choose the **OK** button to close the **Client Add-Ins** window. The public key token is inserted into the **Value** field.  

6.  Close the **Properties** window.  

#### To set the add-in trigger in the C/AL Code  

1.  On the **View** menu, choose **C/AL Code**.  

2.  In the **Page 21 Customer card -C/AL** Editor, locate the following trigger.  

    ```  
    Name - OnControlAddIn(Index : Integer;Data : Text[1024])  
    ```  

3.  Add the following code.  

    ```  
    Message(Data);  
    ```  

4.  Close the **C/AL Editor**.  

5.  On the **File** menu, choose **Save**, select the **Compiled** check box, and then choose the **OK** button.  

6.  Close the **C/AL** window.  

#### To test the add-in  

1.  In Object Designer, choose **Page**. In the **Name** column, select the **Customer Card** page, and then choose **Run**. The customer card view is displayed. Notice the color of the **Name** field.  

2.  Double-click the **Name** field. The contents of the **Name** field are displayed in a pop-up window.  

3.  On the **Action** menu, choose **Next** until you find a name that extends beyond the field size, and then double-click the field. All of the content for the field is displayed in a pop-up window.  

## See Also  
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Client Extensibility API Overview](Client-Extensibility-API-Overview.md)   
 [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md)   
 [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)   
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [How to: Determine the Public Key Token of the Windows Client Control Add-in and .NET Framework Assembly](How-to--Determine-the-Public-Key-Token-of-the-Windows-Client-Control-Add-in-and-.NET-Framework-Assembly.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)   
 [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md)   
 [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md)
