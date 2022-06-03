---
title: Extending Email
description: Learn how to extend the email capabilities in Business Central.
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: brentholtorf
ms.author: bholtorf
ms.date: 05/19/2022
---

# Extend Email Capabilities
[!INCLUDE [prod_short](includes/prod_short.md)] offers built-in email capabilities that cover the needs of most businesses. You can share documents and information by email directly from [!INCLUDE [prod_short](includes/prod_short.md)].

However, you might have a bright idea for something extra that would benefit your, or your customers', business. For example, you might want to use an email scenario that we don't provide. This article describes how you can extend the key components of our standard email capabilities. 

## Email architecture overview
The following diagram shows the key components of the out-of-the-box email capabilities.  

:::image type="content" source="../media/email-architecture-overview.png" alt-text="Overview of the key parts of the email architecture"::: 

|Component  |Description |
|---------|---------|
|Email scenarios|Define the business processes for which an email account will be used by default.|
|Email address book lookup|Sets how you find email addresses for specific entities.|
|Email view policies|Determine who has access to which email messages.|
|Email accounts and connectors|Specify the email providers and accounts that are connected to [!INCLUDE [prod_short](includes/prod_short.md)].|
|Email Outbox and Sent Email pages|Contain messages that haven't been sent, or have been sent, respectively.|

We'll explore each of these components in more depth, and provide an example of how to extend their capabilities.

## Email scenarios
Email scenarios are processes that involve sending a document. For example, a sales or purchase order or a notification that gives an external accountant access to your [!INCLUDE [prod_short](includes/prod_short.md)]. You can use specific email accounts for specific scenarios. The following are a few examples:

* All users always send sales documents from account A.
* All users always send purchase documents from account B.
* All users always send warehouse or production documents from account C.

The following diagram shows the relationship between the objects for email scenarios. 

:::image type="content" source="../media/email-scenarios.png" alt-text="The objects for email scenarios."::: 

The following code example shows how to extend the `Email Scenario` enum by adding a new scenario named **BC LE Scenario**. After you extend the enum, the new BC LE option is available in the Email Scenario field. You can assign the scenario to accounts on the **Email Scenarios** page, or by using the `EmailScenario.SetEmailAccount()` method.

```al

enumextension 50100 BCLEScenario extends "Email Scenario"​

{​
    value(999888; BCLEScenario)​
    {​
        Caption = 'BC LE Scenario';​
    }​
}​

```

```al
procedure AddEmailToScenario(Rec: Record "Email Account")
var
    EmailScenario: Codeunit "Email Scenario";
    NullGuid: Guid;
begin
    if Rec."Account Id" <> NullGuid then
        EmailScenario.SetEmailAccount(Enum::"Email Scenario"::BCLEScenario, Rec)
    else
        Error('Trying to set an empty email account to BCLE email scenario');
end;
```

## Email address book lookup
The email address book lookup is what you use to choose email accounts in [!INCLUDE [prod_short](includes/prod_short.md)] from entities such as customers and vendors. The following diagram shows the relationship between the objects for the email address book lookup. 

:::image type="content" source="../media/email-address-book-lookup.png" alt-text="The objects for the email address book lookup.":::

The following code example shows how to extend the `Email Address Entity` enum by adding a **BCLE Entity** option. The BCLE entity has an email address that we want to be able to access. 

```al

enumextension 50110 "BCLE - Address Book" extends "Email Address Entity"​

{​
    value(50110; "BCLE Entity")​
    {​
        Caption = 'BCLE Entity';​
    }​
} 

```
After you extend the `Email Address Entity` enum, subscribe to the `OnGetSuggestedAddresses` and `OnLookupAddressFromEntity` events. These events do the following:

* `OnGetSuggestedAddresses` gets email addresses from the records in the table that are related to an email that you are composing and displays them in the address book.
* `OnLookupAddressFromEntity` opens a modal dialog where you can choose the email addresses to add to the address book. 

The following examples show how to implement the events.

```al

[IntegrationEvent(false, false)]​
internal procedure OnGetSuggestedAddresses(TableId: Integer; SystemId: Guid; var Address: Record "Email Address Lookup")​

[IntegrationEvent(false, false)]​
internal procedure OnLookupAddressFromEntity(Entity: Enum "Email Address Entity"; var Address: Record "Email Address Lookup"; var IsHandled: Boolean)

```

