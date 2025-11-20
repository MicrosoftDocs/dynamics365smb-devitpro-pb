---
title: Security Scenarios Guide by Persona
description: Practical security scenarios and best practices for partners, administrators, auditors, and developers working with Dynamics 365 Business Central.
author: jswymer
ms.topic: how-to
ms.date: 11/20/2025
ms.author: jswymer
ms.reviewer: solsen
---

# Security Scenarios Guide: How Do I Secure Business Central?

This guide provides scenario-based security recommendations organized by persona. Each best practice includes context, solution, guidance, benefits, and trade-offs to help you make informed security decisions.

## Partner Scenarios

### How do I ensure my consultants don't have persistent access to all customers I manage?

**Context and Problem:**  
Partners managing multiple customers through GDAP (Granular Delegated Admin Privileges) face a security risk when consultants have persistent, always-on administrative access to customer environments. A compromised consultant account could lead to unauthorized access across all customers. Compliance requirements and customer trust demand minimizing standing privileges.

**Solution:**  
Implement time-bound privileged access using Microsoft Entra ID Privileged Identity Management (PIM) combined with GDAP group-based access control.

**Guidance:**

1. **Set up GDAP with groups:**
   - In your partner's Microsoft Entra ID, create one security group per customer you have a GDAP relationship with (e.g., `GDAP-CustomerA-Admins`, `GDAP-CustomerB-Admins`)
   - Establish the GDAP relationship with each customer, linking the relevant security group to the appropriate Azure AD roles
   - Do not directly assign consultants to these groups permanently

2. **Configure PIM for time-bound access:**
   - Enable Microsoft Entra ID Privileged Identity Management (requires Microsoft Entra ID P2 or Microsoft Entra ID Governance license)
   - Make the GDAP customer groups eligible for activation in PIM rather than permanently assigned
   - Configure activation requirements (e.g., justification, approval workflow, maximum duration)
   - Set appropriate activation duration limits (e.g., 4-8 hours)

3. **Consultant workflow:**
   - When a consultant needs to work on a specific customer, they request activation of the relevant customer group in PIM
   - They provide business justification (e.g., ticket number, task description)
   - Access is granted for the specified time window only
   - Access automatically expires after the configured duration

**Benefits:**
- **Reduced attack surface:** Compromised credentials have limited blast radius and time window
- **Audit trail:** Complete logging of who accessed what customer, when, and why
- **Compliance:** Meets regulatory requirements for just-in-time access and least privilege
- **Customer trust:** Demonstrates commitment to security best practices
- **Competitive advantage:** Can be marketed as a security differentiator

**Trade-offs:**
- **Licensing cost:** Requires Microsoft Entra ID P2 or Governance licenses (typically $6-9 per user/month)
- **Initial setup complexity:** Requires configuring PIM and GDAP groups for each customer
- **User friction:** Consultants must request access before working, adding 1-5 minutes overhead
- **Administrative overhead:** May require approval workflows and monitoring

**ROI Consideration:**  
Partners can absorb licensing costs and position this as a premium security offering. The cost of a single security breach far exceeds the licensing investment.

### How do I secure API access for automation tools I build for customers?

**Context and Problem:**  
Partners often build automation tools, integrations, or monitoring solutions that need to call Business Central APIs across multiple customer tenants. Using personal admin accounts or long-lived secrets creates security risks and operational fragility.

**Solution:**  
Use managed identities with Federated Identity Credentials (FIC) when running in Azure, or implement secure credential management for non-Azure scenarios.

**Guidance:**

**If running in Azure (recommended):**
1. Deploy your automation as an Azure resource (Function App, Logic App, or Azure Container Instance)
2. Enable system-assigned or user-assigned managed identity on the Azure resource
3. Register an app in your partner's Microsoft Entra ID
4. Configure Federated Identity Credential on the app registration, linking it to the Azure resource's managed identity
5. Authorize the app in customer tenants via GDAP or direct app authorization
6. Your code acquires tokens automatically using the managed identity—no secrets to manage

**If not running in Azure:**
1. Create a dedicated app registration per integration/tool
2. Use certificate-based authentication instead of client secrets
3. Store certificates securely in Azure Key Vault or hardware security modules
4. Implement certificate rotation procedures (every 12 months minimum)
5. Use separate credentials per customer environment when possible
6. Monitor API usage through telemetry

