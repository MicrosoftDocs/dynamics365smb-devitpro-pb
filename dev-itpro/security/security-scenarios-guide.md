---
title: Security Scenarios Guide by Persona
description: Practical security scenarios and best practices for partners, administrators, auditors, and developers working with Dynamics 365 Business Central.
author: jswymer
ms.topic: how-to
ms.date: 11/20/2025
ms.author: jswymer
ms.reviewer: solsen
---

# Security Guide: How to Secure Business Central

This guide provides scenario-based security recommendations organized by persona. Each best practice includes context, solution, guidance, benefits, and trade-offs to help you make informed security decisions.

## Partner Scenarios

### Ensure consultants don't have persistent access to all customers you manage

**Context and problem:**  
Partners managing multiple customers through GDAP (Granular Delegated Admin Privileges) face a security risk when consultants have persistent, always-on administrative access to customer environments. A compromised consultant account could lead to unauthorized access across all customers. Compliance requirements and customer trust demand minimizing standing privileges.

**Solution:**  
Implement time-bound privileged access using Microsoft Entra ID Privileged Identity Management (PIM) combined with granular delegated admin privileges (GDAP) group-based access control.

Learn more in [Microsoft Entra Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-configure) and [Granular delegated admin privileges](/partner-center/gdap-introduction).

**Guidance:**

1. Set up GDAP with groups:
   1. In your partner's Microsoft Entra ID tenant, create one security group per customer you have a GDAP relationship with (for example, `GDAP-CustomerA-Admins`, `GDAP-CustomerB-Admins`). Learn more in [Manage Microsoft Entra groups and group membership](/entra/fundamentals/how-to-manage-groups).

      Don't directly assign consultants to these groups permanently.
   1. Establish the GDAP relationship with each customer, linking the relevant security group to the appropriate Microsoft Entra roles. Learn more in [Manage Microsoft Entra groups and group membership](/entra/fundamentals/how-to-manage-groups).

1. Configure PIM for time-bound access:

   1. Enable Microsoft Entra ID Privileged Identity Management (requires Microsoft Entra ID P2 or Microsoft Entra ID Governance license). Learn more in [Start using Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-getting-started).
   1. Make the GDAP customer groups eligible for activation in PIM rather than permanently assigned. Learn more in [Assign eligibility for a group in Privileged Identity Management](/entra/id-governance/privileged-identity-management/groups-assign-member-owner). 
   1. Configure activation requirements (for example, justification, approval workflow, maximum duration).
   1. Set appropriate activation duration limits (for example, 4-8 hours).

**Consultant workflow:**
Here's the workflow for consultants when PIM is configured:

- When a consultant needs to work on a specific customer, they request activation of the relevant customer group in PIM.
- They provide business justification (for example, ticket number, task description).
- Access is granted for the specified time window only.
- Access automatically expires after the configured duration.

**Benefits:**

- Reduced attack surface: Compromised credentials have limited blast radius and time window
- Audit trail: Complete logging of who accessed what customer, when, and why
- Compliance: Meets regulatory requirements for just-in-time access and least privilege
- Customer trust: Demonstrates commitment to security best practices
- Competitive advantage: Can be marketed as a security differentiator

**Trade-offs:**

- Licensing cost: Requires Microsoft Entra ID P2 or Governance licenses
- Initial setup complexity: Requires configuring PIM and GDAP groups for each customer
- User friction: Consultants must request access before working, adding 1-5 minutes overhead
- Administrative overhead: Might require approval workflows and monitoring

### Secure API access for automation tools you build for customers

