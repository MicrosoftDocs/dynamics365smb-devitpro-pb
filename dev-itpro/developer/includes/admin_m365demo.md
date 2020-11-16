---
author: dmc-dk

ms.service: dynamics365-business-central
ms.topic: include
ms.reviewer: edupont
ms.date: 10/01/2020
ms.author: dmitrych
---
1. Log in to [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com/) using your partner account.
2. Choose the **My Environments** tab, and then, under **My tenants**, choose the **Create Tenant** button.
3. As the type, choose **Quick Tenant**.
4. As the period, choose either a quarter or a full year.

    As a partner, you can have 1 one year tenant at a time. So if you want more tenants, we suggest that you choose 90-Day tenants.
5. As the location, choose the region that is closest to your location.

    The list of locations includes specific countries, but the [!INCLUDE [prodshort](prodshort.md)] content pack is only available for the regions North America, Asia/Pacific, and Europe, Middle East, Africa.

6. Choose the **Dynamics 365 Business Central** content pack, and then choose the **Create Tenant** button.

    The content pack gives you all you need for the next step. Alternatively, use the **Microsoft 365 Business Premium Demo Content** or **Microsoft 365 Enterprise Demo Content** content packs so that you can get more users for your demo and other scenarios. These content packs are also useful for when you want to demo more complex Microsoft 365 integration scenarios, or if you want to make sure that you get a [!INCLUDE [prodshort](prodshort.md)] tenant for a specific country, for example.

7. In an dedicated browser window, go to [https://businesscentral.dynamics.com/?redirectedFromSignup=1&response=AlreadyAssignedLicense](https://businesscentral.dynamics.com/?redirectedFromSignup=1&response=AlreadyAssignedLicense) and log in with the new administrator account that you created, typically called something like admin@CRMbc123456.onmicrosoft.com.

    > [!TIP]
    > We recommend that you use profiles in the New Edge browser rather than InPrivate or Incognito browser mode. For more information, see [Microsoft Edge documentation](/microsoft-edge/).

    If you chose another content pack, you must use the administrator account to sign up for a standard trial by choosing the **Get started** button on the [https://dynamics.microsoft.com/en-us/business-central/](https://dynamics.microsoft.com/en-us/business-central/) page. The **Dynamics 365 Business Central** content pack gives you a more integrated experience with Microsoft 365, but otherwise the trial experience is the same.

The content pack gives you a [!INCLUDE [prodshort](prodshort.md)] environment with two companies:

- The CRONUS demonstration company
- An empty company with the name *My Company*, but it might have a different display name for demo purposes

If you go to the **Companies** list in [!INCLUDE [prodshort](prodshort.md)], you will see that the demonstration company is marked as an evaluation company and does not have a subscription. The missing subscription means that you must switch to the empty *My Company* if you want to demo something that requires a subscription.  

You can use the demonstration company for as long as you like. Provided that you use it at least a couple of times per week, the company remains available for as long as your Microsoft 365 account is still valid.  

Because you are logged in as the internal Microsoft 365 administrator, you can now go to the [!INCLUDE [prodadmincenter](prodadmincenter.md)] and create a new production or sandbox environment, depending on your needs. For more information, see [Managing Environments](../../administration/tenant-admin-center-environments.md).  

In this new environment, you can set things up the way you want. You can log in with the demo user account, often called meganb@M365B123456.onmicrosoft.com, or something similar, for the non-administrator experience. You can also switch to the empty My Company in this environment, and then, when the 30-day trial expires, you just create a new environment. You can use Excel or RapidStart Services to reuse data, for example.  

This tenant includes Microsoft 365 for each of the users, so that you can run the **Set up your Business Inbox in Outlook** assisted setup guide on behalf of the organization and demo this feature. For more information, see [Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook). You also have access to other apps, such as [Dynamics 365 Customer Service](/dynamics365/customer-service/index), [Dynamics 365 Sales](/dynamics365/sales-enterprise/overview), [Power Automate](/power-automate/), [Power Apps](/powerapps/), and many more.  
