---
title: "Security Tips for Business Users"
description: Tips for administrators and business users to secure their devices that access Business Central.
ms.date: 04/01/2021
ms.topic: article
author: mikebc
---

# Security Tips for Business Users

This article describes how you can work with users and configure their devices to improve security.

> [!IMPORTANT]
> Use this article together with industry standard security practices for securing users and their access to company data.

## Enforce separation of duties for sensitive operations

In Business Central, use built-in features like Approval Workflows to ensure critical transactions (like large payments, purchase orders, or journal postings) require approval by a second person. This reduces the risk of fraud or mistakes by a single user.

## Kiosks and shared devices

Customers using kiosks, where multiple users sign in to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with their own identity from a single terminal, should apply additional security practices for an appropriate level of isolation between users:

- Before ending a session at the kiosk, business users should remember to sign out of Business Central, then close all browser windows. Closing the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] browser tab or closing the browser without signing out might not fully complete the signout process.
- Each user should use private or guest browsing modes so that any data cached by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is discarded when the browser is closed. Users should be made aware that private or guest browsing can degrade some [!INCLUDE[prod_short](../developer/includes/prod_short.md)] features and performance optimizations that are only available when the browser provides access to its storage mechanisms.

## Personal security best practices 

- **Think before you click:** Emphasize phishing awareness: Don’t trust unsolicited emails or links that seem “too good” or urgent; if something feels off, double-check with IT. Essentially, “trust your gut” as the slide said. 

- **Enable MFA everywhere:** Reiterate that users should enable 2FA on their accounts (Business Central and others) for significantly improved security. 

- **Keep software updated** Advise users to apply updates to their devices and apps regularly (via official channels) to patch vulnerabilities (this aligns with the slide’s point about staying up-to-date). 

- **Use a password manager:** Encourage using a reputable password manager to generate and store strong unique passwords, rather than re-using or writing them down. 

- **Avoid Using Admin Accounts Daily:** If a user has a privileged account, they should have a separate regular user account for day-to-day work. (In Business Central context, only sign in with the SUPER user role when needed.)

- **Remove unneeded apps/extensions:** Remind users to uninstall software or browser add-ons they don’t need, to reduce attack surface.

- **Backup important data:** – Promote the “3-2-1” backup rule mentioned: at least one local backup, one cloud backup, and one offline (disconnected) backup. Also note that services like OneDrive have ransomware detection and recovery features – but users should still test their backups periodically. 

- **Protect devices:** Suggest measures like enabling full-disk encryption (BitLocker on Windows, FileVault on Mac), using strong passcodes for mobile devices (and biometric unlock for convenience + security), and even covering webcams when not in use (as an extra privacy precaution). 

- **Safe browsing habits:** Recommend using ad-blockers or privacy filters to avoid malicious ads, and using a secure network (VPN when on public Wi-Fi, but “avoid free VPNs” as the slide said).

## Related information  

[Security and Protection](security-and-protection.md)  
[Application Security](security-application.md)  
[Online Security](security-online.md)  
[On-Premises Security](security-onpremises.md)  
