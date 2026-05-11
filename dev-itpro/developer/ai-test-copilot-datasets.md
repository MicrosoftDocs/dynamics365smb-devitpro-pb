---
title: Datasets
description: Learn how to create datasets for AI tests and agent tests in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.date: 05/11/2026
ms.update-cycle: 180-days
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Datasets

A **dataset** is the foundation of AI testing in [!INCLUDE [prod_short](includes/prod_short.md)]. Since AI tests are inherently data-driven, datasets allow you to simulate various user scenarios and interactions. By using diverse and comprehensive datasets, you can thoroughly evaluate AI features to ensure they meet high standards for correctness, safety, and accuracy.

This article covers two dataset flows:

- **AI test datasets** — simple input/expected-data pairs for evaluating prompt-based Copilot features. JSONL or YAML.
- **Agent test datasets** — richer YAML datasets that drive multi-turn agent scenarios with intervention handling and per-turn setup.

## AI test datasets

AI tests rely on datasets defined in either **JSONL** or **YAML** format. These datasets contain both the test input and the expected values used by Evaluation.

> [!TIP]
> The full source code for the example used in this section is available in the [Marketing Text Simple](ai-test-copilot-testtool.md) demo project.

### Define a JSONL dataset

While there's no rigid schema required, Evaluation supports certain common elements like `test_setup` and `expected_data`. Using these keywords helps create a consistent structure.

Here's an example of a valid JSONL dataset:

```json
{"test_setup": {"item_no": "C-10000", "description": "Contoso Coffee Machine", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
{"test_setup": {"item_no": "C-10001", "description": "Contoso Toaster", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
{"test_setup": {"item_no": "C-10002", "description": "Contoso Microwave Oven", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
```

Each line represents a distinct test case with inputs and expected outputs.

### Define a YAML dataset

You can also define the same dataset in YAML format for improved readability:

```yaml
tests:
  - test_setup:
      item_no: "C-10000"
      description: "Contoso Coffee Machine"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20

  - test_setup:
      item_no: "C-10001"
      description: "Contoso Toaster"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20

  - test_setup:
      item_no: "C-10002"
      description: "Contoso Microwave Oven"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20
```

Datasets can also carry top-level metadata such as `name` and `language`, which is useful when you run multilingual evaluations:

```yaml
name: MARKETING-TEXT
description: Marketing text generation accuracy tests.
language: en-US
tests:
  - test_setup:
      item_no: "C-10000"
      description: "Contoso Coffee Machine"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20
```

## Agent test datasets

Datasets for **agent tests** describe what the agent receives on each turn and what the test should validate afterwards. They use a richer YAML schema with multi-turn support, intervention handling, and reusable suite-level setup.

> [!TIP]
> A complete working example is available in the [`SalesValidationAgent3P`](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent/test) sample on the BCTech repository.

### File kinds

Two YAML file kinds make up an agent test suite. The framework loads `*.yaml` recursively from the test app's `.resources/` folder, so folder names are convention.

| Kind | Convention path | Top-level shape | Required |
|---|---|---|---|
| Suite-setup file | `.resources/suite_setup/<NAME>.yaml` | `name:` + `suite_setup:` as object content | optional |
| Test dataset file | `.resources/datasets/<NAME>.yaml` | `suite_setup:` as scalar reference + `tests:` array | required |

A **suite-setup file** holds data that needs to be set up only once across all tests in the suite — typical examples are master records every test relies on (locations, customers, posting groups). The framework runs it before the first test and skips it on subsequent turns; test code gates re-execution via `IsSuiteSetupDone()` and `SetEvalSuiteSetupCompleted()`.

A **test dataset file** is the per-suite input that the test runner iterates over. It usually references a suite-setup by name but can stand alone if no shared setup is needed.

> [!NOTE]
> Author **one file per language** for localized suites — for example, `MY-AGENT.yaml` and `MY-AGENT-FR.yaml`. The same convention applies to suite-setup files.

### Top-level keys

