---
title: Get Started Building Apps
description: Learn how you can get started building apps for Dynamics 365 Business Central in six easy steps.
author: a-emniel
ms.topic: article
ms.service: "dynamics365-business-central"
ms.reviewer: edupont
ms.author: kurtju
ms.date: 11/06/2020
---

# Get Started with Building Apps

[!INCLUDE [prodlong](../includes/prodlong.md)] is a business management solution that helps companies connect their financials, sales, services, and operations to streamline business processes, improve customer interactions and make better decisions. With this modern business platform, you can easily and quickly tailor, extend, and build applications so they fit your specific needs with little to no code development.

Build a line-of-business app, such as for a specific industry, process, or department such as HR, finance, marketing, or operations. Then, publish your app to [the Microsoft commercial marketplace](https://appsource.microsoft.com/partners), where customers can find and try your app, and get in touch with you. For more information, see [What is the Microsoft commercial marketplace?](/azure/marketplace/overview).  

Learn how you can become a [!INCLUDE [prodshort](../includes/prodshort.md)] app publisher in six steps in this article.  

## Step 1: Become a partner

Becoming a Microsoft partner gives you access to the Microsoft resources needed to build, market, and sell your apps. You don't have to be a Microsoft partner to begin developing your apps. But all of the steps below are required to gain access to the programs that enable you to publish, market, and sell your apps for [!INCLUDE [prodshort](../includes/prodshort.md)].

### Obtain your work account

Your work account or work email is the email address provided to you by your company. This email is usually in the format `you@yourcompany.com`. More information on work accounts can be found [here](/partner-center/azure-active-directory-tenants-and-partner-center).

[!INCLUDE [admin-partner-mpn](../includes/admin-partner-mpn.md)]

## Step 2: Register as a publisher

The first step to becoming a publisher is to register in Partner Center (PC). PC is where you submit your apps for publication, promote your apps, and manage your offers. To begin the registration process, you must complete [these steps](https://partner.microsoft.com/dashboard/account/v3/enrollment/introduction/azureisv). One of our team members will follow up to help you complete your registration. Once registered, you can access PC.

For more information, see [Partner Center Account](/partner-center/partner-center-account-setup).  

### PartnerSource Business Center (PSBC) account

Developing apps requires you to be known as [!INCLUDE [prodshort](../includes/prodshort.md)] developer and requires you to have a unique development license file with a specific object range.

To obtain an object range for developing a [!INCLUDE [prodshort](../includes/prodshort.md)], you must first have access to PartnerSource Business Center (PSBC). You have access to PSBC if you have one of the following agreements:

- [An active Partner Registration Agreement](https://businesscenter.mbs.microsoft.com/#contentdetail/MSDpartneragreem) (PRA)

- [A Registered Solution Program Addendum](https://businesscenter.mbs.microsoft.com/#contentdetail/RegisterSolutionProgram) (RSPA)

The relevant contract can be requested through your local Regional Operations Center (ROC) Contracts and Agreements Team below:

- [mbscon@microsoft.com](mailto:mbscon@microsoft.com) if you are based in Europe, the Middle East, or Africa

- [mbsagree@microsoft.com](mailto:mbsagree@microsoft.com) if you are based in the Americas

- [mbslques@microsoft.com](mailto:mbslques@microsoft.com) if you are based in the Asia Pacific region.

## Step 3: Your unique app specifications

### Requesting an object range

When you develop an app for [!INCLUDE [prodshort](../includes/prodshort.md)], you must request access to an object range that holds a certain number of objects for your solution. To avoid overlap between objects used in different solution, each partner is assigned a number of objects in a unique object range. For example, a partner is assigned the object range 70,001,000 – 70,001,999. The object range gives them 1000 numbered objects that they can use to develop [!INCLUDE [prodshort](../includes/prodshort.md)] solutions.

Depending on where you will deploy your [!INCLUDE [prodshort](../includes/prodshort.md)] solution, online or on-premises, you can use different licensing methods and object ranges. There are currently two available ranges that you can request. Both have some characteristics to keep in mind:

- The RSP Object Range (1-69 million ID range)

    This object range is tied to [the RSP Program](https://businesscenter.mbs.microsoft.com/#contentdetail/RegisterSolutionProgram) details.

    > [!IMPORTANT]
    > We currently advise NEW publishers NOT to request an RSP object range

- The App Object Range (70-75 million ID range)

    This object range was originally designed to run in the [!INCLUDE [prodshort](../includes/prodshort.md)] service only for apps in the Microsoft commercial marketplace.

    > [!IMPORTANT]
    > We currently advise NEW Publishers to request an App Object Range.

Currently, you can implement apps developed in both the RSP Range and the app object range in [!INCLUDE [prodshort](../includes/prodshort.md)] online and on-premises, as well as partner-hosted.

You can request an object range by downloading the object range request form [here](https://businesscenter.mbs.microsoft.com/#contentdetail/RegisterSolutionProgram). After completion, send them to your Regional Operational Center (ROC) for processing:

- [mbscon@microsoft.com](mailto:mbscon@microsoft.com) if you are based in Europe, the Middle East, or Africa

- [mbsagree@microsoft.com](mailto:mbsagree@microsoft.com) if you are based in the Americas

- [mbslques@microsoft.com](mailto:mbslques@microsoft.com) if you are based in the Asia Pacific region.

### Downloading your development license file

After your Regional Operational Center has processed your Agreements and Object Range Request forms, download your company's unique developer license from [PartnerSource Business Center](https://aka.ms/PSBC). Find it in the license key configuration section under the developer tools section.

### Register your unique prefix or suffix

In your extension, the name of each new application object must contain [a prefix or suffix](/dynamics365/business-central/dev-itpro/compliance/apptest-prefix-suffix). This rule applies to all objects. Email [d365val@microsoft.com](mailto:d365val@microsoft.com) with a prioritized list of three-letter affixes of your choice. You must also submit your MPN ID and the publisher name that you will use for the app.

## Step 4: Getting access to preview bits

Get access to preview builds by joining Microsoft Collaborate.

In Microsoft Collaborate, you get access to a set of [!INCLUDE [prodshort](../includes/prodshort.md)] builds:

- The current major version
- An upcoming major version
- Daily builds

You must have the following prerequisites to register on Microsoft Collaborate:

- Azure Active Directory (Azure AD).

  > [!NOTE]
  > If you have Microsoft 365, then your company most likely has Azure AD

- Azure AD Global Administrator permission

  > [!NOTE]
  > To find out if your company has an Azure AD account, check with your system administrator.

### Step 4 A: How your Global Administrator must register for Collaborate

Only your company's Global Administrator can start the onboarding to Collaborate. They must register at [https://aka.ms/Collaborate](https://aka.ms/Collaborate), choose the **Get Started** action, and then complete the registration form.  

The administrator can then add the relevant colleagues.  

#### Optional Step: Add your coworkers to Microsoft Collaborate

To add coworkers:

1. Sign in to Microsoft Collaborate with your Global Administrator account at [aka.ms/Collaborate](https://aka.ms/Collaborate).

2. Choose the :::image type="content" source="../media/settings_icon_small.png" alt-text="Settings icon"::: icon in the top-right corner of the page, and then choose **Developer Settings**.

3. Choose **Users** under **Settings** in the grey panel on the left-hand side of the page.

4. Choose the grey **ADD USERS** button, and leave the default choice to **Add existing users** as-is. Now you can search for the user(s) that you want to add to Collaborate. To add them you need to select them from the menu, and then click the grey **ADD SELECTED** button.

5. You have successfully added your coworkers to Collaborate. Users can now sign in to Microsoft Collaborate using the following link: [aka.ms/Collaborate](https://aka.ms/Collaborate)

### Step 4 B: Getting access to the available builds and engagements

Once you have successfully registered on Microsoft Collaborate, Microsoft must assign you to the right programs and engagements before you can see the preview bits. Contact [Dyn365BEP@microsoft.com](mailto:Dyn365BEP@microsoft.com) and provide them with information about the relevant users. the following table illustrates the type of information that you must submit:

| **Publisher Display Name** | **MPN ID** | **First Name** | **Last Name** | **Work account Email** |
|--|--|--|--|--|
| Contoso | 12345 | Eugenia | Lopez | Eugenia.Lopez@Contoso.com |
| Contoso | 12345 | Quincy | Watson | Quincy.Watson@Contoso.com |

After sending the email, expect a response from Microsoft within 1-2 business days.

## Step 5: Resources while you develop your solution

Find below some guiding resources on how to develop your apps for [!INCLUDE [prodshort](../includes/prodshort.md)].

- Microsoft Learn

    Learn new skills and discover the power of Microsoft products with step-by-step guidance. Start your journey today by exploring our [learning paths and modules](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs).

- Microsoft Docs

    Find [The developer and administration content on Microsoft Docs](/dynamics365/business-central/dev-itpro/)

- Join the conversation

    In the dedicated Yammer network, [join the conversation on developing apps](https://www.yammer.com/dynamicsnavdev/#/threads/inGroup?type=in_group&feedId=41498640384&view=all)

- Join the monthly Office hour calls

    Join the monthly [Office hour calls](https://aka.ms/ReadyToGoOfficeHours) to learn more about a hot topic

- Get coaching from experts

    Need help with developing your apps? There is a community of [ISV Development Centers](https://partner.microsoft.com/isv-resource-hub/development-centers) specialized in [!INCLUDE [prodshort](../includes/prodshort.md)] ready to engage with you.

### Set up Azure DevOps for your development processes

Optionally, use the CI/CD workshop document at [https://aka.ms/cicdhol](https://aka.ms/cicdhol) if you want to do it yourself. Alternatively, choose between vendors offering tools or services around DevOps.

Talk to one of the [ISV Development Centers](https://partner.microsoft.com/isv-resource-hub/development-centers) for guidance.

## Step 6: Publish your app in the Microsoft commercial marketplace

Once your app is ready for submission, you can list your app in the Microsoft commercial marketplace by submitting it in [Partner Center](https://partner.microsoft.com/dashboard/commercial-marketplace/overview). For more information, see [Create a Dynamics 365 Business Central offer](/azure/marketplace/partner-center-portal/create-new-business-central-offer).

Before you submit, we recommend that you review the [technical validation checklist](/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission) and [marketing validation checklist](/dynamics365/business-central/dev-itpro/developer/readiness/readiness-checklist-marketing). The two articles list all requirements that you **must meet before you submit** an app for validation. If you do not meet these mandatory requirements, your extension will fail validation

## See also

[The Lifecycle of Apps and Extensions for [!INCLUDE [prodshort](../includes/prodshort.md)]](../devenv-app-life-cycle.md)  
[Update Lifecycle for AppSource Apps FAQ](../devenv-update-app-life-cycle-faq.md)  
[Maintain AppSource Apps and Per-Tenant Extensions in [!INCLUDE [prodshort](../includes/prodshort.md)] Online](../app-maintain.md)  
[Microsoft Responsibilities for Apps on [!INCLUDE [prodshort](../includes/prodshort.md)] online](../../deployment/microsoft-responsibilities.md)  
