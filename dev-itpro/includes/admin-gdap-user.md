---
author: edupont04
ms.topic: include
ms.date: 05/09/2022
ms.author: edupont
---
Delegated administrators are not visible in the customer's Azure AD user list and cannot be managed by the customer's internal admin. However, when a delegated admin logs into a Business Center environment on behalf of a customer, they are automatically created as a user inside the Business Central environment. This way, the actions performed by a delegated admin are logged in Business Central, such as posting documents, and associated with their user ID.  

With *granular delegated admin privileges (GDAP)*, the user is shown in the **Users** list and can be assigned any permissions. They are not shown with name and other personal information but with their company name and a unique ID. Both internal and external admins can see these users in the **Users** list, and they have full transparency into what these users do through the [change log](/dynamics365/business-central/across-log-changes), for example. But they can't see the actual name of these users. GDAP users are listed with user names in the following format: `User123456@partnerdomain.com`. They might have a user name that reflects the partner's company name, and the email address is not the person's actual email address. This way, the GDAP user accounts do not reveal personal information. If you need to find out who the person behind such a pseudonym is, you'll have to reach out to the company that this user works or worked for.  

