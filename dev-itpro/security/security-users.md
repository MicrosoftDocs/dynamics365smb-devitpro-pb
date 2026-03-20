---
title: Security Tips for Business Users
ms.reviewer: jswymer
description: Learn essential security tips for business users to protect devices and data in Business Central. Discover best practices for safe browsing, MFA, and more.
ms.date: 12/04/2025
ms.topic: article
author: jswymer
ms.author: jswymer
---

# Security tips for business users

This article describes how you can work with users and configure their devices to improve security.

> [!IMPORTANT]
> Use this article together with industry standard security practices for securing users and their access to company data.

## Enforce separation of duties for sensitive operations

In Business Central, use built-in features like Approval Workflows to ensure critical transactions (like large payments, purchase orders, or journal postings) require approval by a second person. This practice reduces the risk of fraud or mistakes by a single user.

## Establish out-of-band verification for high-value transactions

For example, some organizations use a pre-agreed 'safety word' or callback procedure to confirm any unusual payment requests. Training employees to verify before acting can prevent scams.

## Kiosks and shared devices

Customers using kiosks, where multiple users sign in to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with their own identity from a single terminal, should apply extra security practices for an appropriate level of isolation between users:

- Before ending a session at the kiosk, business users should remember to sign out of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], then close all browser windows. Closing the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] browser tab or closing the browser without signing out might not fully complete the sign-out process.
- Each user should use private or guest browsing modes so that any data cached by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is discarded when the browser closes. Private or guest browsing can degrade some [!INCLUDE[prod_short](../developer/includes/prod_short.md)] features and performance optimizations that are only available when the browser provides access to its storage mechanisms.

## Related information  

[Security and Protection](security-and-protection.md)  
[Application Security](security-application.md)  
[Online Security](security-online.md)  
[On-Premises Security](security-onpremises.md)  
