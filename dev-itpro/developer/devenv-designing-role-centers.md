---
title: Role Center Design in Business Central
description: Learn how to design Business Central role centers with navigation, actions, and page parts that help users focus on their daily tasks.
author: jswymer
ms.date: 06/21/2025
ms.topic: concept-article
ms.author: jswymer
ms.reviewer: jswymer
---

# Designing role centers

Design a role center in [!INCLUDE[prod_short](includes/prod_short.md)] to help users focus on the tasks and information that matter to their role. As a developer, use the intended users' daily work as the foundation for your role center design.

## About the role center

The role center is the user's entry point and home page for [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. You can develop several different role centers, where each role center is customized to the profile of the intended users. For example, you could have role centers that target different levels within an organization, such as business owners, department leads, and information workers.

Role centers are based on a user-centric design model. Design a role center to give users quick access to the information that is most important to them in their daily work. Display information that's relevant to their role and provide links to pages for viewing data and doing tasks.

## Role center structure

A role center is defined by a page that has the [PageType property](properties/devenv-pagetype-property.md) set to `RoleCenter`. The role center page is divided into two main areas: the navigation and actions area and the content area. The following figure illustrates the general layout and elements of a role center page.

:::image type="content" source="media/rolecenter-overviewApril19.png" alt-text="Diagram of a role center with numbered navigation, actions, headlines, cues, and content parts." lightbox="media/rolecenter-overviewApril19.png":::

The diagrams illustrate the structure. Labels and placement can differ in current versions. For example, the older **Business Assistance** section label is now **Insights**.

Learn more in [Simple role center code example](devenv-simple-role-center-example.md).

## Navigation and actions area

The navigation and actions area appears at the top of the role center page, and provides links to other objects, such as pages, reports, and codeunits. You define the navigation area by adding actions to the role center page code, under the `actions` control in the page code. The navigation and actions area is subdivided into smaller areas by using different `area()` controls as described in the following table:

|  No.  |Area|Description|Usage Guidelines|
|----|-------|-----------|----------------|
|1|Navigation menus|The top-level navigation consists of one or more root menu items that expand to display links to other pages. Group the links into submenus to create a logical hierarchy. List pages normally open in the main content area. Other page types open according to the client's navigation rules.<br /><br />Define this area with an `area(Sections)` control.|Provide access to relevant entity lists for the role's areas of business. For example, a business manager's root items could include finance, sales, and purchasing. Place root items in order of importance, starting from the left.|
|2|Navigation bar|The second-level navigation displays a flat list of page links. List pages normally open in the main content area. Other page types open according to the client's navigation rules.<br /><br />Define this area with an `area(embedding)` control.|Link to users' most useful entity lists. For a business manager, these could include customers, sales orders, and bank accounts. Order items to reflect the business process. Limit the number of second-level items. Place extra links in the top-level navigation.|
|3|Action bar|The action bar provides links to pages, reports, and codeunits. Display links at the root level or group them in a submenu. Actions that open pages typically display them in front of the role center. Other actions run their target object and show any UI that object provides.<br /><br />The following sections describe the creation, processing, and reporting action areas.|Provide the most important or frequently used tasks. Actions typically open card pages for creating customers, invoices, and sales orders. Actions can also run reports. Place the most important action at the root level. Group closely related actions in a submenu.|

### Action bar area controls

:::image type="content" source="media/rolecenter-overview-action-bar.png" alt-text="Diagram of the role center action bar with creation, processing, and reporting actions labeled.":::

|  No.  |Control|Description|Usage Guidelines|
|----|-------|-----------|----------------|
|3a|`area(creation)`|Actions in this control appear first in the action area. Root-level actions display a plus (+) icon.|Use this control to target pages that enable the user to create new entities.|
|3b|`area(processing)`|Actions in this control will appear after the `area(creation)` items. You can group actions in submenus by using a `group` control.|Use this control to target pages that are associated with the work flow for processing documents, such as payments or sales orders. Use the `group` control to organize similar actions under a common parent.|
|3c|`area(reporting)`|Actions in this control appear last in the action area. Root-level actions display a default report icon.|Use this control to target report objects.|

