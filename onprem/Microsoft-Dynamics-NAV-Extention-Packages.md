---
title: "Microsoft Dynamics NAV Extension Packages"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f7a66201-dc01-4221-8aa4-6ba1e7a4ef6a
caps.latest.revision: 2
---
# Microsoft Dynamics NAV Extension Packages
You deploy your [!INCLUDE[navnow](includes/navnow_md.md)] extensions as packages.  

 A package file can contain a number of different artifacts that are needed for the extension, such as DELTA files and full application object .TXT files. The package also contains a manifest with metadata such as name, version, publisher and, most importantly, a globally unique identifier, the extension ID. [!INCLUDE[navnow](includes/navnow_md.md)] uses the extension ID to uniquely identify the extension. This ID must be maintained consistently across versions of an extension in order to upgrade properly. The [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets that you use to create the manifest generate an ID for you, but you can also specify an ID.  

## Extension Manifests  

> [!IMPORTANT]  
>  Use the New-NAVAppManifestFile cmdlet to write your manifest to disk so that the App ID is preserved. Then, you can use the modification cmdlet, Set-NAVAppManifest, to change attributes such as the version number.  

 The following code snippet illustrates how you can generate a manifest file.  

```  
New-NAVAppManifest -Name ‘My Extension’ -Publisher ‘Proseware’ -Version ‘1.0.0.0’ | New-NAVAppManifestFile –Path ‘C:\MyExtensionManifest.xml’  
```  

 The following code example illustrates a manifest for an extension.  

```  
<?xml version="1.0" encoding="utf-8"?>  
<Package xmlns="https://schemas.microsoft.com/navx/2015/manifest">  
<App Id="6147E5EF-197E-43CF-B4A2-168AAE537A0B"  
Name="Microsoft Dynamics NAV Customer Loyalty"  
Publisher="Microsoft Corporation"  
Description="Customer Loyalty Extension Package for Microsoft Dynamics NAV"  
Version="1.0.23.0"  
CompatibilityId="1.0.0.0" />  
<Capabilities>   
<Capability Name="schemaChanges" />  
</Capabilities>  
<Prerequisites>  
     <Objects>  
          <Object Type="CodeUnit" Id="1600"/>  
     </Objects>  
</Prerequisites>  
<Dependencies>  
<Dependency Id="9DE57280-CC68-4612-BB26-8C8F5CF34A37"  
     Name="Microsoft Dynamics NAV Service Integration"  
     Publisher="Microsoft Corporation"  
     MinVersion="1.3.1.0"  
     CompatibilityId="1.1.0.0" />  
</Dependencies>  
</Package>  
```  

 At the root of the manifest is the `Package` element. The following sections describe the other elements and settings.  

### App  
 The `App` element describes your extension to the system and users. The element has the following attributes.  

|Attribute|Required|Type|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|--------------|----------|---------------------------------------|  
|Id|Yes|GUID|An identifier that uniquely identifies the extension. This value should remain constant for the life of the application.|  
|Name|Yes|String|The name of the extension. String length of 250 characters.|  
|Publisher|Yes|String|The publisher of the extension. String length of 250 characters.|  
|Description|No|String|The description of the extension. String length of 2048 characters.|  
|Version|Yes|String|Version string in the format of Major.Minor.Build.Revision. This value should be incremented for each published package.|  
|CompatibilityId|Yes|String|Version string in the format of Major.Minor.Build.Revision. This value defines the compatibility ID of the extension.|  
|Brief|No|String|The brief description of the extension.|  
|PrivacyStatement|No|String|A hyperlink to a privacy statement for the extension.|  
|Eula|No|String|A hyperlink to an end user license agreement for the extension.|  
|Url|No|String|A hyperlink to a page or web site with additional information for the extension.|  
|Help|No|String|A hyperlink to Help for the extension.|  
|Logo|No|String|A logo image file for the extension that is shown in the **Extension Management** page. Provide a .png or .jpg file that is 240 x 240 pixels.|  
|ScreenShots|No|String|One or more screenshots of the extension. Provide a .png or .jpg file that is 240 x 240 pixels.|  

### Capabilities  
 The `Capabilities` element contains a collection of `Capability` elements that describe what the extension impacts in terms of the hosting [!INCLUDE[navnow](includes/navnow_md.md)] deployment. The `Capability` element can be used to determine if an extension is allowed to be installed.  

> [!NOTE]  
>  Capabilities cannot be set manually as they are added by the packaging process. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] does not provide any functionality for analyzing or otherwise reacting to capabilities. Capabilities are reserved for future use.  

|Capability|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|uiChanges|Existing UI objects have been modified,|  
|uiAdds|New UI objects are added,|  
|schemaChanges|Existing tables or fields have been modified. This includes adding a new field to an existing table.|  
|schemaAdds|New table objects are added.|  
|codeAdds|Event subscriber codeunits are added,|  
|permissionSets|New permission sets are added.|  
|ControlAddIns|Client-side JavaScript or WinForms extensibility control add-ins are added.|  
|ServerSideControlAddIns |Server-side .NET add-ins are added.|  
|FieldPropertyChanges |Existing field properties have been modified. |  
|XMLPortAdds|New XMLports are added.|  
|ReportAdds |New reports are added.|  
|QueryAdds |New queries are added.|  
|TenantWebServices|New tenant web services are added.|  
|CustomReportLayouts|New custom report layouts are added.|  
|LanguageFiles|New language translations are added.|  

### Prerequisites  
 The `Prerequisites` element contains a collection of `Object` elements that define what must be presently available in the hosting [!INCLUDE[navnow](includes/navnow_md.md)] deployment in order for this extension to function. It uses specific identifiable object IDs that must be available in the system. If a prerequisite is not found, the extension cannot install.  

|Attribute|Required|Type|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|--------------|----------|---------------------------------------|  
|Type|Yes|Type|The type of the object. The following objects are available:<br /><br /> -   TableData<br />-   Table<br />-   Report<br />-   CodeUnit<br />-   XmlPort<br />-   MenuSuite<br />-   Page<br />-   Query|  
|Id|Yes|Int32|The object ID.|  

### Dependencies  
 The `Dependencies` element contains a collection of `Dependency` elements that define identifies other extensions that this extension has a specific dependency on. Dependencies are added to the manifest when you provide a path to a .navx file in the –Dependencies parameter of the New-NAVAppManifest cmdlet.  

|Attribute|Required|Type|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|--------------|----------|---------------------------------------|  
|Id|Yes|GUID|The unique identifier of the extension that this extension depends on.|  
|Name|Yes|String|The name of the extension.|  
|Publisher|Yes|String|The publisher of the extension.|  
|MinVersion|Yes|String|Version string in the format of Major.Minor.Build.Revision. This is the minimum version of the extension that must be present in conjunction with the specified Compatibility ID.|  
|CompatibilityId|Yes|String|Version string in the format of Major.Minor.Build.Revision. This value defines the compatibility ID of the extension.|  

## See Also  
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)   
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)  
[How to: Develop an Extension](How-to--Develop-an-Extension.md)  
