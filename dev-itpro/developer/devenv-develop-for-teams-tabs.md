---
title: Create Business Central tabs for Teams 
description: Learn how to use the Graph API to programmatically add a Business Central tab in a Teams channel or chaT.  
author: jswymer 
ms.author: jswymer 
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 10/27/2022
ms.custom: bap-template
---

# Create Business Central tabs for Teams

This article explains how to add tabs in Teams in channels and chats.

To learn about how users can add Business Central tabs in the Teams client, see [Add a Business Central Tab in Teams](/dynamics365/business-central/across-teams-tab).
  
## Add tabs programmatically

Microsoft Teams is part of the [Microsoft REST Graph API](/graph/overview), which allows apps to connect to Teams and create resources like channels, chats, and tabs. Using the Graph API, you can add Business Central tabs to new or existing channels and chats in Teams. Together with the Business Central app for Teams, you can set up a Teams environment complete with teams, channels, and Business Central tabs&mdash;without requiring users to do anything extra.

To add a Business Central tab to a channel or chat, you send a POST request to either the [channel tab](/graph/api/channel-post-tabs) or [chat tab](/graph/api/chat-post-tabs?tabs=http) endpoint.

### For channels

You'll need the ID the team and the channel that you want to add the tab to. 

```http
POST https://graph.microsoft.com/v1.0/teams/{teamId}/channels/{channelId}/tabs

{
    "displayName": "<tab name>",​
    "teamsApp@odata.bind": ​"https://graph.microsoft.com/v1.0/appCatalogs/teamsApps/84c2de91-84e8-4bbf-b15d-9ef33245ad29",​
    "configuration": {​
        "entityId": "<unique id>",​
        "contentUrl": "https://businesscentral.dynamics.com/teams?<company and page ID>",​
        "websiteUrl": "https://businesscentral.dynamics.com/?<company and page ID>"​
    }
}
```

### For chats

You'll need the ID the chat that you want to add the tab to.

```http
POST https://graph.microsoft.com/v1.0/chats/{chat-id}/tabs

{
    "displayName": "<tab name>",​
    "teamsApp@odata.bind": ​"https://graph.microsoft.com/v1.0/appCatalogs/teamsApps/84c2de91-84e8-4bbf-b15d-9ef33245ad29",​
    "configuration": {​
        "entityId": "<unique id>",​
        "contentUrl": "https://businesscentral.dynamics.com/teams?<company and page ID>",​
        "websiteUrl": "https://businesscentral.dynamics.com/?<company and page ID>"​
    }
}
```

### Composing request body

The request body, also called the payload, follows the request URL and specifies the content of the tab. There are several string properties that you can set. Some are required. The following table describes the properties and any specific values that you must provide.

|Property|Description|Required|
|--------|----|-------|
|displayName|Specifies the name that shows for the tab in the channel or chat|Yes|
|teamsApp@odata.bind|This property binds the tab to the Business Central app for Teams. The ID of the Business Central app is **84c2de91-84e8-4bbf-b15d-9ef33245ad29**. So set the value to `​"https://graph.microsoft.com/v1.0/appCatalogs/teamsApps/84c2de91-84e8-4bbf-b15d-9ef33245ad29"` |Yes|
|  entityId   |Specifies an identifier for tab|
|  contentUrl |Specifies the URL used for rendering Business Central tab and its content in the channel or chat. It's important to include `/teams` in the path, which directs the Business Central web client to deliver a Teams-specific view and use the Teams authentication platform. If you omit it, that tab can't authenticate. Replace `<company and page ID>` with parameters that identify the company and page that you want to show. For more information about the Business Central web client URL and parameters, see [Web Client URL](devenv-web-client-urls.md).|Yes|
|  removeUrl  | Specifies the URL called by Teams client when a tab is removed using the Teams client.|
|  websiteUrl | Specifies the URL for showing tab contents outside of Teams, which users do by selecting **Go to website** option on the tab in the Teams client. Typically, you would set the value to the URL of the Business Central page in the web client. |

## Example

This example illustrates how you can add a team, channel, and Business Central tab. You'll add a tab in Teams that displays page 9305 **Sale Orders**. There are several tools that you can use, like AL code, PowerShell, Postman, and more. In this example, you'll use the Graph Explorer. For details about using Graph Explorer, see [Working with Graph Explorer](/graph/graph-explorer/graph-explorer-features).

