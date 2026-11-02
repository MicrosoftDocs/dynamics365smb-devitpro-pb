---
title: Control Add-in Style Guide for Business Central
description: Style control add-ins for Dynamics 365 Business Central with CSS. Choose colors and fonts, and build readable controls with keyboard access.
ms.date: 10/29/2026
ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.reviewer: solsen
---

# Style control add-ins for Business Central

Use CSS to style your control add-ins so that they complement the [!INCLUDE[prod_short](../includes/prod_short.md)] experience. This article provides example colors, font families, and text sizes, followed by an HTML and CSS example with labeled inputs and a button.

> [!NOTE]
> This guidance is for developers who build control add-ins. It doesn't change the appearance of the rest of the [!INCLUDE[prod_short](../includes/prod_short.md)] client. To help users distinguish companies and environments, learn more in [Display a company badge](/dynamics365/business-central/admin-company-information#badge).

## Design for the Business Central experience

Control add-ins can display charts, maps, third-party controls, and content from other data sources alongside business data. They help users work with related information without switching to another application. To make that content fit the surrounding experience:

- Use familiar patterns for commands, navigation, and data presentation.
- Keep the focus on the content rather than decorative elements.
- Design content that adapts to the available space and supports mouse, touch, and keyboard input.
- Associate labels with inputs, use standard HTML controls, and provide visible keyboard focus.
- Use text or another visual indicator as well as color to communicate status.
- Keep users in control and make interactions predictable.

Style the HTML content of your control add-in with CSS. Use the [StyleSheets property](properties/devenv-stylesheets-property.md) to include stylesheet files. Don't depend on the surrounding client's DOM structure, CSS classes, or internal theme tokens.

Learn more about implementation and sizing in [Control add-in object](devenv-control-addin-object.md).

## Choose colors for add-in content

Consistent colors help create visual continuity. You can use color to communicate information, indicate interactivity, and provide feedback. Apply colors to an element's background, border, or text according to its purpose.

The following tables provide example colors for control add-in content. They aren't an exhaustive specification of the [!INCLUDE[prod_short](../includes/prod_short.md)] client. Rendered colors can vary by component, background, and interaction state.

Check contrast for each combination you use. For normal text, use a contrast ratio of at least 4.5:1 between the text and its background. Learn more in [WCAG contrast guidance](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html).

### Example main colors

| Color | Name | Use | Hex value |
|-------|------|-----|-----------|
| :::image type="content" source="media/style/00B7C3.png" alt-text="Primary turquoise color swatch with hex value 00B7C3."::: | Primary | Prominent UI elements and areas. | `#00B7C3` |
| :::image type="content" source="media/style/505C6D.png" alt-text="Secondary blue-gray color swatch with hex value 505C6D."::: | Secondary | UI elements and areas in a default or subdued state. | `#505C6D` |

### Example status colors

These colors can help communicate status or draw attention to conditions and user activity. For example, color can help distinguish Cue values. A color's name doesn't guarantee sufficient contrast with every background. Use text or another indicator alongside color so that the meaning remains clear.

| Color | Name | Hex value |
|-------|------|-----------|
| :::image type="content" source="media/style/212121.png" alt-text="Standard dark gray color swatch with hex value 212121."::: | Standard | `#212121` |
| :::image type="content" source="media/style/00B7C3.png" alt-text="Accent turquoise color swatch with hex value 00B7C3."::: | Accent | `#00B7C3` |
| :::image type="content" source="media/style/212121.png" alt-text="Strong dark gray color swatch with hex value 212121."::: | Strong | `#212121` |
| :::image type="content" source="media/style/35AB22.png" alt-text="Favorable green color swatch with hex value 35AB22."::: | Favorable | `#35AB22` |
| :::image type="content" source="media/style/9F9700.png" alt-text="Ambiguous yellow-green color swatch with hex value 9F9700."::: | Ambiguous | `#9F9700` |
| :::image type="content" source="media/style/EB6965.png" alt-text="Unfavorable red color swatch with hex value EB6965."::: | Unfavorable | `#EB6965` |
| :::image type="content" source="media/style/EB6965.png" alt-text="Attention red color swatch with hex value EB6965."::: | Attention | `#EB6965` |
| :::image type="content" source="media/style/A7ADB6.png" alt-text="Subordinate gray color swatch with hex value A7ADB6."::: | Subordinate | `#A7ADB6` |

### Additional example colors

The following table provides more colors for your add-in's UI elements.

