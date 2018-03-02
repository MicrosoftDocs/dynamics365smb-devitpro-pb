---
title: "Notifications"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.prod: "dynamics-nav-2018"
---
# Notifications
Notifications provide a programmatic way to send non-intrusive information to the user interface (UI) in the Dynamics NAV Web client. Notifications differ from messages initiated by the MESSAGE function. Messages are modal, which means users are typically required to address the message and take some form of corrective action before they continue working. On the other hand, notifications are non-modal. Their purpose is to give users information about a current situation, but do not require any immediate action or block users from continuing with their current task. For example, you could have a notification that a customer's credit limit is exceeded.

## Notifications in the UI
In the UI, notifications appear in the **Notification** bar (similar to validation errors) at the top of the page on which a user is currently working. The user can then choose to dismiss the notification, which clears it. Or if actions are defined on notification, the user can choose one of the actions.

* There can be multiple notifications. The notifications appear chronological order from top to bottom.
* Notifications remain for duration of the page instance or until the user dismisses them or takes action on them.
* Notifications that are defined on sub-pages, for example in parts and FactBoxes, appear in the same **Notification** bar.
* Validation errors on the page will be shown first.

## Notifications in the development environment
By using the **Notification** and **NotificationScope** data types and functions in C/AL, you can add code to send notifications to users. The following table provides an overview of the available functions. The sections that follow provide additional information about how to create notifications.

|  Function  |  Description  |
|------------|---------------|
|[MESSAGE](function-notificationmessage.md)  |Specifies the content of the notification that appears in the UI.|
|[SCOPE](function-notificationscope.md)     |Specifies the scope in which the notification appears.|
|[SEND](function-notificationsend.md)  |Sends the notification to be displayed by the client.|
|[ADDACTION](function-notificationaddaction.md)  |Adds an action on the notification.|
|[SETDATA](function-notificationsetdata.md)  |Sets a data property value for the notification|
|[GETDATA](function-notificationgetdata.md)  |Gets a data property value from the notification.|
|[RECALL](function-notificationrecall.md)|Recalls a sent notification.|


## Creating and sending a notification
You create a notification by using the **MESSAGE** and **SEND** functions. The **MESSAGE** function defines the message part of the notification. When the **SEND** function is called, the notification is sent to the client and content of the message is displayed.
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SEND;
```
The **SEND** function call should be the last statement in the notification code, after any **ADDACTION** or **SETDATA** function calls for the notification instance.

## Defining the notification scope
The scope is the realm in which a notification is broadcast in the client. There are two different scopes: *LocalScope* and *GlobalScope*.

*   A *LocalScope* notification appears in context of the user's current task, that is, on the page the user is currently working on. *LocalScope* is the default.

* A *GlobalScope* notification is not directly related to the current task. **Note:** *GlobalScope* is currently not supported, so do not use it. This will be implemented in a future release.

The following code creates a notification in the LocalScope:
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SEND;
```
## Adding actions on a notification
You add actions on notifications by using the **ADDACTION** function. This function provides a way for you to create interactive notifications. By default, users have the option to dismiss the notifications. However, there might be cases where you want to provide users with different actions that they can take to address the notification, like opening an associated page for modifying data.

Conceptually, a notification action calls a function in a specified codeunit, passing the notification object in the call. The function includes the business logic for handling the action.

```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.ADDACTION('Action 1',CODEUNIT::"Action Handler",'RunAction1');
MyNotification.ADDACTION('Action 2',CODEUNIT::"Action Handler",'RunAction2');
MyNotification.SEND;
```

The basic steps for adding an action are as follows:

1. Create a global function in a new or existing codeunit. The function must have a **Notification** data type parameter for receiving the notification object.
2. Add C/AL code to the function for handling the action.
3. Specify the codeunit and function in the **ADDACTION** function call.

>[!Important]
>You can have more than one action on a notification. A LocalScope notification can have up to 3 actions. A GlobalScope notification can have up to 2 actions.

## Sending data with a notification
You use the **SETDATA** and **GETDATA** functions to add data to a notification, which is typically needed when actions are invoked. The **SETDATA** function sets, or adds, data to the notification. The data is defined as text in a key-value pair. With the **GETDATA** function, you can then retrieve the data again.

