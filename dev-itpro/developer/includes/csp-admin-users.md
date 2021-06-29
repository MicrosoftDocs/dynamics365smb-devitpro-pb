---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 04/01/2021
ms.author: edupont
---
In the Microsoft Partner Center documentation, you can learn how to [request a reseller relationship with customers](/partner-center/request-a-relationship-with-a-customer), [assign licenses to users](/partner-center/assign-licenses-to-users), and [create new subscriptions](/partner-center/create-a-new-subscription). [!INCLUDE[prod_short](prod_short.md)] is one of the subscriptions that you can create, and there are [!INCLUDE[prod_short](prod_short.md)]-specific license types that you can assign to users.  

You must also assign certain roles to users in your own organization so that they can support your customers.  

### Add users from your own organization

In most cases, your partner company includes employees with different responsibilities, and you can assign different roles depending on people's responsibility. This way, you can be very explicit about who from your staff can access your customers' data, for example.

For each user, you can assign permissions for 2 categories of tasks:

- Managing your organization's account

  This controls access to the functionality of the Partner Center portal
- Assisting your customers

  This controls access to your customers' environments

When you establish a reseller relationship with a customer in Partner Center, you must specify which people from your organization will assist that customer's tenant as either *Admin agent* or *Helpdesk agent*. These users can manage implementation, support, and troubleshooting tasks for your customers. Once the reseller relationship with a customer is established, they will be able to login into the [!INCLUDE [prod_short](prod_short.md)] environments of the customer without a license. The number of partner users that can access customer environments is not restricted.  

Both roles will provide your users with exactly the same level of access to the customer's [!INCLUDE [prod_short](prod_short.md)] environment. However, they have very different capabilities to manage the customer's Active Directory and other subscriptions that the customer might have. For more information, see [Admin roles](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#roles-available-in-the-microsoft-365-admin-center).  

This way of accessing customer resources is called *delegated administration*, and the partner users are therefore called *delegated administrators* or *delegated admins* in daily shorthand. For more information, see [Delegated Administrator Access to Business Central Online](../../administration/delegated-admin.md).  

> [!NOTE]
> These users cannot provide accounting services for the customers. For this purpose, the customers must use the **External Accountant** license, which is also available via CSP.  
