---
title: Multifactor authentication 
description: This article explains how to add multi-factor authentication when your solution uses Azure Active Directory as authentication mechanism.
author: jswymer
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 04/01/2021

---
# Multi-Factor Authentication for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]  

When using Azure Active Directory authentication with [!INCLUDE[prod_short](../developer/includes/prod_short.md)], we recommend you take advantage of Azure AD Multi-Factor Authentication (MFA). MFA further safeguards access to the application and data. It delivers single sign-on authentication through a range of verification options, like:

- Phone call
- Text message
- Mobile app notification
- One-time password

It can be used both on-premises and in the cloud to add security for accessing Microsoft online services, remote access applications, and more. For more information, see the [Azure Multi-Factor Authentication documentation](/azure/active-directory/authentication/concept-mfa-howitworks).

## Conditional access support

Conditional Access in Azure Active Directory provides a more granular control of MFA through policies that specify specific Cloud applications that require MFA. When creating Conditional Access policies, consider the following information:

- For Business Central online, you can't select Business Central as a Cloud app. The only way to include Business Central is to select  **All Cloud Apps** for the policy.

- For Business Central on-premises, you assign Business Central as a Cloud App by selecting the Azure AD app registration that's used for Business Central authentication.

For more information about creating policies, see [Conditional Access: Cloud apps, actions, and authentication context](/azure/active-directory/conditional-access/concept-conditional-access-cloud-apps).


## See Also

[Security and Protection](security-and-protection.md)  
[On-Premises Security](security-onpremises.md)  