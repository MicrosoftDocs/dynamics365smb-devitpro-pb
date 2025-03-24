---
title: Influence Copilot and agents without extending them 
description: Learn how to influence Copilot and agents without extending them in Business Central.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual
ms.collection: bap-ai-copilot
ms.date: 03/24/2025
ms.custom: bap-template
---

# Influence Copilot and agents without extending them

Some AI-powered features are directly extensible using AL and offer documented mechanisms to modify or enhance existing features. This article covers a different class of Copilot and agent capabilities that, while not directly extensible, can still work with the custom code and content from your extensions. All extensions installed in an environment can influence the output of Copilot and agents.

## Approach to extensibility

This table describes how each Copilot and agent capability offers direct or indirect extensibility.

|Capability|Direct AL extensibility|Can work with your extensions|Details|
|-|-|-|-|
|Analyze list|No |Yes |Copilot automatically works with fields you add to existing pages and new list or worksheet page objects in your extension. No action is required to enable this.|
|Chat|No |Yes|Copilot can query new pages and tables in your extension. It can include, display, or filter on fields you add to existing pages. No action is required to enable this.<br><br>Copilot doesn't support the following field types: fields without a tooltip, fields with the AL property AllowInCustomizations set to false, and fields of type Blob, RecordId, InStream, OutStream, Media, MediaSet, Notification, JsonArray, JsonObject, JsonToken, JsonValue, Variant, and SecretText.<br><br>While in preview, Copilot can't provide guidance or answer questions based on documentation for your extensions. This functionality is coming in a later release update. Learn more in [Chat with Copilot to learn how to use installed add-on apps](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/chat-copilot-learn-use-installed-add-on-apps).|
|Autofill|No|Yes |Copilot can autofill fields you add to existing pages, and fields in new card or document page objects from your extension. No action is required to enable this.<br><br>Learn more about limitations in [Autofill availability](/dynamics365/business-central/autofill-fields-with-copilots#availability).  |
|Summarize|No |Yes |Copilot generates record summaries that include fields, FactBoxes, and actions from your extension. The fields can be added to existing pages or new card and document page objects. Actions include those that use the RunObject to open other pages. No action is required to enable this.|
|Sales Order Agent|No |Yes|Similar to other users, the Sales Order Agent interacts with Business Central using the UI and reacts to the presence of new fields and actions that are made available on pages.<br><br>The agent uses an out of the box profile (role) called “Sales Order Agent (Copilot)” that defines the UI elements the agent can interact with. Using profiles reduces the UI surface that is available to the users and agents alike. E.g., if the Purchase Orders page is not included with the profile, the agent cannot navigate to it, also it cannot modify the discounts on a Sales Order as these fields are hidden for this profile.<br><br>Therefore, if you want the agent to consider or interact with e.g. a field on the Sales Order page, which is added by your extension, you can customize the “Sales Order Agent (Copilot)” profile so the field becomes visible to the agent. |
|Bank account reconciliation|No |Yes |WWhen users ask Copilot to Post Difference to G/L Account, Copilot relies on data from the Text-to-Account Mapping table for a list of specific texts that don’t need to be matched using AI. You can add to this list to reduce cases processed by AI.|
|Marketing text suggestions|No |No | |
|No. Series Suggestions|No |Yes |Copilot can work with any No. Series setting fields added by your extension, if the field follows typical No. Series patterns. Copilot only looks for No. Series fields in Setup tables that include the term “Setup” in the table name. |
|E-document matching assistance|No |No |  |
|Sales lines suggestions|No |Yes |When users choose to keep any sales lines suggested by Copilot, the lines are copied to the sales document, where Business Central automatically triggers field validation and the Copy Document Codeunit. If your extension customizes validation or this codeunit using events, your logic will be executed to validate the inserted sales lines. |
|Create product information|No |No | |

## Improving Copilot and agent output for your extensions

In most cases, Copilot and agents use generative AI to view, learn and use Business Central as any user would. These rely on the quality of the
text you display in Business Central in captions, notifications and messages, and the quality of your accompanying online documentation, to
explain new concepts and business processes you bring to Business Central as part of your extensions.

By improving how your functionality presents itself, you improve the experience both for end-users and for these AI-powered features.

Below are a few practical examples that help improve quality of Copilot output:

- Ensure your captions, tooltips and teaching tips are concise, informative and unambiguous, explaining critical nuances such as any special meaning of a default value or the purpose of a page.
- Define alternate keywords to your pages and reports, that may represent common or industry-specific terms.
- Apply role-tailoring and other standard Business Central mechanisms to reduce page content that is not useful or required.
- Define an appropriate brick field group for your tables, ensuring  records can be represented in a compact form.
- Apply access control using permissions, so that users, Copilot and agents have a smaller data landscape to work with and only the minimum  necessary to carry out their tasks. 

> [!NOTE]
> Microsoft provides multiple layers of safety for all AI-powered features in Business Central. Some of these safeguards are designed to protect users from harmful content that can be output by generative AI features, and may trigger in sensitive business domains such as medical, drugs, legal or weapons. Customers may experience lower quality of output in these domains.
>
> When using the developer tool for Copilot in Business Central, you cannot extend a Prompt Dialog page at this time. This reduces the chances of others overriding or negatively impacting the AI safeguards that you have built into your experience. 
