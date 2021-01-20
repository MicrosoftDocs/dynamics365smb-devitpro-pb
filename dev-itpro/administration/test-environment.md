---
title: Preparing test environments of Business Central
description: Get an overview of your options for deploying test environments for Dynamics 365 Business Central for performance testing.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 10/01/2020
---
# Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

As a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] reselling partner, you might want to have an environment that you can use for testing or pre-sales demonstrations. You can create such environments based on free 30 day trials, or you can set up a dedicated environment if you have a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] subscription yourself.  

## Test environments based on a 30 day trial

This type of environment can be useful if you want to run benchmark tests, for example. The following procedure requires CSP access in Partner Center. If you do not have CSP access, you can work with your CSP distributor to do this for you. For more information, see the [Partner Center documentation](/partner-center/customer-subscriptions).  

### To create a test environment based on a 30 day trial

1. In Partner Center, create a new test customer with any test domain, such as *contoso.onmicrosoft.com*. For more information, see [Add a new customer](/partner-center/add-a-new-customer) in the Partner Center docs.

    1. Fill in the fields as described in the following list:

        |Field  |Value  |
        |-------|-------|
        |**Country**| \<Your country\> |
        |**Subscription**     | *Dynamics 365 Business Central Premium Trial* </br></br>This will give you 25 Premium licenses for 30 days for free|

    2. Make a note of the Admin credentials that are shown on the last page of the customer creation wizard. You will need these credentials later.  

2. In Partner Center, once the test customer has been created, create a new test user. For more information, see [Create user accounts for a customer](/partner-center/assign-licenses-to-users#create-user-accounts-for-a-customer) in the Partner Center documentation.

3. Assign that user 1 Premium license.

    > [!NOTE]
    > It may take up to 10 minutes for the available licenses to show up on the **Users** page.

    Also, make a note of the user credentials shown on the last page of the user creation wizard. You will use this information in step 55

4. In the **Service Management** section, choose the **Dynamics 365 Business Central** link.

    This opens the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] at the equivalent of the following URL: `https://businesscentral.dynamics.com/contoso.onmicrosoft.com/admin`

    In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you can create new production and sandbox environments for the test customer.

    > [!TIP]
    > Always include the domain or the Azure Active Directory ID of the customer in the URL when you login as a *delegated admin*. This way, you always know exactly which customer you are trying to access.

5. Access [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as the local user that you created in step 2.

    1. Open another browser window in InPrivate or Incognito mode. This way, you can make sure that you are not logging in with your own credentials.

        > [!TIP]
        > We recommend that you use profiles in the Microsoft Edge browser instead. For more information, see [Microsoft Edge documentation](/microsoft-edge/).

    2. Go to *[https://businesscentral.dynamics.com/](https://businesscentral.dynamics.com/)*, and then, when you are asked to sign in, use the credentials of the user you created in step 2.

The [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment is created automatically when you use the environment URL to login the first time.  

## Prepare for major updates with preview environments

About two months before a major update, you can try out new functionality in preview environments. For more information, see [Prepare for major updates with preview environments](preview-environments.md).  

## See also

[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Preparing Demonstration Environments](demo-environment.md)  
[Prepare for major updates with preview environments](preview-environments.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Deployment of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../deployment/Deployment.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products)  