The following code sets data for a notification:
```
MyNotification.MESSAGE := 'This is a notification';
MyNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
MyNotification.SETDATA('Created',FORMAT(CURRENTDATETIME,0,9));
MyNotification.SETDATA('ID',FORMAT(CREATEGUID,0,9));
MyNotification.ADDACTION('Action 1',CODEUNIT::"Action Handler",'RunAction1');
MyNotification.ADDACTION('Action 2',CODEUNIT::"Action Handler",'RunAction2');
MyNotification.SEND;
```
The following code gets the data for a notification:

```
DataValue := MyNotification.GETDATA('Created');
DataValue := MyNotification.GETDATA('ID');
```
## Example
This simple example illustrates how notifications work and provides some insight into how you can use them. This example uses page **42 Sales Order** of the CRONUS International Ltd. demonstration database according to the following.

*   The code compares a customer's balance with their credit limit. If the balance exceeds the credit limit, a notification is sent to the client.
*   The notification includes an action, which has the caption **Change credit limit**, that opens page **21 Customer Card**. This enables the user to increase the credit limit.

To complete the example, follow these steps:

1. In C/AL code for page **42 Sales Order**, add the following variables and text constants:
<table>
  <tr>
    <th>Variable Name</th>
    <th> Data Type</th>
    <th>Subtype</th>
  </tr>
  <tr>
    <td>Customer</td>
    <td>Record</td>
    <td>Customer</td>
  </tr>
  <tr>
    <td>CreditBalanceNotification</td>
    <td>Notification</td>
    <td></td>
  </tr>
  <tr>
    <td>OpenCustomer</td>
    <td>Text</td>
    <td></td>
  </tr>
</table>
<table>
  <tr>
    <th>Text Constant Name</th>
    <th> ConstValue</th>
  </tr>
  <tr>
    <td>Text003</td>
    <td>The customer's current balance exceeds their credit limit.</td>
  </tr>
  <tr>
    <td>Text004</td>
    <td>Change credit limit</td>
  </tr>
</table>

2. Add the notification code on page **42 Sales Order**.

    For this example, add the code on **OnOpenPage** tigger in C/AL .
    ```
Customer.GET("Sell-to Customer No.");
IF Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" THEN
BEGIN
    //Create the notification
    CreditBalanceNotification.MESSAGE(Text003);
    CreditBalanceNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
    //Add a data property for the customer number
    CreditBalanceNotification.SETDATA('CustNumber', Customer."No.");
    //Add an action that calls the Action Handler codeunit, which you define in the next step.
    CreditBalanceNotification.ADDACTION('Text004', CODEUNIT::"Action Handler", OpenCustomer);
    //Send the notification to the client.
    CreditBalanceNotification.SEND;
END
    ```
3. Create a codeunit, called **Action Handler**, for handling the notification action as follows:
    *   Add a global function called **OpenCustomer** that has a **Notification** data type parameter called **CreditBalanceNotification** for receiving the Notification object.

    *   Add the following C/AL variables to the codeunit:
    <table>
      <tr>
        <th>Variable Name</th>
        <th>Data Type</th>
        <th>Subtype</th>
      </tr>
      <tr>
        <td>CustNumber</td>
        <td>Text</td>
        <td></td>
      </tr>
      <tr>
        <td>CustNo</td>
        <td>Text</td>
        <td></td>
      </tr>
      <tr>
        <td>CustRec</td>
        <td>Record</td>
        <td>Customer</td>
      </tr>
      <tr>
        <td>CustPage</td>
        <td>Page</td>
        <td>Customer Card</td>
      </tr>
    </table>

    *   Add the following code to the **OpenCustomer** function:

        ```
        //Get the customer number data from the SETDATA call.
        CustNo := CreditBalanceNotification.GETDATA(CustNumber);
        // Open the Customer Card page for the customer.
        IF CustRec.GET(CustNo) THEN BEGIN
         CustPage.SETRECORD(CustRec);
         CustPage.RUN;
        END ELSE BEGIN
          ERROR('Could not find Customer: ' + CustNo);
        END;   
        ```

## See Also  
