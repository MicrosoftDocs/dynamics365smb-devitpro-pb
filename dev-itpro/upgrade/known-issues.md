---
title: Some Known Issues in Business Central On-premises
description: Provides an overview of the known issues in Business Central versions
ms.date: 04/07/2025
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.custom: bap-template 
---

# Some Known issues in Business Central on-premises

This article describes some known issues in [!INCLUDE[prod short](../developer/includes/prod_short.md)] versions. These issues can affect installation, upgrade, and various operations of [!INCLUDE[prod short](../developer/includes/prod_short.md)] on-premises.

> [!NOTE]
> The article doesn't include a complete list of known issues. Instead, it addresses some common issues that you might experience or might consider when upgrading to a version. If you're aware of issues that aren't in this article, or you'd like more help, see [Resources for Help and Support](../help-and-support.md).

## Renamed tables and fields in susbscription billing extension cause synch errors on upgrade

> Applies to: Upgrade from 25.X

### Problem

Several tables and fields are [renamed](#renamed-tables-and-fields) in the subscription billing extension for version 26. These changes prevent you from syncing the extension to the tenant database when upgrading to version 26.0 or later. When you try to sync the extension, you get errors like the following:  

`Table 8001 Contract Renewal Line :: The table 'Contract Renewal Line' cannot be located. Removing tables is not allowed unless they are temporary or are being moved by migration to another app.`

`Table 8003 Price Update Template :: The field 'Contract Filter' cannot be located. Removing fields is not allowed.`

### Workaround

If no custom application code depends on the renamed tables and fields, force sync the extension using the `-Mode ForceSync` parameter:  

```powershell
Sync-NAVApp -ServerInstance $NewBcServerInstance -Name "Subscription Billing" -version $NewVersion -Mode ForceSync
```

Force sync might cause data loss if custom code depends on the renamed tables and fields in the extension. To prevent data loss, refactor the custom code to match the extension's latest database schema before upgrading.

### Renamed tables and fields

This section lists the new names for tables and fields. *(ff)* indicates a flow field.

#### Table 8051 "Service Contract Setup" → "Subscription Contract Setup"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Customer Contract Nos.                 | Cust. Sub. Contract Nos.               |
| 3        | Vendor Contract Nos.                   | Vend. Sub. Contract Nos.               |
| 4        | Service Object Nos.                    | Subscription Header No.                |
| 6        | Serv. Start Date for Inv. Pick         | Sub. Line Start Date Inv. Pick         |

#### Table 8004 "Contract Price Update Line" → "Sub. Contr. Price Update Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 7        | Contract No.                           | Subscription Contract No.              |
| 8        | Contract Description                   | Sub. Contract Description              |
| 9        | Service Object Description             | Subscription Description               |
| 10       | Service Commitment Description         | Subscription Line Description          |
| 13       | Additional Service Amount              | Additional Amount                      |
| 14       | Old Service Amount                     | Old Amount                             |
| 15       | New Service Amount                     | New Amount                             |

#### Table 8001 "Contract Renewal Line" → "Sub. Contract Renewal Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 2        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 10       | Linked to Ser. Comm. Entry No.         | Linked to Sub. Line Entry No.          |
| 11       | Linked to Contract No.                 | Linked to Sub. Contract No.            |
| 12       | Linked to Contract Line No.            | Linked to Sub. Contr. Line No.         |
| 13       | Contract No.                           | Subscription Contract No.              |
| 14       | Contract Line No.                      | Subscription Contract Line No.         |
| (ff) 101 | Service Object Description             | Subscription Description               |
| (ff) 102 | Service Commitment Description         | Subscription Line Description          |
| (ff) 103 | Service Start Date                     | Subscription Line Start Date           |
| (ff) 104 | Service End Date                       | Subscription Line End Date             |
| (ff) 106 | Service Amount                         | Amount                                 |
| (ff) 108 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |
| 201      | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |

#### Table 8002 "Planned Service Commitment" → "Planned Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| 26       | Service Object Customer No.            | Subscription Customer No.              |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |

#### Table 8019 "Contract Analysis Entry" → "Sub. Contr. Analysis Entry"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |
| 33       | Service Amount (LCY)                   | Amount (LCY)                           |
| 39       | Quantity Decimal                       | Quantity                               |
| 1005     | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 8007     | Service Object Source Type             | Sub. Header Source Type                |
| 8008     | Service Object Source No.              | Sub. Header Source No.                 |
| 8010     | Service Object Description             | Subscription Description               |

#### Table 8062 "Customer Contract Line" → "Cust. Sub. Contract Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Contract No.                           | Subscription Contract No.              |
| 100      | Service Object No.                     | Subscription Header No.                |
| 101      | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 102      | Service Object Description             | Subscription Description               |
| 106      | Service Commitment Description         | Subscription Line Description          |
| (ff) 109 | Service Obj. Quantity Decimal          | Service Object Quantity                |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |

#### Table 8065 "Vendor Contract Line" → "Vend. Sub. Contract Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Contract No.                           | Subscription Contract No.              |
| 100      | Service Object No.                     | Subscription Header No.                |
| 101      | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 102      | Service Object Description             | Subscription Description               |
| 106      | Service Commitment Description         | Subscription Line Description          |
| (ff) 109 | Service Obj. Quantity Decimal          | Service Object Quantity                |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |

#### Table 8066 "Customer Contract Deferral" → "Cust. Sub. Contract Deferral"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Type                          | Subscription Contract Type             |
| 22       | Contract Line No.                      | Subscription Contract Line No.         |
| 23       | Service Object Description             | Subscription Description               |
| 24       | Service Commitment Description         | Subscription Line Description          |

#### Table 8072 "Vendor Contract Deferral" → "Vend. Sub. Contract Deferral"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Type                          | Subscription Contract Type             |
| 22       | Contract Line No.                      | Subscription Contract Line No.         |
| 23       | Service Object Description             | Subscription Description               |
| 24       | Service Commitment Description         | Subscription Line Description          |

#### Table 8010 "Imported Customer Contract" → "Imported Cust. Sub. Contract"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Contract No.                           | Subscription Contract No.              |
| 7        | Contract Type                          | Subscription Contract Type             |


#### Table 8008 "Imported Service Object" → "Imported Subscription Header"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 100      | Service Object created                 | Subscription Header created            |

#### Table 8009 "Imported Service Commitment" → "Imported Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 3        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 5        | Contract No.                           | Subscription Contract No.              |
| 6        | Contract Line No.                      | Subscription Contract Line No.         |
| 7        | Contract Line Type                     | Sub. Contract Line Type                |
| 8        | Package Code                           | Subscription Package Code              |
| 11       | Service Start Date                     | Subscription Line Start Date           |
| 12       | Service End Date                       | Subscription Line End Date             |
| 19       | Service Amount                         | Amount                                 |
| 28       | Service Amount (LCY)                   | Amount (LCY)                           |
| (ff) 37  | Quantity Decimal                       | Quantity                               |
| 100      | Service Commitment created             | Subscription Line created              |
| 104      | Contract Line created                  | Sub. Contract Line created             |

#### Table 8007 "Overdue Service Commitments" → "Overdue Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Contract No.                           | Subscription Contract No.              |
| 5        | Contract Description                   | Sub. Contract Description              |
| 6        | Service Commitment Description         | Subscription Line Description          |
| 10       | Service Amount                         | Amount                                 |
| 12       | Contract Type                          | Subscription Contract Type             |
| 14       | Service Start Date                     | Subscription Line Start Date           |
| 15       | Service End Date                       | Subscription Line End Date             |
| 16       | Service Object No.                     | Subscription Header No.                |
| 17       | Service Object Description             | Subscription Description               |
| 19       | Quantity Decimal                       | Quantity                               |

#### Table 8068 "Sales Service Commitment" → "Sales Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Service Amount                         | Amount                                 |
| 21       | Service Comm. Start Formula            | Sub. Line Start Formula                |
| 22       | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |
| 31       | Package Code                           | Subscription Package Code              |
| 50       | Service Object No.                     | Subscription Header No.                |
| 51       | Service Commitment Entry No.           | Subscription Line Entry No.            |

#### Table 8069 "Sales Service Comm. Archive" → "Sales Sub. Line Archive"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Service Amount                         | Amount                                 |
| 21       | Service Comm. Start Formula            | Sub. Line Start Formula                |
| 22       | Agreed Serv. Comm. Start Date          | Agreed Sub. Line Start Date            |

#### Table 8057 "Service Object" → "Subscription Header"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 28       | Quantity Decimal                       | Quantity                               |
| (ff) 95  | Archived Service Commitments           | Archived Sub. Lines exist              |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Lines exist               |

#### Table 8059 "Service Commitment" → "Subscription Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Service Object No.                     | Subscription Header No.                |
| 3        | Package Code                           | Subscription Package Code              |
| 6        | Service Start Date                     | Subscription Line Start Date           |
| 7        | Service End Date                       | Subscription Line End Date             |
| 14       | Service Amount                         | Amount                                 |
| 19       | Contract No.                           | Subscription Contract No.              |
| (ff) 26  | Service Object Customer No.            | Sub. Header Customer No.               |
| 27       | Contract Line No.                      | Subscription Contract Line No.         |
| 33       | Service Amount (LCY)                   | Amount (LCY)                           |
| (ff) 39  | Quantity Decimal                       | Quantity                               |
| (ff) 200 | Planned Serv. Comm. exists             | Planned Sub. Line exists               |
| (ff) 8010| Service Object Description             | Subscription Description               |

#### Table 8073: Service Commitment Archive → Subscription Line Archive

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 2        | Service Object No.                     | Subscription Header No.                |
| 5        | Package Code                           | Subscription Package Code              |
| 8        | Service Start Date                     | Subscription Line Start Date           |
| 9        | Service End Date                       | Subscription Line End Date             |
| 16       | Service Amount                         | Amount                                 |
| 21       | Contract No.                           | Subscription Contract No.              |
| (ff) 28  | Service Object Customer No.            | Sub. Header Customer No.               |
| 29       | Contract Line No.                      | Subscription Contract Line No.         |
| 35       | Service Amount (LCY)                   | Amount (LCY)                           |
| 41       | Serial No. (Service Object)            | Serial No. (Sub. Header)               |
| 42       | Quantity Decimal (Service Ob.)         | Quantity (Sub. Header)                 |
| 96       | Variant Code (Service Object)          | Variant Code (Sub. Header)             |

#### Table "Service Comm. Package Line" → "Subscription Package Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 1        | Package Code                           | Subscription Package Code              |
| 12       | Service Comm. Start Formula            | Sub. Line Start Formula                |

#### Table 8016 "Usage Data Subscription" → "Usage Data Supp. Subscription"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 6        | Service Object No.                     | Subscription Header No.                |
| 7        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 21       | Connect to Service Object No.          | Connect to Sub. Header No.             |
| 22       | Connect to SO Method                   | Connect to Sub. Header Method          |
| 23       | Connect to SO at Date                  | Connect to Sub. Header at Date         |

### Only fields renamed

#### Table 8070 "Subscription Billing Cue"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| (ff) 2   | Customer Contract Invoices             | Cust. Sub. Contr. Invoices             |
| (ff) 3   | Customer Contract Credit Memos         | Cust. Sub. Contr. Credit Memos         |
| (ff) 4   | Vendor Contract Invoices               | Vend. Sub. Contr. Invoices             |
| (ff) 5   | Vendor Contract Credit Memos           | Vend. Contr. Credit Memos              |
| (ff) 6   | Serv. Comm. wo Cust. Contract          | Sub. L. wo Cust. Sub. Contract         |
| (ff) 7   | Serv. Comm. wo Vend. Contract          | Sub. L. wo Vend. Sub. Contract         |

#### Table 8061 "Billing Line"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Contract No.                           | Subscription Contract No.              |
| 21       | Contract Line No.                      | Subscription Contract Line No.         |
| 30       | Service Object No.                     | Subscription Header No.                |
| 31       | Service Commitment Entry No.           | Subscription Line Entry No.            |
| (ff) 32  | Service Object Description             | Subscription Description               |
| 33       | Service Commitment Description         | Subscription Line Description          |
| 34       | Service Start Date                     | Subscription Line Start Date           |
| 35       | Service End Date                       | Subscription Line End Date             |
| 39       | Service Obj. Quantity Decimal          | Service Object Quantity                |
| 52       | Service Amount                         | Amount                                 |

#### Table 8064 "Billing Line Archive"

| Field no, | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 20       | Contract No.                           | Subscription Contract No.              |
| 21       | Contract Line No.                      | Subscription Contract Line No.         |
| 30       | Service Object No.                     | Subscription Header No.                |
| 31       | Service Commitment Entry No.           | Subscription Line Entry No.            |
| (ff) 32  | Service Object Description             | Subscription Description               |
| 33       | Service Commitment Description         | Subscription Line Description           |
| 34       | Service Start Date                     | Subscription Line Start Date           |
| 35       | Service End Date                       | Subscription Line End Date             |
| 39       | Service Obj. Quantity Decimal          | Service Object Quantity                |
| 52       | Service Amount                         | Amount                                 |

#### Table 8003 "Price Update Template"

| Field no, | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Contract Filter                        | Subscription Contract Filter           |
| 5        | Service Commitment Filter              | Subscription Line Filter               |
| 6        | Service Object Filter                  | Subscription Filter                    |

#### Table 8017 "Generic Import Settings"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 4        | Create Subscriptions                   | Create Supplier Subscriptions          |

#### Table 8006 "Usage Data Billing"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 5        | Contract No.                           | Subscription Contract No.              |
| 6        | Contract Line No.                      | Subscription Contract Line No.         |
| 7        | Service Object No.                     | Subscription Header No.                |
| (ff) 8   | Service Object Description             | Subscription Description               |
| 9        | Service Commitment Entry No.           | Subscription Line Entry No.            |
| 10       | Service Commitment Description         | Subscription Line Description           |

#### Table 8018 "Usage Data Generic Import"

| Field no. | Original field name                     | New field name                     |
|----------|-----------------------------------------|----------------------------------------|
| 6        | Service Object No.                     | Subscription Header No.                |

#### Only tables renamed

| Original table name                     | New table name                     |
|-----------------------------------------|----------------------------------------|
| Contract Type                           | Subscription Contract Type             |
| Customer Contract                       | Customer Subscription Contract         |
| Vendor Contract                         | Vendor Subscription Contract           |
| Item Serv. Commitment Package           | Item Subscription Package              |
| Item Templ. Serv. Comm. Pack.           | Item Templ. Sub. Package               |
| Service Commitment Template             | Sub. Package Line Template             |
| Service Commitment Package              | Subscription Package                   |
| Usage Data Customer                     | Usage Data Supp. Customer              |


Learn more about this issue in [Breaking schema changes in subscription billing extension](upgrade-considerations-v26.md#breaking-schema-changes-in-subscription-billing-extension).



## Number series creation doesn't work in Business Central 25.2 on-premises

> Applies to: 25.2

### Problem

If you try to create a number series, you get the following error:

`The filter on Series Code was altered by an event subscriber. This is a programming error. Please contact your partner to resolve this issue.`

### Workaround

Upgrade to 25.3 or later.

## Different installation path in 25.2

> Applies to: 25.2

25.2 includes internal database schema changes with the following consequences:

- New platform version 25.2 instead of 25.0.
- Different installation path than 25.0 and 25.1. Instead of using folder '250', components are installed in folder '252', for example: `C:\Program Files\Microsoft Dynamics 365 Business Central\252`.
<!-- - Platform-only upgrade isn't supported. You must do a full platform and application upgrade.-->

Future updates like 25.3 and 25.4 will also use platform number '25.2' and installation folder '252'.

## Installation fails because PowerShell 7 is already installed

> Applies to: Installation of version 24.0 or 24.1

### Problem

When you try to install the [!INCLUDE[server](../developer/includes/server.md)] using the setup.exe program of version 24.1, the installation fails with the following error:

```
Microsoft Dynamics 365 Business Central Build NNNNN
Error Report

Setup Components
The component was rolled back.

PowerShell 7
PowerShell 7 for the commandlets
Fatal error during installation.
```

In the installation log or Windows Event Viewer, you get an error message similar to `A newer version of PowerShell is already installed`.  

## Possible cause

Windows PowerShell 7.4.2 or later is already installed on the [!INCLUDE[server](../developer/includes/server.md)] machine. The Business Central setup.exe will automatically install PowerShell 7.4.2, but it should only do so if the machine doesn't have PowerShell installed or it has a version earlier than 7.4.2. In version 24.1, instead of skipping the PowerShell installation when it should, the setup.exe tries to install PowerShell but fails.

> [!TIP]
> To find out what PowerShell version is running on your machine, open PowerShell and enter the following prompt:
>
> ```powershell
> PWSH.exe
> ```

### Workaround

Uninstall PowerShell 7 from the [!INCLUDE[server](../developer/includes/server.md)] machine, then run setup.exe again.

[Learn how to uninstall an app or program in Windows.](https://support.microsoft.com/en-us/windows/uninstall-or-remove-apps-and-programs-in-windows-4b55f974-2cc6-2d2b-d092-5905080eaf98)

## Error importing control add-in files from the client

> Applies to: Upgrade to version 23.3

### Problem

When you try to import a control add-in file client from the **Control Add-ins** page in the client by using the **Control Add-in Resource** > **Import**, you get the following error:

```
Can't open file`

[URL] can't open files in this folder because it cotains system files`
```

`[URL]` is the URL of your Business Central web client, for example, `http://localhost:8080`.

### Workaround

You have two options to work around this issue:

- Use the Set-NAVAddin cmdlet of the Business Central Administration Shell as described in [Upgrade control add-ins](upgrading-cumulative-update-v23.md#controladdins). 
- If you want to use the Business Central web client, then copy the files to another folder on your PC, like Documents or Downloads, and try again.

## Removed table fields in the Czech (CZ) base application cause sync errors

> Applies to: Upgrade to version 23

### Problem

As part of the delocalization process of the Czech (CZ) version of Business Central, Microsoft moved Czech-specific functionality into separate applications. As a result, the following fields have been removed and the primary keys modified in the Czech (CZ) base application, version 23:

|Table|Field|
|-|-|
|1251 "Text-to-Account Mapping"|11700 "Text-to-Account Mapping (Code[10])|
|1252 "Bank Pmt. Appl. Rule"|11700 "Bank Pmt. Appl. Rule Code" (Code[10])|

These changes can lead to the following errors when you try to synchronize the base application with the tenant during upgrade:

```ps
Sync-NAVApp : Table 1251 Text-to-Account Mapping :: The field 'Text-to-Account Mapping Code' cannot be located. Removing fields is not allowed.
Table 1251 Text-to-Account Mapping :: Changing fields for the key 'Key1' is not allowed. Previous list: 'Text-to-Account Mapping Code', 'Line No.', new List: 'Line No.'.
Table 1252 Bank Pmt. Appl. Rule :: The field 'Bank Pmt. Appl. Rule Code' cannot be located. Removing fields is not allowed.
Table 1252 Bank Pmt. Appl. Rule :: Changing fields for the key 'Key1' is not allowed. Previous list: 'Bank Pmt. Appl. Rule Code', 'Match Confidence', 'Priority', new List: 'Match Confidence', 'Priority'.
```

### Workaround

If you're upgrading from version 22, use the [Sync-NavApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) to synchronize the base application in the ForceSync mode during upgrade, for example: 

```ps
SyncNavApp -ServiceInstance <BC 23 server instance> -Name "Base Application" -Version <23 version number> -Mode ForceSync
```

If you're upgrading from version 21 or earlier, the workaround is slightly different. First, ensure that no duplicate records will exist in either table 1251 "Text to Account Mapping" or table 1252 "Bank Payment Application Rule" after upgrade. <!--the Czech-specific fields have been removed and the primary key modified.--> To do this, complete one of the following tasks before you upgrade to version 23:

- Manually delete any duplicate records in either of the tables, or
- Upgrade to the latest [version 22 that's compatible](upgrade-v14-v15-compatibility.md) with the version 23 you're upgrading to. With version 22, the necessary data modifications to handle duplicate records are included as part of the upgrade procedures.

Once you completed either of these tasks, upgrade to version 23 as usual. Don't forget to synchronize the base application using the ForceSync mode with the Sync-NavApp cmdlet.

<!--[Learn more about this issue]()-->


## Web server components fatal error during installation on Azure virtual machine (VM)

<!-- hhttps://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/445272/-->

> Applies to: Version 20 and 21 

### Problem

When you try to install the [!INCLUDE[webserver](../developer/includes/webserver.md)] components using setup.exe on an Azure VM running Windows Server, the following error occurs:

**Web Server Components**

**Fatal error during installation**

### Possible cause

This error typically occurs on a VM where the [!INCLUDE[webserver](../developer/includes/webserver.md)] hasn't been installed before. It happens because setup is trying to install Windows Server Hosting and Microsoft .NET Core Runtime on the VM but they're already installed, causing a conflict. 

### Workaround

Uninstall Windows Server Hosting and Microsoft .NET Core Runtime from the VM, then run setup.exe again.

## Users can't sign in to the web client after upgrade to 19.0

<!-- https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/413768-->

> Applies to: Upgrade to 19.0

### Problem

If the [!INCLUDE[webserver](../developer/includes/webserver.md)] is configured for Windows authentication, users might not be able to sign in. In the event viewer, you see the following exception:

```
System.PlatformNotSupportedException: Operation is not supported on this platform.
   at System.Func`2.BeginInvoke(T arg, AsyncCallback callback, Object object)
   at Microsoft.Dynamics.Nav.Client.ConnectionEstablisher.TestSpnSettings(ConnectFailedEventArgs connectFailedArgs)
```

### Workaround

Set the `UnknownSpnHint` setting in the navsettings.json file of [!INCLUDE[webserver](../developer/includes/webserver.md)] by following the guidelines at in [Configuring Business Central Web Server instance](../administration/configure-web-server.md#spn).


## <a name="temptables"></a>Tables changed to temporary might prevent synchronizing new base application version

> Applies to: Upgrade from version 17.X or earlier to any later version

### Problem

Starting in version 18, the following base application tables are now temporary tables, as specified by the [TableType property](../developer/properties/devenv-tabletype-property.md). Depending on how you're using these tables, this change may affect the upgrade from version 17 or earlier to a later version.

|Table|File|
|-----|----|
|Table 49 "Invoice Post. Buffer"|InvoicePostBuffer.Table.al|
|Table 265 "Document Entry"| DocumentEntry.Table.al|
|Table 269 "G/L Account Net Change"|GLAccountNetChange.Table.al|
|Table 338 "Entry Summary" |EntrySummary.Table.al|
|Table 491 "Parallel Session Entry"|ParallelSessionEntry.Table.al|
|Table 1670 "Option Lookup Buffer"|OptionLookupBuffer.Table.al |
|Table 1754 "Field Content Buffer"|FieldContentBuffer.Table.al|
|Table 6305 "Power BI Chart Buffer"|PowerBIChartBuffer.Table.al|
|Table 6302 "Power BI Report Buffer"|PowerBIReportBuffer.Table.al|
|Table 7330 "Bin Content Buffer" |BinContentBuffer.Table.al|

### Impact

With this change, these tables must be empty to complete the upgrade. If a table isn't empty, you can't synchronize the new version of the base application. In this case, you get an error stating that the table can't be deleted from the database because it contains data, for example:

`Cannot delete the Document Entry table from the database because it contains data.`

So if there are records in these tables, or the application includes custom code that stores nontemporary records to these tables, you have to make some changes before you can run the upgrade.

### Workaround 

Before you upgrade, either move the records to new tables or delete the records from the tables. Also, rewrite the custom application code that's stores the nontemporary records in these base application tables to use other tables.

## NavUserPassword authentication doesn't work after upgrade to version 18
<!-- https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/398164 -->

> Applies to: Upgrade to 18.0-18.2

### Problem

When you upgrade to version 18 from an earlier major version, authentication that's based on NavUserPassword credential type no longer works for existing users. Passwords aren't considered valid anymore.

### Impact

When users try to sign in to Business Central, they get an error, similar to the following message:

`The specified user name or password is not correct, or you do not have a valid user account in Dynamics 365 Business Central`

In event viewer, you see the following error:

`Your user name <name> or password is incorrect, or you do not have a valid account in Dynamics 365 Business Central.`

### <a name="legacy"></a>Workaround

To work around this issue, activate the `EnableLegacyIterationCount` feature switch by completing these steps.

1. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

   [!INCLUDE[open-admin-shell](../developer/includes/open-admin-shell.md)]

2. Run the following command to determine which feature switches are enabled:

   ```powershell
   Get-NAVServerConfiguration -ServerInstance $ServerInstanceName -KeyName "FeatureSwitchOverrides"
   ```

   Replace`$ServerInstanceName` with the [!INCLUDE[server](../developer/includes/server.md)] instance name.

3. Depending on what was returned in step 2, run one of the following commands to enable the `EnableLegacyIterationCount` feature switch:

   - If the nothing was returned, run the following command:

     ```powershell
     Set-NAVServerConfiguration -ServerInstance $ServerInstanceName -KeyName "FeatureSwitchOverrides" -KeyValue "EnableLegacyIterationCount"
     ```

   - If one or more entries were returned, run the following command:

     ```powershell
     Set-NAVServerConfiguration -ServerInstance $ServerInstanceName -KeyName "FeatureSwitchOverrides" -KeyValue ((Get-NAVServerConfiguration -ServerInstance $ServerInstanceName -KeyName "FeatureSwitchOverrides") + (",EnableLegacyIterationCount"))
     ```

4. Restart the server.

   ```powershell
   Restart-NAVServerInstance -ServerInstance $ServerInstanceName
   ```

### Notes

- Activating the `EnableLegacyIterationCount` feature switch is only required if you have existing users that are set up with passwords for the NavUserPassword authentication. So if you want to set up NavUserPassword from scratch after upgrade, you don't need to enable the `EnableLegacyIterationCount` feature switch for it to work.
- When the `EnableLegacyIterationCount` feature switch is enabled, you can create new users with passwords and assign or change passwords of existing users.
- You can activate and deactivate the `EnableLegacyIterationCount` feature switch for the deployment at any time, but be aware of the following behavior:

  - Passwords that were assigned to users when the `EnableLegacyIterationCount` feature switch was activated, won't work when the `EnableLegacyIterationCount` feature switch is deactivated.
  - Passwords that were assigned to users when the `EnableLegacyIterationCount` feature switch was deactivated, won't work when the `EnableLegacyIterationCount` feature switch is activated.

    In these cases, as an administrator, you'll have to assign new passwords to the affected users.

- This feature switch is activated per server instance, so it pertains to all tenants in a multitenant deployment.

## NavUserPassword authentication performance after upgrade to version 18

> Applies to: Upgrade to 18.X

### Problem

When you upgrade to version 18 from an earlier major version, authentication that's based on the NavUserPassword credential type takes longer than it did in previous versions. This reason is that the password algorithm has been updated in version 18. The extra time it takes per authentication isn't noticeable to a normal user. But in a solution that has a heavy authentication load, for example from multiple and repeated web service calls, the extra time might be significant.

### Workaround

One solution is to activate the `EnableLegacyIterationCount` feature switch, as described in the [previous issue](#legacy). This feature switch sets the server instance to use the same authentication algorithm used in version 17. Another solution is to change the authentication method to either OAuth or Web service access key. With these authentication methods, the password isn't stored in Business Central in a hashed format.

## Data upgrades fail because of missing $system fields in the Permission and Permission Set tables
<!-- https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/400103 -->

> Applies to: Upgrade to 18.0-18.1

### Problem

When you upgrade to version 18 from an earlier major version, and the [!INCLUDE[server](../developer/includes/server.md)] instance is [configured to use permission sets from data](upgrade-permissions.md#continue-using-the-permission-sets-defined-as-data), the data upgrade fails because some system fields aren't added to **Permission** and **Permission Set** tables.

### Impact

When you run the Start-NAVDataUpgrade or Start-NAVAppDataUpgrade against the base application, the cmdlet fails. You'll get an error message that the following columns in the **Permission Set** table are missing or invalid:

- `$systemCreatedAt`
- `$systemCreatedBy`
- `$systemModifiedAt`
- `$systemModifiedBy`

### Workaround

Upgrade to [version 18.2](https://support.microsoft.com/help/5004062) or later.

## Package Microsoft .NET Core Windows Server Hosting failed with error

> Applies to: All versions up to and including version 18.0.

### Problem

When you install [!INCLUDE [prod_short](../includes/prod_short.md)] on premises, installation may fail with the error `Package Microsoft .NET Core Windows Server Hosting failed with error`, or with error code 1638, when the installer attempts to install prerequisite components.  

This problem occurs when a version of Windows Server Hosting newer than version 2.1.14 is installed on the server, because [!INCLUDE [prod_short](../includes/prod_short.md)] installer attempts to install version 2.1.14.  

The issue only occurs when the currently installed version is a newer minor version, not a newer major version of Windows Server Hosting.  

### Impact

Installation will fail and will be rolled back.

### Workaround

The issue can be resolved in different ways:

- Manually install Windows Server Hosting version 3 or later before you install Business Central components.
- Uninstall Windows Server Hosting from your server before you install Business Central
- Use the installer from Business Central version 18.1 or later. In these versions, Business Central installer skips installing Windows Server Hosting components if it determines that newer Windows Server Hosting components are already installed.


<!-- never included 
## <a name="azuregqlmi"></a>Can't convert version 14 and earlier databases on Azure SQL Managed Instance to later Business Central platform

defect 395751 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/395751

> Applies to: 15.0-15.17, 16.0-16.12, 17.0-17.6, 18.0

### Problem

Converting a database from one of these versions requires that your account is a member of the **dbmanager** server role in the master database, and that the database can run in single-user mode. However, Azure SQL Managed Instance doesn't support these prerequisites.

### Impact

You won't be able to successfully convert the database from it's current platform the later version, which prevents you from completing technical and application upgrade scenarios. If you try to convert the database, you'll get an error similar to `Alter Database set Single_User failed`.

### Workaround

We recommend that use the latest update for the target version &mdash; at minimum 15.18, 16.13, 17.7, or 18.1. This issue has been fixed in these versions. Otherwise, you can make a BACPAC of the database and restore it to an on-premise SQL Server. Then, run the conversion against the SQL Server database, and restore BABPAC to Azure SQL Managed Instance.-->

## <a name="keys"></a>Primary key mismatch between converted tables in local 14 versions and Microsoft Base Application
<!--https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/387119 -->

> Applies to: Upgrade from 14.18-14.X to 15.12-15.X, 16.7-16.X, or 17.1-17.X

### Problem

In some local versions, new table objects were added as part of a minor update. In version 14, which is still C/AL based, the primary keys of these tables are unnamed. When you convert the tables from CAL to AL using the txt2AL tool, primary keys are given the name `Key1`. In version 15, 16, and 17, which is fully AL-based, these tables have been moved to Microsoft base application extension, and the primary keys have the name `PK`. This difference can cause problems when you upgrade to use the Microsoft Base Application because it introduces breaking changes.

The affected local versions and tables include:

|Local 14 version|Tables|
|-------------|------|
|CH|<ul><li>QRBill Buffer</li><li>QRBill Billing Detail</li><li>QRBill Billing Info</li><li>QRBill Layout QRBill</li><li>QRBill Setup</li><li>VAT Reg. No. Srv. Template</li><li>VAT Registration Log Details</li></ul>|
|NA|<ul><li>VAT Reg. No. Srv. Template</li><li>VAT Registration Log Details</li></ul>|

> [!NOTE]
> You don't experience this problem with table objects in other Microsoft extensions because the primary keys are named `KEY1`.

### Impact

If you don't resolve this conflict, you'll experience problems when upgrading a customized version 14 (C/AL) application to the Microsoft Base Application.

For example, consider the following articles:

- [Upgrading Customized C/AL Application to Microsoft Base Application Version 16](upgrade-to-microsoft-base-app.md)
- [Upgrading Customized C/AL Application to Microsoft Base Application Version 17](upgrade-to-microsoft-base-app-v17.md)

During this upgrade process, you'll create two versions of an extension referred to as the *table migration* extension. This extension is used for transferring ownership of existing tables in the database to other extensions. The first version contains table objects. The second version contains a migration.json file instead of the table objects. When you try synchronize the second version of the table migration extension ([Task 13.5](upgrade-to-microsoft-base-app.md#syncfinal) or [Task 12.6](upgrade-to-microsoft-base-app-v17.md#syncfinal)), you'll get the following errors for each affected table:

<!--
More specifically, you'll get the following errors when synchronizing the table migration extension. Depending on the upgrade article you're following, the error occurs in either [Task 13.5](upgrade-to-microsoft-base-app.md#syncfinal) or [Task 12.6](upgrade-to-microsoft-base-app-v17.md#syncfinal).
-->

`Table <table name> :: The previous primary key 'Key1' cannot be located. Changing the primary key is not allowed.`

`Table <table name> :: Introducing a new key 'PK' as the primary key is not allowed. Please make the key 'Key1' the primary key again.`

### Workaround

To avoid these errors, after converting the version 14 tables to AL, rename instances of the primary key `Key1 ` to `PK` in the affected table objects before building your extensions.

- If you're following the upgrade articles listed above, do this change as part of Task 2. If you've already published the first table migration extension with the wrong key names, restore the databases and go through the upgrade again, starting from Task 2.
- Also make these changes if you're only doing a technical upgrade. This way, you won't run into problems later if eventually uptake the Microsoft Base Application.

For each affected table object, do the following steps:

1. Open the \.al file.
2. Locate the primary key  definition. For example: 

    ```al
    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }
    ```

3. Change the name from `Key1` to `PK`. For example:

    ```al
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }
    ```

<!-- 

1. Create another version of the table migration extension that contains the table objects.
2. In this version, change the name of the primary keys in the affected tables to `PK`.
3. Build the extension package.
4. Publish the extension version.
5. Synchronize the extension version by using Sync-NAVApp cmdlet with the `-Mode ForceSync` parameter.
6. Synchronize the table migration extension that contains the migration.json.
7. Complete the upgrade.
-->

## <a name="enum"></a>Enum type fields not transferred as part of schema migration between extensions

<!--defect 363940 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/363940, 3666199 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/366199, 376391 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/376391-->

> Applies to: Upgrade to 15.3-15.11 and 16.0-16.4

### Problem

The table migration feature fails to transfer data from a table object to a table extension object that introduces an enumeration.

> [!NOTE]
> The table migration feature was introduced in version 15.3. For more information, see [Migrating Tables and Fields Between Extensions](../developer/devenv-migrate-table-fields.md).

### Impact

You'll experience this issue in the following scenarios:

- Upgrading a customized version 14 solution to version 15 or 16
- Migrating data from one extension to another.

The issue occurs when synchronizing extensions. You get an error similar to one of the following messages:

`Sync-NAVApp : The metadata object Enum <ID> was not found.`

`Message App Sync Exception -- Microsoft.Dynamics.Nav.Types.NavMetadataNotFoundException: The metadata object Enum <ID> was not found.`

### Workaround

- If you're upgrading from version 14, use 15.12 (or later) or 16.5 (or later) as the target version.

- If you're migrating data between extensions, upgrade your solution to 15.12 (or later) or 16.5 (or later).

## $systemModifiedAt fields in tables not populated during upgrade

> Applies to: Upgrade from 14.0-14.X to 17.X

### Problem

[!INCLUDE[prod short](../developer/includes/prod_short.md)] version 17 introduced [data audit](../developer/devenv-table-system-fields.md#audit) fields on tables. When you upgrade from version 15 or 16, the $systemModifiedAt field is populated with values from field **5120 ModifiedOn** in table **5151 Integration Record**. However, this mapping doesn't work in a version 14-to-17 upgrade.  

### Impact

When upgrading from version 14 to version 17, the $systemModifiedAt field will be blank.

### Workaround

Upgrade to version 15 or 16 before upgrading to version 17.

## Wrong .NET assemblies for external connected services

> Applies to: Upgrade to 16.5

### Problem

Version 16.5 includes the wrong .NET 4.5 assemblies for connecting to external services that use OAuth, like Common Data Service.

### Impact

In the [!INCLUDE[prod short](../developer/includes/prod_short.md)] client, you can set up external service connections from the **Service Connections** page. When you try to set up a connection, it fails because [!INCLUDE[prod short](../developer/includes/prod_short.md)] can't obtain an access token for connecting to the service.

In the client, you get an error similar to the following message:

`Failed to acquire authorization token for <service>.`

In the event log, you see an error similar to the following message:

`Could not load file or assembly 'Microsoft.Identity.Client, Version=4.14.0, Culture=neutral, PublicToken=0a613f4dd989e8e' or one of its dependencies. The located assembly's manifest location does not match the assembly reference.`

### Workaround

There are two workarounds for this issue:

1. Upgrade to 16.6 or later.

2. Install the required assemblies:

    1. Go to [https://www.nuget.org/packages/Microsoft.Identity.Client/4.14.0](https://www.nuget.org/packages/Microsoft.Identity.Client/4.14.0).
    2. Under **Info**, select **Download package**.
    3. Extract the contents of the nupkg file to a folder.

        There are different ways to extract the content of nupkg file. An easy way is to change the file extension from *\.nupkg* to *\.zip*. Then, extract the files like you would do with any .zip file.

    4. Copy the files in the **\lib\net45** folder to the **Service** folder of the [!INCLUDE[server](../developer/includes/server.md)] installation. Replace the existing files when prompted.

        The default folder is C:\Program Files\Microsoft Dynamics 365 Business Central\160\Service.
    5. Restart the [!INCLUDE[server](../developer/includes/server.md)] instance.

## Help Server for India preview missing files

> Applies to: Upgrade to 17.X

### Problem

The installation media (DVD) is missing required HTML files for the Help Server.

### Impact

The Help Server installation fails.

### Workaround

Install Help Server without the HTML files for local functionality, then pick up the content from GitHub instead.

## [!INCLUDE[admintool](../developer/includes/admintool.md)] doesn't work for multitenant server instances

<!--Defect 377645 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/377645 -->

> Applies to: Upgrade to 17.0-17.1

If a [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant instance, you can't manage the tenants by using the [!INCLUDE[admintool](../developer/includes/admintool.md)].

### Impact

When you try to use the **Tenant** node in the [!INCLUDE[admintool](../developer/includes/admintool.md)], you get a message: The MMC has detected an error in the snap-in and will unload it. This message is followed by:

`FX:{ba484c42-ed9a-0170-925f-23e64e686fd0}`

`Value cannot be null.`
`Parameter name: objectToValidate at Microsoft.ManagementConsole.BaseCollection.OnValidate(Object objectToValidate, Boolean testForDuplicate) at System.Collections.CollectionBase.System.Collections.IList.Add(Object value)    at CallSite.Target(Closure , CallSite , NodeSubItemDisplayNameCollection , Object )    at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.RefreshWithNodeStateChangedCheck(IList1 tenants, ResultNodeCollection currentResultNodes)    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.RefreshCore()    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.OnInitialize(AsyncStatus status)    at Microsoft.ManagementConsole.View.ProcessRequest(Request request)    at Microsoft.ManagementConsole.ViewMessageClient.ProcessRequest(Request request)    at Microsoft.ManagementConsole.Internal.IMessageClient.ProcessRequest(Request request)    at Microsoft.ManagementConsole.Executive.RequestStatus.BeginRequest(IMessageClient messageClient, RequestInfo requestInfo)    at Microsoft.ManagementConsole.Executive.SnapInRequestOperation.ProcessRequest()    at Microsoft.ManagementConsole.Executive.Operation.OnThreadTransfer(SimpleOperationCallback callback)`

### Workaround

Use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. This error is fixed in later updates.


## Sync-NAVApp error: Parameter @objname is ambiguous or the claimed @objtype (INDEX) is wrong

<!--https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/374610-->

> Applies to: Upgrade from 14.X 

### Problem

You get the following error when running Sync-NAVApp cmdlet on the base application:

```powershell
Sync-NAVApp : The following SQL error was unexpected:

Either the parameter @objname is ambiguous or the claimed @objtype (INDEX) is wrong.

Either the parameter @objname is ambiguous or the claimed @objtype (INDEX) is wrong.

Caution: Changing any part of an object name could break scripts and stored procedures.
```

### Workaround

This occurs when a key fails to get renamed. To fix the problem, identify the key that fails to get renamed, for example, by using the event log or SQL profiler. Then, disable the key by using [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)].

## Business Central Server instance fails to start after changing a port number directly in the CustomSettings.config file

> Applies to: Upgrade to 21.x

### Problem

You get errors in the Event Log similar to the following errors when trying to start the [!INCLUDE[server](../developer/includes/server.md)] instance after changing a port number directly in it's CustomSettings.config file:

- Message (HttpSysException): Failed to start service with CLR type Microsoft.Dynamics.Nav.Service.AspNetCore.AspNetCoreApiHost, API type ClientApi and address http://gc1662:8085/BC210/client.
- Failed to start service with CLR type Microsoft.Dynamics.Nav.Service.AspNetCore.AspNetCoreApiHost, API type ClientApi and address
- The service MicrosoftDynamicsNavServer$BC210 failed to start. This could be caused by a configuration error. Detailed error information: Microsoft.AspNetCore.Server.HttpSys.HttpSysException (0x80004005): Access is denied
- Type: Microsoft.AspNetCore.Server.HttpSys.HttpSysException; Message: Access is denied

### Impact

After upgrading to version 21.x, you notice that the [!INCLUDE[admintool](../developer/includes/admintool.md)] is no longer available, because it has been removed in version 21.x. If you then try to update certain port numbers (for example, ClientServicesPort ) directly in the server instance's CustomSettings.config file, you may get the errors described above when you try to start the server instance.

### Workaround

Avoid updating the CustomSetting.config file directly. Instead, use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] with the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration). This will automatically grant the required Namespace Reservation permissions for the relevant port.

Alternatively, you could grant the required Namespace Reservation permissions manually for the relevant port by running the appropriate NETSH command in an administrator command prompt on the [!INCLUDE[server](../developer/includes/server.md)] machine, for example:

```
netsh http add urlacl url=http://+:<PORT NUMBER>/<BC SERVICE NAME>/ user="<BC SERVICE ACCOUNT>"
```

## Related information

[Upgrading to Business Central](upgrading-to-business-central.md)  
