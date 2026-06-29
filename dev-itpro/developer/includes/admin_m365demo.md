---
author: dmc-dk
ms.topic: include
ms.reviewer: jswymer
ms.date: 05/20/2026
ms.author: jswymer
---

1. Sign in to [aka.ms/cdx](https://aka.ms/cdx) by using your partner account.
1. Use the **Search** box to find the following demo experiences:

   - Dynamics 365 Business Central Demo
   - Dynamics 365 Business Central
   - Microsoft 365 Business Premium Demo

   Not sure which experience to choose? Experiences are available in both 90-day and 1-year versions. Learn more in [Understand the differences between experiences](#understand-the-differences-between-experiences).
1. On the tile for the experience you want to use, select **View experience** to show information about the experience.
1. Under **Customer details**, fill in the information as needed.
1. Under **Tenant details**, select **Claim new tenant**.
1. Set the **Region** as you like.

   This setting determines the Azure region where the tenant is deployed, not the Business Central country/region version. In most cases, choose the region that is closest to your location. You select the country/region version later when you sign up for the Business Central trial.
1. Select **Start demo** to create the new tenant.
1. When the tenant is created, a page appears with details of the tenant. Keep the page open because you need the administrator email and password in the next step.
1. Start a [!INCLUDE [prod_short](prod_short.md)] trial in the new MDX tenant:
   1. In a dedicated browser window, open [https://go.microsoft.com/fwlink/?linkid=2255328](https://go.microsoft.com/fwlink/?linkid=2255328).
   1. Follow the online instructions to fill in the information required to sign up for Business Central. For the email, use the new administrator account email that was set up for the tenant in the previous step.

   > [!TIP]
   > We recommend that you use profiles in the Microsoft Edge browser rather than InPrivate or Incognito browser mode. Learn more at [Microsoft Edge](/microsoft-edge/).

When sign-up is complete, you have a dedicated demonstration organization that includes multiple demo users with Microsoft 365 licenses and a [!INCLUDE [prod_short](prod_short.md)] environment.

Expected result: Verify that these two companies are available in the initial [!INCLUDE [prod_short](prod_short.md)] demo environment:

- The CRONUS demonstration company
- An empty company with the name *My Company* (the display name might differ for demo purposes)

#### Understand the differences between experiences

All three experiences support the same core Business Central scenarios and include Microsoft 365 apps, such as Office apps, Teams, and Microsoft 365 Copilot.

The main differences are in the Power Platform configuration—specifically, Dynamics 365 apps availability and Dataverse and AI Builder default setup. The following table summarizes the key differences across tenants created from different experiences.

| Category | Dynamics 365 Business Central Demo | Dynamics 365 Business Central | Microsoft 365 Business Premium Demo |
|-|-|-|-|
| Licensing | Microsoft 365 E5, Dynamics 365, Business Central, Power Apps Plan 2 | Microsoft 365 E5, AI Builder | Microsoft 365 Business Premium |
| Dynamics 365 apps in Power Platform | ✅ | ❌ | ✅ |
| Dataverse enabled by default in Power Platform | ✅ | ❌ | ❌ |
| AI Builder in Power Platform | ✅ | ✅ | ✅ |

> [!NOTE]
> - Some Business Central features integrate with Dataverse, such as Dynamics 365 Sales integration and Power Platform scenarios. These features are optional and don't affect core Business Central functionality.
> - AI Builder requires Dataverse and sufficient capacity. Some capabilities might appear in a tenant after additional configuration or trials. The table reflects the default configuration of each experience.

##### When to use each content pack

- **Dynamics 365 Business Central Demo**: Use for end-to-end demos and scenarios that combine Business Central with Power Platform and Dynamics 365 apps.
- **Dynamics 365 Business Central**: Use for testing, validation, or documentation scenarios where a simpler Dataverse-only environment is sufficient.
- **Microsoft 365 Business Premium Demo**: Use for small and medium business scenarios that combine Microsoft 365 capabilities with Business Central and Power Platform, making it well suited for demonstrating end-to-end business workflows that extend beyond ERP.

