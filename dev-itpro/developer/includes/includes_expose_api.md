In the app registration, expose the Business Central API with a scope requiring admin and user consent:

1. Sign in to [Microsoft Entra admin center](https://entra.microsoft.com) and open the app rgistration.
1. Select **Expose an API**.
1. If there's no value for **Application ID URI**, select **Add** > **Save**. Make note of the Application ID URI for later.
1. On the **Expose an API** page, select **Add a scope** and configure these settings:

    |Setting|Value|Example|
    |-|-|-|
    |Scope name|Specify a meaningful name for a permission scope.|BusinessCentralOnPrem.Access|
    |Consent|Choose **Admins and users**.||
    |Admin consent display name|Specify a meaningful name for admin consent.|Access Business Central as the signed-in user|
    |Admin consent description|Specify a meaningful description.|Business Central is a business management solution that helps organizations work smarter, adapt faster, and perform better.|
    |User consent display name|Specify a meaningful name for user consent.|Have full access to Business Central|
    |User consent description|Specify a meaningful description.|Allow the application full access to Dynamics 365 on your behalf.|

1. Make a note of the scope's name on the **Expose an API** page and app registration's display name on the Overview page. You might need this information later.

Learn more in [Configure an application to expose a web API](/entra/identity-platform/quickstart-configure-app-expose-web-apis#add-a-scope).