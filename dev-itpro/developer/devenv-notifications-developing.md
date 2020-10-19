---
title: "Notifications"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: solsen
ms.service: "dynamics365-business-central"
---

 

# Notifications
Notifications provide a programmatic way to send non-intrusive information to the User Interface (UI) in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)]. Notifications differ from messages initiated by the **Message** method. Messages are modal, which means users are typically required to address the message and take some form of corrective action before they continue working. On the other hand, notifications are non-modal. Their purpose is to give users information about a current situation, but do not require any immediate action or block users from continuing with their current task. For example, you could have a notification that a customer's credit limit is exceeded.

## Notifications in the UI
In the UI, notifications appear in the **Notification** bar (similar to validation errors) at the top of the page on which a user is currently working. The user can then choose to dismiss the notification, which clears it. Or, if actions are defined on notification, the user can choose one of the actions.

* There can be multiple notifications. The notifications appear in chronological order from top to bottom.
* Notifications remain for the duration of the page instance or until the user dismisses them or takes action on them.
* Notifications that are defined on sub-pages, for example in parts and FactBoxes, appear in the same **Notification** bar.
* Validation errors on the page will be shown first.

## Notifications in the development environment
By using the **Notification** and **NotificationScope** data types and methods in AL, you can add code to send notifications to users. The following table provides an overview of the available methods. The sections that follow provide additional information about how to create notifications.

|  Method  |  Description  |
|------------|---------------|
|[Message](methods-auto/notification/notification-message-method.md)  |Specifies the content of the notification that appears in the UI.|
|[Scope](methods-auto/notification/notification-scope-method.md)     |Specifies the scope in which the notification appears.|
|[Send](methods-auto/notification/notification-send-method.md)  |Sends the notification to be displayed by the client.|
|[AddAction](methods-auto/notification/notification-addaction-method.md)  |Adds an action on the notification.|
|[SetData](methods-auto/notification/notification-setdata-method.md)  |Sets a data property value for the notification|
|[GetData](methods-auto/notification/notification-getdata-method.md)  |Gets a data property value from the notification.|
|[Recall](methods-auto/notification/notification-recall-method.md)|Recalls a sent notification.|


## Creating and sending a notification
You create a notification by using the **Message** and **Send** methods. The **Message** method defines the message part of the notification. When the **Send** method is called, the notification is sent to the client and content of the message is displayed.

```AL
MyNotification.Message := 'This is a notification';
MyNotification.Send();
```

The **Send** method call should be the last statement in the notification code, after any **AddAction** or **SetData** method calls for the notification instance.

## Defining the notification scope

The scope determines where the notification is broadcast in the client. There are two different scopes: *LocalScope* and *GlobalScope*.

* A *LocalScope* notification appears in context of the user's current task, that is, on the page the user is currently working on. *LocalScope* is the default.

* A *GlobalScope* notification is not directly related to the current task, and will appear regardless of which the page the user is viewing.
  > [!NOTE]  
  > *GlobalScope* is currently not supported. This will be implemented in a future release.

The following code creates a notification in the *LocalScope*:

```AL
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.Send();
```

## Adding actions on a notification
You add actions on notifications by using the **AddAction** method. This method provides a way for you to create interactive notifications. By default, users have the option to dismiss the notifications. However, there might be cases where you want to provide users with different actions that they can take to address the notification, like opening an associated page for modifying data.

Conceptually, a notification action calls a method in a specified codeunit, passing the notification object in the call. The method includes the business logic for handling the action.

```AL
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.AddAction('Action 1',Codeunit::"Action Handler",'RunAction1');
MyNotification.AddAction('Action 2',Codeunit::"Action Handler",'RunAction2');
MyNotification.Send();
```

The basic steps for adding an action are as follows:

1. Create a global method in a new or existing codeunit. The method must have a **Notification** data type parameter for receiving the notification object.
2. Add AL code to the method for handling the action.
3. Specify the codeunit and method in the **AddAction** method call.

> [!IMPORTANT]  
> You can have more than one action on a notification. A LocalScope notification can have up to 3 actions. A GlobalScope notification can have up to 2 actions.

## Sending data with a notification
You use the **SetData** and **GetData** methods to add data to a notification, which is typically needed when actions are invoked. The **SetData** method sets, or adds, data to the notification. The data is defined as text in a key-value pair. With the **GetData** method, you can then retrieve the data again.

The following code sets data for a notification:

```AL
MyNotification.Message := 'This is a notification';
MyNotification.Scope := NotificationScope::LocalScope;
MyNotification.SetData('Created',Format(CurrentDateTime,0,9));
MyNotification.SetData('ID',Format(CreateGuid(),0,9));
MyNotification.AddAction('Action 1',Codeunit::"Action Handler",'RunAction1');
MyNotification.AddAction('Action 2',Codeunit::"Action Handler",'RunAction2');
MyNotification.Send();
```