**Benefits:**
- **No credential theft risk** (managed identity scenario)
- **Automated credential rotation** (Azure handles it)
- **Fine-grained access control** per customer
- **Complete audit trail** of API calls
- **Compliance with zero-trust principles**

**Trade-offs:**
- **Azure dependency** for optimal security (managed identities)
- **Complexity** in multi-tenant scenarios
- **Learning curve** for FIC and managed identity concepts
- **Cost** of Azure resources (minimal—Function Apps can run on consumption plan)

## Administrator Scenarios

### How do I restrict network access to Business Central from external services?

**Context and Problem:**  
Your Business Central environment (AppSource apps or per-tenant extensions) calls external services (APIs, Azure Storage, databases). You want to ensure only legitimate traffic from your Business Central environment reaches these services, blocking potential unauthorized access or data exfiltration attempts from other sources.

**Solution:**  
Use Azure service tags and network access controls to create allowlists based on Business Central's IP ranges.

**Guidance:**

**Scenario A: Destination service supports service tags natively**  
(Azure SQL Database, Azure Key Vault, Azure Cosmos DB, etc.)

1. Navigate to your Azure resource's networking settings
2. Configure firewall rules or network access controls
3. Add a rule allowing traffic from the `Dynamics365BusinessCentral` service tag
4. Remove any overly permissive rules (e.g., "Allow all Azure services")

**Scenario B: Destination is Azure Storage Account**  
(Special case due to internal routing)

1. Create an Azure Function as a proxy in the same region as Business Central
2. Restrict Azure Function access using service tag-based access restriction: allow `Dynamics365BusinessCentral`
3. Create a private endpoint or VNet integration from Azure Function to Storage Account
4. Configure your Business Central extension to call the Azure Function instead of Storage directly
5. Azure Function proxies requests to Storage Account

**Scenario C: Destination supports IP allowlisting only**  
(On-premises systems, third-party SaaS, custom APIs)

1. Retrieve current Business Central IP ranges:
   ```powershell
   $serviceTags = Get-AzNetworkServiceTag -Location eastus2
   $bcTag = $serviceTags.Values | Where-Object { $_.Name -eq "Dynamics365BusinessCentral" }
   $bcTag.Properties.AddressPrefixes
   ```
2. Configure firewall/network rules on destination to allow these IP ranges
3. Monitor the `ChangeNumber` property and update rules when Microsoft updates the ranges
4. Consider automating updates using Azure Automation or scheduled scripts

**Benefits:**
- **Prevents unauthorized access** from non-Business Central sources
- **Reduces attack surface** significantly
- **Compliance** with network segmentation requirements
- **Visibility** into allowed traffic patterns

**Trade-offs:**
- **No per-environment granularity:** Service tag includes all Business Central environments globally
- **Maintenance overhead:** IP ranges change over time (though infrequently)
- **Proxy complexity:** Storage Account scenario requires additional Azure Function
- **Regional limitations:** Must be in supported Azure regions for some scenarios

### How do I monitor and respond to suspicious login attempts?

**Context and Problem:**  
Attackers may attempt credential stuffing, password spraying, or brute-force attacks against your Business Central users. Integration accounts might use incorrect credentials. You need visibility into authentication failures to detect threats early and respond appropriately.

**Solution:**  
Implement comprehensive monitoring of authentication events using Microsoft Entra sign-in logs and Business Central telemetry.

**Guidance:**

1. **Enable Microsoft Entra ID sign-in logging:**
   - Navigate to Microsoft Entra admin center → Monitoring → Sign-in logs
   - Configure diagnostic settings to route logs to:
     - Azure Monitor Log Analytics workspace (recommended for querying)
     - Azure Storage (for long-term retention)
     - Azure Event Hub (for SIEM integration)
   - Retention: Set to at least 90 days for security investigations

2. **Create alert rules for suspicious patterns:**
   - **Multiple failed sign-ins:** Alert when user has >5 failures in 10 minutes
   - **Impossible travel:** Alert when sign-ins occur from geographically distant locations within short timeframes
   - **Unfamiliar locations:** Alert when sign-ins come from countries where you don't operate
   - **Disabled accounts:** Alert on any authentication attempt to disabled accounts
   
   Sample KQL query for Log Analytics:
   ```kusto
   SigninLogs
   | where AppDisplayName contains "Business Central"
   | where ResultType != 0  // Failed sign-ins
   | summarize FailureCount=count() by UserPrincipalName, IPAddress, bin(TimeGenerated, 10m)
   | where FailureCount > 5
   ```

