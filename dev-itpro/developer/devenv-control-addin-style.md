---
title: Control Add-in Styling for Business Central
description: Style control add-ins for Business Central with selected colors, fonts, and CSS examples, and learn how to check readability and keyboard interaction.
ms.date: 10/21/2026
ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.reviewer: solsen
---

# Control add-in style guide

Use colors, fonts, and CSS to make your control add-ins complement the [!INCLUDE[prod_short](../includes/prod_short.md)] interface.

> [!NOTE]
> This article is for developers who style content inside a control add-in. It doesn't describe how to change the colors of the entire client or distinguish production and sandbox environments.

## Design control add-ins for the client

Control add-ins display contextual functionality alongside business data. Typical uses include data visualizations, third-party controls, and related content from another data source.

Follow these principles when designing a control add-in:

- Apply similar patterns for commands, navigation, and data presentation.
- Favor content over decorative interface elements.
- Design for all platforms and input methods.
- Make it accessible to all users.
- Make it enjoyable and keep users in control.

The following tables list selected colors and font definitions used by the client. Individual components can use different shades and styles depending on their context. Use these values as styling examples, not as a complete specification of the client interface.

Test text contrast, keyboard interaction, input labels, visible focus, and forced-color modes. A palette or font choice alone doesn't ensure that a control add-in is accessible.

## Choose colors for control add-ins

Colors can convey information, indicate interactivity, and provide feedback. You can apply the following colors to backgrounds, borders, text, and other interface elements. Choose foreground and background combinations with sufficient contrast.

### Main colors

The following colors are the primary and secondary colors in the client's base palette.

|  Color  |  Name  |  Use  |  HEX value  |
|---------|--------|-------|-------------|
|:::image type="content" source="media/style/00B7C3.png" alt-text="Color swatch showing the color #00B7C3, used as a styling example.":::|Primary color|Prominent UI elements and areas.|#00B7C3|
| :::image type="content" source="media/style/505C6D.png" alt-text="Color swatch showing the color #505C6D, used as a styling example.":::|Secondary color| UI elements and areas in default or subdued state.|#505C6D|

### Style colors

The following base palette colors express conditions or user activity, such as sentiments on cues. Don't rely on color alone to communicate meaning.

|  Color  |  Description  | HEX value|
|---------|---------------|----------|
|:::image type="content" source="media/style/212121.png" alt-text="Color swatch showing the color #212121, used as a styling example.":::|Standard|#212121|
|:::image type="content" source="media/style/00B7C3.png" alt-text="Color swatch showing the color #00B7C3, used as a styling example.":::|Accent|#00B7C3|
|:::image type="content" source="media/style/212121.png" alt-text="Color swatch showing the color #212121, used as a styling example.":::|Strong|#212121|
|:::image type="content" source="media/style/35AB22.png" alt-text="Color swatch showing the color #35AB22, used as a styling example.":::|Favorable|#35AB22|
|:::image type="content" source="media/style/9F9700.png" alt-text="Color swatch showing the color #9F9700, used as a styling example.":::|Ambiguous|#9F9700|
|:::image type="content" source="media/style/EB6965.png" alt-text="Color swatch showing the color #EB6965, used as a styling example.":::|Unfavorable|#EB6965|
|:::image type="content" source="media/style/EB6965.png" alt-text="Color swatch showing the color #EB6965, used as a styling example.":::|Attention|#EB6965|
|:::image type="content" source="media/style/A7ADB6.png" alt-text="Color swatch showing the color #A7ADB6, used as a styling example.":::|Subordinate|#A7ADB6|

### Additional palette colors

The following table includes additional colors that you can use in the UI.

