---
title: "Transparent Data Encryption (TDE)"
ms.custom: na
ms.date: 26/04/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: kepontop
---
# Transparent Data Encryption (TDE)

You can use Transparent Data Encryption (TDE) to encrypt SQL Server and Azure SQL Database data files at rest. In a scenario where the physical media (such as drives or backup tapes) are stolen, a malicious party can just restore or attach the database and browse the data. With TDE you can encrypt the sensitive data in the database and protect the keys that are used to encrypt the data with a certificate. TDE performs real-time I/O encryption and decryption of the data and log files to protect data at rest. TDE can assist in the ability to comply with many laws, regulations, and guidelines established in various industries. 

> [!IMPORTANT]
> TDE does not provide encryption across communication channels. For more information about how to encrypt data across the communication channel between the database and the [!INCLUDE[server](../developer/includes/server.md)], see [Enhancing Microsoft Dynamics NAV Server Security](Enhancing-Microsoft-Dynamics-NAV-Server-Security.md).

> [!CAUTION]
> Backup files of databases that have TDE enabled are also encrypted by using the database encryption key. As a result, when you restore these backups, the certificate protecting the database encryption key must be available. This means that in addition to backing up the database, you must make sure that you also maintain backups of the server certificates to prevent data loss. Data loss will result if the certificate is no longer available.

For more information about TDE, see [Transparent Data Encryption (TDE)](https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/transparent-data-encryption).

## See Also  
 [Classifying Data](../developer/devenv-classifying-data.md)   
 [Data Security](data-security.md)  
 [Enhancing Microsoft Dynamics NAV Server Security](Enhancing-Microsoft-Dynamics-NAV-Server-Security.md)   
 [Deploy a Business Central Database to Azure SQL Database](../deployment/deploy-database-azure-sql-database.md)  
[Security and Protection](security-and-protection.md)  