3. **Monitor Business Central telemetry:**
   - Enable Business Central telemetry to Azure Application Insights
   - Track authorization failures and permission errors
   - Monitor API authentication failures for service accounts
   - Set up alerts for anomalous API usage patterns

4. **Establish response procedures:**
   - Investigate high-priority alerts within 1 hour
   - For confirmed attacks: Reset credentials, enable Conditional Access if not already active
   - For integration failures: Check service principal certificates/secrets expiration
   - Document incidents for trend analysis

**Benefits:**
- **Early threat detection** before damage occurs
- **Forensic capability** for security incidents
- **Operational insights** (e.g., expiring integration credentials)
- **Compliance evidence** for audit requirements
- **Reduced MTTR** (mean time to respond)

**Trade-offs:**
- **Alert fatigue:** Too many alerts can desensitize teams
- **Cost:** Log Analytics charges based on data ingestion and retention
- **Expertise required:** Creating effective KQL queries requires learning curve
- **False positives:** Legitimate scenarios (e.g., VPN users) may trigger alerts

### How do I enforce multi-factor authentication for all users?

**Context and Problem:**  
Password-only authentication is vulnerable to phishing, credential theft, and account takeover. Regulatory requirements and security best practices mandate multi-factor authentication (MFA), but enabling it requires balancing security with user experience.

**Solution:**  
Implement Microsoft Entra Conditional Access policies to require MFA for Business Central access with modern authentication methods.

**Guidance:**

1. **Assess current authentication methods:**
   - Review authentication methods report in Microsoft Entra ID
   - Identify users still using SMS/voice call (less secure)
   - Plan migration to Microsoft Authenticator app or FIDO2 security keys

2. **Configure Conditional Access policy:**
   - Navigate to Microsoft Entra admin center → Protection → Conditional Access
   - Create new policy: "Require MFA for Business Central"
   - **Assignments:**
     - Users: Include "All users" or specific Business Central user groups
     - Cloud apps: Select "Dynamics 365 Business Central"
   - **Access controls:**
     - Grant access, but require multi-factor authentication
   - **Session controls:** Consider sign-in frequency (e.g., require re-auth every 7 days)
   
3. **Enable modern authentication methods:**
   - Navigate to Authentication methods policies
   - Enable Microsoft Authenticator (push notifications and passwordless)
   - Enable FIDO2 security keys for high-privilege accounts
   - Disable less secure methods (SMS, voice) after transition period
   - Enable Temporary Access Pass for new user onboarding

4. **Plan rollout:**
   - **Phase 1 (report-only mode):** Monitor impact without enforcing
   - **Phase 2 (pilot group):** Enable for IT and early adopters
   - **Phase 3 (broad deployment):** Roll out to all users with communication plan
   - Provide user training and help desk preparation

5. **Handle service accounts:**
   - Use certificate-based authentication for automated processes
   - Never exempt service accounts from security policies
   - Consider managed identities for Azure-hosted integrations

**Benefits:**
- **99.9% reduction** in account compromise risk (Microsoft data)
- **Compliance** with regulations (GDPR, SOC 2, ISO 27001)
- **User trust** in platform security
- **Passwordless future:** Foundation for eliminating passwords entirely
- **Conditional flexibility:** Can exempt trusted locations if needed

**Trade-offs:**
- **User friction:** Additional authentication step at sign-in
- **Support burden:** Initial increase in help desk calls during rollout
- **License requirements:** Conditional Access requires Microsoft Entra ID P1 minimum
- **Legacy app challenges:** Some integrations may not support modern auth
- **Offline scenarios:** Users need device access for authenticator app

**Critical note:**  
Introducing new CA policies prompts users to reauthenticate. Plan changes during maintenance windows and communicate clearly to minimize disruption. Update background job credentials and service accounts before enforcement.

### How do I implement separation of duties for financial transactions?

**Context and Problem:**  
A single user with unrestricted access can create fraudulent transactions, approve their own payments, or modify critical master data without oversight. Regulatory frameworks (SOX, internal controls) require separation of duties to prevent fraud and errors.

