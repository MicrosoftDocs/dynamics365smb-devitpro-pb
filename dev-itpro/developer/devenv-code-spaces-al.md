---
title: Use GitHub Codespaces for AL development
description: GitHub Codespaces gives you a ready-to-use, cloud-hosted development environment for AL that runs in your browser.
author: SusanneWindfeldPedersen
ms.date: 03/25/2026
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
---

# Use GitHub Codespaces for AL development

GitHub Codespaces gives you a ready-to-use, cloud-hosted development environment for [!INCLUDE [prod_short](includes/prod_short.md)] that runs in your browser. Instead of spending time installing tools on your local machine, you open a codespace and start writing AL code in minutes. This article shows you how to set one up, explains the configuration options, and walks you through common tasks.

## What is a codespace?

A codespace is a development environment hosted in the cloud by GitHub. It runs Visual Studio Code in your browser, or connects to your local Visual Studio Code, and comes with all the tools and extensions your project needs - defined in a configuration file called `devcontainer.json`.

Think of it as your development laptop in the cloud. When you open a codespace, it builds a container with your preferred editor settings, extensions, and tools already installed. Close the browser, and your work is saved. Open it again, and you're right back where you left off.

## Why use Codespaces for AL?

Here are some reasons you might want to use Codespaces:

- Fast onboarding - New team members get a working environment in minutes, not hours.
- No local setup - No need to install Visual Studio Code, the AL Language extension, PowerShell, or .NET locally.
- Consistency - Everyone on the team works in the same environment, which reduces "it works on my machine" issues.
- Low-spec hardware friendly - Because the heavy lifting happens in the cloud, you can develop from a Chromebook, tablet, or older laptop.
- Cross-platform - Works on Windows, macOS, and Linux since it runs in a browser.  

  > [!NOTE]
  > GitHub Codespaces requires a GitHub account and uses your GitHub billing plan. Free accounts include a limited number of codespace hours each month. Learn more in [GitHub Codespaces billing](https://docs.github.com/billing/concepts/product-billing/github-codespaces).

## Prerequisites

Before you start, make sure you have the following:

- A [GitHub](https://github.com/) account.
- A repository on GitHub that contains your AL project (or a repository where you want to start a new project).
- Access to a Business Central environment (online sandbox or on-premises) for downloading symbols and publishing extensions.

> [!TIP]
> If you're new to GitHub, see [Getting started with GitHub](https://docs.github.com/get-started). If you're new to AL development, learn more in [Get started with AL](devenv-get-started.md).

## Understand the devcontainer.json file

The `devcontainer.json` file is the heart of your codespace configuration. It tells GitHub which container image to use, which tools to install, which Visual Studio Code extensions to include, and how to configure the editor.

Place this file in a `.devcontainer` folder in your repository. You can have multiple configurations in subfolders if your repository contains different projects.

Here's an example based on the [BCApps repository](https://github.com/microsoft/BCApps/blob/main/.devcontainer/BCApps/devcontainer.json):

```json
{
  "name": "Business Central AL Dev",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/devcontainers/features/dotnet:2": {
      "version": "8.0"
    },
    "ghcr.io/devcontainers/features/powershell:1": {},
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-dynamics-smb.al",
        "GitHub.copilot",
        "GitHub.copilot-chat",
        "GitHub.vscode-pull-request-github",
        "GitHub.vscode-github-actions",
        "ms-azuretools.vscode-docker",
        "ms-vscode.powershell"
      ],
      "settings": {
        "al.enableCodeAnalysis": true,
        "al.enableCodeActions": true,
        "al.codeAnalyzers": [
          "${CodeCop}",
          "${UICop}"
          // "${PerTenantExtensionCop}",
          // "${AppSourceCop}"
        ],
        "al.useVsCodeAuthentication": true
      }
    }
  }
}
```

> [!NOTE]
> The `devcontainer.json` format supports comments (JSONC), so the `//` lines in the example above are valid. GitHub Codespaces and Visual Studio Code both handle them correctly.

The following sections break down each part of this file.

### Container image

```json
"image": "mcr.microsoft.com/devcontainers/base:ubuntu"
```

This line specifies the base operating system for your codespace. The `base:ubuntu` image is a lightweight Linux container that serves as a starting point. You add tools and languages on top of it through features.

### Features

```json
"features": {
  "ghcr.io/devcontainers/features/dotnet:2": { "version": "8.0" },
  "ghcr.io/devcontainers/features/powershell:1": {},
  "ghcr.io/devcontainers/features/node:1": {},
  "ghcr.io/devcontainers/features/github-cli:1": {}
}
```

Features are prepackaged tool installers. Instead of writing custom scripts, you declare which tools you need:

| Feature | What it adds | Why you need it |
|---------|-------------|----------------|
| dotnet | .NET SDK (version 8.0) | Required by some AL build tools and scripts |
| PowerShell | PowerShell Core | Used for build scripts and automation tasks |
| node | Node.js and npm | Needed for frontend tooling and task runners |
| github-cli | GitHub CLI (gh) | Create pull requests, manage issues, and trigger workflows from the terminal |

Browse available features at [containers.dev/features](https://containers.dev/features).

### VS Code extensions

```json
"extensions": [
  "ms-dynamics-smb.al",
  "GitHub.copilot",
  "GitHub.copilot-chat",
  "GitHub.vscode-pull-request-github",
  "GitHub.vscode-github-actions",
  "ms-azuretools.vscode-docker",
  "ms-vscode.powershell"
]
```

Extensions are installed automatically when the codespace starts. They fall into two categories: the AL extension you need for Business Central development, and the GitHub extensions that help you work with your repository.

Business Central development:

| Extension | Purpose |
|-----------|---------|
| ms-dynamics-smb.al | The AL Language extension - provides IntelliSense, compilation, and deployment for Business Central |
| ms-vscode.PowerShell | PowerShell language support for build and automation scripts |

GitHub workflow (recommended for projects hosted on GitHub):

| Extension | Purpose |
|-----------|---------|
| GitHub.copilot | AI-powered code suggestions as you type |
| GitHub.copilot-chat | Chat interface for asking Copilot questions about your code |
| GitHub.vscode-pull-request-github | Create, review, and manage pull requests without leaving VS Code |
| GitHub.vscode-github-actions | View workflow runs, check build status, and debug failed actions |
| ms-azuretools.vscode-docker | Manage Docker containers, images, and registries - useful if your workflow involves Business Central Docker containers |

> [!TIP]
> The example installs the stable release of the AL Language extension. If you want the latest preview features, append @prerelease to the extension identifier: "ms-dynamics-smb.al@prerelease". The prerelease version gives you early access to new language features and fixes, but might occasionally include breaking changes. For production projects, the stable release is the safer choice.

> [!NOTE]
> The GitHub Copilot extensions require a GitHub Copilot subscription. If your team doesn't have Copilot licenses, remove those two extensions from the list - the codespace works fine without them.

### AL Language settings

```json
"settings": {
  "al.enableCodeAnalysis": true,
  "al.enableCodeActions": true,
  "al.codeAnalyzers": [
    "${CodeCop}",
    "${UICop}"
    // "${PerTenantExtensionCop}",
    // "${AppSourceCop}"
  ],
  "al.useVsCodeAuthentication": true
}
```

These settings configure the AL development experience:

**al.enableCodeAnalysis** - Turns on the built-in code analysis tools that check your code for common issues and best practices.
**al.enableCodeActions** - Enables quick-fix suggestions (the light bulb icon) so you can resolve code analyzer warnings with a single select.
**al.codeAnalyzers** - Specifies which analyzers to run. CodeCop and UICop are enabled by default. Uncomment the analyzer that matches your extension type (see the table below).
**al.useVsCodeAuthentication** - Uses VS Code's built-in authentication to sign in to Business Central. This is the recommended approach in Codespaces because it works seamlessly with browser-based authentication.

Learn more about code analyzers in [Using the code analysis tool](devenv-using-code-analysis-tool.md).

The available analyzers are:

| Analyzer | Purpose | When to enable |
|----------|---------|----------------|
| CodeCop | Enforces general AL coding guidelines | Always - included by default |
| UICop | Checks user interface best practices | Always - included by default |
| PerTenantExtensionCop | Enforces per-tenant extension rules | Uncomment for per-tenant extensions (PTE) built for a specific customer |
| AppSourceCop | Enforces AppSource submission rules | Uncomment for apps published globally through AppSource |

> [!IMPORTANT]
> Enable either `PerTenantExtensionCop` or `AppSourceCop` based on your deployment target - not both. Per-tenant extensions are installed for a single customer, while AppSource apps are published to the marketplace for all Business Central customers.

## Set up your first codespace

Follow these steps to create a codespace with Business Central development tools:

### Step 1: Add the configuration file

1. In your GitHub repository, create a `.devcontainer` folder.
2. Inside that folder, create a file called `devcontainer.json`.
3. Copy the example configuration from the previous section and adjust it to match your project needs.
4. Commit and push the file to your repository.
1. 
Your repository structure should look something like this:

```
your-repo/
  .devcontainer/
    devcontainer.json
  app/
    app.json
    src/
      ...
```

### Step 2: Open a codespace

1. Go to your repository on GitHub.
2. Select the Code button, then select the Codespaces tab.
3. Select Create codespace on main (or the branch you want to work on).
4. Wait for the codespace to build. The first time takes a few minutes while it downloads the container image and installs extensions.

### Step 3: Connect to Business Central

After your codespace is running, configure your AL project to connect to a Business Central environment:

1. Open the `launch.json` file in your project's `.vscode` folder.
2. Set the `server` property to point to your Business Central environment.
3. Download symbols by pressing Ctrl+Shift+P and selecting `AL: Download symbols`.
4. Sign in when prompted.

Learn more about configuring `launch.json` in [Launch JSON file](devenv-json-launch-file.md).

> [!NOTE]
> Because a codespace runs in the cloud, it connects to your [!INCLUDE [prod_short](includes/prod_short.md)] environment over the internet. Make sure your environment is accessible from outside your corporate network, or use a Business Central online sandbox.

## Customize your codespace

You can tailor your codespace for your team's specific needs. Here are some common customizations.

### Add more Visual Studio Code extensions

Add any extension identifier to the extensions array. For example, you might add YAML support for editing GitHub Actions workflows or a spell checker for documentation:

```json
"extensions": [
  "ms-dynamics-smb.al",
  "ms-vscode.yaml",
  "streetsidesoftware.code-spell-checker"
]
```

### Add environment variables

Use `containerEnv` to set environment variables available inside the codespace:

```json
"containerEnv": {
  "BC_ENVIRONMENT": "sandbox",
  "AL_PROJECT_PATH": "/workspaces/my-project/app"
}
```

### Forward ports

If your workflow involves connecting to external services or running local dev tools that expose ports, you can forward them:

```json
"forwardPorts": [8080, 3000]
```

### Run setup scripts

Use `postCreateCommand` to run a setup script that installs project-specific dependencies:

```json
"postCreateCommand": "pwsh -File .devcontainer/setup.ps1"
```

### Configure MCP servers (advanced)

You can add Model Context Protocol (MCP) servers to give AI tools like GitHub Copilot access to external knowledge sources. This is an advanced configuration that you can skip when getting started. For example, to give Copilot access to Microsoft Learn documentation:

```json

"customizations": {
  "vscode": {
    "mcp": {
      "servers": {
        "ms-learn-mcp": {
          "url": "https://learn.microsoft.com/api/mcp",
          "type": "http"
        }
      }
    }
  }
}
```

## Limitations and considerations

Keep the following points in mind when using Codespaces for Business Central development:

- **No local Business Central container** - Codespaces run on Linux. You can't run a Windows-based Business Central Docker container inside a codespace. Instead, connect to an external Business Central environment (online sandbox or a server reachable over the internet).
- **Debugging** - You can debug AL code against a Business Central online sandbox. On-premises debugging requires the server to be reachable from the internet.
- **AL extension on Linux** - The AL Language extension runs on Linux in Codespaces. Some features that depend on Windows-specific components might behave differently. Check the AL Language extension configuration for the latest compatibility information.
- **Performance** - Codespace performance depends on your selected machine type. For large AL projects, choose a machine with more cores and memory.
- **Cost** - Codespaces are billed based on compute time and storage. Stop your codespace when you're not using it to manage costs.

> [!TIP]
> Set an idle timeout in your GitHub codespace settings to automatically stop Codespaces after a period of inactivity. This helps you avoid unexpected charges.

## Tips for consultants and functional users

If you're a Business Central consultant or functional user who wants to explore AL development without a complex local setup, Codespaces are a good starting point. Here are some tips:

- **Start with a template** - Fork a repository that already has a `devcontainer.json` configured, such as the BCApps repository. Then customize it for your project.
- **Use a Business Central online sandbox** - Connect your codespace to a sandbox environment to safely test your extensions without affecting production data.
- **Let code analyzers guide you** - Enable CodeCop and UICop in your configuration. They highlight issues and suggest fixes as you type, which is a great way to learn AL best practices.
- **Use GitHub Copilot** - If you have access to GitHub Copilot, it can help you write AL code by suggesting completions based on your comments and existing code. It's like having a coding assistant who knows AL.
- **Don't worry about "breaking" anything** - A codespace is isolated. If something goes wrong, delete it and create a new one in minutes.

## Related information

[Get started with AL](devenv-get-started.md)
[Developing extensions in AL](devenv-dev-overview.md)
[AL Language extension configuration](devenv-al-extension-configuration.md)
[Launch JSON file](devenv-json-launch-file.md)
[Using the code analysis tool](devenv-using-code-analysis-tool.md)
[AppSourceCop analyzer rules](analyzers/appsourcecop.md)
[CodeCop analyzer rules](analyzers/codecop.md)
[Running a container-based development environment](devenv-running-container-development.md)
[GitHub Codespaces documentation](https://docs.github.com/codespaces)
[Dev containers specification](https://containers.dev/)
[GitHub Codespaces billing](https://docs.github.com/billing/concepts/product-billing/github-codespaces)