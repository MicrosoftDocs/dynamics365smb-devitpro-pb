---
title: "Control Add-in Style Guide"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

 

# Control Add-in Style Guide
This article offers a variety of stylistic definitions that are used throughout [!INCLUDE[d365fin_md](includes/d365fin_md.md)], which you can apply to your control add-ins to create an experience that complements [!INCLUDE[d365fin_md](includes/d365fin_md.md)].

## Introduction
Control add-ins for [!INCLUDE[d365fin_md](includes/d365fin_md.md)] extend a business solution by surfacing contextual functionality alongside business data. Control add-ins empower users to get more done without costly context switching, no matter which device they access Dynamics 365 from. Typical uses of control add-ins include unique data visualizations, surfacing controls from a third party service, or displaying related content from another data source.

Apart from the functionality, an important aspect of creating a control add-in is making sure the control add-in looks good and blends seamlessly into [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. To achieve this, you should follow these basic principles:

- Apply similar patterns for command, navigation and presentation of data.
- Favor content over chrome
- Design for all platforms and input methods.
- Make it accessible to all users.
- Make it enjoyable and keep users in control.

[!INCLUDE[d365fin_md](includes/d365fin_md.md)] uses a set of specific colors and fonts. You can employ these colors and fonts in your control add-ins to give it a style that matches the rest of client's user interface.  

> [!IMPORTANT]  
> This article is currently in progress and contents will change.

## Colors
Choosing the right color gives the interface visual continuity. Color can be used to convey information to users, indicate interactivity, give feedback, and more. The following sections describe the colors used in [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. The colors can be used on all aspects of a UI element, such background, border, text, and more. 

### Main colors

The following colors represent the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] theme main palette.

|  Color  |  Name  |  Use  |  HEX value  |
|---------|--------|-------|-------------|
|![Primary (#00B7C3)](media/style/00B7C3.png "Primary (#00B7C3)")|Primary color|Prominent UI elements and areas.|#00B7C3|
| ![Secondary (#505C6D)](media/style/505C6D.png "Secondary (#505C6D)")|Secondary color| UI elements and areas in default or subdued state.|#505C6D|

### Style colors
The following colors are used to express or accent conditions or user activity in the UI. For example, these colors are used as sentiments, or color indication, on Cues.
  
|  Color  |  Description  | HEX value|
|---------|---------------|----------|
|![Standard (#00B7C3)](media/style/212121.png "Accent (#00B7C3)")|Standard|#212121|
|![Accent (#00B7C3)](media/style/00B7C3.png "Accent (#00B7C3)")|Accent|#00B7C3|
|![Strong (#00B7C3)](media/style/212121.png "Strong (#00B7C3)")|Strong|#212121|
|![Favorable (#35AB22)](media/style/35AB22.png "Favorable (#35AB22)")|Favorable|#35AB22|
|![Ambiguous (#9F9700)](media/style/9F9700.png "Ambiguous (#9F9700)")|Ambiguous|#9F9700|
|![Unfavorable (#EB6965)](media/style/EB6965.png "Unfavorable (#EB6965)")|Unfavorable|#EB6965|
|![Attention (#EB6965)](media/style/EB6965.png "Attention (#EB6965)")|Attention|#EB6965|
|![Subordinate (#A7ADB6)](media/style/A7ADB6.png "Subordinate (#A7ADB6)")|Subordinate|#A7ADB6|

### More palette colors
The following table includes additional colors that you can use in the UI.

|  Color  |  Description  | HEX value|
|---------|---------------|----------|
|![YELLOW (#C9C472)](media/style/C9C472.png "YELLOW (#C9C472)")|Yellow|#C9C472|
|![GREEN (#88CE81)](media/style/88CE81.png "GREEN (#88CE81)")|Green|#88CE81|
|![RED (#E97768)](media/style/E97768.png "RED (#E97768)")|Red|#E97768|
|![BLUE (#75B5E7)](media/style/75B5E7.png "BLUE (#75B5E7)")|Blue|#75B5E7|
|![LIGHTGREEN (#59CCB4)](media/style/59CCB4.png "LIGHTGREEN (#59CCB4)")|Light green|#59CCB4|
|![SKY (#75D8E7)](media/style/75D8E7.png "SKY (#75D8E7)")|Sky|75D8E7|
|![EGG (#EEEA86)](media/style/EEEA86.png "EGG (#EEEA86)")|Egg|EEEA86|
|![ORANGE (#E89E63)](media/style/E89E63.png "ORANGE (#E89E63)")|Orange|#E89E63|
|![VIOLET (#DBBDEB)](media/style/DBBDEB.png "VIOLET (#DBBDEB)")|Violet|#DBBDEB|
|![TEAL (#39B294)](media/style/39B294.png "TEAL (#39B294)")|Teal|#39B294|
|![GRASS (#73BA5A)](media/style/73BA5A.png "GRASS (#73BA5A)")|Grass|#73BA5A|
|![SCARLET (#E65E6D)](media/style/E65E6D.png "SCARLET (#E65E6D)")|Scarlet|#E65E6D|

### Chart colors
The following table describes the colors used in charts.

|  Color  |  Description  | HEX value|
|---------|---------------|----------|
| ![Secondary (#505C6D)](media/style/505C6D.png "Secondary (#505C6D)")|-|#505C6D|
| ![Secondary (#008089)](media/style/008089.png "Secondary (#505C6D)")|-|#008089|
|![Primary (#00B7C3)](media/style/00B7C3.png "Primary (#00B7C3)")|Primary color|#00B7C3|
|![YELLOW (#C9C472)](media/style/C9C472.png "YELLOW (#C9C472)")|Yellow|#C9C472|
|![RED (#E97768)](media/style/E97768.png "RED (#E97768)")|Red|#E97768|
|![BLUE (#75B5E7)](media/style/75B5E7.png "BLUE (#75B5E7)")|Blue|#75B5E7|
|![LIGHTGREEN (#59CCB4)](media/style/59CCB4.png "LIGHTGREEN (#59CCB4)")|Light green|#59CCB4|
|![SKY (#75D8E7)](media/style/75D8E7.png "SKY (#75D8E7)")|Sky|75D8E7|
|![EGG (#EEEA86)](media/style/EEEA86.png "EGG (#EEEA86)")|Egg|EEEA86|
|![VIOLET (#DBBDEB)](media/style/DBBDEB.png "VIOLET (#DBBDEB)")|Violet|#DBBDEB|
|![TEAL (#39B294)](media/style/39B294.png "TEAL (#39B294)")|Teal|#39B294|
|![GRASS (#73BA5A)](media/style/73BA5A.png "GRASS (#73BA5A)")|Grass|#73BA5A|


### Applying colors
To apply a color scheme to the control add-in, you specify CSS rule-sets that use the following properties:

|  Property  |  Description  |
|------------|---------------|
|`color`|Specifies font color.|
|`background-color`|Specifies background colors.|
|`border-color`|Specifies Border colors. |

For example, to change the background of a part of your UI to use the `Secondary (#505C6D)` color, write the following CSS:

```css
.my-ui-part {
    background-color: #505C6D;
}
```

If you want to change the text color of a caption to the Primary (#00B7C3) color, use the following CSS:

```css
.my-caption {
    color: #00B7C3;
}
```
## Typography

The main goal of typography is to provide clean and readable text in the user interface. Similar to colors, typgraphy can also be used to convey or communicate conditions to the user. 

### Font Families

[!INCLUDE[d365fin_md](includes/d365fin_md.md)] uses the following font families to specify the typeface and weight for text elements, such as headings, captions, messages, and so on:

|  Example  |  Name  | Value |
|-----------|--------|:-----------:|
|![Segoe UI font family](media/style/segoe-ui.png "Segoe UI font family")| Segoe UI | `"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif` |
|![Segoe UI Light font family](media/style/segoe-ui-light.png "Segoe UI Light font family")| Segoe UI Light | `"Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
|![Segoe UI Semilight font family](media/style/segoe-ui-semi-light.png "Segoe UI Semilight font family")| Segoe UI Semilight | `"Segoe UI Semilight", "Segoe WP Semilight", device-segoe-semilight, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
|![Segoe UI Semibold font family](media/style/segoe-ui-semi-bold.png "Segoe UI Semibold font family")| Segoe UI Semibold | `"Segoe UI Semibold", "Segoe WP Semibold", device-segoe-semibold, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
|![Bahnschrift font family](media/style/bahnschrift.png "Bahnschrift font family")| Bahnschrift | `webclient-standard, device-standard, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |

### Sizes
[!INCLUDE[d365fin_md](includes/d365fin_md.md)] uses the following font sizes for text. The same font family on different clients may apply different sizes.

|  Example  | Name | Value |
|-----------|------|:-----:|
|![largest-plus-font-size (37.5pt)](media/style/37-5-fontsize.png "largest-plus-font-size (37.5pt)")| largest-plus-font-size | `37.5pt` |
|![largest-font-size (30pt)](media/style/30-fontsize.png "largest-font-size (30pt)")| largest-font-size | `30pt` |
|![large-plus-font-size (22.5pt)](media/style/22-5-fontsize.png "large-plus-font-size (22.5pt)")| large-plus-font-size | `22.5pt` |
|![large-font-size (18pt)](media/style/18-fontsize.png "large-font-size (18pt)")| large-font-size | `18pt` |
|![medium-plus-font-size (15pt)](media/style/15-fontsize.png "medium-plus-font-size (15pt)")| medium-plus-font-size | `15pt` |
|![medium-font-size (13.5pt)](media/style/13-5-fontsize.png "medium-font-size (13.5pt)")| medium-font-size | `13.5pt` |
|![small-plus-font-size (12pt)](media/style/12-fontsize.png "small-plus-font-size (12pt)")| small-plus-font-size | `12pt` |
|![small-font-size (10.5pt)](media/style/10-5-fontsize.png "small-font-size (10.5pt)")| small-font-size | `10.5pt` |
|![smallest-font-size (9pt)](media/style/9-fontsize.png "smallest-font-size (9pt)")| smallest-font-size | `9pt` |

<!-- 
| Large | `16pt` |
| Medium+ | `14pt` |
| Medium | `12pt` |
| Small | `10pt` |
| Smallest | `9pt` |

#### Phone client

| Name | Value |
|------------|:-----:|
| Largest | `24pt` |
| Large | `18pt` |
| Medium+ | `14pt` |
| Medium | `14pt` |
| Small | `12pt` |
| Smallest | `10pt` |
-->

### Applying Font Families and Sizes
To apply fonts and sizes to text elements in the UI, you need specify the following CSS properties:

- Font family. use property `font-family`.
- Font size. use property `font-size`.

For example, to change a UI element for the Web client to use the font family *Segoe UI Light* and the size *Small* (10.5pt), write the following CSS:

```css
.my-ui-part {
    font-family: "Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 10.5pt;
}
```

> [!IMPORTANT]
>   To ensure that the correct fonts are used on devices, do not omit fonts or change the order of the fonts.

## Example
This examples illustrates how to use CSS to style a simple HTML UI part of a control add-in. The example includes three UI controls, as shown in the following HTML code:

```html
<div class="addin">
    <div class="control">
        <div class="caption">Name:</div>
        <div class="value">
            <input type="text" name="name">
        </div>
    </div>

    <div class="control">
        <div class="caption">Surname:</div>
        <div class="value">
            <input type="text" name="name">
        </div>
    </div>

    <div class="control">
        <div class="submit">Submit</div>
    </div>
</div>
```

The following is CSS code for styling the controls, including padding, background colors, and fonts:

```css
.addin {
    padding: 1em;
    background-color: #505C6D; /* Sets the background color to "Secondary" */
}

.addin .control {
     border-color: #00B7C3; /* Sets the border color to "Primary" */
}

.addin .control .caption {
    color: #00B7C3; /* Sets the captions to "Primary" */

    /* Segoe UI Light, small */
    font-family: "Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif; /* Sets the font of the caption to ""Segoe UI Light" */
    font-size: 10.5pt;
}

.addin .control .value {
    color: #008089; /* Tertiary shade 2 */

    /* Segoe UI, medium */
    font-family: "Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 12pt;
}

.addin .control .submit {
    color: white; /* Sets the caption text to "white" */
    background-color: #00B7C3; /* Sets the background to "Primary */

    /* Segoe UI Semibold, medium */
    font-family: "Segoe UI Semibold", "Segoe WP Semibold", device-segoe-semibold, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 12pt;
    text-transform: uppercase; /* Sets the caption to use all uppercase letters */
}
```

<!--
## See Also  
 [Development](Development.md)
-->