|  Color  |  Description  | HEX value|
|---------|---------------|----------|
|:::image type="content" source="media/style/C9C472.png" alt-text="Color swatch showing the color #C9C472, used as a styling example.":::|Yellow|#C9C472|
|:::image type="content" source="media/style/88CE81.png" alt-text="Color swatch showing the color #88CE81, used as a styling example.":::|Green|#88CE81|
|:::image type="content" source="media/style/E97768.png" alt-text="Color swatch showing the color #E97768, used as a styling example.":::|Red|#E97768|
|:::image type="content" source="media/style/75B5E7.png" alt-text="Color swatch showing the color #75B5E7, used as a styling example.":::|Blue|#75B5E7|
|:::image type="content" source="media/style/59CCB4.png" alt-text="Color swatch showing the color #59CCB4, used as a styling example.":::|Light green|#59CCB4|
|:::image type="content" source="media/style/75D8E7.png" alt-text="Color swatch showing the color #75D8E7, used as a styling example.":::|Sky|#75D8E7|
|:::image type="content" source="media/style/EEEA86.png" alt-text="Color swatch showing the color #EEEA86, used as a styling example.":::|Egg|#EEEA86|
|:::image type="content" source="media/style/E89E63.png" alt-text="Color swatch showing the color #E89E63, used as a styling example.":::|Orange|#E89E63|
|:::image type="content" source="media/style/DBBDEB.png" alt-text="Color swatch showing the color #DBBDEB, used as a styling example.":::|Violet|#DBBDEB|
|:::image type="content" source="media/style/39B294.png" alt-text="Color swatch showing the color #39B294, used as a styling example.":::|Teal|#39B294|
|:::image type="content" source="media/style/73BA5A.png" alt-text="Color swatch showing the color #73BA5A, used as a styling example.":::|Grass|#73BA5A|
|:::image type="content" source="media/style/E65E6D.png" alt-text="Color swatch showing the color #E65E6D, used as a styling example.":::|Scarlet|#E65E6D|

### Example colors for charts

The following colors are examples for chart series, not a complete chart palette. Chart implementations can use different shades, opacity, and color sequences.

|  Color  |  Description  | HEX value|
|---------|---------------|----------|
| :::image type="content" source="media/style/505C6D.png" alt-text="Color swatch showing the color #505C6D, used as a styling example.":::|-|#505C6D|
| :::image type="content" source="media/style/008089.png" alt-text="Color swatch showing the color #008089, used as a styling example.":::|-|#008089|
|:::image type="content" source="media/style/00B7C3.png" alt-text="Color swatch showing the color #00B7C3, used as a styling example.":::|Primary color|#00B7C3|
|:::image type="content" source="media/style/C9C472.png" alt-text="Color swatch showing the color #C9C472, used as a styling example.":::|Yellow|#C9C472|
|:::image type="content" source="media/style/E97768.png" alt-text="Color swatch showing the color #E97768, used as a styling example.":::|Red|#E97768|
|:::image type="content" source="media/style/75B5E7.png" alt-text="Color swatch showing the color #75B5E7, used as a styling example.":::|Blue|#75B5E7|
|:::image type="content" source="media/style/59CCB4.png" alt-text="Color swatch showing the color #59CCB4, used as a styling example.":::|Light green|#59CCB4|
|:::image type="content" source="media/style/75D8E7.png" alt-text="Color swatch showing the color #75D8E7, used as a styling example.":::|Sky|#75D8E7|
|:::image type="content" source="media/style/EEEA86.png" alt-text="Color swatch showing the color #EEEA86, used as a styling example.":::|Egg|#EEEA86|
|:::image type="content" source="media/style/DBBDEB.png" alt-text="Color swatch showing the color #DBBDEB, used as a styling example.":::|Violet|#DBBDEB|
|:::image type="content" source="media/style/39B294.png" alt-text="Color swatch showing the color #39B294, used as a styling example.":::|Teal|#39B294|
|:::image type="content" source="media/style/73BA5A.png" alt-text="Color swatch showing the color #73BA5A, used as a styling example.":::|Grass|#73BA5A|

### Apply colors with CSS

Use the following CSS properties to apply colors to your control add-in:

|  Property  |  Description  |
|------------|---------------|
|`color`|Specifies text color.|
|`background-color`|Specifies background colors.|
|`border-color`|Specifies border colors. A visible border also requires a border style and width.|

For example, use the secondary color as a background:

```css
.my-ui-part {
    background-color: #505C6D;
}
```

To apply the primary color to caption text, use the following CSS. Check its contrast against the caption's background.

```css
.my-caption {
    color: #00B7C3;
}
```

## Choose fonts and text sizes

Choose fonts and sizes that keep text readable in the available space.

### Font families

The following font definitions specify typefaces and weights for text elements such as headings, captions, and messages:

