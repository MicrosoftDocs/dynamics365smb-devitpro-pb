---
title: "Sizing a Control Add-in on a Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4070244f-e203-4c2f-b157-628ce4f871a2
caps.latest.revision: 13
---
# Sizing a Control Add-in on a Page
By default, the size of a control add-in on a page is determined by the [System.Drawing.Size](assetId:///T:System.Drawing.Size) class of the control. The size is static, so when the page is resized in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the control add-in size will remain the same.  
  
## Changing the Size of a Control Add-in  
 To change the size of the control add-in and set it to resize with the page window size, you implement the [WinFormsControlAddInBase.ApplySize](assetId:///M:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.ApplySize(Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.DisplaySize,Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.DisplaySize)) method. This method has the following syntax.  
  
```c#  
public void ApplySize(DisplaySize width, DisplaySize height);  
```  
  
 Each dimension is defined by the [DisplaySize](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.DisplaySize) method. This method has the following syntax.  
  
```c#  
DisplaySize.DisplaySize(int minimum, int preferred, int maximum)  
```  
  
 The DisplaySize parameters specify the control add-in size as follows.  
  
|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|`minimum`|An integer that sets the minimum width or height, in pixels, of the control add-in. The control add-in will not resize smaller than this value regardless of the size of the page window.|  
|`preferred`|An integer that sets the initial width or height, in pixels, of the control add-in when the page first opens.|  
|`maximum`|An integer that sets the minimum width or height, in pixels, of the control add-in. The control add-in will not resize larger than this value regardless of the size of the page window.|  
  
### Example  
 The following code example shows the control add-in width \(in pixels\) set to: minimum 100, preferred 600, and maximum 1000. The height \(in pixels\) is set to: minmum 10, preferred 20, and maximum 200.  
  
```c#  
this.ApplySize(new DisplaySize(101, 600, 1000), new DisplaySize(10, 20, 200));  
```  
  
## Sizing a Control Add-in According to the Size of Other Page Controls  
 There might be instances when you want the control add-in to use the same size of other controls on the page. By using page controls, [!INCLUDE[navnow](includes/navnow_md.md)] automatically determines the size based on the control’s data type. To set this behavior on the control add-in, for each dimension, use either `DisplaySize.Default` or `null`. You can set one dimension to default and the other to custom values.  
  
### Example  
 The following code example shows the control add-in width in pixels set to default and the minimum height to 10, a preferred height set to 20, and the maximum height set to 200.  
  
```c#  
this.ApplySize(DisplaySize.Default, new DisplaySize(10, 20, 200));  
```  
  
 In this case, the control add-in width resembles other field controls that have the same C/AL data type on the page.  
  
## Calling the ApplySize Method  
 You can use the [WinFormsControlAddInBase.ApplySize](assetId:///M:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.ApplySize(Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.DisplaySize,Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.DisplaySize)) method multiple times in the control add-in code to change the width and height. However, you should use it as part of the [CreateControl](assetId:///M:Microsoft.Dynamics.Framework.UI.Extensibility.WinForms.WinFormsControlAddInBase.CreateControl) method.  
  
## See Also  
 [Extending the Windows Client Using Control Add-ins](Extending-the-Windows-Client-Using-Control-Add-ins.md)   
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)
