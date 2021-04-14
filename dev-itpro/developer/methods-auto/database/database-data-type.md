---
title: "Database Data Type"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database Data Type
> **Version**: _Available or changed with runtime version 1.0._

Provides access to common database functionality.


The following methods are available on the Database data type.


|Method name|Description|
|-----------|-----------|
|[ChangeUserPassword(String, String)](database-changeuserpassword-method.md)|Changes the password for the current user.|
|[CheckLicenseFile(Integer)](database-checklicensefile-method.md)|Checks a key in the license file of the system.|
|[Commit()](database-commit-method.md)|Ends the current write transaction.|
|[CompanyName()](database-companyname-method.md)|Gets the current company name.|
|[CopyCompany(String, String)](database-copycompany-method.md)|Creates a new company and copies all data from an existing company in the same database.|
|[CurrentTransactionType([TransactionType])](database-currenttransactiontype-method.md)|Gets the current transaction type and sets a new type to be assigned.|
|[DataFileInformation(Boolean, var Text, var Text, var Boolean, var Boolean, var Boolean, var Text, var DateTime, var Record)](database-datafileinformation-method.md)|Specifies data from a file that has been exported from a database.|
|[ExportData(Boolean, var Text [, String] [, Boolean] [, Boolean] [, Boolean] [, Record])](database-exportdata-method.md)|Exports data from the database to a file. The data is not deleted from the database.|
|[GetDefaultTableConnection(TableConnectionType)](database-getdefaulttableconnection-method.md)|Gets the default table connection based on the specified connection type. You must already have registered a table connection of this type.|
|[HasTableConnection(TableConnectionType, String)](database-hastableconnection-method.md)|Verifies if a connection to an external database exists based on the specified name.|
|[ImportData(Boolean, var Text [, Boolean] [, Boolean] [, Record])](database-importdata-method.md)|Imports data from a file that has been exported from a database.|
|[LockTimeout([Boolean])](database-locktimeout-method.md)|Determines whether the lock time-out setting is set to On. You can also use this method to override the default setting.|
|[RegisterTableConnection(TableConnectionType, String, String)](database-registertableconnection-method.md)|Registers a table connection to an external database.|
|[SelectLatestVersion()](database-selectlatestversion-method.md)|Forces the latest version of the database to be used.|
|[SerialNumber()](database-serialnumber-method.md)|Gets a string that contains the serial number of the license file for your system.|
|[ServiceInstanceId()](database-serviceinstanceid-method.md)|Gets the ID of the service instance.|
|[SessionId()](database-sessionid-method.md)|Gets the ID of the current session.|
|[SetDefaultTableConnection(TableConnectionType, String [, Boolean])](database-setdefaulttableconnection-method.md)|Establishes a connection to an external database based on a previously registered connection of the specified type.|
|[SetUserPassword(Guid, String)](database-setuserpassword-method.md)|Sets a password for the user iwith the given user security ID. If the given password is blank, an empty string will be stored instead of a password hash. This will prevent the user from logging in using a password. Only SUPER can call this method. Passwords cannot be set for the empty GUID or for the default Super ID.|
|[SID([String])](database-sid-method.md)|Retrieves the security identifier (SID) of a Windows user account.|
|[TenantId()](database-tenantid-method.md)|Gets the ID of the tenant that has started the current session. Use this method when your code must be specific about which tenant database to access in a multitenant deployment. For example, if your code imports data into a cache, you can make a cache tenant-specific by using the tenant ID as a key. Also, if you want to write code that saves documents, you can include the tenant ID in the file name or location, for example. In those cases, you can use the TENANTID method in combination with the COMPANYNAME method to identify the company and the tenant database.|
|[UnregisterTableConnection(TableConnectionType, String)](database-unregistertableconnection-method.md)|Unregisters a table connection to an external database.|
|[UserId()](database-userid-method.md)|Gets the user name of the user account that is logged on to the current session.|
|[UserSecurityId()](database-usersecurityid-method.md)|Gets the unique identifier of the user that is logged on to the current session.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  