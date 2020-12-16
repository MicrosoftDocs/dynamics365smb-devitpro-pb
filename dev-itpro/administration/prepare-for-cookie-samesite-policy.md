---
title: Cookie Samesite policy
description: Deploy and administer the Web server to support the latest in browser cookie-handling policies.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---

# Preparing Dynamics NAV or Dynamics 365 Business Central for Upcoming Changes to Browser Cookie Policy

The web is constantly evolving to improve the user experience, security, and privacy. Upcoming releases of some browsers expected early calendar year 2020 include a change in how cookies are handled. This change affects federated authentication flows and cross-domain hosting scenarios when using these browsers. The change can potentially affect users' ability to connect to [!INCLUDE[prod_short](../includes/prod_short.md)] or Dynamics NAV in one or more of the following situations:

- When using the Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] Outlook Add-In.
- Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] as a SharePoint app.
- Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] is using Azure Active Directory authentication.
- Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] is embedded in an iframe as part of another web site.

## Which browsers are impacted by the change

- Google Chrome (major version 80, currently scheduled for release on February 4, 2020)
- Microsoft Edge (as an update at the same time or later than Google Chrome version 80)

> [!NOTE]
> Other supported browsers may adopt similar cookie policies. We recommend you read this article and take action no matter which browsers or browser versions your users use to sign in to [!INCLUDE[prod_short](../includes/prod_short.md)].

## Which cookie policies are changing

Browsers have changed the implementation of the `SameSite` attribute according as follows:

- Cookies default to `SameSite=Lax`

    By default, if no `SameSite` attribute is specified, then cookies are treated as `SameSite=Lax`. For more information from Google Chrome, see [Cookies default to SameSite=Lax](https://www.chromestatus.com/feature/5088147346030592).
- Reject insecure `SameSite=None` cookies

    If a cookie that requests `SameSite=None` isn't marked Secure, it will be rejected. For more information Google Chrome, see [Reject insecure SameSite=None cookies](https://www.chromestatus.com/feature/5633521622188032).


## What to do to prevent disruption

To prevent disruption, you must upgrade the platform for your version of Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] to an update listed in the following table, or a later update. If your deployment is already running on one of these updates or later, then no action is required. However, we recommend that you test your deployment with any available pre-release versions of the affected browsers, such as Chrome 80 Beta.  

|Version|Minimum recommended update|
|-------|--------------------------|
|Dynamics NAV 2015|[61](https://support.microsoft.com/help/4528700/cumulative-update-61-for-microsoft-dynamics-nav-2015-build-51641)|
|Dynamics NAV 2016|[49](https://support.microsoft.com/help/4528701/cumulative-update-49-for-microsoft-dynamics-nav-2016-build-51640)|
|Dynamics NAV 2017|[36](https://support.microsoft.com/help/4528702/cumulative-update-36-for-microsoft-dynamics-nav-2017-build-30074)|
|Dynamics NAV 2018|[23](https://support.microsoft.com/help/4528703/cumulative-update-23-for-microsoft-dynamics-nav-2018-build-37606)|
|Dynamics 365 365 Business Central Fall 2018|[13](https://support.microsoft.com/help/4528704/cumulative-update-13-for-microsoft-dynamics-365-business-central-on-pr)|
|Dynamics 365 Business Central Spring 2019|[06](https://support.microsoft.com/help/4528705/cumulative-update-06-for-microsoft-dynamics-365-business-central-sprin)|
|Dynamics 365 Business Central 2019 Release Wave 2|[15.2](https://support.microsoft.com/help/4533389/update-15-1-for-microsoft-dynamics-365-business-central-2019-release-w)|

> [!NOTE]
> Currently, Chrome 80 implements a temporary mitigation to allow LAX+Post requests in a 2 minute window. This should be enough to make Azure AD authentication work. However, this mitigation will be removed at some point. For more information from Chrome, see [SameSite Updates](https://www.chromium.org/updates/same-site).


### Additional changes required to load balancer configuration

If the web server is hosted inside a web farm, it's important to add the SameSite attribute for the session affinity cookie.
In an IIS web farm, you can do this by adding additional rewrite rules in the system web.config file as follows:

```
<rule name="Add SameSite Cookie Flag to ArrAffinity cookie" enabled="true">
    <match serverVariable="RESPONSE_Set_Cookie" pattern="ARRAffinity=.*" />
        <conditions>
            <add input="{R:0}" pattern="SameSite=(Lax|Strict|None)" ignoreCase="true" negate="true" />
            <add input="{HTTP_USER_AGENT}" pattern="Macintosh; Intel Mac OS X 10_14.+Version/.*Safari" ignoreCase="true" negate="true" />
            <add input="{HTTP_USER_AGENT}" pattern="CPU iPhone OS 12" ignoreCase="true" negate="true" />
            <add input="{HTTP_USER_AGENT}" pattern="iPad; CPU OS 12" ignoreCase="true" negate="true" />
        </conditions>
        <action type="Rewrite" value="{R:0};SameSite=none" />
</rule>
```

This rule will append the `SameSite=none` attribute to the `ARRAffinity` cookie except for older versions of Safari and iOS browsers that have known limitations with handling `SameSite` attributes.


### Testing

To test your solution, use Chrome 80 Beta version. To download Chrome 80 beta version, go to [https://www.google.com/chrome/beta/](https://www.google.com/chrome/beta/).

You can also test on older Chrome versions by manually enabling the SameSite flag. To do the following steps:

1. Start Chrome browser.
2. In the **Address**, type `chrome://flags`.
3. Set **SameSite by default cookies** to **Enabled**.
5. Set **Cookies without SameSite must be secure** to **Enabled**.

For more information about testing on older Chrome versions, see [https://docs.microsoft.com/aspnet/samesite/system-web-samesite#test-with-chrome](https://docs.microsoft.com/aspnet/samesite/system-web-samesite#test-with-chrome).

### Known issue with Dynamics NAV cumulative updates for November and December

In Chrome 80 Beta or older Chrome versions where **Cookies without SameSite must be secure** (`chrome://flags/#cookies-without-same-site-must-be-secure`) is **Enabled**, the web client won't load when using HTTP protocol. A fix for this issue will be included in the January 2020 updates. For now, the workaround is to either switch to HTTPS or set `chrome://flags/#cookies-without-same-site-must-be-secure` to **Disabled**.

### FAQ

**Is access from mobile apps affected?**  
In the short-term, the Dynamics NAV or [!INCLUDE[prod_short](../includes/prod_short.md)] store apps for tablet and phone shouldn't be affected. However, there's evidence from each of the major browsers that their new security policies will eventually also roll out to the technology that our mobile apps rely on. We recommend you minimize risk and take action as outlined in this article.

**Are Control Add-Ins affected?**  
Custom control add-ins sometimes rely on [!INCLUDE[prod_short](../includes/prod_short.md)]'s authentication with Azure AD. Whether this is impacted by the cookie policy changes is highly dependent on your implementation to handle Azure AD. We recommend you minimize risk and take action as outlined in this article.

**Is the Dynamics NAV Windows Client affected?**  
The Dynamics NAV Windows client may be configured to authenticate using Azure AD. In this case, the change in cookie policy has no effect on access to the Windows client.