**Solution:**  
Implement Business Central's Approval Workflows combined with role-based permissions to enforce multi-person authorization for sensitive operations.

**Guidance:**

1. **Identify sensitive operations requiring approval:**
   - Payment journals exceeding threshold (e.g., >$10,000)
   - Vendor master data changes (bank account modifications)
   - User permission changes or role assignments
   - Fixed asset disposals
   - Inventory adjustments above threshold
   - Customer credit limit increases

2. **Configure Approval Workflows:**
   - Navigate to Business Central → Workflows
   - Create approval workflow for each sensitive operation type
   - Define approval hierarchy (e.g., manager approval, finance director for large amounts)
   - Set threshold amounts where applicable
   - Configure notifications (email, in-app)
   - Enable delegation for approver absence scenarios

3. **Design segregated permission sets:**
   - **Requester role:** Can create payment journals but cannot post
   - **Approver role:** Can approve but cannot create their own requests
   - **Posting role:** Can only post pre-approved transactions
   - Ensure no single user has all three capabilities
   - Use security groups for easier management

4. **Implement audit logging:**
   - Enable Change Log for sensitive tables (Vendor Bank Account, User Permissions)
   - Monitor approval workflow telemetry
   - Regular review of who approved what (monthly reconciliation)

5. **Handle exceptions:**
   - Document emergency override procedures (requires C-level approval)
   - Temporary permission elevation should be logged and time-limited
   - Post-incident review of all emergency actions

**Benefits:**
- **Fraud prevention:** Reduces risk of unauthorized transactions by 80%+ (industry data)
- **Error reduction:** Second review catches mistakes before posting
- **Regulatory compliance:** Meets SOX, GDPR accountability requirements
- **Audit trail:** Complete history of approval decisions
- **Cultural impact:** Reinforces accountability and control consciousness

**Trade-offs:**
- **Process delays:** Approvals add time to transaction completion (hours to days)
- **User resistance:** Perceived as bureaucratic or lack of trust
- **Complex setup:** Requires careful workflow design and testing
- **Approver availability:** Vacation/absence can block operations (mitigate with delegation)
- **Overhead for small transactions:** May need threshold-based rules

**Best practice:**  
Start with high-risk, high-value transactions only. Expand separation of duties gradually based on risk assessment and user feedback. Balance control with operational efficiency.

## Developer Scenarios

### How do I secure API calls from my Business Central extension to external services?

**Context and Problem:**  
Your extension needs to call external APIs (payment gateways, shipping providers, tax services) and requires credentials or API keys. Hardcoding secrets in code or storing them in plain text creates severe security vulnerabilities.

**Solution:**  
Use Azure Key Vault for secret storage, accessed via secure authentication patterns from AL code.

**Guidance:**

1. **Set up Azure Key Vault:**
   - Create Azure Key Vault in same region as Business Central for optimal performance
   - Store API keys, connection strings, certificates as Key Vault secrets
   - Enable Key Vault logging to monitor secret access
   - Configure access policies or use Azure RBAC

2. **Access from Business Central:**
   - **Option A - App registration with certificate:**
     - Create app registration in customer's Microsoft Entra ID
     - Upload certificate to app registration (do NOT use client secrets)
     - Grant app registration "Get Secret" permission on Key Vault
     - Store certificate in Business Central isolated storage
     - Use AL HttpClient with certificate authentication
   
   - **Option B - Managed identity (for SaaS integrations):**
     - If calling Azure Function/Logic App as intermediary
     - Azure service uses managed identity to access Key Vault
     - Business Central calls Azure service (no secrets in BC)

3. **AL code pattern:**
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

4. **Implement secret rotation:**
   - Rotate secrets every 90 days minimum
   - Use Key Vault secret versions
   - Update references in BC setup tables without code changes

**Benefits:**
- **Centralized secret management:** Single source of truth
- **No secrets in code:** Source control remains clean
- **Audit trail:** All secret access logged
- **Rotation without deployment:** Update secrets without recompiling extension
- **Compliance:** Meets encryption key management standards

**Trade-offs:**
- **Azure dependency:** Requires Azure subscription
- **Latency:** Additional network call to Key Vault (cache appropriately)
- **Complexity:** More complex than hardcoded values
- **Cost:** Key Vault operations are metered (typically <$1/month)
- **Error handling:** Need robust retry logic for Key Vault unavailability