```al
var
    NoRecordsFoundMsg: Label 'No %1 found with an email address.', Comment = '%1 Entity type';

[EventSubscriber(ObjectType::Codeunit, Codeunit::"Email Address Lookup", 'OnLookupAddressFromEntity', '', false, false)]
local procedure OnLookupAddressFromEntity(Entity: Enum "Email Address Entity"; var Address: Record "Email Address Lookup"; var IsHandled: Boolean)
var
    BCLEEntity: Record "BCLE Entity";
    BCLEEntityList: Page "BCLE Entity List";
begin
    if not BCLEEntity.ReadPermission() or IsHandled or (Entity <> Entity::"BCLE Entity") then
        exit;

    BCLEEntity.SetFilter("Email", '<>%1', '');
    if not BCLEEntity.FindSet() then begin
        Message(StrSubstNo(NoRecordsFoundMsg, BCLEEntity.TableCaption));
        exit;
    end;

    BCLEEntityList.SetTableView(BCLEEntity);
    BCLEEntityList.LookupMode := true;

    if BCLEEntityList.RunModal() <> ACTION::LookupOK then begin
        IsHandled := false;
        exit;
    end;

    BCLEEntityList.SetSelectionFilter(BCLEEntity);
    if BCLEEntity.FindSet() then
        repeat
            if StrLen(BCLEEntity.Email) > 0 then begin
                Address.Name := BCLEEntity."Speaker Name";
                Address."E-Mail Address" := BCLEEntity.Email;
                Address."Source Table Number" := Database::"BCLE Entity";
                Address."Source System Id" := BCLEEntity.SystemId;
                Address."Entity type" := Enum::"Email Address Entity"::"BCLE Entity";
                Address.Insert();
                IsHandled := true;
            end;
        until BCLEEntity.Next() = 0;
end;

[EventSubscriber(ObjectType::Codeunit, Codeunit::"Email Address Lookup", 'OnGetSuggestedAddresses', '', false, false)]
local procedure SuggestedAddressesFromContacts(TableId: Integer; SystemId: Guid; var Address: Record "Email Address Lookup")
var
    BCLEEntity: Record "BCLE Entity";
    CompanyNo: Code[20];
begin
    case TableId of
        Database::"BCLE Entity":
            begin
                if not BCLEEntity.GetBySystemId(SystemId) then
                    exit;
                InsertAddressFromBCLEEntity(BCLEEntity, Address);
            end;
        else
            exit;
    end;
end;

local procedure InsertAddressFromBCLEEntity(var BCLEEntity: Record "BCLE Entity"; var Address: Record "Email Address Lookup")
begin
    if ((BCLEEntity.Email <> '') and not Address.Get(BCLEEntity.Email, BCLEEntity."Speaker Name", Enum::"Email Address Entity"::"BCLE Entity")) then begin
        Address.Name := BCLEEntity."Speaker Name";
        Address."E-Mail Address" := BCLEEntity.Email;
        Address."Source Table Number" := Database::"BCLE Entity";
        Address."Source System Id" := BCLEEntity.SystemId;
        Address."Entity type" := Enum::"Email Address Entity"::"BCLE Entity";
        Address.Insert();
    end;
end;
```

## Email view policies
Email view policies give you control over the email messages that a user can access on the Email Outbox and Sent Emails pages. You can extend email view policies, for example by adding new policies, by customizing their types. The following diagram shows the relationship between the objects for email view policies.

:::image type="content" source="../media/email-view-policies.png" alt-text="The objects for email view policies.":::

The first step is to implement the `Email View Policy` interface.

```al

interface "Email View Policy"​

{​
    procedure GetSentEmails(var SentEmails: Record "Sent Email" temporary);​
    procedure GetOutboxEmails(var OutboxEmails: Record "Email Outbox" temporary);​
    procedure GetSentEmails(SourceTableId: Integer; var SentEmails: Record "Sent Email" temporary);​
    procedure GetOutboxEmails(SourceTableId: Integer; var OutboxEmails: Record "Email Outbox" temporary);​
    procedure GetSentEmails(SourceTableId: Integer; SourceSystemId: Guid; var SentEmails: Record "Sent Email" temporary);​
    procedure GetOutboxEmails(SourceTableId: Integer; SourceSystemId: Guid; var OutboxEmails: Record "Email Outbox" temporary);​
    procedure HasAccess(SentEmail: Record "Sent Email"): Boolean;​
    procedure HasAccess(OutboxEmail: Record "Email Outbox"): Boolean;​
}

```

Next, we'll extend the `Email View Policy` enum by adding a **BE LE View Policy** option.

```al

enumextension 50108 "BC LE View Policy" extends "Email View Policy"​

{​
    value(50108; "BC LE View Policy")​
    {​
        Caption = 'BC LE View Policy';​
        Implementation = "Email View Policy" = BCLEViewPolicy;​
    }​
}

```

