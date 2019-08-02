---
title: Upgrade Application Code
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.service: "dynamics365-business-central"
---
# Upgrading the Application Code in [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

## Non-customized application single tenant

1. Upgrade to Business Central Spring 2019.
2. Make backup
3. Uninstall extensions from the tenants
4. Run application technical upgrade. invole-navapplicationdbupgrade
  1. C:\windows\system32> Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
6. Publish platform system symbols: C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
7. Publishing the application system app:

    C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification

7. Publishing the application base app:



## Customized application single tenant
### Option 1

1. Upgrade to Business Central Spring 2019.
2. Make backup
3. Uninstall extensions from the tenants
4. Run application technical upgrade.
5. Sync tenant


## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