### Create team

1. Open and sign in to [Graph Explorer](https://developer.microsoft.com/graph/graph-explorer).
2. Create a team.

    The first step is to create a team using the [teams](/graph/api/team-post?tabs=http) endpoint. In this example, you create a team named is **Warehouse**.

    1. At the top, set the method to **Post** and add the following URL:

        ```http
        https://graph.microsoft.com/v1.0/teams
        ```

    2. Go to the **Modify permissions** tab and consent to required permissions.
    3. In the **Request body**, add the following:

        ```json
        {
          "template@odata.bind": "https://graph.microsoft.com/v1.0/teamsTemplates('standard')",
          "displayName": "Warehouse",
          "description": "Team for communicating with the warehouse personnel"
        }
        ```

    4. Select **Run Query**.

        If successful, you get an **Accepted - 202** message.
    5. In the **Response headers**, get the ID of the new team from the `"locaton"` entry: 

        ```http
        "location": "/teams('734c3798-b644-4b50-8f42-b3d56b6d1e35')/operations('df79c928-7cae-4d3f-8584-016d01dcfc56')",
        ```

       In this case, `734c3798-b644-4b50-8f42-b3d56b6d1e35`.

### Create channel

The next step is to create a channel using the [channels](/graph/api/channel-post?tabs=http) endpoint. In this example, you create a channel for raising issues about sales orders.

1. Start a new query, set the method to **Post** and add the following endpoint URL:

    ```http
    https://graph.microsoft.com/v1.0/teams/734c3798-b644-4b50-8f42-b3d56b6d1e35/channels
    ```

2. Go to the **Modify permissions** tab and consent to required permissions.
3. In the **Request body**, add the following:

    ```json
    {
      "displayName": "Sales order complaints",
      "description": "This channel is for raising issues with sales orders. ",
      "membershipType": "standard"
    }
    ```

4. Select **Run Query**.

    If successful, you get an **Created - 201** message.
5. In the **Response headers**, get the ID of the new team from the `"locaton"` entry: 

    ```http
    "location": "https://teamsgraph.teams.microsoft.com/v1.0/teams('734c3798-b644-4b50-8f42-b3d56b6d1e35')/channels('19:7f4bae394f7c479a921c679123aa8e7c@thread.tacv2')",
    ```

    In this case, `19:7f4bae394f7c479a921c679123aa8e7c@thread.tacv2`.

### Add tab

The final step is to add a Business Central tab to the channel by using the [tabs](/graph/api/channel-post-tabs) endpoint.

1. Start a new query, set the method to **Post** and add the following endpoint URL:

    ```http
    https://graph.microsoft.com/v1.0/teams/734c3798-b644-4b50-8f42-b3d56b6d1e35/channels/19:7f4bae394f7c479a921c679123aa8e7c@thread.tacv2/tabs
    ```

2. Go to the **Modify permissions** tab and consent to required permissions.
3. In the **Request body**, add the following:

    ```json
    {
        "displayName": "Overdue Sales Orders",
        "teamsApp@odata.bind": "https://graph.microsoft.com/v1.0/appCatalogs/teamsApps/84c2de91-84e8-4bbf-b15d-9ef33245ad29",
        "configuration": {
            "entityId": "2DCA2E6C7A10415CAF6B8AB6661B3154",
            "contentUrl": "https://businesscentral.dynamics.com/teams?company=CRONUS%20USA%2C%20Inc.&page=9305",
            "websiteUrl": "https://businesscentral.dynamics.com/?company=CRONUS%20USA%2C%20Inc.&page=9305"
        }
    }
    ```

4. Select **Run Query**.

    If successful, you get an **Created - 201** message.
5. In the **Response headers**, get the ID of the new team from the `"locaton"` entry: 

    ```http
    "location": "https://teamsgraph.teams.microsoft.com/v1.0/teams('734c3798-b644-4b50-8f42-b3d56b6d1e35')/channels('19:7f4bae394f7c479a921c679123aa8e7c@thread.tacv2')",
    ```

    In this case, `19:7f4bae394f7c479a921c679123aa8e7c@thread.tacv2`.

## Next steps

Change the recommended content for the tab. See [Add and Remove Recommended Content for Business Central Tabs](devenv-develop-for-teams-tab-content.md).

## See also

[Developing for Microsoft Teams Integration](devenv-develop-for-teams.md)  