To control data ingestion cost, you can:

- sample to only ingest a percentage of the inbound data (learn more at [Sampling in Application Insights](/azure/azure-monitor/app/sampling#ingestion-sampling).
- set a daily limit of how much data can be ingested
- set alerts on cost thresholds being exceeded to get notified when it happens
- use data collection rules (DCR) to filter the type of data you want
- use a custom endpoint ([go to section](#use-a-custom-endpoint))

The first three options for controlling data ingestion cost in [!INCLUDE[appinsights](azure-appinsights-name.md)] are found under _configure, usage, and estimated costs_. Data collection rules are defined on your workspace under the menu item Tables.