The following code gets the data for a notification:

```AL
DataValue := MyNotification.GetData('Created');
DataValue := MyNotification.GetData('ID');
```
## Example
This simple example illustrates how notifications work and provides some insight into how you can use them. This example extends page **42 Sales Order** of the CRONUS International Ltd. demonstration database according to the following:

- The code compares a customer's balance with their credit limit. If the balance exceeds the credit limit, a notification is sent to the client.
- The notification includes an action, which has the caption **Change credit limit**, that opens page **21 Customer Card**. This enables the user to increase the credit limit.

To complete the example, follow these steps:

<!--

1. In AL code for page **42 Sales Order**, add the following notification code on the **OnOpenPage** trigger.

    ```
    var
      Customer : Record Customer;
      CreditBalanceNotification : Notification;
      OpenCustomer : Text;
      Text003 : TextConst ENU='The customer's current balance exceeds their credit limit.';
      Text004 : TextConst ENU='Change credit limit';
    begin
      Customer.GET("Sell-to Customer No.");
      IF Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" THEN
        begin
          //Create the notification
          CreditBalanceNotification.MESSAGE(Text003);
          CreditBalanceNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
          //Add a data property for the customer number
          CreditBalanceNotification.SETDATA('CustNumber', Customer."No.");
          //Add an action that calls the Action Handler codeunit, which you define in the next step.
          CreditBalanceNotification.ADDACTION('Text004', CODEUNIT::"Action Handler", 'OpenCustomer');
          //Send the notification to the client.
          CreditBalanceNotification.SEND;
        end;        
    end;
    ```
    
2. Create a codeunit called **Action Handler** for handling the notification action. Add a global method called **OpenCustomer** that has a **Notification** data type parameter called **CreditBalanceNotification** for receiving the Notification object, and include the following code on the method:

    ```
    var
      CustNumber : Text;
      CustNo : Text;
      CustRec : Record Customer;
      CustPage : Page "Customer Card";
    begin
      //Get the customer number data from the SETDATA call.
      CustNo := CreditBalanceNotification.GETDATA(CustNumber);
      // Open the Customer Card page for the customer.
      if Custec.GET(CustNo) then begin
        CustPage.SETRECORD(CustRec);
        CustPage.RUN;
      end else begin
        ERROR('Could not find Customer: ' + CustNo);
      end;   
    end;
    ```
-->

1. Create a page extension object that extends page **42 Sales Order**, and add the notification code on the **OnOpenPage** trigger.

    ```AL
    pageextension 50100 CreditBalanceNotification extends "Sales Order"
    {
    
        trigger OnOpenPage()
        var
            Customer: Record Customer;
            CreditBalanceNotification: Notification;
            OpenCustomer: Text;
            Text003: Label 'The current balance exceeds the credit limit.';
            Text004: Label 'Change credit limit';
        begin
            Customer.Get("Sell-to Customer No.");
            if Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" then begin
                //Create the notification
                CreditBalanceNotification.Message(Text003);
                CreditBalanceNotification.Scope := NotificationScope::LocalScope;
                //Add a data property for the customer number
                CreditBalanceNotification.SetData('CustNumber', Customer."No.");
                //Add an action that calls the ActionHandler codeunit, which you define in the next step.
                CreditBalanceNotification.AddAction('Text004', Codeunit::"ActionHandler", 'OpenCustomer');
                //Send the notification to the client.
                CreditBalanceNotification.Send();
            end;
        end;
    }
    ```

2. Create a codeunit called **ActionHandler** for handling the notification action. Add a global method called **OpenCustomer** that has a **Notification** data type parameter called **CreditBalanceNotification** for receiving the Notification object, and include the following code on the method:

    ```AL
    codeunit 50100 ActionHandler
    {
        trigger OnRun()
        begin
    
        end;
    
        procedure OpenCustomer(CreditBalanceNotification: Notification)
        var
            CustNumber: Text;
            CustNo: Text;
            CustRec: Record Customer;
            CustPage: Page "Customer Card";
        begin
            //Get the customer number data from the SetData() call.
            CustNo := CreditBalanceNotification.GetData(CustNumber);
            // Open the Customer Card page for the customer.
            if CustRec.Get(CustNo) then begin
                CustPage.SetRecord(CustRec);
                CustPage.Run();;
            end else begin
                Error('Could not find Customer: ' + CustNo);
            end;
        end;
    }
    ```

## See Also
[Notification Data Type](datatypes/devenv-notification-data-type.md)   
[Developing Extensions](devenv-dev-overview.md)   
[Getting Started with AL](devenv-get-started.md)   