| Key | Type | Required | Notes |
|---|---|---|---|
| `name` | scalar | required on setup files | Group name. Other datasets reference a suite-setup by this exact string. |
| `description` | scalar | optional | Free-form. |
| `language` | scalar | optional | Windows language tag (`en-US`, …). Used to pick a language-variant suite-setup. |
| `suite_setup` | scalar **or** object | optional | Scalar value references another group's `name:`. Object value is inline content (used in suite-setup files). |
| `tests` | array | required for test datasets | One element per test case. |
| `continue_on_failure` | bool | optional | Per-test flag — when `true`, turn iteration continues after a failed turn. |

### Suite-setup file

A suite-setup file declares its name (so dataset files can reference it) and provides inline `suite_setup:` content.

```yaml
name: MY-AGENT-SETUP
description: Shared master data for the My Agent suite.
suite_setup:
  setup_actions:
    - action_type: create_location
      action_data:
        - Name: MAIN
    - action_type: create_customers
      action_data:
        - "No.": CUST001
          Name: Validation Customer 01
        - "No.": CUST002
          Name: Validation Customer 02
```

The shape under `suite_setup` (`setup_actions` / `action_type` / `action_data`) is a convention defined by your test app — the framework imposes no schema. Your test library walks the JSON, dispatches on `action_type`, and creates records. See [Per-turn setup](#per-turn-setup) for the same convention applied at the turn level.

### Test dataset file

A test dataset file references a suite-setup (when used) and contains the `tests:` array.

```yaml
suite_setup: MY-AGENT-SETUP
tests:
  - name: AGENT_TEST_01
    description: Process a sales order with a future shipment date.
    turns:
      - turn_setup: { ... }     # see "Per-turn setup"
        query: { ... }          # see "Query"
        expected_data: { ... }  # see "Expected data"
```

Always use the `turns:` array, even for single-turn tests. Multi-turn syntax is the only supported shape.

### Query

`query:` describes what the agent receives on a turn. It takes one of two shapes:

**Task input** — used when starting a new agent task (typically turn 1, or any time the agent isn't already paused).

```yaml
query:
  from: Jane Doe                       # sender display name
  title: "Release all open sales orders"
  message: "Release all open sales orders"
  attachments:                         # optional
    - file: invoices/inv-001.pdf
```

`title` is required. `from` and `message` together add a task message; `attachments[].file` paths are resolved against the test app's resources.

**Intervention continuation** — used when the agent paused on the previous turn and is waiting for the user.

```yaml
query:
  intervention:
    suggestion: PROVIDE_DATE           # respond with a suggestion code offered by the agent
    # OR
    instruction: "Use shipment date $DateFormula-<CW+1M>$"   # respond with free-text
```

`intervention.suggestion` and `intervention.instruction` are mutually exclusive. Mixing both in one query, or mixing `title` and `intervention`, results in an error.

### Expected data

`expected_data:` is read by your validator. Most keys are application-defined and implemented in your test library. One sub-key is recognized by the framework: `intervention_request`.

```yaml
expected_data:
  intervention_request:                # framework-recognized
    type: Assistance                   # Assistance | Review | Message
    suggestions:                       # optional list of codes that MUST be present
      - PROVIDE_DATE
  expected_released_count: 1           # application-defined; your validator reads this
```

`type` is the English name of the `Agent User Int Request Type` enum. `suggestions` is optional — when present, every listed code must appear in the agent's actual intervention request.

Declare `intervention_request` on every turn where you expect the agent to pause. The framework fails the turn if the agent pauses without an expected intervention, or fails to pause when one is expected.

### Per-turn setup

`turn_setup:` holds data to materialize in Business Central before the agent runs. The shape is application-defined — most agents use the same `setup_actions` convention as the suite-setup, so one dispatcher in the test library can drive both.

```yaml
turn_setup:
  setup_actions:
    - action_type: create_sales_order
      action_data:
        - "Sell-to Customer No.": CUST001
          "Shipping Advice": Complete
          "Shipment Date": "$DateFormula-<CW+1M>$"
          lines:
            - Quantity: 10
              "Location Code": MAIN
```

Recommendation: match AL field captions exactly (quoted when they contain spaces or special characters), and use placeholders for dates so the test doesn't drift over time. See the next section for the placeholder syntax.

## Placeholders for dates

Hardcoded dates in datasets cause tests to need frequent maintenance as time passes — a test written for a January 2027 shipment date stops behaving the same way once January 2027 is in the past. Datasets express dates through placeholders that are calculated relative to `WorkDate` at run time.

| Form | Resolves to | Example |
|---|---|---|
| `$DateFormula-<formula>$` (whole value) | `Date` | `"$DateFormula-<CW+1M+1D>$"` |
| `$DateFormula-<formula>$` (inside text) | substring replaced with the formatted date | `"Release orders for $DateFormula-<CW+1M>$"` |
| `$DateTimeFormula-<formula>$` | `DateTime` (time = `0T`) | `"$DateTimeFormula-<CD>$"` |
| `$DateTimeFormula-<formula>-HH:MM:SS$` | `DateTime` with explicit time | `"$DateTimeFormula-<CW>-13:30:11$"` |
| `$DateTimeFormula-<formula>-HH:MM:SS.FFFF$` | `DateTime` with milliseconds | `"$DateTimeFormula-<CW>-13:30:11.1301$"` |

`<formula>` is a standard AL DateFormula evaluated against `WorkDate`. Common values: `<CD>` (today), `<CW>` (start of current week), `<CM>` (start of current month), `<CW+1M+1D>`, `<-7D>`, `<+30D>`.

> [!IMPORTANT]
> Always quote placeholder strings in YAML — the `<` and `>` characters are otherwise interpreted as flow-style delimiters by some parsers.

Resolution is automatic when YAML values are read through the test framework. Authors don't need to call a resolver explicitly.

## Backwards compatibility: `question:`

Earlier agent test datasets used `question:` instead of `query:`. The framework still accepts the legacy form so existing tests don't have to be rewritten, but new datasets should use `query:`:

| Legacy | Current |
|---|---|
| `question:` (scalar text or object with `from` / `message`) | `query:` with `title` / `from` / `message` / `attachments`, or `query.intervention` for continuations |
| `AITTestContext.GetQuestion()` | `AITTestContext.GetQuery()` |

The current `query:` shape is required to use multi-turn continuation queries (`query.intervention.suggestion` / `.instruction`), the data-driven driver `LibraryAgent.RunTurnAndWait`, and the framework's automatic intervention validation. See [Write agent tests](ai-test-copilot-agent-tests.md#backwards-compatibility-question-and-getquestion) for migration guidance.

## Get data for your tests

When you create AI tests, the data you use is as important as the AI features you're testing. Quality, consistency, and realism of data are critical for ensuring that your tests are comprehensive and meaningful.

> [!TIP]
> Learn more in [Best practices](ai-test-copilot-bestpractices.md) about other considerations when creating datasets.

### Sources of data for your tests

1. **Public datasets**:
   - There are many publicly available datasets that you can use for AI testing.

2. **Synthetic data**:
   - In cases where real-world data is difficult to obtain or too sensitive, you can generate synthetic data.
   - Synthetic data can be especially useful for testing edge cases or generating large volumes of data quickly.

3. **Customer or internal data**:
   - If you have access to anonymized customer data or internal business datasets, this can be a valuable source for realistic AI testing.
   - Ensure that the data is appropriately anonymized and that you comply with privacy regulations.

4. **Crowdsourced data**:
   - Certain platforms allow you to gather custom data by using crowdsourcing.

5. **Simulated data from domain experts**:
   - In certain domains, domain experts can provide valuable insights into generating realistic and relevant test data.
   - This approach is helpful when real-world data isn't readily available or too sensitive to share.

### More tips for collecting test data

- **Start with small datasets**: Especially when testing new AI features, begin with small, manageable datasets to avoid overwhelming your testing process.
- **Incrementally increase complexity**: As you refine your tests, increase the complexity of the datasets to better simulate real-world scenarios.
- **Document data sources**: Always document the origins of your test data, including any transformations made, to ensure traceability and transparency in your testing process.

## Related information

[Business Central Copilot Evaluation](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[SalesValidationAgent3P sample on BCTech](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent/test)  
[Build the Copilot capability in AL](ai-build-capability-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Evaluation](ai-test-copilot-testtool.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Write agent tests](ai-test-copilot-agent-tests.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  
