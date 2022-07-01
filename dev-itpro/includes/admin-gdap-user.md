---
author: edupont04
ms.topic: include
ms.date: 06/30/2022
ms.author: edupont
---
Delegated administrators aren't visible in the customer's Azure AD user list and can't be managed by the customer's internal admin. However, when a delegated admin logs into a [!INCLUDE [prod_short](prod_short.md)] environment on behalf of their customer, they're automatically created as a user inside [!INCLUDE [prod_short](prod_short.md)]. This way, the actions performed by a delegated admin are logged in [!INCLUDE [prod_short](prod_short.md)], such as posting documents, and associated with their user ID.  

With *granular delegated admin privileges (GDAP)*, the user is shown in the **Users** list and can be assigned any permissions. They aren't shown with name and other personal information but with a unique ID and their company name. Both internal and external admins can see these users in the **Users** list, and they have full transparency into what these users do through the [change log](/dynamics365/business-central/across-log-changes), for example. But they can't see the actual name of these users. GDAP users are listed with user names such as `USER_1A2B3C4D5E6F`, and an email address such as `USER_1A2B3C4D5E6F@partnerA.com`, which isn't the person's actual email address. Because they aren't part of their customer's Azure AD, their authentication email address isn't an email address at all but reflects the company that they work for, such as `Partner A`. This way, the GDAP user accounts don't reveal personal information. If you need to find out who the person behind such a pseudonym is, you'll have to reach out to the company that this user works or worked for.  
