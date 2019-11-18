---
author: SusanneWindfeldPedersen
title: "How to: Write Extension Upgrade Code"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f76ac1a0-9529-4c87-bad2-b468f3f95506
ms.prod: "dynamics-nav-2018"
ms.author: solsen
---
# How to: Write Extension Upgrade Code
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

The process of upgrading an extension includes uninstalling the current version of the extension and then installing a new version. If the extension modifies the schema of an existing table, or adds new tables, upgrade code will be required to handle the data that was automatically archived from the tables during uninstall.
For more information about upgrading extensions, see [Upgrading Extensions](extensions-upgrading.md).  

## To write upgrade code for an extension
1.  Create new codeunit.  

    > [!IMPORTANT]  
    >  This must be a codeunit of type **Normal**, not an **Upgrade** codeunit. For more information, see [SubType Property](SubType-Property--Codeunit-.md).  

2.	Add upgrade functions to the codeunit. Make sure the function is declared as global so that the **Local** property is set to **No**.  
    1. Add the *OnNavAppUpgradePerDatabase()* function if the extension contains cross-company tables.   
    2. Add the *OnNavAppUpgradePerCompany()* function if the extension contains per-company tables.

3.  Add the upgrade code to the appropriate function.  

    The upgrade code will depend on what you want to do with the archived data, plus additional factors such as the version of the archive data, whether the schema has changed, and whether the data can be modified by users. Determine which of the following upgrade methods is required for each new or modified table in your extension. For more information, see the next sections.  

### Restore Table Data
If the table has the same schema as the archive data and doesn’t require any special upgrade logic, then use the [RESTOREARCHIVEDATA](restorearchivedata-function.md) system function to copy the archived data to the table. The data that is copied may be for new tables added as part of the extension or for fields added to existing base tables.  

The following code example restores the archived data for tables 50000 and 50001 on a company basis.  

```  
PROCEDURE OnNavAppUpgradePerCompany@1();  
BEGIN  
  NAVAPP.RESTOREARCHIVEDATA(50000);  
  NAVAPP.RESTOREARCHIVEDATA(50001);  
END;  
```  

### Delete Table Data
If you do not want to restore the archived data to the table, then use the [DELETEARCHIVEDATA](deletearchivedata-function.md) system function to delete the archived data.  

The following code deletes the archived data for table 50002 on a company basis.

```  
PROCEDURE OnNavAppUpgradePerCompany@1();  
BEGIN  
  NAVAPP.DELETEARCHIVEDATA(50002);  
END;  
```  

### Upgrade Table Data
If the archived data is from a previous version and requires special upgrade logic, then use custom code to upgrade the records retrieved from the archive tables. For this scenario, you will use the following system functions:  

-   [GETARCHIVEVERSION Function](GETARCHIVEVERSION-Function.md)  

    Returns the extension version of archived data.  

-   [GETARCHIVERECORDREF Function](GETARCHIVERECORDREF-Function.md)  

    Returns a RecordRef for the identified table.  

-   [RESTOREARCHIVEDATA Function](restorearchivedata-function.md)  

    Restores the archived data to the database.

The following code upgrades records that are retrieves from the archived table for table 50003. The upgrade code that is run depends on the extension version number of the archived data.  

```  
VAR
  ArchiveRecRef@1000 : RecordRef;  
  FldRef@1001 : FieldRef;  
  DestRec@1002 : Record;  
  Version@1003 : Text[20];  
PROCEDURE OnNavAppUpgradePerCompany@1();  
BEGIN  
  Version := NAVAPP.GETARCHIVEVERSION();  
  IF Version < '2.0.0.0' THEN BEGIN  
    // The Version 1 to Version 2 upgrade code block. Copy over relevant old fields and initialize new fields using archive data.  
    IF NAVAPP.GETARCHIVERECORDREF(50003, ArchiveRecRef) THEN BEGIN  
      IF ArchiveRecRef.FINDSET(FALSE) THEN BEGIN  
        DestRec.INIT;  
        REPEAT  
          FldRef := ArchiveRecRef.FIELD(50000);  
          DestRec.Key := FldRef.VALUE;  
          FldRef := ArchiveRecRef.FIELD(50001);  
          DestRec.V1Field := FldRef.VALUE;  
          DestRec.V2Field := 'NEW FIELD DEFAULT VALUE';  
          DestRec.INSERT;  
        UNTIL ArchiveRecRef.NEXT = 0;  
      END  
    END  
  END  
  ELSE BEGIN  
    // This is the reinstall (version 2 to version 2) block.  
    // Because the schema is the same for all minor versions of the version 2 product,  
    // you can copy the data in without changes.  
    NAVAPP.RESTOREARCHIVEDATA(50003);  
  END  
END;  
```  

> [!NOTE]  
>  The preceding sample code uses a strongly typed instance of the record for the destination. The other option is to use a RecordRef for both the source and destination. The sample code also assumes that any version 2 build of the extension uses the same table schema. If this is not true for your extension, you may have to use more specific version checks.  

> [!TIP]  
>  It is a best practice to use the `IF NAVAPP.GETARCHIVERECORDREF(50003, ArchiveRecRef) THEN BEGIN` construct to catch any exception that is thrown, for example, if a non-valid table was passed.  

### Load Default or Starting Table Data

If the table should always be populated with starting or default data that was included in the package, then use the `NAVAPP.LOADPACKAGEDATA(TableNo)` function to import the starting data to the table. If starting data is imported, then any archived data for the table will be deleted and not restored.

The following code example shows how to populate table 50004 with data.
```
PROCEDURE OnNavAppUpgradePerDatabase@1();
    BEGIN
        NAVAPP.LOADPACKAGEDATA(50004);
    END;
```

### Conditional Restore or Load Starting Table Data
In some situations, you may want to conditionally use different options. For example, say that if archive data exists for a new extension table, you want to restore that data. But if archive data doesn’t exist, you want to import starting data from the package. In this scenario you will want to check for the existence of an archive table using the NAVAPP.GETARCHIVERECORDREF(TableNo) function and if a RecordRef is returned then restore or upgrade the table. If a record isn’t returned, then use the function to import the starting data for the table.

Sample Code:
```
PROCEDURE OnNavAppUpgradePerDatabase@1();
    // Variables:
    // ArchiveRecRef 	RecordRef		
    BEGIN
      IF NAVAPP.GETARCHIVERECORDREF(50001, ArchiveRecRef) THEN
            NAVAPP.RESTOREARCHIVEDATA(50001)
        ELSE
                  NAVAPP.LOADPACKAGEDATA(50001);
    END;
```

## See Also  
[Getting Started](developer/devenv-get-started.md)  
<!--
[Extending Microsoft Dynamics NAV Using Extension Packages](Extending-Microsoft-Dynamics-NAV-Using-Extension-Packages.md)  
[Upgrading Extensions](extensions-upgrading.md)  
[GETARCHIVEVERSION Function](GETARCHIVEVERSION-Function.md)  
[GETARCHIVERECORDREF Function](GETARCHIVERECORDREF-Function.md)  
[RESTOREARCHIVEDATA Function](restorearchivedata-function.md)  
[DELETEARCHIVEDATA Function](deletearchivedata-function.md)  
[How to: Develop an Extension](How-to--Develop-an-Extension.md)  
[How to: Create an Extension Package](How-to--Create-an-Extension-Package.md)  
[Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)  
[Development Cmdlets for Microsoft Dynamics NAV](https://go.microsoft.com/fwlink/?LinkID=510540)  
[Development](development.md)  
-->