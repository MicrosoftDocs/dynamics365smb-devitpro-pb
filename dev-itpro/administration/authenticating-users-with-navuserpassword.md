---
title: User Authentication with NavUserPassword
description: Learn how to set up NAVUserPassword for authenticating users.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
---
# Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with NavUserPassword

NavUserPassword is an authentication method that's handled by [!INCLUDE[server](../developer/includes/server.md)], but isn't based on Windows users or Active Directory. Each user is set up with a user name and password that's configured inside [!INCLUDE[prod_short](../developer/includes/prod_short.md)] only. The user is prompted for username/password credentials when they start the client.

## Preparation

Obtain and set up security certificates on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment. NavUserPassword authentication requires the use of service certificates to help secure client connections over a wide area network (WAN). In a production environment, you should obtain a certificate from a certification authority or trusted provider. In a test environment, if you don't have a certificate, then you can create your own self-signed certificate. The implementation of certificates involves installation and configuration of the certificates on the [!INCLUDE[server](../developer/includes/server.md)] server and client computers.

For more information, see [Using Certificates to Secure Connections](../deployment/implement-security-certificates-production-environment.md).

> [!IMPORTANT]
> As you follow the instructions, **don't** change the credential type used by [!INCLUDE[server](../developer/includes/server.md)] and [!INCLUDE[webserver](../developer/includes/webserver.md)] for now. You'll change it later in this article.

## <a name="task1"></a>Task 1: Set up your Business Central user account with a password

You can postpone this task for other users, but you must do this task for your user account. If you don't, you won't be able to sign in to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] after you switch to NavUserPassword authentication.

1. Open the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.
2. Go to the **Users** page, then open your user account.
3. Under **Business Central Password Authentication**, choose the ![Review or update the value for password.](../developer/media/ellipse-button.png ) button next to the **Password** field.
4. Enter the password in the **Password** and **Confirm Password** fields, then choose **OK**.

You're now done with setting up your account.

## Task 2: Configure [!INCLUDE[server](../developer/includes/server.md)]

You can configure the [!INCLUDE[server](../developer/includes/server.md)] by using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

# [Administration Tool](#tab/admintool)

[!INCLUDE[admin_tool_deprecated](../developer/includes/admin_tool_deprecated.md)]

1. Open the [!INCLUDE[admintool](../developer/includes/admintool.md)].

2. In the **General** tab, set the **Credential Type** to **NavUserPassword**.

3. Restart the server instance.

For more information about the tool, see [Business Central Server Administration Tool](administration-tool.md).

# [Administration Shell](#tab/adminshell)

1. Run [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
 
    To configure the server instance in the next steps, you'll use the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).

2. Set the `ClientServicesCredentialType` to `NavUserPassword`.

   ```powershell
   Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ClientServicesCredentialType -KeyValue NavUserPassword
   ```

3. Restart the server instance.

   ```powershell
   Restart-NAVServerInstance -ServerInstance <BC server instance name>
   ```

---

## Task 3: Configure [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)]

Configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] to use `NavUserPassword` as the credential type. 

1. Open the navsettings.json for the [!INCLUDE[webserver](../developer/includes/webserver.md)] in a text or code editor, such as Notepad or Visual Studio Code.

2. Set the `ClientServicesCredentialType` key value to `NavUserPassword`.

    ```
    "ClientServicesCredentialType":  "NavUserPassword",
    ```

3. Save the navsettings.json file

For more information, see [Configure Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](configure-web-server.md).

## Next steps

1. Set up other [!INCLUDE[prod_short](../developer/includes/prod_short.md)] users with a Business Central password, like you did in [Task 1](#task1).
2. (Optional) Set web service accounts as needed. For more information, see [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: SAML2 token errors with Azure Active Directory/Office 365 Authentication](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  
[Migrating to Multitenancy](../deployment/migrating-to-multitenancy.md)
