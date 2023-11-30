---
title: Change the way data is replicated to Business Central online
description: Learn how to use the replication properties to include or exclude specific tables from cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.collection: 
ms.date: 11/17/2023
ms.custom: bap-template 
---

# Change how data is replicated to Business Central online

In this article, you learn how to use the **Change how the data is replicated** feature to:

- Include or exclude the specific tables from cloud migration. 
- Specify whether to replace the full table with the data from the on-premises table or to update and insert only the missing records.


## Considerations before you start

This is an expert feature. Using this functionality can lead to incorrectly replicated data or losing access to the tenant. The defaults were defined after careful consideration. Make sure that you fully understand the application functionality that you want to change, so that you include or exclude all related tables. 

We strongly advise that you don't modify **Permissions** related tables, because **Permissions** from on-premises and online aren't compatible. We recommend setting up the permissions again by using the online permission sets. Replicating permissions can lead to losing access or to some application features not working properly. If you lose access, delete and create the environment again or use point-in-time restore to the point before replication.

## Prerequisite


## Change how data is replicated 

1. Search for and open the **Cloud Migration Management** page
2. Select **More Options** > **Actions ** > **Change how the data is replicated**.
3. On the page you can change the way the data is replicated
 
  |Field|Description|
  |-|-|
  |Include in migration|The table is replicated to the online tenant 
  |Exclude from migration|The table isn't replicated to the online tenant, which means that no data will be copied. Action can be used on multiple records.|
  |Preserve data action||
  |||

Include in migration will make sure that the table is replicated to SaaS, Exclude from migration means that no data will be copied. Action can be used on multiple records. 
Preserve data action will keep the data in the database, if the value is set to false then it will delete the SaaS table before making the initial replication from SaaS. Action can be used on the multiple records
Reset to default will reset all changes for the selected records to their initial values. 
Show history can show you the history of changes done with the timestamps so you can see when the change to the properties was made
Table name field will allow you to filter to the tables that contain a part of the value typed, so it is easy to find the related tables
Company name can set the filter for the selected company

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