| Color | Name | Hex value |
|-------|------|-----------|
| :::image type="content" source="media/style/C9C472.png" alt-text="Additional yellow color swatch with hex value C9C472."::: | Yellow | `#C9C472` |
| :::image type="content" source="media/style/88CE81.png" alt-text="Additional green color swatch with hex value 88CE81."::: | Green | `#88CE81` |
| :::image type="content" source="media/style/E97768.png" alt-text="Additional red color swatch with hex value E97768."::: | Red | `#E97768` |
| :::image type="content" source="media/style/75B5E7.png" alt-text="Additional blue color swatch with hex value 75B5E7."::: | Blue | `#75B5E7` |
| :::image type="content" source="media/style/59CCB4.png" alt-text="Additional light green color swatch with hex value 59CCB4."::: | Light green | `#59CCB4` |
| :::image type="content" source="media/style/75D8E7.png" alt-text="Additional sky blue color swatch with hex value 75D8E7."::: | Sky | `#75D8E7` |
| :::image type="content" source="media/style/EEEA86.png" alt-text="Additional egg yellow color swatch with hex value EEEA86."::: | Egg | `#EEEA86` |
| :::image type="content" source="media/style/E89E63.png" alt-text="Additional orange color swatch with hex value E89E63."::: | Orange | `#E89E63` |
| :::image type="content" source="media/style/DBBDEB.png" alt-text="Additional violet color swatch with hex value DBBDEB."::: | Violet | `#DBBDEB` |
| :::image type="content" source="media/style/39B294.png" alt-text="Additional teal green color swatch with hex value 39B294."::: | Teal | `#39B294` |
| :::image type="content" source="media/style/73BA5A.png" alt-text="Additional grass green color swatch with hex value 73BA5A."::: | Grass | `#73BA5A` |
| :::image type="content" source="media/style/E65E6D.png" alt-text="Additional scarlet color swatch with hex value E65E6D."::: | Scarlet | `#E65E6D` |

### Example chart colors

Use these example colors for chart series in your control add-in. They don't define the complete palette, order, or opacity used by every [!INCLUDE[prod_short](../includes/prod_short.md)] chart. Include labels or other indicators so that users don't have to rely on color alone.

| Color | Name | Hex value |
|-------|------|-----------|
| :::image type="content" source="media/style/505C6D.png" alt-text="Chart secondary blue-gray color swatch with hex value 505C6D."::: | Secondary | `#505C6D` |
| :::image type="content" source="media/style/008089.png" alt-text="Chart dark teal color swatch with hex value 008089."::: | Dark teal | `#008089` |
| :::image type="content" source="media/style/00B7C3.png" alt-text="Chart primary turquoise color swatch with hex value 00B7C3."::: | Primary | `#00B7C3` |
| :::image type="content" source="media/style/C9C472.png" alt-text="Chart yellow color swatch with hex value C9C472."::: | Yellow | `#C9C472` |
| :::image type="content" source="media/style/E97768.png" alt-text="Chart red color swatch with hex value E97768."::: | Red | `#E97768` |
| :::image type="content" source="media/style/75B5E7.png" alt-text="Chart blue color swatch with hex value 75B5E7."::: | Blue | `#75B5E7` |
| :::image type="content" source="media/style/59CCB4.png" alt-text="Chart light green color swatch with hex value 59CCB4."::: | Light green | `#59CCB4` |
| :::image type="content" source="media/style/75D8E7.png" alt-text="Chart sky blue color swatch with hex value 75D8E7."::: | Sky | `#75D8E7` |
| :::image type="content" source="media/style/EEEA86.png" alt-text="Chart egg yellow color swatch with hex value EEEA86."::: | Egg | `#EEEA86` |
| :::image type="content" source="media/style/DBBDEB.png" alt-text="Chart violet color swatch with hex value DBBDEB."::: | Violet | `#DBBDEB` |
| :::image type="content" source="media/style/39B294.png" alt-text="Chart teal green color swatch with hex value 39B294."::: | Teal | `#39B294` |
| :::image type="content" source="media/style/73BA5A.png" alt-text="Chart grass green color swatch with hex value 73BA5A."::: | Grass | `#73BA5A` |

### Apply colors with CSS

Use the following CSS properties to set colors:

| Property | Purpose |
|----------|---------|
| `color` | Sets the text color. |
| `background-color` | Sets the background color. |
| `border-color` | Sets the border color. A visible border also requires a border style and width. |

For example, the following rule pairs dark text with a white background:

```css
.addin {
    color: #212121;
    background-color: #ffffff;
}
```

To use the Secondary color as a background, pair it with white text:

```css
.my-ui-part {
    color: #ffffff;
    background-color: #505C6D;
}
```

You can also apply a palette color to a caption. The following example uses Primary text on a dark background. Check contrast again if you change either color.

```css
.my-caption {
    color: #00B7C3;
    background-color: #212121;
}
```

## Choose fonts and text sizes

Typography helps make text readable and communicate hierarchy. Use font families, weights, and sizes consistently for headings, captions, and messages.

Choose readable fonts and test them on the devices your users work with. Font availability varies by device. End each `font-family` list with a generic family such as `sans-serif` so that the browser can choose a fallback.

### Example font families

The following font stacks are examples, not required settings for a control add-in. The browser uses the list order to select an available font.

| Example | Name | CSS `font-family` value |
|---------|------|-----------------------|
| :::image type="content" source="media/style/segoe-ui.png" alt-text="Font preview showing the Segoe UI regular typeface."::: | Segoe UI | `"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif` |
| :::image type="content" source="media/style/segoe-ui-light.png" alt-text="Font preview showing the Segoe UI Light typeface."::: | Segoe UI Light | `"Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
| :::image type="content" source="media/style/segoe-ui-semi-light.png" alt-text="Font preview showing the Segoe UI Semilight typeface."::: | Segoe UI Semilight | `"Segoe UI Semilight", "Segoe WP Semilight", device-segoe-semilight, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |
| :::image type="content" source="media/style/segoe-ui-semi-bold.png" alt-text="Font preview showing the Segoe UI Semibold typeface."::: | Segoe UI Semibold | `"Segoe UI Semibold", "Segoe WP Semibold", device-segoe-semibold, "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif` |

