---
title: "Signing an APP Package File"
description: "How do you sign an extension developed in the AL language."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/23/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Signing an APP Package File
Code signing is a common practice for many applications. It is the process of digitally signing a file to verify the author and that the file has not been tampered with since it was signed. The signature of the APP package file is verified during the publishing of the extension using the `Publish-NAVApp` cmdlet. 
For more technical information on signing, see [Authenticode](https://msdn.microsoft.com/en-us/library/ms537359\(VS.85\).aspx) in the MSDN Library. 

> [!NOTE]   
> If you want to publish an unsigned extension package in your on-premise environment, you need to explicitly state that by using the - *SkipVerification* parameter on the `Publish-NAVApp` cmdlet. An extension without a valid signature will not be published. 

The signing of an APP package file must be performed on a computer that has [!INCLUDE[navnow](includes/navnow_md.md)] 2018 or later (or the latest version of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]) installed. If you use a Docker image for your development environment, that environment will meet this requirement. You must also have the certificate that will be used for signing on the computer. The certificate must include code signing as the intended purpose. It is recommended that you use a certificate purchased from a third-party certificate authority. 

> [!IMPORTANT]  
> If you publish the extension as an app on AppSource, the APP package file must be signed using a certificate from a [Certification Authority](https://technet.microsoft.com/en-us/library/cc751157.aspx) that has its root certificates in Microsoft Windows.

## Steps for signing your .app file

1. Prepare your computer for signing. 
2. Make sure that you sign the .app file on a computer that has [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] installed.
3. Copy the certificate that you purchased from a third-party certificate authority to a folder on the computer. Optionally, create your own certificate for local test or development purposes using the [Self-signed certificate information](#self-signed-certificate). The file path for the sample command is `C:\Certificates\MyCert.pfx`.
4. Install a signing tool such as [SignTool](https://docs.microsoft.com/en-us/dotnet/framework/tools/signtool-exe) or [SignCode](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms537364(v=vs.85)) to the computer. The sample command will use SignTool.
5. Copy your extensions .app file to the computer if it is not already on the computer. The file path for the sample command is `C:\NAV\Proseware.app`.
6. Run the command to sign the .app file.  
7. The following example signs the Proseware.app file with a time stamp using the certificate in the password-protected MyCert.pfx file. The command is run on the computer that was prepared for the signing. Once the command has been run, the Proseware.app file has been modified with a signature. This file is then used when publishing the extension.

```
SignTool sign /f C:\Certificates\MyCert.pfx /p MyPassword /t http://timestamp.verisign.com/scripts/timestamp.dll “C:\NAV\Proseware.app”
```

> [!IMPORTANT]   
> It is recommended to use a time stamp when signing the APP package file. A time stamp allows the signature to be verifiable even after the certificate used for the signature has expired. For more information, see [Time Stamping Authenticode Signatures](https://msdn.microsoft.com/en-us/library/windows/desktop/bb931395(v=vs.85).aspx).


## Self-signed certificate
For testing purposes and on-premise deployments, it is acceptable to create your own self-signed certificate using the [New-SelfSignedCertificate](https://technet.microsoft.com/library/hh848633) cmdlet in PowerShell on Windows 10 or [MakeCert](https://msdn.microsoft.com/en-us/library/windows/desktop/aa386968(v=vs.85).aspx).  

The following example illustrates how to create a new self-signed certificate for code signing:

```
New-SelfSignedCertificate –Type CodeSigningCert –Subject “CN=ProsewareTest”
```

The following MakeCert command is used to create a new self-signed certificate for code signing:

```
Makecert –sk myNewKey –n “CN=Prosewaretest” –r –ss my
```

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)  
