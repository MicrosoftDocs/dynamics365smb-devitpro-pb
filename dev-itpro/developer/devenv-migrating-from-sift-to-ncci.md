---
title: "Migrating from SIFT to Nonclustered Columnstore Indexes (NCCIs)"
description: Explains how you can change from using SIFT keys to nonclustered columnstore indexes in Business Central tables.
ms.custom: na
ms.date: 01/28/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Migrating from SIFT to Nonclustered Columnstore Indexes

The nonclustered columnstore index (NCCI) is envisioned to be the successor of SumIndexField Technology \(SIFT\). This article provides examples of how to replace one or more SIFT keys on a table with a nonclustered columnstore index.

## Why migrating from SIFT Keys to NCCIs

When data is inserted, updated, or deleted in a table, the SIFT keys for that table are maintained. Maintaining these SIFT indexes has performance overhead. The size of the performance overhead depends on the number of keys and SumIndexFields that have been defined for each table. So give careful consideration to the number of SIFT keys that you define. And only maintain the SIFT keys that are important for your application.  
  
With an NCCI, only one index structure exists and needs to be maintained. So there's no need to consider which query scenarios should be indexed. 

## Example

This example illustrates how to replace SIFT indexes on a table with an NCCI.  

The following code creates a table with two SIFT keys defined on it. The **Student** table is a simple model of students with counts of ECTS points and how many courses they've passed.

```AL
table 50100 Student
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(2; Code; Text[50])
        {
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(3; FirstNames; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; ECTSPoints; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; NumberOfCourses; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    // Here are the SIFT keys that the developer added to the table:
    keys
    {
        // Defines the primary key
        key(PK; ID)
        {
            Clustered = true;
        }
        // Defines a SIFT index on Code with aggregations fields for count and SUM(ECTSPoints)
        key(SIFTKeyOnCode; Code)
        {
            SumIndexFields = ECTSPoints;
            MaintainSqlIndex = false;
        }
        // Defines a SIFT index on FirstNames with aggregations fields for count and SUM(NumberOfCourses)
        key(SIFTKeyOnNames; FirstNames)
        {
            SumIndexFields = NumberOfCourses;
            MaintainSqlIndex = false;
        }
    }
}
```

To replace SIFT keys with an NCCI, just add all fields to the definition of the NCCI and remove the SIFT keys:

```AL
table 50100 Student
{
    DataClassification = CustomerContent;
    // Defines NCCI to replace the SIFT keys
    ColumnStoreIndex = Code,FirstNames,ECTSPoints,NumberOfCourses;

    fields
    {
        field(1; Code; Text[50])
        {
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(2; FirstNames; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; ECTSPoints; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(4; NumberOfCourses; Integer)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        // Defines the primary key
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
```

## See Also

[SumIndexField Technology \(SIFT\)](devenv-sift-technology.md)  
[SIFT and SQL Server](devenv-sift-and-sql-server.md)  
[SIFT Tuning and Tracing](devenv-sift-tuning-and-tracing.md)  
[SIFT Performance](devenv-sift-performance.md)  
[NCCI and SQL Server](devenv-ncci-and-sql-server.md)  
[NCCI Tuning and Tracing](devenv-ncci-tuning-and-tracing.md)  
[NCCI Performance](devenv-ncci-performance.md)  