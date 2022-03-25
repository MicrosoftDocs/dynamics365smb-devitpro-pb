---
title: "Cloud Migration API Overview"
description: 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
ms.author: solsen
---

# Cloud Migration APIs Overview (v1.0)

[!INCLUDE[2022_releasewave1](../../includes/2022_releasewave1.md)]

Cloud Migration APIs provide capability for automating the cloud migration process end-to-end by using APIs. You will be able to complete the setup, move the data, and track the progress, trigger upgrade if needed and switch off the cloud migration.

The main endpoint for the API is:
`https://api.businesscentral.dynamics.com/v2.0/79dbd222-0f30-42a6-9f25-3164d21b269a/Production/api/microsoft/cloudMigration/v1.0/companies`

## Set up cloud migration

To create the set up you can issue a `POST` request, if it is a first setup, otherwise use a `PATCH` request. Issue the request against the following endpoint:

```json
POST https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/setupCloudMigration
Authorization: Bearer {token}
Content-type: application/json

Body:
{ 
   "productId":"{ProductID}",
   "sqlServerType":"{SqlServerType}",
   "sqlConnectionString":"{SqlConnectionString}"
}

```

In the JSON example above, `productId` can be one of following values:  
 
- DynamicsBCLast – use for cloud migration with upgrade
- DynamicsBC – use for cloud migration from the same version of [!INCLUDE[prod_short](../../developer/includes/prod_short.md)]
- DynamicsGP – use if you are setting up a Dynamics GP cloud migration

In the JSON example above, `sqlServerType` can be one of the following values:  

- SQLServer – Use if you are migrating from the database that is hosted on the On-Prem SQL server
- AzureSQL – If you have uploaded the database to migrate to Azure SQL server

And the `SqlConnectionString` must be the SQL connection string to the database you want to migrate

The above request will return a payload like:

```json
{ 
    "id":"{SetupRecordId}",
   "productId":"{ProductID}",
   "sqlServerType":"{SqlServerType}",
   "sqlConnectionString":"{SqlConnectionString}"
   "runtimeName":"{RuntimeName}",
   "runtimeKey":"{RuntimeKey}"
}
```

If you are migrating from Azure SQL you can skip next step:

If you are migrating from SQLServer, you should take the `runtimeKey` value and install and connect Microsoft Integration Runtime by using this key. Then you need to issue a `PATCH` request such as the following:

```JSON
PATCH  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/setupCloudMigration({SetupRecordId})
Authorization: Bearer {token}
Content-type: application/json
If-Match: etag
Body:
{ 
   "productId":"{ProductID}",
   "sqlServerType":"{SqlServerType}",
   "sqlConnectionString":"{SqlConnectionString}",
    "runtimeName":"{RuntimeName}"
}
```

To complete the setup for both SQL and Azure SQL hosted databases invoke:

```json
POST https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/setupCloudMigration({SetupRecordId})/ Microsoft.NAV.completeSetup

```

## Cloud migration - create companies

To create on-prem companies you can get the list first by issuing a request like this:

```json
GET https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationCompanies 
Authorization: Bearer {token}

The response will be like this for each of the companies:
  {
      "id": "{CompanyId}",
      "name": "{CompanyName}",
      "replicate": false,
      "displayName": "{DislpayName}",
      "estimatedSize":{SizeOfComapny},
      "status": "",
      "created": false
    }
```

To include the company into the cloud migration you should issue following request:

```json
PATCH  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationCompanies ({CompanyId})
Authorization: Bearer {token}
Content-type: application/json
If-Match: etag
 {
      "replicate": true
}

```

To exclude the company, issue the same request with a false value.

Once the companies are marked for replication you can create them by running the following request:

```json
POST  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationCompanies({AnyCompanyId}) /Microsoft.NAV.createCompaniesMarkedForReplication

Authorization: Bearer {token}
```

`DELETE` and `POST` are not allowed against this API; it is not possible to create or delete entities on this API.

## Cloud migration status

To manage cloud migration or to track the status this API should be used:

```json
GET https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationStatus
Authorization: Bearer {token}
```

It will return the following payload:

```json
{  
      "id": "679c8aa5-16a9-ec11-80f1-002248334988",
      "runId": "79090ce4-404d-4274-829a-a3b18e99006c",
      "startTime": "2022-03-21T12:57:17Z",
      "endTime": "2022-03-21T12:58:48.35Z",
      "replicationType": "Normal",
      "status": "Completed",
      "source": "Dynamics 365 Business Central earlier versions",
      "details": "Cloud migration setup completed.",
      "tablesSuccessful": 0,
      "tablesFailed": 0,
      "tablesRemaining": 0
}
```

To start the replication find the cloudMigrationStatus with last endTime and invoke the following command:

```json
POST  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationStatus ({LastStatusId}) /Microsoft.NAV.runReplication
Authorization: Bearer {token}

```

To refresh the status do the following request:

```json
POST  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationStatus ({LastStatusId}) /Microsoft.NAV.refreshStatus
Authorization: Bearer {token}

```

To trigger the data upgrade do the following request:

```json
POST  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationStatus ({LastStatusId}) /Microsoft.NAV.runDataUpgrade
Authorization: Bearer {token}
```

To disable the replication as the last step do the following request:

```json
POST  https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/cloudMigrationStatus ({LastStatusId}) /Microsoft.NAV.disableReplication
Authorization: Bearer {token}

```

## See also
