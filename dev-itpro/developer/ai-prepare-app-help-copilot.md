---
title: Prepare your app Help for Copilot
description: Explore how Copilot uses your app's online content as grounding data to deliver precise answers to user queries.
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ms.author: mikebc
ms.topic: concept-article
ms.date: 07/03/2025
ms.collection:
  - bap-ai-copilot
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:07/03/2025
---

# Prepare your app Help for Copilot

The [!INCLUDE [prod_short](includes/prod_short.md)] user assistance model is based on principles of helping users get started, get unblocked, and learn more. Copilot in [!INCLUDE [prod_short](includes/prod_short.md)] makes it easy for users to learn new skills or quickly get unblocked by allowing them to ask questions in their own words, or quickly get answers at the click of a button – without leaving the [!INCLUDE [prod_short](includes/prod_short.md)] app. 

When your customers install your app and want to learn about functionality that your app provides, such as how to set up and configure, how to get past specific error messages, or how to use certain fields or pages, your app must link to your online content that includes this information, so that Copilot can it to provide answers. Rather than relying on Large Language Models to answer questions, where the AI model might not know the details of your app, Copilot uses your online content as grounding data to provide better answers. 

Copilot is able to access content in a wide range of styles, languages, and hosted on different publishing platforms. This article highlights the limitations and best practices you need to be aware of, to increase the chance of Copilot successfully answering questions about your app.

## Recommended process to verify Copilot readiness

The best way to verify that Copilot can reach your help content and is able to return good quality responses is to test this directly through [!INCLUDE [prod_short](includes/prod_short.md)]. The following steps can help you plan your approach: 

1. Deploy a sandbox environment and install your app. 
1. Ensure Copilot Chat is active and all prerequisites are satisfied. <!-- Learn more -- link -->. 
1. Carefully plan which questions to ask Copilot, providing sufficient coverage across different aspects of your app, such as different roles, processes, fields, pages your app supports. To start with, 5-10 questions can be sufficient for an initial test.
1. Ask Copilot, either directly using the Copilot pane, or by using the “Ask Copilot” action on tooltips for fields from your app.  
1. Capture and analyze the responses.  
    1. If Copilot provides responses based on Microsoft’s online documentation or is unable to answer the question, this might be because your online content is unreachable, or you're using a publishing platform or web content structure that isn't supported.
    1. If Copilot provides responses that include references to your online content, but the results are of poor quality, you might need to optimize your content to match how Copilot searches and retrieves information. 

> [!TIP]
> You can also test the AI-readiness of your online content by using Microsoft Copilot Studio’s feature Generative Answers. This uses similar technology to Copilot in Business Central, but isn't identical and might not produce the same results or reveal issues with Copilot connecting to your online content. 

## Making help content reachable by Copilot 

Copilot doesn’t do a broad web search to find your online content. Instead, it relies on hints from your app.json for where to find your documentation. The following table highlights requirements that might affect whether Copilot can reach your online content. 


| Criteria | Detail | Examples |
|----------|--------|----------|
|URL hint | The Help property in the app.json file must contain a valid URL that links to your online content. Copilot uses this URL to search for help content. | Use this: `"help": "https://fabrikam.com/docs"` <br> Avoid this: URLs to websites you don't own, such as search engines or social media sites. |
|URL domain structure | Copilot searches and uses content at the URL you specify including deeper paths in the URL structure and subdomains. The URL you specify can be at most two path levels deep. If your URL includes three or more levels, Copilot truncates this URL to two levels and removes any fragments and queries, and uses all content below that. If you offer multiple apps where your online content is organized by app at three levels deep, Copilot might pick up irrelevant content from other apps and provide lower-quality responses. | If you set “help” to `https://www.fabrikam.com/engines/rotary` then <br> the content at `https://www.fabrikam.com/engines/rotary/dual-shaft` will also be used. <br> but the content at `https://www.fabrikam.com/tools` isn’t used. <br>and the content at `https://docs.fabrikam.com` isn’t used <br><br>Use this: `https://fabrikam.com/path1/path2` <br>Avoid this: `https://fabrikam.com/path1/path2/path3` |
| Redirection | Copilot doesn't support URLs that redirect to another top-level site or domain, such as those typically used for URL shortening. Redirection across URL paths within the same domain is supported. | Use this: `https://fabrikam.com/docs` <br> Avoid this: `https://aka.ms/FabrikamDocs` |
| HTTPS | URLs must be secure and start with HTTPS | Use this: `https://fabrikam.com/docs` <br> Avoid this: `http://fabrikam.com/docs` |
|Public access | Copilot can only reach online content available publicly and indexed by Bing. It can't reach any URLs that are internal to your customers’ organization, such as intranet web apps or SharePoint sites. | Use this: `https://fabrikam.com/docs` <br> Avoid this: `https://fabrikam.sharepoint.com/docs` |
| Authentication | Online content must be publicly reachable without authentication. Copilot isn't able to sign into any website, not even with the current user’s credentials. | |
| Format | Copilot primarily finds and uses text-base content. PDF documents and Microsoft Excel spreadsheets hosted directly at a URL path on your website can be used by Copilot as long as they aren't embedded on an HTML page. Copilot isn't using any content from images, videos, slides, or Microsoft Word documents.| A PDF that contains troubleshooting information available at `https://fabrikam.com/docs/troubleshooting.pdf` is used. |

Copilot is designed to work primarily with add-on apps installed from Microsoft AppSource. If customizations (per-tenant extensions) satisfy the above criteria, Copilot is also able to answer questions about those customizations. 

> [!IMPORTANT]
> App publishers are responsible for the URLs they choose to include with their apps and all content that the URL contains or leads to. You must regularly ensure that your online documentation is free of malicious or harmful content, uses language appropriate for work, and is relevant to your app. By specifying a URL in the `contextSensitiveHelpUrl` property of your `app.json` file, you confirm that you're the owner of this website and are responsible for the quality of your content. 

## Optimize language and style for Copilot 

Copilot Chat is validated and supported in English only. While it can be used in other languages, it might not function as intended. Language quality might vary if your online content isn't in English language, which might affect accuracy and the user experience. 

Copilot works best when content is structured and formatted similar to Microsoft’s own online documentation at [learn.microsoft.com](https://learn.microsoft.com). The following tips can help improve the output of Copilot. 

- Text-based webpages that focus on one specific topic often provide better results. 
- Shorter webpages tend to produce better results. 
- For PDF files, smaller PDFs with fewer pages, or having specific topics per page, might provide better results. 
- When content is a mix of text and images such as icons, illustrations, or pictures, Copilot might miss important context or information that is conveyed by those images, and might provide lower quality results. 

## Related information