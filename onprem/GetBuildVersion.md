---
title: "GetBuildVersion"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b634cbf6-166e-4ec5-b7f1-88e5f1f56b83
caps.latest.revision: 4
---
# GetBuildVersion
Gets the [!INCLUDE[navnow](includes/navnow_md.md)] product name and build version number that is currently installed and saves the information to a .txt type file.  
  
## Syntax  
  
```  
finsql.exe command=getbuildversion, file=<versionfile>[, logfile=<path and filename>]  
```  
  
#### Parameters  
 *file*  
  
 Specifies the folder path and file name of the text file, for example *C:\\navbuildversion.txt*, in which to save the build information. This parameter is required.  
  
 *logfile*  
  
 The folder path and file name of a text file, for example *C:\\navbuildversionlog.txt*, in which to save error messages that result from the command. If there are no errors when you run the command, then a log file is not created.  
  
## Remarks  
 When you run the command, a file that contains information about the success or failure of the command is automatically created. The file has the name *navcommandresult.txt*. If you specify the *logfile* parameter, then the *navcommandresult.txt* file is created in the folder that is specified by the *logfile* parameter. If you do not specify the *logfile* parameter, the file is created in the same location as finsql.exe file, which by default is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not run the command prompt as an Administrator, then the command prompt window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the finsql.exe file.  
  
## Example  
 This example shows how to run the GetBuildVersions command to get the product name and version of [!INCLUDE[navnow](includes/navnow_md.md)] that is currently installed on the computer. The example saves the build version information to a .txt type file that has the path and file name *C:\\temp\\navbuildversion.txt*. The example also specifies a log file that has the path and file name *C:\\temp\\navbuildversionlog.txt*  
  
```  
finsql.exe command=getbuildversion.txt, file=C:\temp\navbuildversion.txt, logfile= C:\temp\navbuildversionlog.txt  
```  
  
 The build version file, in this case *navbuildversion.txt*, includes information that is similar to the following:  
  
 `Product Name: navnowlong`  
  
 `Product Version: 8.0.38865.0`  
  
## See Also  
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)   
 [Development Environment Commands](Development-Environment-Commands.md)