**Context and problem:**  
Partners often build automation tools, integrations, or monitoring solutions that need to call [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs across multiple customer tenants. Using personal admin accounts or long-lived secrets creates security risks and operational fragility.

**Solution:**  
Use managed identities with Federated Identity Credentials (FIC) when running in Azure, or implement secure credential management for non-Azure scenarios.

Learn more in [Business Central Administration Center API](../administration/administration-center-api.md), [Automation APIs](../administration/itpro-introduction-to-automation-apis.md), and [What are managed identities for Azure resources?](/entra/identity/managed-identities-azure-resources/overview).

**Guidance:**

**If running in Azure (recommended):**

1. Deploy your automation as an Azure resource (Function App, Logic App, or Azure Container Instance). Learn more in [Azure Functions](/azure/azure-functions/functions-overview), [Azure Logic Apps](/azure/logic-apps/logic-apps-overview), or [Azure Container Instances](/azure/container-instances/container-instances-overview).
1. Enable system-assigned or user-assigned managed identity on the Azure resource. Learn more in [How to manage user-assigned managed identities](/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities).
1. Register an app in your partner's Microsoft Entra ID. Learn more in [Register an application with the Microsoft identity platform](/entra/identity-platform/quickstart-register-app).
1. Configure Federated Identity Credential on the app registration, linking it to the Azure resource's managed identity. Learn more in [Configure an application to trust a managed identity](/entra/workload-id/workload-identity-federation-config-app-trust-managed-identity) and [Workload identity federation](/entra/workload-id/workload-identity-federation).
1. Authorize the app in customer tenants via GDAP or direct app authorization. Learn more in [Manage Access to Environments](../administration/tenant-admin-center-manage-access.md).

Your code acquires tokens automatically using the managed identity—no secrets to manage. Learn more in [Access token request with a federated credential](/entra/identity-platform/v2-oauth2-client-creds-grant-flow#third-case-access-token-request-with-a-federated-credential).

**If not running in Azure:**

1. Create a dedicated app registration per integration/tool. Learn more in [Register an application with the Microsoft identity platform](/entra/identity-platform/quickstart-register-app).
1. Use certificate-based authentication instead of client secrets. Learn more in [Microsoft identity platform application authentication certificate credentials](/entra/identity-platform/certificate-credentials).
1. Store certificates securely in Azure Key Vault or hardware security modules. Learn more in [About Azure Key Vault certificates](/azure/key-vault/certificates/about-certificates).
1. Implement certificate rotation procedures (every 12 months minimum). Learn more in [Automate the rotation of a secret for resources that have two sets of authentication credentials](/azure/key-vault/secrets/tutorial-rotation-dual).

   Use separate credentials per customer environment when possible.
1. Monitor API usage through telemetry. Learn more in [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md).

**Benefits:**

- No credential theft risk (managed identity scenario)
- Automated credential rotation (Azure handles it)
- Fine-grained access control per customer
- Complete audit trail of API calls
- Compliance with zero-trust principles

**Trade-offs:**

- Azure dependency for optimal security (managed identities)
- Complexity in multitenant scenarios
- Learning curve for FIC and managed identity concepts
- Cost of Azure resources (minimal—Function Apps can run on consumption plan)

## Administrator Scenarios

### Restrict network access to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from external services

**Context and problem:**  
Your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment (AppSource apps or per-tenant extensions) calls external services (APIs, Azure Storage, databases). You want to ensure only legitimate traffic from your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment reaches these services, blocking potential unauthorized access or data exfiltration attempts from other sources.

**Solution:**  
Use Azure service tags and network access controls to create allow lists based on [!INCLUDE[prod_short](../developer/includes/prod_short.md)]'s IP ranges.

Learn more in [Use Azure security service tags](security-service-tags.md) and [Azure service tags overview](/azure/virtual-network/service-tags-overview).

**Guidance:**

**Scenario A: Destination service supports service tags natively**  
(Azure SQL Database, Azure Key Vault, Azure Cosmos DB, and so on.)

1. Navigate to your Azure resource's networking settings.
1. Configure firewall rules or network access controls.
1. Add a rule allowing traffic from the `Dynamics365BusinessCentral` service tag.
1. Remove any overly permissive rules (for example, "Allow all Azure services").

**Scenario B: Destination is Azure Storage Account**  
(Special case due to internal routing)

1. Create an Azure Function as a proxy in the same region as [!INCLUDE[prod_short](../developer/includes/prod_short.md)].
1. Restrict Azure Function access using service tag-based access restriction: allow `Dynamics365BusinessCentral`.
1. Create a private endpoint or virtual network integration from Azure Function to Storage Account.
1. Configure your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extension to call the Azure Function instead of Storage directly.
1. Azure Function proxies requests to Storage Account.

<a id="C"></a>**Scenario C: Destination supports IP allowlisting only**  
(On-premises systems, non-Microsoft SaaS, custom APIs)

1. Retrieve current [!INCLUDE[prod_short](../developer/includes/prod_short.md)] IP ranges:

   ```powershell
   $serviceTags = Get-AzNetworkServiceTag -Location eastus2
   $bcTag = $serviceTags.Values | Where-Object { $_.Name -eq "Dynamics365BusinessCentral" }
   $bcTag.Properties.AddressPrefixes
   ```

1. Configure firewall/network rules on destination to allow these IP ranges.
1. Monitor the `ChangeNumber` property and update rules when Microsoft updates the ranges.
1. Consider automating updates using Azure Automation or scheduled scripts.

**Benefits:**

- Prevents unauthorized access from non-[!INCLUDE[prod_short](../developer/includes/prod_short.md)] sources
- Reduces attack surface significantly
- Compliance with network segmentation requirements
- Visibility into allowed traffic patterns

**Trade-offs:**

- No per-environment granularity: Service tag includes all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments globally
- Maintenance overhead: IP ranges change over time (though infrequently)
- Proxy complexity: Storage Account scenario requires extra Azure Function
- Regional limitations: Must be in supported Azure regions for some scenarios

### Monitor and respond to suspicious sign-in attempts

**Context and problem:**
Attackers might attempt credential stuffing, password spraying, or brute-force attacks against your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] users. Integration accounts might use incorrect credentials. You need visibility into authentication failures to detect threats early and respond appropriately.

**Solution:**  
Implement comprehensive monitoring of authentication events using Microsoft Entra sign-in logs and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry.

Learn more in [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md) and [Sign-in logs in Microsoft Entra ID](/entra/identity/monitoring-health/concept-sign-ins).

**Guidance:**

1. Set up Microsoft Entra ID sign-in logging:
   1. In [Microsoft Entra admin center](https://entra.microsodt.com), open the Sign-in Logs. Learn more in [View logs through the Microsoft Entra admin center](/entra/identity/monitoring-health/howto-access-activity-logs#view-logs-through-the-microsoft-entra-admin-center).
   1. Configure diagnostic settings to route logs to:

      - [Azure Monitor Log Analytics workspace](/azure/azure-monitor/logs/log-analytics-workspace-overview) (recommended for querying)
      - [Azure Storage](/azure/storage/common/storage-account-overview) (for long-term retention)
      - [Azure Event Hubs](/azure/event-hubs/event-hubs-about) (for Security Information and Event Management (SIEM) integration)
      - Retention: Set to at least 90 days for security investigations

        Learn more in [Configure diagnostic settings](/entra/identity/monitoring-health/howto-configure-diagnostic-settings).

1. Create alert rules for suspicious patterns:

   - Multiple failed sign-ins: Alert when user has >5 failures in 10 minutes
   - Impossible travel: Alert when sign-ins occur from geographically distant locations within short timeframes
   - Unfamiliar locations: Alert when sign-ins come from countries/regions where you don't operate
   - Disabled accounts: Alert on any authentication attempt to disabled accounts

   Learn more in [Create alert rules](/azure/azure-monitor/alerts/alerts-create-new-alert-rule).

   Sample KQL query for Log Analytics:

   ```kusto
   SigninLogs
   | where AppDisplayName contains "[!INCLUDE[prod_short](../developer/includes/prod_short.md)]"
   | where ResultType != 0  // Failed sign-ins
   | summarize FailureCount=count() by UserPrincipalName, IPAddress, bin(TimeGenerated, 10m)
   | where FailureCount > 5
   ```

1. Monitor [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry:

   1. Enable [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry to Azure Application Insights. Learn more in [Turn environment telemetry on or off](../administration/telemetry-enable-application-insights.md).
   1. Monitor authorization failures and permission errors and API authentication failures for service accounts Learn more in [Authorization trace telemetry](../administration/telemetry-authorization-trace.md) [Permission errors trace telemetry](../administration/telemetry-permission-error-trace.md), and [Web Services telemetry](../administration/telemetry-webservices-trace.md).

1. Establish response procedures:

   - Investigate high-priority alerts within 1 hour
   - For confirmed attacks: Reset credentials, enable Conditional Access if not already active
   - For integration failures: Check service principal certificates/secrets expiration
   - Document incidents for trend analysis

**Benefits:**

- Early threat detection before damage occurs
- Forensic capability for security incidents
- Operational insights (for example, expiring integration credentials)
- Compliance evidence for audit requirements
- Reduced MTTR (mean time to respond)

**Trade-offs:**

- Alert fatigue: Too many alerts can desensitize teams
- Cost: Log Analytics charges based on data ingestion and retention
- Expertise required: Creating effective KQL queries requires learning curve
- False positives: Legitimate scenarios (for example, VPN users) might trigger alerts

### Enforce multifactor authentication for all users

**Context and problem:**
Password-only authentication is vulnerable to phishing, credential theft, and account takeover. Regulatory requirements and security best practices mandate multifactor authentication (MFA), but enabling it requires balancing security with user experience.

**Solution:**  
Implement Microsoft Entra Conditional Access policies to require MFA for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] access with modern authentication methods.

Learn more in [Setting up Multifactor Authentication for Business Central](multifactor-authentication.md), [Conditional Access overview](/entra/identity/conditional-access/overview), and [Authentication and Credential Types](../administration/users-credential-types.md).

**Guidance:**

1. Assess current authentication methods:
   - Review authentication methods report in Microsoft Entra ID.
   - Identify users still using SMS/voice call (less secure).
   - Plan migration to Microsoft Authenticator app or FIDO2 security keys.

1. Configure Conditional Access policy:

   1. In [Microsoft Entra admin center](https://entra.microsoft.com), navigate to **Protection** > **Conditional Access**.
   1. Create new policy. Learn more in [Create a Conditional Access policy](/entra/identity/conditional-access/how-to-policy-mfa-admin-portals).
   1. Set assignments:

      - **Users:** Include "All users" or specific [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user groups
      - **Target Resources:** Select "Dynamics 365 [!INCLUDE[prod_short](../developer/includes/prod_short.md)]". Learn more [Conditional Access: Target resources](/entra/identity/conditional-access/concept-conditional-access-cloud-apps)
      - **Access controls:** Grant access, but require multifactor authentication
      - **Session controls:** Consider sign-in frequency (for example, require reauth every seven days)

1. Enable modern authentication methods:
   - In [Microsoft Entra admin center](https://entra.microsoft.com), select **Authentication methods** > **Policies**. Learn more in [Authentication methods in Microsoft Entra ID](/entra/identity/authentication/concept-authentication-methods).
   - Enable **Microsoft Authenticator** (push notifications and passwordless)
   - Enable **Passkey (FIDO2)**
   - Enable **Temporary Access Pass** for new user onboarding
   - Disable less secure methods (SMS, voice) after transition period

   Learn more in [Manage authentication methods for Microsoft Entra ID](/entra/identity/authentication/concept-authentication-methods-manage).
1. Plan rollout:
   - Phase 1 (report-only mode): Monitor impact without enforcing.
   - Phase 2 (pilot group): Enable for IT and early adopters.
   - Phase 3 (broad deployment): Roll out to all users with communication plan.
   - Provide user training and help desk preparation.

1. Handle service accounts:
   - Use certificate-based authentication for automated processes. Learn more in [Certificate credentials](/entra/identity-platform/certificate-credentials).
   - Never exempt service accounts from security policies.
   - Consider managed identities for Azure-hosted integrations. Learn more in [What are managed identities for Azure resources?](/entra/identity/managed-identities-azure-resources/overview).

**Benefits:**

- Reduction in account compromise risk
- Compliance with regulations
- User trust in platform security
- Passwordless future: Foundation for eliminating passwords entirely
- Conditional flexibility: Can exempt trusted locations if needed

**Trade-offs:**

- User friction: Extra authentication step at sign-in
- Support burden: Initial increase in help desk calls during rollout
- License requirements: Conditional Access requires Microsoft Entra ID P1 minimum
- Legacy app challenges: Some integrations might not support modern auth
- Offline scenarios: Users need device access for authenticator app

> [!IMPORTANT]
> Introducing new CA policies prompts users to reauthenticate. Plan changes during maintenance windows and communicate clearly to minimize disruption. Update background job credentials and service accounts before enforcement.

### Implement separation of duties for financial transactions

**Context and problem:**  
A single user with unrestricted access can create fraudulent transactions, approve their own payments, or modify critical master data without oversight. Regulatory frameworks (SOX, internal controls) require separation of duties to prevent fraud and errors.

**Solution:**  
Implement [!INCLUDE[prod_short](../developer/includes/prod_short.md)]'s Approval Workflows combined with role-based permissions to enforce multi-person authorization for sensitive operations.

Learn more in [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions) and [Use Approval Workflows](/dynamics365/business-central/across-how-use-approval-workflows).

**Guidance:**

1. Identify sensitive operations requiring approval:
   - Payment journals exceeding threshold (for example, >$10,000)
   - Vendor master data changes (bank account modifications)
   - User permission changes or role assignments
   - Fixed asset disposals
   - Inventory adjustments above threshold
   - Customer credit limit increases

1. Configure Approval Workflows:
   - In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], go to **Workflows**.
   - Create approval workflow for each sensitive operation type.
   - Define approval hierarchy (for example, manager approval, finance director for large amounts).
   - Set threshold amounts where applicable.
   - Configure notifications (email, in-app).
   - Enable delegation for approver absence scenarios.

   Learn more in [Use Approval Workflows](/dynamics365/business-central/across-how-use-approval-workflows).

1. Design segregated permission sets:
   - Requester role: Can create payment journals but can't post
   - Approver role: Can approve but can't create their own requests
   - Posting role: Can only post preapproved transactions
   - Ensure no single user has all three capabilities
   - Use security groups for easier management

   Learn more in [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

1. Implement audit logging:
   - Enable change log for sensitive tables (Vendor Bank Account, User Permissions). Learn more about the change log at [Audit changes](/dynamics365/business-central/across-log-changes).
   - Monitor approval workflow telemetry.
   - Regular review of who approved what (monthly reconciliation).

1. Handle exceptions:
   - Document emergency override procedures (requires C-level approval). Learn more in [Manage emergency access accounts in Microsoft Entra ID](/entra/identity/role-based-access-control/security-emergency-access).
   - Temporary permission elevation should be logged and time-limited.
   - Post-incident review of all emergency actions.

**Benefits:**

- Fraud prevention: Reduces risk of unauthorized transactions by 80%+ (industry data)
- Error reduction: Second review catches mistakes before posting
- Regulatory compliance: Meets SOX, GDPR accountability requirements
- Audit trail: Complete history of approval decisions
- Cultural impact: Reinforces accountability and control consciousness

**Trade-offs:**

- Process delays: Approvals add time to transaction completion (hours to days)
- User resistance: Perceived as bureaucratic or lack of trust
- Complex setup: Requires careful workflow design and testing
- Approver availability: Vacation/absence can block operations (mitigate with delegation)
- Overhead for small transactions: May need threshold-based rules

**Best practice:**  
Start with high-risk, high-value transactions only. Expand separation of duties gradually based on risk assessment and user feedback. Balance control with operational efficiency.

## Developer Scenarios

### Secure API calls from your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extension to external services

**Context and problem:**  
Your extension needs to call external APIs (payment gateways, shipping providers, tax services) and requires credentials or API keys. Hardcoding secrets in code or storing them in plain text creates severe security vulnerabilities.

**Solution:**  
Use Azure Key Vault for secret storage, accessed via secure authentication patterns from AL code.

Learn more in [What is Azure Key Vault?](/azure/key-vault/general/overview) and [HttpClient Data Type](../developer/methods-auto/httpclient/httpclient-data-type.md).

**Guidance:**

1. Set up Azure Key Vault:
   - Create Azure Key Vault in same region as [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for optimal performance. Learn more in [Quickstart: Create a key vault using the Azure portal](/azure/key-vault/general/quick-create-portal).
   - Store API keys, connection strings, certificates as Key Vault secrets.
   - Enable Key Vault logging to monitor secret access. Learn more in [Azure Key Vault logging](/azure/key-vault/general/logging).
   - Configure access policies or use Azure role-based access control (RBAC). Learn more in [Assign a Key Vault access policy](/azure/key-vault/general/assign-access-policy) or [Azure Key Vault RBAC guide](/azure/key-vault/general/rbac-guide).

1. Access from [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:
   
   **Option A - App registration with certificate:**
   - Create app registration in customer's Microsoft Entra ID. Learn more in [Register an application with the Microsoft identity platform](/entra/identity-platform/quickstart-register-app).
   - Upload certificate to app registration (do NOT use client secrets). Learn more in [Certificate credentials](/entra/identity-platform/certificate-credentials).
   - Grant app registration "Get Secret" permission on Key Vault. Learn more in [Assign a Key Vault access policy](/azure/key-vault/general/assign-access-policy).
   - Store certificate in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] isolated storage. Learn more in [Isolated Storage](../developer/devenv-isolated-storage.md).

   **Option B - Managed identity (for online integrations):**
   - If calling Azure Function/Logic App as intermediary.
   - Azure service uses managed identity to access Key Vault. Learn more in [Use managed identities for App Service and Azure Functions](/azure/app-service/overview-managed-identity).
   - [!INCLUDE[prod_short](../developer/includes/prod_short.md)] calls Azure service (no secrets in Business Central).

1. AL code pattern: Use AL [HttpClient data type](../developer/methods-auto/httpclient/httpclient-data-type.md) with certificate authentication.

   The following example shows how to retrieve a secret from Azure Key Vault using certificate-based authentication:

   ```al
   local procedure GetApiKey(): Text
   var
       Client: HttpClient;
       Response: HttpResponseMessage;
       KeyVaultUrl: Text;
   begin
       KeyVaultUrl := 'https://mykeyvault.vault.azure.net/secrets/api-key?api-version=7.3';
       
       // Authenticate using certificate-based auth
       if not Client.Get(KeyVaultUrl, Response) then
           Error('Failed to retrieve secret');
       
       // Parse and return secret value
       // Implement proper error handling
   end;
   ```

1. Implement secret rotation:
   - Rotate secrets every 90 days minimum.
   - Use Key Vault secret versions.
   - Update references in Business Central setup tables without code changes.
   - Monitor Key Vault access using Business Central telemetry to track secret retrieval patterns and troubleshoot failures. Learn more in [App Key Vault Secrets Telemetry](../administration/telemetry-extension-key-vault-trace.md).

**Benefits:**

- Centralized secret management: Single source of truth
- No secrets in code: Source control remains clean
- Audit trail: All secret access logged
- Rotation without deployment: Update secrets without recompiling extension
- Compliance: Meets encryption key management standards

**Trade-offs:**

- Azure dependency: Requires Azure subscription
- Latency: Extra network call to Key Vault (cache appropriately)
- Complexity: More complex than hardcoded values
- Cost: Key Vault operations are metered
- Error handling: Need robust retry logic for Key Vault unavailability

### Secure inter-service communication using service tags

**Context and problem:**  
Your AppSource app or pertenant extension (PTE) calls external Azure services (SQL Database, Cosmos DB, custom APIs). You want to restrict these services to only accept traffic from [!INCLUDE[prod_short](../developer/includes/prod_short.md)], preventing unauthorized access from other sources.

**Solution:**  
Configure network access controls on Azure services using the `Dynamics365BusinessCentral` service tag.

**Guidance:**

1. For Azure SQL Database:
   1. In [Azure portal](https://portal.azure.com), open your SQL logical server (not individual database), then select **Networking**.
   1. Under **Public access**, clear the **Allow Azure services and resources to access this server** checkbox.
   1. To restrict access to Business Central IP ranges, use one of these approaches:

      - **Option A - Virtual Network rule** (recommended): Create a virtual network with service endpoint enabled, then add a virtual network rule that references the `Dynamics365BusinessCentral` service tag.
      - **Option B - Firewall IP rules**: Retrieve the IP address ranges from the `Dynamics365BusinessCentral` service tag using PowerShell (see [Scenario C: Destination supports IP allowlisting only](#C)), then add firewall rules for each IP range.

   1. Test connection from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].
   1. Monitor denied connection attempts in Azure SQL audit logs. Learn more in [Auditing for Azure SQL Database and Azure Synapse Analytics](/azure/azure-sql/database/auditing-overview).

   Learn more in [Azure SQL Database firewall rules](/azure/azure-sql/database/firewall-configure).

1. For Azure Key Vault:
   1. In [Azure portal](https://portal.azure.com), open your key vault, and select **Networking** (under **Settings**).
   1. Select **Allow public access from specific virtual networks and IP addresses** (or **Disable public access** if you want to block all public access).
   1. To restrict access to Business Central IP ranges, use one of these approaches:
     - **Option A - Virtual Network** (recommended): Add your virtual network with a service endpoint for Microsoft.KeyVault, which can then reference service tags at the network level.
     - **Option B - Firewall rules**: In the **Firewall** section, add the IP address ranges from the `Dynamics365BusinessCentral` service tag (retrieve them using PowerShell as shown in [Scenario C: Destination supports IP allowlisting only](#C)).

   Learn more in [Configure Azure Key Vault networking settings](/azure/key-vault/general/network-security).

1. For custom APIs behind Azure Application Gateway, create web application firewall (WAF) and Network Security Group (NSG) rules:
   1. In [Azure portal](https://portal.azure.com), go to your **Application Gateway** > **Web application firewall** (under Settings).
   1. Select your **WAF Policy** (or create one).
   1. Under **Custom rules**, add a new rule:
      - **Rule type**: Match rule
      - **Priority**: Set appropriately (lower numbers = higher priority)
      - **Match conditions**:
         - **Match variable**: RemoteAddr
         - **Operation**: IPMatch
         - **IP addresses or ranges**: Enter IP ranges from `Dynamics365BusinessCentral` service tag (retrieve using PowerShell from [Scenario C: Destination supports IP allowlisting only](#C)).
      - **Action**: Allow

      Learn more in [Create custom rules for Web Application Firewall v2](/azure/web-application-firewall/ag/create-custom-waf-rules).
   1. Create a Network Security Group (NSG) rule for your backend subnet:
      - **Source**: Service Tag - `Dynamics365BusinessCentral`
      - **Destination**: Your backend subnet
      - **Destination port**: 443
      - **Action**: Allow

      Learn more in [Create a network security group](/azure/virtual-network/manage-network-security-group).

   > [!TIP]
   > For global distribution scenarios requiring multi-region load balancing and CDN capabilities, consider using [Azure Front Door](/azure/frontdoor/front-door-overview) with similar WAF custom rules. Learn more in [Configure IP restriction rules with WAF for Azure Front Door](/azure/web-application-firewall/afds/waf-front-door-rate-limit-configure).

1. Automate IP range updates to detect when Microsoft changes the Business Central service tag IP addresses:
   1. Create an Azure Automation runbook or scheduled script that runs daily.
   1. Use the following PowerShell script to monitor for changes:

   ```powershell
   # Script to sync Business Central IP ranges to firewall
   $serviceTags = Get-AzNetworkServiceTag -Location eastus2
   $bcTag = $serviceTags.Values | Where-Object { $_.Name -eq "Dynamics365BusinessCentral" }
   
   if ($bcTag.Properties.ChangeNumber -ne $lastKnownChangeNumber) {
       # Update firewall rules in Azure SQL, Key Vault, WAF policies, etc.
       # Store new ChangeNumber for next comparison
   }
   ```

   - Store the `ChangeNumber` in Azure Table Storage or Key Vault for persistence.
   - Configure alerts to notify administrators when IP ranges are updated.
   - Test the automation in a nonproduction environment first.

   Learn more in [What is Azure Automation?](/azure/automation/overview).

**Benefits:**

- Automated IP management: Microsoft maintains service tag IP ranges
- Reduced attack surface: Only Business Central can reach your services
- Compliance: Network segmentation requirement
- No manual IP updates: Service tags autoupdate

**Trade-offs:**

- Global scope: All Business Central environments worldwide included, not per-environment filtering
- Azure-only: Service tags only work within Azure
- Initial configuration: Requires understanding of Azure networking
- Testing complexity: Difficult to test from development machines

**Important limitation:**  
Service tags represent ALL [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments globally. You can't restrict to a single environment or region. For higher granularity, consider extra application-level authentication (API keys, OAuth).

Learn more in [Use Azure security service tags](security-service-tags.md).

## Auditor Scenarios

### Verify that appropriate security controls are in place

**Context and problem:**  
As an auditor (internal or external), you need to verify that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployments meet security standards, compliance requirements, and internal policies. Manual verification is time-consuming and incomplete.

**Solution:**  
Use a checklist-based approach combining automated queries and manual verification procedures.

Learn more in [Security and Protection](security-and-protection.md), [Business Central Online Security](security-online.md), and [Microsoft Dynamics 365 Cloud Services Compliance](https://aka.ms/d365-compliance-list).

**Guidance:**

**Authentication controls verification:**

1. Confirm MFA is enforced:
   - Review Microsoft Entra Conditional Access policies.
   - Verify "Require MFA" is enabled for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] app.
   - Check for exemptions or exclusions (should be minimal/none).
   - Sample authentication logs to confirm MFA claims in tokens.

1. Check for legacy authentication blocks:
   - Review sign-in logs for BasicAuth protocol usage.
   - Confirm Conditional Access blocks legacy auth protocols.
   - Verify no app passwords are enabled.

**Authorization controls verification:**

1. Review separation of duties:
   - Export user permission sets.
   - Verify no user has both "Create Payment" and "Approve Payment".
   - Check approval workflow configurations.
   - Review override/emergency access logs.

1. Audit privileged access:
   - List all users with SUPER permission set.
   - Verify justification for each (should be minimal).
   - Check if PIM is used for admin access (time-bound).
   - Review admin action logs.

   Learn more in [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

**Data protection verification:**

1. Confirm encryption at rest:
   - Verify TDE is enabled on database (online: automatic; on-premises: check SQL Server).
   - For on-premises: Confirm backup encryption enabled.
   - Check for customer-managed key (CMK) if required by policy.

   Learn more in [Transparent Data Encryption](transparent-data-encryption.md) and [Data Encryption at Rest](security-online.md#data-isolation-and-encryption).

1. Verify network encryption:
   - Confirm HTTPS/TLS 1.2+ for all client connections.
   - Check certificate validity and strength.
   - Review network service tag configurations.

   Learn more in [Using Security Certificates with Business Central on-premises](../deployment/implement-security-certificates-production-environment.md).

**Monitoring and detection:**

1. Verify logging is enabled:
   - Confirm Microsoft Entra sign-in logs retention (90+ days).
   - Verify [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry is flowing to Application Insights.
   - Check change log is enabled for sensitive tables.
   - Review alert configurations.

1. Test incident response:
   - Verify security runbooks exist.
   - Confirm contact procedures are documented.
   - Review past security incident reports.

**Compliance artifacts:**

1. Collect evidence:
   - Export Conditional Access policies (JSON).
   - Screenshot approval workflow configurations.
   - Export user permission reports with dates.
   - Collect security alert reports from last quarter.

1. Document findings:
   - Use standardized control testing templates.
   - Rate controls: Effective / Needs Improvement / Ineffective.
   - Provide remediation recommendations with priority.

**Benefits:**

- Standardized assessment: Consistent audit approach
- Evidence-based: Objective verification vs. self-attestation
- Comprehensive coverage: Technical and process controls
- Remediation roadmap: Clear action items from audit

**Trade-offs:**

- Technical expertise required: Auditor needs Azure/Business Central knowledge
- Time investment: Thorough audit takes 8-16 hours per environment
- Access requirements: Needs elevated privileges to review all settings
- Point-in-time: Snapshot of controls, not continuous assurance

**Audit frequency recommendation:**

- External compliance audits: Annual (SOC 2, ISO 27001)
- Internal security reviews: Quarterly
- Privileged access review: Monthly
- Automated control testing: Continuous (where possible)

### Track and report on data access patterns

**Context and problem:**  
For compliance and security investigations, you need to understand who accessed what data, when, and from where. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] doesn't enable comprehensive data access logging by default.

**Solution:**  
Implement multi-layered audit logging using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] change log, database auditing, and telemetry.

Learn more in [Auditing Changes in Business Central](/dynamics365/business-central/across-log-changes), [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md), and [Transparent Data Encryption](transparent-data-encryption.md).

**Guidance:**

1. Enable [!INCLUDE[prod_short](../developer/includes/prod_short.md)] change log:
   1. In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], go to **Change Log Setup**.
   1. Enable change logging for sensitive tables:

      - Customer, Vendor, Bank Account
      - G/L Entry, Customer Ledger Entry, Vendor Ledger Entry
      - User, User Group, Permission Set

   1. Select fields to track: All fields versus critical fields only.
   1. Consider performance impact (logging adds overhead).

   Learn more in [Auditing Changes in Business Central](/dynamics365/business-central/across-log-changes)
1. Configure SQL Server Auditing (on-premises):

   ```sql
   -- Create server audit
   CREATE SERVER AUDIT BCDataAccessAudit
   TO FILE (FILEPATH = 'C:\SQLAudit\')
   
   -- Create database audit specification
   CREATE DATABASE AUDIT SPECIFICATION BCTableAccess
   FOR SERVER AUDIT BCDataAccessAudit
   ADD (SELECT ON SCHEMA::dbo BY public)
   WITH (STATE = ON)
   ```

1. Use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry (online):
   1. Enable environment telemetry to Application Insights. Learn more in [Turn environment telemetry on or off](../administration/telemetry-enable-application-insights.md).
   1. Monitor custom telemetry events:
     - [Long Running SQL Query Telemetry](../administration/telemetry-long-running-sql-query-trace.md) (data access patterns)
     - [Permission Error Telemetry](../administration/telemetry-permission-error-trace.md) (unauthorized access attempts)
     - [Company Lifecycle Telemetry](../administration/telemetry-company-lifecycle-trace.md) (cross-company access)

1. Create access reports using KQL queries in Application Insights and SQL queries for change log data:
   - Daily access summary:
     - Who accessed which companies
     - Failed permission checks
     - After-hours access (outside 7am-7pm)

   - Sensitive data access:
     - Bank account field reads
     - Salary information views
     - Customer credit card data (if stored)

   Learn more in [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/) and [Create a report in Business Central](/dynamics365/business-central/ui-work-report).

1. Retention and archival:
   - Change log: Archive monthly to separate table and retain 13 months.
   - SQL Audit files: Retain 90 days active, 7 years archive.
   - Telemetry: Application Insights defaults 90 days, export to storage for long-term.

**Benefits:**

- Forensic capability: Investigate security incidents with complete history
- Compliance evidence: Demonstrate data access controls for audits
- Insider threat detection: Identify unusual access patterns
- Performance insights: Identify inefficient data access

**Trade-offs:**

- Performance impact: Logging adds 5-15% overhead depending on scope
- Storage costs: Audit logs can be substantial (GB per month)
- Analysis complexity: Raw logs require queries/tools to extract insights
- Privacy considerations: Logging employee activity requires policy disclosure

**Best practice for auditors:**  
Don't enable logging reactively after an incident. Implement comprehensive audit trails proactively. The data you didn't log yesterday can't be retrieved for today's investigation.

## Related information

[Security and Protection](security-and-protection.md)  
[[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online Security](security-online.md)  
[[!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises Security](security-onpremises.md)  
[Security Tips for Business Users](security-users.md)  
[Use Azure Service Tags](security-service-tags.md)  
[Setting up Multifactor Authentication](multifactor-authentication.md)  
[Manage Access to Environments](../administration/tenant-admin-center-manage-access.md)
