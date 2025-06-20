---
title: Data Encryption at Rest, Transparent Data Encryption, and BitLocker
description: Learn how to secure your data at rest using TDE and BitLocker on Business Central. Protect your SQL Server and Azure SQL Database files.
ms.date: 06/20/2025
ms.topic: article
ms.author: kepontop
author: jswymer
ms.reviewer: jswymer
---

# Data Encryption at Rest

When thinking about data encryption, you should mainly consider three scenarios:

- Encrypt your data at rest, which means encrypting it while it's stored on whatever file storage you use.
- Encrypt your data in transit, which means encrypting data while it travels through private or public network communication channels.
- Encrypt your data in use, which means encrypting it while it's actively used in RAM or CPU caches and registers.

This article shows you the alternatives for encrypting data at rest. Suppose someone steal the physical media, like drives or backup tapes, or the database files. A malicious party can restore or attach the database and browse the data if you don't encrypt it. The following mechanisms give you different possibilities to help prevent this outcome.

> [!IMPORTANT]
> Data encryption at rest doesn't provide encryption across communication channels. For more information about how to encrypt data across the communication channel between the database and the [!INCLUDE[server](../developer/includes/server.md)], see [Enhancing Business Server Security](enhancing-server-instance-security.md). It also doesn't provide encryption while the data is in use. SQL Server offers the [Always Encrypted](/sql/relational-databases/security/encryption/always-encrypted-database-engine?view=sqlallproducts-allversions) feature, but [!INCLUDE[prod_short](../developer/includes/prod_short.md)] doesn't support it.

## Transparent Data Encryption (TDE)

You can use Transparent Data Encryption (TDE) to encrypt SQL Server and Azure SQL Database data files at rest. With TDE you can encrypt the sensitive data in the database and protect the keys that are used to encrypt the data with a certificate. TDE performs real-time I/O encryption and decryption of the data and log files to protect data at rest. TDE can help the ability to comply with many laws, regulations, and guidelines established in various industries. If a malicious party is able to steal your data files, they still can't use them at all because they need the keys.

> [!CAUTION]
> Backup files of databases that have TDE enabled are also encrypted by using the database encryption key. As a result, when you restore these backups, the certificate protecting the database encryption key must be available. This means that in addition to backing up the database, you must make sure that you also maintain backups of the server certificates to prevent data loss. Data loss results if the certificate is no longer available.

For more information about TDE, see [Transparent Data Encryption (TDE)](/sql/relational-databases/security/encryption/transparent-data-encryption).

## BitLocker Drive Encryption

BitLocker is a volume encryption feature included in Windows Server. It protects at the file volume level so when the database server is online, the volume is unlocked, though not decrypted. If a malicious party is able to steal your whole drive, they still can't attach and use it.

> [!CAUTION]
> Detaching or backing up a database to a different volume that isn't protected by BitLocker causes any protection the file currently has to be lost.


Learn more in [BitLocker overview](/windows/security/information-protection/bitlocker/bitlocker-overview) and how it applies to Windows Server in[Install BitLocker on Windows Server](/windows/security/information-protection/bitlocker/bitlocker-how-to-deploy-on-windows-server).

## Defense in depth with BitLocker Drive Encryption and Transparent Data Encryption (TDE) combined

BitLocker encrypts the entire drive and is integrated in the OS. The effect is that a user process, like SQL Server, running on the machine can access data on the drive as if it weren't encrypted at all. But if the drive gets stolen, nobody can use the data without access to the key.

On the other hand, if someone gets access to the drive through a network share or another service that shares data from the drive, they can copy data, unless the running SQL Server process locks the file. The copy on the new drive isn't encrypted.

With TDE alone, the database files themselves backup files of the TDE-encrypted databases are encrypted. Therefore, if either file is copied or stolen via a network, as in the previous example, the attacker can't read it. But if the attacker gains access to the whole drive, including SQL Server, they can start SQL Server and read the data using SQL, because SQL Server is doing the decryption for them. Now if both BitLocker and TDE are used concurrently, both data theft vectors are mitigated.
Both technologies complement each other, and it's recommended that you use BitLocker together with TDE for defense in depth.

## Performance impact

TDE has an estimated performance impact around 3-5% and can be lower if most of the data accessed is stored in memory. The main impact is on the CPU; impact on I/O is smaller impact. Learn more in [Encrypting file system](/previous-versions/sql/sql-server-2008/cc278098(v=sql.100)#_Toc189384687).

BitLocker Drive Encryption has a single-digit percentage performance impact as explained in [BitLocker FAQ](/windows/security/information-protection/bitlocker/bitlocker-deployment-and-administration-faq#is-there-a-noticeable-performance-impact-when-bitlocker-is-enabled-on-a-computer).

## Related information

[Classifying Data](../developer/devenv-classifying-data.md)  
[Data Security](data-security.md)  
[Enhancing Business Server Security](enhancing-server-instance-security.md)  
[Deploy a Business Central Database to Azure SQL Database](../deployment/deploy-database-azure-sql-database.md)  
[Security and Protection](security-and-protection.md)  
