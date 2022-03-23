---
author: edupont04
ms.topic: include
ms.date: 12/10/2021
ms.author: edupont
---
Before a major update, Microsoft routinely checks per-tenant extensions in all existing environments for compatibility with the next major update. If we detect compatibility issues with the upcoming version, we send email notifications that describe the detected issues to the notification recipients. We warmly encourage all admins to review these emails and take action as soon as possible.  

If you discover any such issues, apply the changes to your solution as usual using Visual Studio Code. Test the new app in a sandbox environment that runs on the new major version, either in preview or the official version. If tests complete successfully, upload the new app version into your production environment in the **Extension Management** page, setting the **Deploy to** field to **Next major version**. This way the compatible version of your app will be used when your environment is updated. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization.md).  
