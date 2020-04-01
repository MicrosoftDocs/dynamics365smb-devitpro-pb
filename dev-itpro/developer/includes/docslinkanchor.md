If your website supports two or more locales, you can use DocFx to generate HTML files for the relevant languages. However, you may experience problems with links to anchors, also known as bookmarks.  

For example, if your content has a link from article1.md to a specific section in article2.md, that link would be formatted like this: ```[My translated subheading](article2.md#my-translated-subheading)```. Then, when you run DocFx to generate HTML files in Danish, DocFx will convert that link to ```[Min oversatte overskrift](article2.md#min-oversatte-overskrift)```. That is not a problem because the link will work in both English and Danish.  

But if you then want to use that link elsewhere, the link only works for one of the languages because the anchor changed its name in the Danish translation. If you link to that subheading in article2 from your marketing site or support site, or if you use it as the value of the [ContextSensitiveHelpPage](../properties/devenv-contextsensitivehelppage-property.md) property, then it only works in English.  

To work around this problem, we recommend that you create explicit anchors by tagging your subheading to give it a *fixed anchor*. The following example illustrates how that would look in MarkDown:

```markdown
### <a name="subheading"></a>My translated subheading
```

You would then be able to use the same link across all locales: ```[My translated subheading](article2.md#subheading)```, which would render in HTML as ```myurl.com/docs/article2#subheading``` across all languages.  

For more information, see [Using hashtag in cross reference](https://dotnet.github.io/docfx/tutorial/links_and_cross_references.html#using-hashtag-in-cross-reference) in the GitHub documentation.  


> [!NOTE]
> Adding fixed anchors is only relevant if you want to generate a link to a subheading that works consistently across languages.