### How do I secure inter-service communication using service tags?

**Context and Problem:**  
Your AppSource app or PTE calls external Azure services (SQL Database, Cosmos DB, custom APIs). You want to restrict these services to only accept traffic from Business Central, preventing unauthorized access from other sources.

**Solution:**  
Configure network access controls on Azure services using the `Dynamics365BusinessCentral` service tag.

**Guidance:**

1. **For Azure SQL Database:**
   - Navigate to Azure SQL Server → Networking
   - Remove "Allow Azure services" if enabled
   - Add virtual network rule or firewall rule:
     - Type: Service Tag
     - Service Tag: `Dynamics365BusinessCentral`
     - Rule name: "Allow-BC-Traffic"
   - Test connection from Business Central
   - Monitor denied connection attempts

2. **For Azure Key Vault:**
   - Navigate to Key Vault → Networking → Firewalls and virtual networks
   - Select "Disable public access" or "Allow public access from specific virtual networks and IP addresses"
   - Add network rule: Service Tag = `Dynamics365BusinessCentral`

3. **For custom APIs behind Azure Application Gateway/Firewall:**
   - Configure WAF rules to allow `Dynamics365BusinessCentral` source
   - Create Network Security Group (NSG) rule:
     - Source: Service Tag - `Dynamics365BusinessCentral`
     - Destination: Your backend subnet
     - Port: 443
     - Action: Allow

4. **Automation for IP range updates:**
   ```powershell
   # Script to sync BC IP ranges to firewall
   $serviceTags = Get-AzNetworkServiceTag -Location eastus2
   $bcTag = $serviceTags.Values | Where-Object { $_.Name -eq "Dynamics365BusinessCentral" }
   
   if ($bcTag.Properties.ChangeNumber -ne $lastKnownChangeNumber) {
       # Update firewall rules
       # Store new ChangeNumber
   }
   ```

**Benefits:**
- **Automated IP management:** Microsoft maintains service tag IP ranges
- **Reduced attack surface:** Only BC can reach your services
- **Compliance:** Network segmentation requirement
- **No manual IP updates:** Service tags auto-update

**Trade-offs:**
- **Global scope:** All BC environments worldwide included, not per-environment filtering
- **Azure-only:** Service tags only work within Azure
- **Initial configuration:** Requires understanding of Azure networking
- **Testing complexity:** Difficult to test from development machines

**Important limitation:**  
Service tags represent ALL Business Central environments globally. You cannot restrict to a single environment or region. For higher granularity, consider additional application-level authentication (API keys, OAuth).

## Auditor Scenarios

### How do I verify that appropriate security controls are in place?

**Context and Problem:**  
As an auditor (internal or external), you need to verify that Business Central deployments meet security standards, compliance requirements, and internal policies. Manual verification is time-consuming and incomplete.

**Solution:**  
Use a checklist-based approach combining automated queries and manual verification procedures.

**Guidance:**

**Authentication Controls Verification:**
1. **Confirm MFA is enforced:**
   - Review Microsoft Entra Conditional Access policies
   - Verify "Require MFA" is enabled for Business Central app
   - Check for exemptions or exclusions (should be minimal/none)
   - Sample authentication logs to confirm MFA claims in tokens

2. **Check for legacy authentication blocks:**
   - Review sign-in logs for BasicAuth protocol usage
   - Confirm Conditional Access blocks legacy auth protocols
   - Verify no app passwords are enabled

**Authorization Controls Verification:**
1. **Review separation of duties:**
   - Export user permission sets
   - Verify no user has both "Create Payment" and "Approve Payment"
   - Check approval workflow configurations
   - Review override/emergency access logs

2. **Audit privileged access:**
   - List all users with SUPER permission set
   - Verify justification for each (should be minimal)
   - Check if PIM is used for admin access (time-bound)
   - Review admin action logs

**Data Protection Verification:**
1. **Confirm encryption at rest:**
   - Verify TDE is enabled on database (online: automatic; on-prem: check SQL Server)
   - For on-prem: Confirm backup encryption enabled
   - Check for customer-managed key (CMK) if required by policy

2. **Verify network encryption:**
   - Confirm HTTPS/TLS 1.2+ for all client connections
   - Check certificate validity and strength
   - Review network service tag configurations

