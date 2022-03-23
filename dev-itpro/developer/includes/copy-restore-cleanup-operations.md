---
author: jobulsin
ms.topic: include
ms.date: 01/18/2022
ms.author: jobulsin
---
- The following setups are set to status disabled
  - Doc. Exch. Service Setup
  - Curr. Exch. Rate Update Setup
  - VAT Reg. No. Srv Config
  - Graph Mail Setup
  - CRM Connection Setup
  - CDS Connection Setup
  - All records in the Service Connection table
  - All records in the Exchange Sync table
- The following data is cleared
  - Password in the OCR Service Setup table
  - SMTP Server in SMTP Mail Setup
  - Exchange Service URL in the Marketing Setup table
- The following changes are made for first-party extensions
  - AMC Banking 365 Fundamentals
    - The Service URL in AMC Banking Setup is reset to default for Sandbox environments
  - Email - Outlook REST API
    - All email accounts of types "Microsoft 365" and "Current User" are deleted. Deleting these records turns any existing field monitoring setup non-valid.
  - Email - SMTP Connector
    - SMTP Server details are deleted
- The following changes are made for specific localizations
  - Spain
    - SII Setup is set to disabled
  - United Kingdom
    - Password in GovTalk Setup table is deleted
  - Netherlands
    - All Digipoort related fields in the Elec. Tax Declaration Setup table are cleared