The last step is to assign the email view policies to users. For more information, see [Set Up View Policies](/dynamics365/business-central/admin-how-setup-email#set-up-view-policies).

## Email accounts and connectors
A connector is the interface for creating and managing email accounts, and for sending emails from the accounts. The following table lists the connectors that are available by default.

|Connector  |Description  |
|---------|---------|
|Microsoft 365 Connector|Everyone sends email from a shared mailbox in Exchange Online.|
|Current User Connector|Everyone sends email from the account they used to sign in to Business Central.|
|SMTP Connector|Use SMTP protocol to send emails.|

> [!Note]
> The Microsoft 365 Connector and Current User Connector require that the user has a mailbox on the tenant. 

All email accounts use a connector, and the accounts contain the information needed to send email messages. The following diagram shows the relationship between the objects for email accounts and connectors.

:::image type="content" source="../media/email-accounts-connectors.png" alt-text="The objects for email accounts and connectors.":::

The first step is to implement the `Email Connector` interface. 

```al

interface "Email Connector"​

{​
    procedure Send(EmailMessage: Codeunit "Email Message"; AccountId: Guid);​
    procedure GetAccounts(var Accounts: Record "Email Account");​
    procedure ShowAccountInformation(AccountId: Guid);​
    procedure RegisterAccount(var EmailAccount: Record "Email Account"): Boolean​
    procedure DeleteAccount(AccountId: Guid): Boolean​
    procedure GetLogoAsBase64(): Text;​
    procedure GetDescription(): Text[250];​
}

```
Next, we'll extend the `Email Connector` enum by adding an **SMTP** option.

```al

{​
    value(2147483647; SMTP)​
    {​
        Caption = 'SMTP';​
        Implementation = "Email Connector" = "SMTP Connector Impl.";​
    }​
}

```

The last step is to create a page where we can view or create an email account. For more information, see [Pages Overview](devenv-pages-overview.md). 

> [!TIP]
> If you want more details, there are several examples available on the [AlAppExtensions repository](https://github.com/microsoft/ALAppExtensions/tree/main/Apps/W1/Email%20-%20SMTP%20Connector/app). For example, the SMTP Connector is a good implementation to explore.

Email Importance Enum
```al
enum 50109 "Email Importance"
{
    Extensible = true;

    value(0; Normal)
    {
        Caption = 'Normal';
    }

    value(1; Important)
    {
        Caption = 'Important';
    }

    value(2; "Super Important")
    {
        Caption = 'Super Important';
    }
}
```

Table extensions to add a new Importance field.
```al
tableextension 50110 "Importance On Sent" extends "Sent Email"
{
    fields
    {
        field(50109; "Importance"; Enum "Email Importance")
        {
            DataClassification = SystemMetadata;
        }
    }
}

tableextension 50109 "Importance On Outbox" extends "Email Outbox"
{
    fields
    {
        field(50109; "Importance"; Enum "Email Importance")
        {
            DataClassification = SystemMetadata;
        }
    }
}
```

Page extensions on the Email Editor and Email Viewer that allow the Importance field to be viewed and changed. 
```al
pageextension 50111 "Importance On Editor" extends "Email Editor"
{
    layout
    {
        addafter(CcField)
        {
            field(Importance; Rec.Importance)
            {
                ApplicationArea = All;
                Caption = 'Importance';
                ToolTip = 'Specifies the importance of the email';
            }
        }
    }
}
```

```al
pageextension 50103 "Importance On Email Viewer" extends "Email Viewer"
{
    layout
    {
        addafter(CcField)
        {
            field(Importance; Rec.Importance)
            {
                ApplicationArea = All;
                Caption = 'Importance';
                ToolTip = 'Specifies the importance of the email';
            }
        }
    }
}
```

Page extensions for the Email Outbox and Sent Emails to display the Importance field.
```al
pageextension 50109 "Importance On Outbox" extends "Email Outbox"
{
    layout
    {
        addafter(Desc)
        {
            field(Importance; Rec.Importance)
            {
                ApplicationArea = All;
                Caption = 'Importance';
                ToolTip = 'Specifies the importance of the email';
            }
        }
    }
}
```
```al
pageextension 50110 "Importance On Sent" extends "Sent Emails"
{
    layout
    {
        addafter(Desc)
        {
            field(Importance; Rec.Importance)
            {
                ApplicationArea = All;
                Caption = 'Importance';
                ToolTip = 'Specifies the importance of the email';
            }
        }
    }
}
```

## See Also
[Overview of the System Application](devenv-system-application-overview.md)  
[Set Up Email](/dynamics365/business-central/admin-how-setup-email)  
