---
title: "Set up the add-ins for Outlook integration with Business Central on-premises"
description: Learn how to configure your Business Central on-premises solution so that users can work with Business Central data in Outlook.
ms.custom: na
ms.date: 08/31/2021
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Set Up the Business Central Add-In for Outlook with Business Central On-premises

If your organization uses Exchange Server or Exchange Online (alone or as part of a Microsoft 365 subscription), [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises supports integration with Outlook that enables users to complete [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business tasks from their Outlook inbox. As the admin, you can configure [!INCLUDE [prod_short](../includes/prod_short.md)] so that users can connect to [!INCLUDE [prod_short](../includes/prod_short.md)] data from Outlook.

## Overview

### About the add-in

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] add-in for Outlook consists of two add-ins:

- Contact Insights

    The add-in provides users with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] customer or vendor information in Outlook emails and calendar appointments. It also enables users to create and send [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business documents, such sales quotes and invoices to a contact. To support these tasks, the add-in adds actions to the Outlook ribbon, in the **Business Central** group.  

- Document View

    When a business document is sent as an email, this  add-in provides a direct link from email to the actual business document in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Each add-in is provided as an XML manifest file, which must be installed in Outlook client of any user that wants this functionality. These files describe how to activate the add-ins and connect to Business Central when they're used in Outlook.

For more information about what you do with the add-ins, see [Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin).

### About deployment

The processes for deploying the add-ins are different for [!INCLUDE [prod_short](../includes/prod_short.md)] online and on-premises, though the add-ins are the same. This article describes how to get the add-ins for [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises. For information about [!INCLUDE [prod_short](../includes/prod_short.md)] online, see [Get the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook) in the business functionality content.

For on-premises environments, there are different options for deploying the add-ins. The option that you choose will depend on your organizations security policies, the Business Central environment, and how much control over installing the add-in that you want to give users. For example, you can choose to install the add-ins automatically for all users in your organization or targeted users only. Or, you can allow users to install the add-ins themselves. For more information about each deployment option, see [Centralized Deployment](#centralized-deployment), [Automated Individual Deployment](#automated-individual-deployment), and [Manual Individual Deployment](#manual-individual-deployment) in this article. 

### Mail server

The add-in deployment works with Exchange Online, Exchange Online as part of Microsoft 365, and Exchange Server 2019. The add-in uses Exchange Web Services (EWS) to access mailbox data from Exchange Online or Exchange Server.

### Authentication and authorization

The authentication and authorization that can be used will depend on whether you're using Exchange Online or Exchange Server.

- In Exchange Online, standalone or as part of Microsoft 365, EWS uses OAuth2 as an authorization protocol. OAuth2 doesn't share password data but instead uses authorization tokens to prove an identity between consumers and service providers. It allows users to approve one application interacting with another on their behalf without giving away your password. The Business Central add-in for Outlook supports multi-factor authentication if that has been configured in Microsoft 365. With Exchange Online, Business Central must be configured to use Azure Active Directory authentication.

- With Exchange Server, EWS and Autodiscover will try to find the local Exchange Server. In this case, Business Central can be configured to use either NavUserPassword or Azure Active Directory authentication.

## Prepare for deployment

The steps you'll need to go through to prepare for deploying the add-in will depend on whether you intend on deploying to Microsoft 365 or Exchange Server.

### [Deploying to Microsoft 365?](#tab/m356)

1. Prepare Microsoft 365

    - Assign users a Microsoft 365 license.
    - Make sure your Microsoft 365 account has the Global Administrator or Exchange Administrator role.

2. Prepare Business Central

    - Set up Azure Active Directory (Azure AD) authentication.

       For more information, see [Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).
    - Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

      For more information, see [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).
    - Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

      For more information, see [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)
    - Set the authentication email on user accounts to the user's Microsoft 365 email address.

      For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) in the business functionality help.

### [Deploying to Exchange Server?](#tab/exchange)

1. Prepare Exchange Server

    - Enable access to EWS. For more information, see [Control access to EWS in Exchange](/exchange/client-developer/exchange-web-services/how-to-control-access-to-ews-in-exchange)
    - Make sure your Exchange account has the Organization Management role or the Org Apps admin role

2. Business Central

    - Set up Azure Active Directory (Azure AD) authentication or NavUserPassword.

      For more information, see [Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).
    - Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

      For more information, see [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).
    - Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

      For more information, see [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)

---

#### <a name="server"></a>Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins

You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the **Set-NAVServerConfiguration** cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Client Services** section, set the **Exchange Auth. Metadata Location** setting to the URL for the Exchange authentication metadata document of the authority that is allowed to sign the Exchange identity token.

    If you're using the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the Set-NAVServerConfiguration cmdlet and set the `ExchangeAuthenticationMetadataLocation` key.

    This setting is used to confirm the identity of the signing authority when using Exchange authentication. In part, the value includes the URL of the Exchange mail server. The field accepts a wild-card URL. So for example, if the URL of the Exchange mail server is `https://mail.cronus.com`, then you can set the field to `https://mail.cronus.com*`. The default value is `https://outlook.office365.com/`.

2. Set the **Web Client Base URL** setting to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

   The base URL the public URL that can be used by Outlook clients to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The base URL is the root portion of all URLs that are used to access pages in the web client. It must have the format `https://[hostname:port]/[instance]`, such as `https://MyNavWebServer:443/BC130`.

   With the Set-NAVServerConfiguration cmdlet, set the `PublicWebBaseUrl` key.
3. Set the **Valid Audiences** setting for Azure AD to include the host name of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

   The host name is the web client URL with the port number and server instance, like `https://MyNavWebServer`.

## <a name="centralized-deployment"></a>Centralized Deployment

Centralized Deployment is a feature in Microsoft 365 admin center and Exchange admin center that lets you automatically install add-ins in users' Office apps, like Outlook. It's the recommended way for admins to deploy for Office add-ins to users and groups within your organization. For more information about Centralized Deployment, see [Centralized Deployment FAQ](/microsoft-365/admin/manage/centralized-deployment-faq).

<!--
### Prerequisites

- Microsoft 365 or Exchange Server
- Users are assigned a Microsoft 365 license.
- Your Microsoft 365 account or Exchange account has the Global Administrator or Exchange Administrator role.
- Centralized Deployment works for your organization. For more information, see [Determine if Centralized Deployment of add-ins works for your organization](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).

### Set up the Business Central environment

1. Set up Azure Active Directory (Azure AD) authentication.

    For more information, see [Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).
2. Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

    For more information, see [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).

3. Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

    For more information, see [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)

### Deploy the add-in
-->
1. Verify that Centralized Deployment works for your organization.

   For more information, see [Determine if Centralized Deployment of add-ins works for your organization](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).
2. In Business Central, choose the ![Lightbulb that opens the Tell Me feature.](../developer/media/search_small.png "Tell me what you want to do") icon, enter **Assisted Setup**, and then choose the related link.
3. Choose **Outlook Add-in Centralized Deployment** > **Next**.
4. In the **Deploy** column, select the check box for the add-ins that you want to deploy, then choose **Download and Continue**.

    A file named OutlookAddins.zip is downloaded to your device.
5. On the **Where do you want to deploy to?** page, set **Deploy Add-in to** to either **Microsoft 365** or **Exchange Server**, then choose **Next**.
6. At this point, you're finished with the work you need to do in Business Central, so you can choose **Done**.

   >[!TIP]
   > Before you choose **Next**, select the **Go to Microsoft 365 (opens in a new window)** or **Learn more about the add-in for Outlook in Exchange Server** link to open or get help on the admin center you'll use to complete the setup.
7. Go the folder where the OutlookAddins.zip file was downloaded, and extract the **Content Insights.xml** and **Document View.xml** files from the .zip to a folder of your choice.

    For more information, see [Zip and Unzip files and folders](https://support.microsoft.com/en-us/windows/zip-and-unzip-files-8d28fa72-f2f9-712f-67df-f80cf89fd4e5).

8. For Microsoft 365 deployment, sign in to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2163967). For Exchange Server deployment, sign in to Exchange admin center.<!--https://admin.microsoft.com/#/Settings/AddIns-->

9. Upload the add-in files as custom add-ins in the admin center you're working with:

    - For Microsoft 365 admin center, follow the steps at [Deploy add-ins in the admin center](/microsoft-365/admin/manage/manage-deployment-of-add-in).
    - For Exchange admin center, follow the steps at [Install or remove add-ins for Outlook for your Exchange organization](/exchange/install-or-remove-outlook-add-ins-2013-help).
    <!--Go to the **Settings** > **Add-ins** page. If you don't see the **Add-in** Page, go to the **Settings** > **Integrated apps** > **Add-ins** page.-->

    In this step, you assign users and deploy the add-ins.

> [!IMPORTANT]
> An add-in can take up to 24 hours before users see the add-in in Outlook app.

After you finish, you can always change the deployment in admin center, like assigning more users.

## <a name="automated-individual-deployment"></a>Automated individual deployment

With this deployment option, users install the Business Central add-in for Outlook for themselves only. This deployment option uses a registered application in Azure Active directory with Exchange web service permission, so users don't have to upload the add-ins manually in Outlook. When using the add-in, users don't have to sign in the Business Central because authentication against the Exchange or Microsoft 365 is done using an authentication token.

If you've prepared for deployment as described earlier, then as an admin, the only remaining task is to set up an application registration in Azure AD. Then, users can start to install the add-in in Outlook.
<!--
### Prerequisites

- Microsoft 365 with Exchange Online or Exchange Server
- Users are assigned a Microsoft 365 license.-->

### Register an application in Azure Active Directory

<!--
### Set up the Business Central environment

1. Set up Azure Active Directory (Azure AD) authentication.

    For more information, see [Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).
2. Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

    For more information, see [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).

3. Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

    For more information, see [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)
4. Create an application registration for Business Central in Microsoft Azure and register it in Business Center.

    Register an application that has delagated Exchange web service (EWS) permission. You can modify an existing application or create a new one. For more information, see [Registering [!INCLUDE[prod_short](../developer/includes/prod_short.md)] On-Premises in Azure AD for Integrating with Other Services](/dynamics365/business-central/dev-itpro/administration/register-app-azure).-->

In the Azure portal, add an application registration for Business Central in your Azure AD tenant. Give the registered app delegated permission to Exchange web service (EWS). After you've added the registered app in Azure AD, set up Business Central to use it by using the **Set up your Azure Active Directory accounts** assisted setup.

For more information about how to complete this step, see [Registering [!INCLUDE[prod_short](../developer/includes/prod_short.md)] On-Premises in Azure AD for Integrating with Other Services](register-app-azure.md).

### Get the add-in (users)

After you complete the Business Central setup, users deploy the add-in by using **Get Outlook Add-in** assisted setup in Business Central. For more information, see [Install the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook#onprem).

## <a name="manual-individual-deployment"></a>Manual individual deployment

With this deployment option, users install the Business Central add-in for Outlook for themselves only. Unlike the individual acquisition (automated) deployment option, users will have to download the add-in files from Business Central, then manually add them in Outlook. If you've prepared your deployment as described earlier, the only step remaining is for users to get the add-in.  

<!--
### Prerequisites

- Microsoft 365 with Exchange Online or Exchange Server
- Users are assigned a Microsoft 365 license.

### Set up the Business Central environment

1. Set up Azure Active Directory (Azure AD) authentication or NavUserPassword.

    For more information, see [Authenticating Business Central Users with Azure Active Directory](authenticating-users-with-azure-active-directory.md).
2. Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

    For more information, see [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).

3. Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

    For more information, see [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)
-->
### Get the add-in (users)

After you complete the Business Central setup, users deploy the add-in by using **Get Outlook Add-in** assisted setup in Business Central. For more information, see [Install the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook#onprem).

<!--
## <a name="server"></a>Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins

You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the **Set-NAVServerConfiguration** cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Client Services** section, set the **Exchange Auth. Metadata Location** setting to the URL for the Exchange authentication metadata document of the authority that is allowed to sign the Exchange identity token.

    Alternatively, with the Set-NAVServerConfiguration cmdlet, set the ```ExchangeAuthenticationMetadataLocation``` key.

    This setting is used to confirm the identity of the signing authority when using Exchange authentication. In part, this includes the URL of the Exchange mail server. The field accepts a wild card URL. So for example, if the URL of the Exchange mail server is ```https://mail.cronus.com```, then you can set this to ```https://mail.cronus.com*```. The default value is ```https://outlook.office365.com/```.

2. Set the **Web Client Base URL** setting to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

 This is the root portion of all URLs that are used to access pages in the web client. This must have the format `https://[hostname:port]/[instance]`, such as such as `https://MyNavWebServer:443/BC130`.

 With the **Set-NAVServerConfiguration** cmdlet, set the ```PublicWebBaseUrl``` key.-->

<!--
## Organization deployment as an Exchange administrator

With an Exchange Server or Exchange Online administrator account, you can deploy the add-ins for the entire organization. There are two ways to deploy the add-ins:

- Run the **Outlook for Business Central** assisted setup in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and choose the **My Organization** option. This method deploys both the Contact Insights and Document View add-ins.
- Use the **Office Add-ins Management** page. The **Office Add-ins Management** page lets deploy  the Contact Insights and Document View add-ins individually.

Both methods will lead you through the deployment. The information that you must provide depends on whether you are using Exchange Online (or Microsoft 365) or Exchange Server, and the user authentication method that is used by [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

- For Exchange Online or Microsoft 365

    If [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for NavUserPassword authentication, you must provide an email address and password for an Exchange administrator account. If [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for Azure AD authentication, you are not prompted for these credentials because authentication against the Exchange or Exchange Online is done using an authentication token.

- For Exchange Server

  Exchange Web Services (EWS) and Autodiscover will try to find the local Exchange Server:

  - If EWS is not set up, you will receive an error message.
  - If Autodiscover cannot find the Exchange Server, you are prompted for an Exchange administrator email and password, and the local Exchange PowerShell endpoint. The Exchange PowerShell endpoint is a URI that has the format ```https://<ExchangeMailboxServer>/PowerShell```.  ```<ExchangeMailboxServer>``` is the fully qualified domain name of the Exchange Server, such as ```https://mail.cronus.com/PowerShell```.  -->

<!--
### Individual user deployment

To deploy both the **Contact Insight** and **Document View** add-ins, users run the **Outlook for Business Central** assisted setup in their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and choose the **My Mailbox** option. Depending on the user authentication method used by [!INCLUDE[prod_short](../developer/includes/prod_short.md)], users will have to provide their email address and password:

- If [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for NavUserPassword or Access Control Service authentication, users must provide their Exchange email address and password.
- If [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for Azure AD authentication, users are not prompted for their email credentials because authentication against the Exchange or Exchange Online is done using an authentication token.
-->

## See Also  

[Deploying Business Central](../deployment/deployment.md)  
[Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook?toc=/dynamics365/business-central/dev-itpro/toc.json)  
