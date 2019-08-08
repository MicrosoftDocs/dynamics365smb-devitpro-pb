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
2. Make backup of the database.
3. Uninstall extensions from the tenants.
4. Run a technical upgrade on the application.
  1. C:\windows\system32> Invoke-NAVApplicationDatabaseConversion -DatabaseServer navdevvm-0127\bcdemo -DatabaseName "demo database bc (14-0)"
5. Increase the application application version.

    Set-NAVApplication bc150 -ApplicationVersion 15.0.34737.0 -force
6. Publish platform system symbols:

    C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
7. Publishing the application system app:

    C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification

8. Publishing the application base app:

    C:\windows\system32> Publish-NAVApp -ServerInstance bc150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
10. Synchronize the tenant.
  
        C:\windows\system32> Sync-NAVTenant bc150 -Mode ForceSync  no force second time
        Get lots of error about deletion
11. Deleted all objects except system objects here the second time
11. Synchronize the tenant with the application system extension (Microsoft_System Application_15.0.34737.0):

    C:\windows\system32> Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0

12. Synchronize the tenant with the base application extension (BaseApp):

    C:\windows\system32> Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
Got this error the second time:
C:\windows\system32> Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
Sync-NAVApp : Table Invoice Post. Buffer :: Unsupported field change.
Field:Additional Grouping Identifier; Change:LengthChanged
Table Incoming Document :: Unsupported field change. Field:URL1; Change:Remove
Table Incoming Document :: Unsupported field change. Field:URL2; Change:Remove
Table Incoming Document :: Unsupported field change. Field:URL3; Change:Remove
Table Incoming Document :: Unsupported field change. Field:URL4; Change:Remove
At line:1 char:1
+ Sync-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Sync-NAVApp], InvalidOper
   ationException
    + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$bc150/nav-systemappli
   cation,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.SyncNavApp
Fixed by doing -mode forcesync

13. Upgrade the tenant data:

    C:\windows\system32> Start-NAVDataUpgrade bc150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
        
13. Install system application extension (Microsoft_System Application_15.0.34737.0) on tenant.

    C:\windows\system32> Sync-NAVApp bc150 -Name "System Application" -Version 15.0.34737.0

12. Install base Application extension on the tenant:

    C:\windows\system32> Install-NAVApp bc150 -Name "BaseApp" -Version 15.0.34737.0

## Customized application single tenant
### Option 1 - Convert entire solution to an extension

1. Upgrade to Business Central Spring 2019.
2. Convert your application from C/AL to AL.

   1. Export aall objects exceot system objects to txt in new sytax:

    C:\windows\system32> Export-NAVApplicationObject -DatabaseServer navdevvm-0127\b    cdemo -DatabaseName "Demo Database BC (14-0)" -ExportToNewSyntax -Path "c:\exporttoal\expoertedbc14app.txt" -Filter 'Id=1..1999999999'
    2. Start command prompt as admin, navigate to txtal, and run :
    1. Convert to *.al:

        C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client>txt2al --source=C:\exporttoal --target=C:\exporttoal\al
    
    This will create separate al file for each object.
3. Create a new application db on BC 15.
4. Connect to 15 server Instance.
5. Publish system symbols.
1. Publsih asystem app extension.
1. Make backup of the database.
1. Uninstall extensions from the tenants.
1. Run application technical upgrade.
1. Sync tenant


From Torben

Notes from meeting:

Technical Upgrade Application:
Invoke-NAVApplicationDatabaseConversion -DatabaseServer . -DatabaseName AL.app 

Technical Upgrade Tenant:
// Allows the upgrade of the tenant tables by using  -PrepareCalToAlUpgrade which allows excessive tables to be renamed into extension tables
Sync-NAVTenant  -Tenant default -ServerInstance platformcore -PrepareCalToAlUpgrade

// Sync-NavAppp mode CalToAlUpgrade will allow for baseappupgrade
// Same operation adds immutable keys into all upgraded tables
Sync-NAVApp -ServerInstance PlatformCore -Name BaseApp -Publisher Microsoft -Version 14.5.0.0 -Mode CalToAlUpgrade -Tenant default

// When sync is over it is normal extension operation to install
Install-NAVApp -ServerInstance PlatformCore -Name BaseApp -Publisher Microsoft -Version 14.5.0.0 -Tenant default

// Here we have data upgrade steps from the old BaseApp that need to be removed, contact Steffen Balslev

Upgrade to 15.0 baseapp:
// To continue to 15.0 BaseApp Extension publish the 15.0 extension
Publish-NAVApp -ServerInstance PlatformCore -Name BaseApp -Publisher Microsoft -Version 15.0.0.0 -Tenant default
Sync-NAVApp -ServerInstance PlatformCore -Name BaseApp -Publisher Microsoft -Version 15.0.0.0 -Tenant default
Install-NAVApp -ServerInstance PlatformCore -Name BaseApp -Publisher Microsoft -Version 15.0.0.0 -Tenant default


## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