Keep the listed font order when using one of these stacks. Removing or reordering fonts changes which available font the browser selects.

Learn more about fallback selection in the [CSS font-family reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/font-family).

### Example font sizes

The following table shows example text sizes. The names are descriptive labels, not public CSS variables or a complete client-wide size scale. The same font family can appear at different sizes on different clients.

| Example | Name | Value |
|---------|------|-------|
| :::image type="content" source="media/style/37-5-fontsize.png" alt-text="Text preview showing the largest plus size at 37.5 points."::: | Largest plus | `37.5pt` |
| :::image type="content" source="media/style/30-fontsize.png" alt-text="Text preview showing the largest font size at 30 points."::: | Largest | `30pt` |
| :::image type="content" source="media/style/22-5-fontsize.png" alt-text="Text preview showing the large plus size at 22.5 points."::: | Large plus | `22.5pt` |
| :::image type="content" source="media/style/18-fontsize.png" alt-text="Text preview showing the large font size at 18 points."::: | Large | `18pt` |
| :::image type="content" source="media/style/15-fontsize.png" alt-text="Text preview showing the medium plus font size at 15 points."::: | Medium plus | `15pt` |
| :::image type="content" source="media/style/13-5-fontsize.png" alt-text="Text preview showing the medium font size at 13.5 points."::: | Medium | `13.5pt` |
| :::image type="content" source="media/style/12-fontsize.png" alt-text="Text preview showing the small plus font size at 12 points."::: | Small plus | `12pt` |
| :::image type="content" source="media/style/10-5-fontsize.png" alt-text="Text preview showing the small font size at 10.5 points."::: | Small | `10.5pt` |
| :::image type="content" source="media/style/9-fontsize.png" alt-text="Text preview showing the smallest font size at 9 points."::: | Smallest | `9pt` |

Use relative units such as `rem` or `em` for your add-in's text sizes. Test the result with enlarged text and browser zoom. Learn more in the [CSS font-size reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/font-size).

### Apply fonts with CSS

Set `font-family` and `font-size` on your add-in content. For example:

```css
.addin {
    font-family: "Segoe UI", Arial, sans-serif;
    font-size: 1rem;
    line-height: 1.5;
}
```

To use the Segoe UI Light stack and the Small size from the tables, specify both properties:

```css
.my-ui-part {
    font-family: "Segoe UI Light", "Segoe WP Light", device-segoe-light, "Segoe WP Semilight", "Segoe UI", "Segoe WP", Segoe, Tahoma, Helvetica, Arial, sans-serif;
    font-size: 10.5pt;
}
```

This example shows how the table values map to CSS. For your add-in's layout, prefer relative text sizes and test readability on the target devices.

## Example: Style labeled inputs and a button

The following example styles only the content of a control add-in. Its colors, font stack, and sizes are illustrative choices, not a specification of the [!INCLUDE[prod_short](../includes/prod_short.md)] client.

The HTML uses a label for each input and a standard button. This example shows styling only. The button doesn't submit data or call AL.

```html
<div class="addin">
    <div class="control">
        <label for="given-name">First name</label>
        <input id="given-name" name="givenName" type="text" autocomplete="given-name">
    </div>

    <div class="control">
        <label for="family-name">Last name</label>
        <input id="family-name" name="familyName" type="text" autocomplete="family-name">
    </div>

    <button type="button">Submit</button>
</div>
```

The CSS provides readable text, spacing, and a visible focus outline. The form controls inherit the add-in's font settings.

```css
.addin {
    padding: 1rem;
    color: #212121;
    background-color: #ffffff;
    font-family: "Segoe UI", Arial, sans-serif;
    font-size: 1rem;
    line-height: 1.5;
}

.addin .control {
    margin-bottom: 1rem;
}

.addin label {
    display: block;
    margin-bottom: 0.25rem;
}

.addin input {
    box-sizing: border-box;
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #616161;
    color: inherit;
    background-color: #ffffff;
    font: inherit;
}

.addin button {
    padding: 0.5rem 1rem;
    border: 1px solid #006f78;
    color: #ffffff;
    background-color: #006f78;
    font: inherit;
    cursor: pointer;
}

.addin input:focus-visible,
.addin button:focus-visible {
    outline: 2px solid #212121;
    outline-offset: 2px;
}
```

Before publishing your add-in, test keyboard navigation, screen reader labels, text contrast, forced-color modes, and layout at different sizes and zoom levels.

## Related information

[Control add-in object](devenv-control-addin-object.md)  
[StyleSheets property](properties/devenv-stylesheets-property.md)  
[Control add-in performance best practices](devenv-control-addin-bestpractices.md)  
[Labeling form controls](https://www.w3.org/WAI/tutorials/forms/labels/)  
