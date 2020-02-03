---
title: Authorization Trace | Microsoft Docs
description: Learn about the Authorization telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/15/2019
ms.author: jswymer
---

# Analyzing Authorization Telemetry

Authorization telemetry provides information about the authorization of users when they try to sign in to Business Central. This telemetry data can help you identify problems a user might experience when signing in. Authorization signals are emitted in two stages of sign-in.

The first stage is the initial authorization, where the user account is verified that it is enabled in the tenant and that it has the correct entitlements. The telemetry data includes:

- Success or failure of the sign-in attempt
- Reason for failure
- Type of user (such as normal, administrator, or delegated user)
- Whether the user belongs to the tenant or is an invited user

The next stage occurs after a successful authorization attempt, when trying to open the company (that is, when the CompanyOpen trigger run). The telemetry data will indicating whether the company was opened successfully or failed (with a reason).

## Operation: Success Authorization (Pre Open Company)

Occurs when a user has been successfully authorized.

### General dimensions

The following tables explains the dimensions included in a **Success Authorization** signal.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Authorization steps prior to the open company trigger succeeded.**||
|severityLevel|**1**||

<!--
|operation_Name|**Success Authorization (Pre Open Company)**||-->

### Custom dimensions

The following tables explains the custom dimensions included in a **Success Authorization** signal.

|Dimension|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Succeeded**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds |Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. Currently, the version is **0.2** ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||

## Operation: Failed Authorization (Pre Open Company)

Occurs when a user sign-in in has failed authorization.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Authorization steps prior to the open company trigger failed, see failureReason column for details.**||
|severityLevel|**1**||

<!--
|operation_Name|**Authorization Failed (Pre Open Company)**||-->

### Custom dimensions

|Dimension|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Failed**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds|Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||
|Failure reason|Specifies why the sign-in failed. See [Troubleshooting failures](#authorizationfailures) section for details.||

### <a name="authorizationfailures"></a> Troubleshooting failures

**The user was successfully authenticated in Azure Active Directory but the user account is disabled in Business Central.**

This occurs when the user has a valid account in Business Central, but the account is disabled. If you open the user account in Business Central, you will see that the **State** field is set to **Disabled**.

*Resolution*

Enable the user account by setting the **State** field to **Enabled**. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions)

**A user successfully authenticated in Azure Active Directory but the user does not have any entitlements in Business Central.**

This occurs when the user has an account in Business Central, but the account has not been assigned any entitlements. 

Entitlements are part of the license. Entitlements are permissions that describe which objects in Business Central a user is entitled to use, according to their Azure Active Directory role or the license they purchased from Microsoft.

*Resolution*

Entitlements are assigned to the user account in the Microsoft 365 Admin Center or Microsoft Partner Center; they are not assigned in Business Central. To assign entitlements to a user, see one of the following:

- From [Microsoft 365 Admin Center](https://admin.microsoft.com), see [Add users individually or in bulk to Office 365](https://aka.ms/CreateOffice365Users).

- From the Microsoft Partner Center ([User management tasks for customer accounts](https://docs.microsoft.com/partner-center/assign-licenses-to-users)).

## Operation: Authorization Succeeded (Open Company)

Occurs when the company has opened successfully.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Authorization steps in the open company trigger succeeded.**||
|severityLevel|**2**||

<!--
|operation_Name|**Authorization Succeeded (Open Company)**||-->

### Custom dimensions

|Dimension|Description or value||
|---------|-----|-----------|
|companyName|||
|status|**Succeeded**|

## Operation: Authorization Failed (Open Company)

Occurs when a company has failed to open.  

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Authorization steps in the open company trigger failed, see failureReason column for details.**||
|severityLevel|**2**||

<!--
|operation_Name|**Authorization Failed (Pre Open Company)**||-->

### Custom dimensions

|Dimension|Description or value||
|---------|-----|-----------|
|companyName|||
|status|**Failed**|
|failureReason|Specifies why the sign-in failed. See [Troubleshooting failures](#opencompanyfailures) section for details.||

### <a name="opencompanyfailures"></a>Troubleshooting failures

##### The company name is not valid, because the name is either empty or exceeds the maximum allowed length.

This occurs when a user tries to sign-in to a company whose name exceeds the maximum allowed length.

*Resolution*

This typically occurs when a user tries to access a specific company in Business Center by entering a URL in the browser address, for example, `https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.`. If the name exceeds 30 characters, then this message occurs. Make sure that the user has the proper name of the company.

<!--
###### The product license permits working with companies that have names that start with ‘<text>’ only.

This occurs when a user tries to open a company whose name does not start with the text that is required by the license.

*Resolution*
-->
###### The user does not have permission to access the company.

This occurs when a user account in Business Central does not have the proper permissions to the company.

*Resolution*

In Business Central, open the user account and modify the permissions the user to give them access to the company. For more information, see [Assign Permissions to Users and Groups](dynamics365/business-central/ui-define-granular-permissions).

> [!TIP]
> A good starting point is to look at the **Effective Permissions** that the user has on the company. You can do this from the user card by selecting **Effective Permissions** and setting the **Company** to the company in question.

###### The company doesn't exist.

This occurs when a user tries to sign in to a company, but the company is not found in Business Central.

*Resolution*

This typically occurs when a user tries to access a specific company in Business Center by entering a URL in the browser address, for example, `https://businesscentral.dynamics.com/?company=CRONUS%20International%20Ltd.`. Make sure that the user has the proper name of the company.


<!--
###### The product license permits a maximum of {0} non-demonstration companies.

*Resolution*
-->
<!--
###### The user opened a company that does not have any applicable entitlement sets. This will result in permission errors.

*Resolution*
-->
<!--

Which environment can the user(s) not sign into? e.g. sandbox/prod/all? 
When was the last successful login for the user(s)? Can the user(s) login now or is this an on-going issue? 
Has the user done a successful login before the issue? 
Can the user(s) sign into other services like Office or CRM? 
What role(s)/type(s) do these users have? e.g. Internal Admin, Delegated Admin, Normal, Device user? 
Which company does the user try to access, has the user access it before? 
Was "Refresh All User Groups" run recently by a SUPER user in BC? 
Are valid licenses assigned to the user(s), if applicable? What type of license was assigned (e.g. premium, essential, paid, trial etc.)? 

For delegated admins: 
Is the admin added to the tenant? (delegate admins are no listed as a user in the tenant user page in Azure) 
Verify the partnership is valid (in the customer tenant) 
Open portal.office.com and go to the admin page.  
Click “Partner relationships”, then click the partner name.  
In the properties of the partner the property “Partner Relationship” should include “Admin” 
Verify the user (delegated admin) is an Admin or Helpdesk agent in the partner tenant.  
Open the Partner center  
Go to users and verify the type of the user to be an Admin or Helpdesk agent under the property “Assist your customers as”. 
For device users, were they setup correctly? See Analyze device user login issues. 
Are the users "enabled" in the BC users page? (information available in the Cloud Manager)  
Are the users marked expired? Were users recently exported/imported via Excel?  
Was the user assigned the correct permissions from the users page? 
Were there any changes to the user recently? Like, permissions/licenses/roles change? Or maybe user was disabled/enabled? 
Permissions are assigned via the Users page in Business Central. 
Licenses are either assigned via the Office or Azure portal by the tenant admin. 
Roles are assigned via the Partner Center. 
The user can be enabled/disabled from the Users page in Business Central. 

>
## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