|  Example  |  Name  | Value |
|-----------|--------|:-----------:|
|:::image type="content" source="media/style/segoe-ui.png" alt-text="Sample text showing the Segoe UI font family.":::| Segoe UI | `"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif` |
|:::image type="content" source="media/style/segoe-ui-light.png" alt-text="Sample text showing the Segoe UI Light font family.":::| Segoe UI Light | `"Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
|:::image type="content" source="media/style/segoe-ui-semi-light.png" alt-text="Sample text showing the Segoe UI Semilight font family.":::| Segoe UI Semilight | `"Segoe UI Semilight", "Segoe WP Semilight", device-segoe-semilight, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
|:::image type="content" source="media/style/segoe-ui-semi-bold.png" alt-text="Sample text showing the Segoe UI Semibold font family.":::| Segoe UI Semibold | `"Segoe UI Semibold", "Segoe WP Semibold", device-segoe-semibold, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |

### Font sizes

The following table lists selected sizes from the client's font scale. Individual components can use other sizes.

|  Example  | Name | Value |
|-----------|------|:-----:|
|:::image type="content" source="media/style/37-5-fontsize.png" alt-text="Sample text showing a font size of 37.5 points.":::| largest-plus-font-size | `37.5pt` |
|:::image type="content" source="media/style/30-fontsize.png" alt-text="Sample text showing a font size of 30 points.":::| largest-font-size | `30pt` |
|:::image type="content" source="media/style/22-5-fontsize.png" alt-text="Sample text showing a font size of 22.5 points.":::| large-plus-font-size | `22.5pt` |
|:::image type="content" source="media/style/18-fontsize.png" alt-text="Sample text showing a font size of 18 points.":::| large-font-size | `18pt` |
|:::image type="content" source="media/style/15-fontsize.png" alt-text="Sample text showing a font size of 15 points.":::| medium-plus-font-size | `15pt` |
|:::image type="content" source="media/style/13-5-fontsize.png" alt-text="Sample text showing a font size of 13.5 points.":::| medium-font-size | `13.5pt` |
|:::image type="content" source="media/style/12-fontsize.png" alt-text="Sample text showing a font size of 12 points.":::| small-plus-font-size | `12pt` |
|:::image type="content" source="media/style/10-5-fontsize.png" alt-text="Sample text showing a font size of 10.5 points.":::| small-font-size | `10.5pt` |
|:::image type="content" source="media/style/9-fontsize.png" alt-text="Sample text showing a font size of 9 points.":::| smallest-font-size | `9pt` |

### Apply fonts and sizes with CSS

Use `font-family` to specify a font stack and `font-size` to specify the text size.

For example, apply the Segoe UI Light stack and the small size of `10.5pt`:

```css
.my-ui-part {
    font-family: "Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 10.5pt;
}
```

> [!IMPORTANT]
> Keep the fonts in the listed order to preserve the intended fallback sequence. The font displayed depends on which fonts are available on the device.

## Style an HTML control add-in

The following example styles two labeled text inputs and a native button. It demonstrates appearance only and doesn't include a submission handler.

```html
<div class="addin">
    <div class="control">
        <label class="caption" for="given-name">Given name</label>
        <input class="value" id="given-name" name="given-name" type="text">
    </div>

    <div class="control">
        <label class="caption" for="family-name">Family name</label>
        <input class="value" id="family-name" name="family-name" type="text">
    </div>

    <button class="submit" type="button">Submit</button>
</div>
```

The CSS applies fonts directly to the inputs and button. It uses dark text on a light background and on the primary-color button.

```css
.addin {
    padding: 1em;
    color: #212121;
    background-color: #FFFFFF;
    font-family: "Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 12pt;
}

.addin .control {
    margin-bottom: 1em;
}

.addin .control .caption {
    display: block;
    margin-bottom: 0.25em;
}

.addin .control .value {
    padding: 0.5em;
    color: #212121;
    background-color: #FFFFFF;
    border: 1px solid #505C6D;
    font: inherit;
}

.addin .submit {
    padding: 0.5em 1em;
    color: #212121;
    background-color: #00B7C3;
    border: 1px solid #505C6D;
    font-family: "Segoe UI Semibold", "Segoe WP Semibold", device-segoe-semibold, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 12pt;
}
```

## Related information

[Control add-in object](devenv-control-addin-object.md)  
[Control add-in performance best practices](devenv-control-addin-bestpractices.md)  
