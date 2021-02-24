---
title: Authorization Trace | Microsoft Docs
description: Learn about the Authorization telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---

# Analyzing Authorization Trace Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Authorization telemetry provides information about the authorization of users when they try to sign in to Business Central. This telemetry data can help you identify problems a user might experience when signing in. 

Authorization signals are emitted in two stages of sign-in. The first stage is the initial authorization, before the CompanyOpen trigger is run. In this stage, the system verifies that the user account is enabled in the tenant and has the correct entitlements. The telemetry data includes:

- Success or failure of the sign-in attempt
- Reason for failure
- Type of user (such as normal, administrator, or delegated user)
- Whether the user belongs to the tenant or is an invited user

The next stage occurs after a successful authorization attempt, when trying to open the company (that is, when the CompanyOpen trigger run). The telemetry data indicates whether the company opened successfully or failed (for some reason).

> [!NOTE]
> Business Central 2020 release wave 1, version 16.1, introduces changes to some `operation_Name` and `message` dimension values. The differences from earlier versions are indicated in the following sections.

## Authorization Succeeded (Pre Open Company)

Occurs when a user has been successfully authorized.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|Version 16.1 and later:<br />**Authorization Succeeded (Pre Open Company)**<br /><br />Before Version 16.1:<br />**Authorization steps prior to the open company trigger succeeded.**|
|operation_Name|**Authorization Succeeded (Pre Open Company)** <br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|authorizationStatus|**Succeeded**|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|entitlementSetIds |Specifies the entitlements that the user has in Business Central.|
|eventId|**RT0003**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user belongs to the tenant.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|userType|Specifies whether the user is a **Delegated_admin**, **Internal_Admin**, or  **Normal user**. See [UserType](#usertype).|

### <a name="usertype"></a> UserType

|Value|Description|See more|
|-----|-----------|--------|
|Delegated_admin|Indicates that the user is a delegated administrator on the tenant. Delegated administrators are typically reserved for partners. Delegated administrator privileges are granted to users by the customer. You grant these privileges by setting up a Partner Relationship in the Microsoft Partner Center.|[Delegated Administrator Access to Business Central Online](delegated-admin.md)<br /><br />[Customers delegate administration privileges to partners](/partner-center/customers_revoke_admin_privileges#delegated-admin-privileges-in-azure-ad)|
|Internal_Admin|Indicates that the user is an internal administrator on the tenant. As an internal administrator, the user is assigned the **Global admin** role in the Microsoft 365 admin center.|[Administration as an internal administrator in Business Central](tenant-administration.md#administration-as-an-internal-administrator)<br /><br />[Assign admin roles in Microsoft 365 admin center](/office365/admin/add-users/assign-admin-roles)|
|Normal user|Indicates that the user is a normal user in the tenant, based on the license.|[Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions)|

<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.2","telemetrySchemaVersion":"0.2","authorizationStatus":"Succeeded","Component version":"15.0.40073.41395","Environment type":"Production","componentVersion":"15.0.40073.41395","Environment name":"Production","environmentType":"Production","environmentName":"Production","deprecatedKeys":", AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","aadTenantId":"36093cb7-8b61-47a2-8f12-078ce1cbbf8b","AadTenantId":"36093cb7-8b61-47a2-8f12-078ce1cbbf8b","component":"Dynamics 365 Business Central Server","entitlementSetIds":"INTERNAL_ADMIN,DYN365_FINANCIALS_BUSINESS","guestUser":"False","userType":"INTERNAL_ADMIN"}

-->

> [!NOTE]
> The client type is not known when the server emits the pre-open company events (RT0001 and RT0003). You need to join to data for the events RT0002/RT0004 if you need both userType and clientType.

## Authorization Failed (Pre Open Company)

Occurs when a user sign-in has failed authorization.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|Version 16.1 and later (depending on the cause):<ul><li>**Authorization Failed (Pre Open Company): User is disabled.**</li><li>**Authorization Failed (Pre Open Company): User has no entitlements.**</li></ul>Before Version 16.1:<br />**Authorization steps prior to the open company trigger failed, see failureReason column for details.**|
|operation_Name|**Authorization Failed (Pre Open Company)**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|severityLevel|**3**|

<!--
|operation_Name|**Authorization Failed (Pre Open Company)**||

{"aadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","AadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","Component version":"15.0.40494.0","guestUser":"False","Telemetry schema version":"0.2","failureReason":"The user was successfully authenticated in Azure Active Directory but the user account is disabled in Business Central.","authorizationStatus":"Failed","component":"Dynamics 365 Business Central Server","environmentType":"Production","telemetrySchemaVersion":"0.2","Environment type":"Production","Component":"Dynamics 365 Business Central Server","Environment name":"Production","environmentName":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Component, Telemetry schema version","componentVersion":"15.0.40494.0"}

{"Telemetry schema version":"0.2","telemetrySchemaVersion":"0.2","authorizationStatus":"Failed","Component version":"15.0.40494.0","Environment name":"Production","componentVersion":"15.0.40494.0","Environment type":"Production","environmentName":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Component, Telemetry schema version","AadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","aadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","guestUser":"False","failureReason":"The user was successfully authenticated in Azure Active Directory but the user account is disabled in Business Central."}
-->

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|authorizationStatus|**Failed**|
|failureReason|Specifies why the sign-in failed. See [Troubleshooting failures](#authorizationfailures) section for details.|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user belongs to the tenant.|
|eventId|**RT0001**|
|userType|Specifies whether the user is a **Delegated_admin**, **Internal_Admin**, or  **Normal user**. See [UserType](#usertype).|

<!--
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|

|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod short](../developer/includes/prod_short.md)] telemetry schema. |
-->

### <a name="authorizationfailures"></a> Troubleshooting failures

#### The user was successfully authenticated in Azure Active Directory but the user account is disabled in Business Central.

This message occurs when the user's account is valid, but the account is disabled. If you open the user account in Business Central, you'll see the **State** field is set to **Disabled**.

*Resolution*

Enable the user account by setting the **State** field to **Enabled**. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions).

#### A user successfully authenticated in Azure Active Directory but the user does not have any entitlements in Business Central.

This message occurs if the user has an account, but the account hasn't been assigned any entitlements. 

Entitlements are part of the license. Entitlements are permissions that describe which objects in Business Central a user can use, according to their Azure Active Directory role or license. For an explanation of entitlements, see [Business Central entitlements explained](https://cloudblogs.microsoft.com/dynamics365/it/2019/07/18/business-central-entitlements/)

*Resolution*

Entitlements are assigned to the user account in the Microsoft 365 admin center or Microsoft Partner Center. They aren't assigned in Business Central. To assign entitlements to a user, see one of the following articles:

- From [Microsoft 365 admin center](https://admin.microsoft.com), see [Add users individually or in bulk to Microsoft 365](/microsoft-365/admin/add-users/add-users).

- From the Microsoft Partner Center, see [User management tasks for customer accounts](/partner-center/assign-licenses-to-users).

## Authorization Succeeded (Open Company)

Occurs when the company has opened successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|-----------|
|message|Version 16.1 and later:<br />**Authorization Succeeded (Open Company)**<br /><br />Before version 16.1:<br />**Authorization steps in the open company trigger succeeded.**|
|operation_Name|**Authorization Succeeded (Open Company)**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|severityLevel|**1**|

<!--
|operation_Name|**Authorization Succeeded (Open Company)**||

{"Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:00.1210560","authorizationStatus":"Success","Component version":"15.0.40494.0","componentVersion":"15.0.40494.0","Environment type":"Production","Environment name":"Production","environmentType":"Production","environmentName":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, AadTenantId, Environment name, Environment type, Component, Telemetry schema version","aadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","companyName":"CRONUS USA, Inc.","sqlRowsRead":"52","sqlExecutes":"23","AadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","clientType":"WebClient","component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.1210560","Component":"Dynamics 365 Business Central Server","result":"Success"}-->

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|authorizationStatus|**Success**|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|clientType|Specifies the type of client that opened the session, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0004**|
|result|**Success**|
|serverExecutionTime|Specifies the amount of time it took the server to open the company**. The time has the format hh:mm:ss.sssssss.<br /><br />Doesn't apply to the **Cancellation report generation** trace. |
|sqlExecutes|Specifies the number of SQL statements that the report executed**. <br /><br />Doesn't apply to the **Cancellation report generation** trace.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements**.<br /><br />Doesn't apply to the **Cancellation report generation** trace.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took to open the company**. The time has the format hh:mm:ss.sssssss.<br /><br />Doesn't apply to the **Cancellation report generation** trace.|

** From telemetrySchemaVersion **0.6** and onwards, this value also includes the CompanyOpen operation.
<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:07.6884757","Component version":"16.0.11208.0","Environment type":"Production","componentVersion":"16.0.11208.0","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","AadTenantId":"common","aadTenantId":"common","companyName":"CRONUS International Ltd.","clientType":"Background","authorizationStatus":"Success","totalTime":"00:00:07.6884757","component":"Dynamics 365 Business Central Server","result":"Success","sqlExecutes":"6","sqlRowsRead":"5"}
-->

## Authorization Failed (Open Company)

Occurs when a company has failed to open.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|Version 16.1 and later (depending on the cause):<ul><li>**Authorization Failed (Open Company): Invalid company name.**</li><li>**Authorization Failed (Open Company): User has no permission to company.**</li><li>**Authorization Failed (Open Company): The tenant is locked.**</li><li>**Authorization Failed (Open Company): The license has expired or the trial period has ended.**</li><li>**Authorization Failed (Open Company): The user's license is not valid for use on production companies.**</li></ul>Before version 16.1:<br />**Authorization steps in the open company trigger failed, see failureReason column for details.**|
|operation_Name|**Authorization Failed (Open Company)**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|severityLevel|**3**|

<!--
{"Telemetry schema version":"0.2","environmentName":"Production","Component version":"15.0.40494.0","AadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","aadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","status":"Failed","clientType":"WebClient","telemetrySchemaVersion":"0.2","companyName":"jsco","componentVersion":"15.0.40494.0","deprecatedKeys":"AadTenantId, Environment name, Environment type, Component, Telemetry schema version","Environment name":"Production","failureReason":"The user does not have permission to access the company.","component":"Dynamics 365 Business Central Server","environmentType":"Production","Environment type":"Production","Component":"Dynamics 365 Business Central Server"}

{"telemetrySchemaVersion":"0.2","componentVersion":"15.0.40494.0","environmentName":"Production","environmentType":"Production","Telemetry schema version":"0.2","aadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","Component version":"15.0.40494.0","component":"Dynamics 365 Business Central Server","Environment name":"Production","Environment type":"Production","companyName":"jsco","deprecatedKeys":"AadTenantId, Environment name, Environment type, Component, Telemetry schema version","AadTenantId":"8ca62103-8877-486d-88e2-9a91303abfc6","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","failureReason":"The user does not have permission to access the company.","status":"Failed"}

-->

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|authorizationStatus|**Failed**|
|companyName|Specifies the name of the company that the user tried to open.|
|failureReason|Specifies why the sign-in failed. See [Troubleshooting failures](#opencompanyfailures) section for details.|
|eventId|**RT0002**|


### <a name="opencompanyfailures"></a>Troubleshooting failures

#### The company name is not valid, because the name is either empty or exceeds the maximum allowed length.

This message occurs when a user tries to sign in to a company whose name exceeds the maximum allowed length.

*Resolution*

This message typically occurs when a user tries to access a specific company in Business Center by entering a URL in the browser address, for example, `https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.`. If the name exceeds 30 characters, then this message occurs. Make sure that the user has the proper name of the company.

#### The user does not have permission to access the company.

This message occurs when a user account in Business Central doesn't have the proper permissions to the company.

*Resolution*

In Business Central, open the user account and modify the permissions the user to give them access to the company. For more information, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

> [!TIP]
> A good starting point is to look at the **Effective Permissions** that the user has on the company. You can do this from the user card by selecting **Effective Permissions** and setting the **Company** to the company in question.

#### The company doesn't exist.

This message occurs when a user tries to sign in to a company, but the company isn't found in Business Central.

*Resolution*

This message typically occurs when a user tries to access a specific company in Business Center by entering a URL in the browser address, for example, `https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.`. Make sure that the user has the proper name of the company.

#### User cannot open the company because the tenant is locked.

This message indicates that the tenant has been locked by Microsoft, typically for security reasons like preventing repeated malicious sign-in attempts. The tenant isn't accessible by any user.

*Resolution*

For help with resolving this issue, read the following articles or contact Microsoft Support: 

- [Troubleshoot account lockout problems with an Azure AD Domain Services managed domain](/azure/active-directory-domain-services/troubleshoot-account-lockout)

- ["It looks like your account has been blocked" error when signing in to Microsoft 365](/office365/troubleshoot/access-management/account-blocked-error-when-sign-in)

#### The user can't sign in to the company because the assigned license has expired or the trial period has ended.

This message occurs for one the following reasons:

- The license being used has expired.
- The license was trial license and the trial period has ended. Trial licenses are typically assigned when customers subscribe for an evaluation version by using self-service sign-up (also known as IW or viral sign-up). This license has a time limit.

*Resolution*

Renew the existing license or obtain a new license. Licenses are purchased through the Cloud Solution Provider (CSP)
program. For more information, see the [Cloud Service Provider site](https://partner.microsoft.com/cloud-solution-provider) and the [Microsoft Dynamics 365 Business Central Licensing Guide](https://download.microsoft.com/download/D/A/4/DA497449-9805-42DC-91F5-A857295C233D/Dynamics%20365%20Business%20Central%20Licensing%20Guide%20Oct%202019.pdf).

#### You can't open the company, because it is a production company. Your license isn't valid for use on production companies.

This message occurs because the license doesn't allow the user to open production companies. For example, the user may be using a trial license that is only valid on the evaluation version.

*Resolution*

Obtain a license that can be used on production companies. Licenses are purchased through the Cloud Solution Provider (CSP)
program. For more information, see the [Cloud Service Provider site](https://partner.microsoft.com/cloud-solution-provider) and the [Microsoft Dynamics 365 Business Central Licensing Guide](https://download.microsoft.com/download/D/A/4/DA497449-9805-42DC-91F5-A857295C233D/Dynamics%20365%20Business%20Central%20Licensing%20Guide%20Oct%202019.pdf).

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