Learn more about navigation in [Adding to navigation](devenv-adding-menus-to-navigation-pane.md).

### Behavioral points of interest

- The order of the `area()` controls in the page code isn't important. However, the order of the individual actions and groups is important because they appear in the order in which they appear in page code.
- In page code, if the first part in the content area is a Headline part, the actions area in the client is automatically positioned. It will be positioned either to the right of the Headline part or after the Headline part, depending on the browser window size. If the first part isn't a Headline, the actions area appears directly after the navigation area, and extends the width of the workspace.
- When the welcome banner is expanded, it hides the action bar. Collapsing the banner restores the action bar's previous visibility.

## Content area

The content area consists of one or more parts that display content from other pages. Unlike the navigation and actions area that's defined in the role center page code, the content area consists of self-contained, independent page part objects that you can use across role centers and in other pages. You define the content area by adding a `layout` control in the page code, and then a `part` control for each individual part to display.

The following table describes some of the most common parts for role centers, as illustrated in the previous figure.

|  No.  |Element|Description|More information|
|----|-------|-----------|----------------|
|4|Headline|Displays a series of automatically changing headlines that provide users with up-to-date information and insight into the business and daily work. A `HeadlinePart` page type creates this element. |[Creating role center headlines](devenv-create-role-center-headline.md)|
|5|Wide data cues|A set of cues for displaying large numbers, like monetary values. Use a `cuegroup` control on a `CardPart` page and set the [CuegroupLayout property](properties/devenv-cuegrouplayout-property.md) to `Wide`.|[Wide cues](devenv-cues-action-tiles.md#CueWideLayout)|
|6|Data cues|Provide a visual representation of aggregated business data, such as the number of open sales invoices or the total sales for the month. Create these elements by using a `cuegroup` control on a `CardPart` page type.|[Creating cues](devenv-cues-action-tiles.md#CreateCue)|
|7|Action cues|Tiles that link to tasks or operations, like opening another page, starting a video, targeting another URL, or running code. To create these elements, use a `cuegroup` control on a `CardPart` page type.|[Action tiles](devenv-cues-action-tiles.md#ActionTiles)|
|8|Chart|A graphical and interactive representation of your business data sourced by a custom business chart control add-in or an embedded Power BI report.||
|9|CardPart or ListPart page|Displays data fields in a form or tabular layout.|[Page object](devenv-page-object.md)|
|10|Control add-in|Displays custom content by using HTML-based control add-in.|[Control add-in object](devenv-control-addin-object.md)|

### Behavioral points of interest

- In general, the parts appear in the client according to the order in which you define them in the role center page code. They automatically rearrange horizontally and vertically to fill the available workspace.
- In the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], cue-containing parts receive promoted layout treatment. Place them together before other parts to keep the activities content together. Their placement still depends on the part order and client layout. Other ordinary parts typically appear under **Insights**. Headline, welcome-banner, and platform-added parts have separate layout treatment. Within each section, parts normally follow their order in the page code.
- When the welcome banner is expanded, it hides the headline part. Collapsing the banner restores the headline part's previous visibility.

## Development tips for overall page design

- Avoid grouping parts in the content area. Groups use a nested layout, which restricts how individual parts can flow across the workspace. Ungrouped parts adapt more easily to different screen resolutions and mobile devices.
- Achieve the best readability and discoverability by placing Headlines first, followed by cues, and then the remaining parts.
- Define navigation, actions, and parts declaratively on the role center page. Put executable logic in hosted parts or objects run by actions. The compiler reports diagnostics for triggers and procedures declared on a role center.
- Role centers can be highly specialized, in the fact that the navigation, actions, and content are optional. For example, you could have a single part that fills the entire workspace.

## Designing a checklist to onboard new users

Since the role center is a user's entry point and home page to [!INCLUDE[prod_short](includes/prod_short.md)], it's also the ideal space to guide new users toward learning activities and finalizing setup of their company. Configure the welcome banner and checklist through the onboarding framework rather than declaring them as parts on each role center. The framework supplies the **Checklist Banner** page, and the platform inserts it. Learn more in [Get users started with the checklist](../administration/onboarding-checklist.md).

## Design for all display targets

- Role center pages are also the primary entry point on mobile devices. Mobile clients use the same role center definition, but adapt its presentation and omit unsupported content. Headline and welcome-banner parts are available only in the desktop layout.
- You can preview how your role center looks on mobile devices directly in Designer.
- Some limitations on mobile devices include:
  - On tablets, there's a limit on the number of cues that can be displayed.
  - On phones, there's a limit on the number of parts in the content area that can be displayed.
  - Role center pages can't be displayed when they're embedded in Outlook or SharePoint.

## Performance considerations

Role centers that have many parts that process data from different sources can degrade performance. [!INCLUDE[prod_short](includes/prod_short.md)] 2021 release wave 1 and later load role center content in an optimized sequence to improve responsiveness and reduce sign-in time. The sequence is as follows:

1. Content directly on the role center page object is loaded first, and users can immediately interact with it. Examples of such content are the navigation menu and actions.
1. The system loads eligible parts one by one from top to bottom.
1. In the desktop layout, eligible parts outside the viewport wait until they come into view.

Hidden parts normally aren't opened and loaded until they become visible. Exceptions include provider parts needed by visible consumers and content loaded for Designer. Learn more about visibility in [Visible property](properties/devenv-visible-property.md).

Phone role-center parts don't use the viewport-based check. The welcome banner is also excluded from delayed opening.

Here are some practical tips to help you make the most of this optimization:

- Consider hiding any parts that represent secondary content that only some users in that role need. Learn more in [Choosing the visibility of parts](devenv-designing-parts.md#choosing-the-visibility-of-parts).
- Consider applying page background tasks for parts that require heavy processing. Learn more in [Using page background tasks](devenv-designing-parts.md#using-page-background-tasks).

## Using the role center in the client

To use or test the new role center in the client, first associate the role center page with a profile. Profiles define user roles, and each profile is associated with a single role center page. Create a new [profile object](devenv-profile-object.md) that references your page. Then, go to **My Settings** and select the new profile.

To let users use their associated role center, you might need to adjust settings for a profile. Learn more in [Define user settings for a profile](/dynamics365/business-central/admin-users-profiles-roles#to-define-user-settings-for-a-profile).

> [!IMPORTANT]
> Assigning a profile doesn't grant permissions to its role center or underlying data. If a user can't open the role center because of a permission error, ensure the user's permission sets grant access to the required pages and tables. Learn more in [Assign permissions to users and groups](/dynamics365/business-central/ui-define-granular-permissions).

### Customizing a role center from the client

Users who work across multiple roles can switch role centers to shift their focus to different tasks. Users can also personalize their role centers by rearranging or hiding content. Learn more in [Personalizing your workspace](/dynamics365/business-central/ui-personalization-user).

As an administrator, you can customize pages for a profile. These customizations apply to users assigned to that profile. Learn more in [Using the client to create profiles and page customizations](devenv-design-profiles-using-client.md).

As a developer, you can use Designer to create extension-based page changes. Designer changes aren't scoped to a profile merely because users share its role center. Learn more in [Use Designer](devenv-inclient-designer.md).

## Related information

[AL development environment](devenv-reference-overview.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page extension object](devenv-page-ext-object.md)  
[Actions overview](devenv-actions-overview.md)  
[Add pages and reports to Tell Me](devenv-al-menusuite-functionality.md)  
[Personalizing your workspace](/dynamics365/business-central/ui-personalization-user)  
[Use Designer](devenv-inclient-designer.md)  
