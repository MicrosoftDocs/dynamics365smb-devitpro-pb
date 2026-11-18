To control data ingestion cost, you can:

- Use ingestion sampling to ingest only a percentage of the inbound data. Learn more in [Ingestion sampling in Application Insights](/previous-versions/azure/azure-monitor/app/sampling-classic-api#ingestion-sampling).
- Set a daily cap as a safeguard against unexpected ingestion spikes. Data collection stops when the cap is reached, and the cap can be exceeded.
- Set alerts on cost thresholds being exceeded to get notified when it happens.
- Use data collection rules (DCR) to filter the type of data you want.
- Use a custom endpoint. Learn more in [Use a custom endpoint](../administration/telemetry-control-cost.md#use-a-custom-endpoint).

Find the ingestion sampling and daily cap settings under **Usage and estimated costs** in [!INCLUDE[appinsights](azure-appinsights-name.md)]. Configure data collection rules on the linked Log Analytics workspace under **Tables**. Learn more in [Set daily cap on Log Analytics workspace](/azure/azure-monitor/logs/daily-cap).