**Monitoring and Detection:**
1. **Verify logging is enabled:**
   - Confirm Microsoft Entra sign-in logs retention (90+ days)
   - Verify Business Central telemetry is flowing to Application Insights
   - Check Change Log is enabled for sensitive tables
   - Review alert configurations

2. **Test incident response:**
   - Verify security runbooks exist
   - Confirm contact procedures are documented
   - Review past security incident reports

**Compliance Artifacts:**
1. **Collect evidence:**
   - Export Conditional Access policies (JSON)
   - Screenshot approval workflow configurations
   - Export user permission reports with dates
   - Collect security alert reports from last quarter

2. **Document findings:**
   - Use standardized control testing templates
   - Rate controls: Effective / Needs Improvement / Ineffective
   - Provide remediation recommendations with priority

**Benefits:**
- **Standardized assessment:** Consistent audit approach
- **Evidence-based:** Objective verification vs. self-attestation
- **Comprehensive coverage:** Technical and process controls
- **Remediation roadmap:** Clear action items from audit

**Trade-offs:**
- **Technical expertise required:** Auditor needs Azure/BC knowledge
- **Time investment:** Thorough audit takes 8-16 hours per environment
- **Access requirements:** Needs elevated privileges to review all settings
- **Point-in-time:** Snapshot of controls, not continuous assurance

**Audit frequency recommendation:**  
- **External compliance audits:** Annual (SOC 2, ISO 27001)
- **Internal security reviews:** Quarterly
- **Privileged access review:** Monthly
- **Automated control testing:** Continuous (where possible)

### How do I track and report on data access patterns?

**Context and Problem:**  
For compliance and security investigations, you need to understand who accessed what data, when, and from where. Business Central doesn't enable comprehensive data access logging by default.

**Solution:**  
Implement multi-layered audit logging using Business Central Change Log, database auditing, and telemetry.

**Guidance:**

1. **Enable Business Central Change Log:**
   - Navigate to Change Log Setup
   - Enable change logging for sensitive tables:
     - Customer, Vendor, Bank Account
     - G/L Entry, Customer Ledger Entry, Vendor Ledger Entry
     - User, User Group, Permission Set
   - Select fields to track: All fields vs. critical fields only
   - Consider performance impact (logging adds overhead)

2. **Configure SQL Server Auditing (on-premises):**
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

3. **Use Business Central telemetry (online):**
   - Enable environment telemetry to Application Insights
   - Monitor custom telemetry events:
     - `AL: Long Running SQL Query` (data access patterns)
     - `AL: Permission Error` (unauthorized access attempts)
     - `AL: Company Switched` (cross-company access)

4. **Create access reports:**
   - **Daily access summary:**
     - Who accessed which companies
     - Failed permission checks
     - After-hours access (outside 7am-7pm)
   
   - **Sensitive data access:**
     - Bank account field reads
     - Salary information views
     - Customer credit card data (if stored)

5. **Retention and archival:**
   - Change Log: Archive monthly to separate table, retain 13 months
   - SQL Audit files: Retain 90 days active, 7 years archive
   - Telemetry: Application Insights default 90 days, export to storage for long-term

**Benefits:**
- **Forensic capability:** Investigate security incidents with complete history
- **Compliance evidence:** Demonstrate data access controls for audits
- **Insider threat detection:** Identify unusual access patterns
- **Performance insights:** Identify inefficient data access

**Trade-offs:**
- **Performance impact:** Logging adds 5-15% overhead depending on scope
- **Storage costs:** Audit logs can be substantial (GB per month)
- **Analysis complexity:** Raw logs require queries/tools to extract insights
- **Privacy considerations:** Logging employee activity requires policy disclosure

**Best practice for auditors:**  
Don't enable logging reactively after an incident. Implement comprehensive audit trails proactively. The data you didn't log yesterday cannot be retrieved for today's investigation.

## Related information

[Security and Protection](security-and-protection.md)  
[Business Central Online Security](security-online.md)  
[Business Central On-Premises Security](security-onpremises.md)  
[Security Tips for Business Users](security-users.md)  
[Use Azure Service Tags](security-service-tags.md)  
[Setting up Multifactor Authentication](multifactor-authentication.md)  
[Manage Access to Environments](../administration/tenant-admin-center-manage-access.md)
