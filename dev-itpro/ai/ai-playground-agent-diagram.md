# AI Playground Agent Architecture and Flow Diagram

This diagram illustrates how the AI Playground Agent works in Business Central, from creation through execution.

## Agent Lifecycle and Architecture

```mermaid
graph TB
    subgraph "Prerequisites"
        A[Enable Copilot & Agent Capabilities] --> B[Sandbox Environment]
        B --> C[User with Appropriate Permissions]
    end
    
    subgraph "Agent Creation"
        D[Navigate to Agents Preview Page] --> E[Choose Playground > Create]
        E --> F[Define Basic Identity]
        F --> G[Agent Card Created - Disabled State]
    end
    
    subgraph "Agent Configuration"
        G --> H[Configure Instructions]
        H --> I[Assign Profile/Role]
        I --> J[Set Permission Sets]
        J --> K[Define User Access]
    end
    
    subgraph "Agent Activation"
        K --> L{Agent Complete?}
        L -->|Yes| M[Activate Agent]
        L -->|No| H
        M --> N[Add Tasks - Active State Required]
    end
    
    subgraph "Agent Runtime"
        N --> O[Manual Task Creation]
        O --> P[Task Message + Instructions]
        P --> Q[Agent Processing]
        Q --> R[UI Interaction Based on Profile]
        R --> S[Data Access Based on Permissions]
        S --> T[Task Execution]
        T --> U[Timeline/Log Generation]
    end
    
    subgraph "Monitoring & Iteration"
        U --> V[Review Agent Task Log]
        V --> W[Analyze Performance]
        W --> X{Needs Adjustment?}
        X -->|Yes - Instructions| Y[Deactivate Agent]
        X -->|Yes - Permissions| Y
        X -->|Yes - Tasks| Z[Modify Tasks - Keep Active]
        X -->|No| AA[Continue Testing]
        Y --> H
        Z --> O
        AA --> O
    end
    
    subgraph "Graduation"
        AA --> BB{Ready for Production?}
        BB -->|Yes| CC[Document Learnings]
        BB -->|No| O
        CC --> DD[Choose Development Path]
        DD --> EE[AL Extension Development]
        DD --> FF[Agent Development SDK]
        EE --> GG[Production Implementation]
        FF --> GG
        GG --> HH[Clean Up Playground Agent]
    end

    classDef prerequisite fill:#e1f5fe
    classDef creation fill:#f3e5f5
    classDef config fill:#e8f5e8
    classDef runtime fill:#fff3e0
    classDef iteration fill:#fce4ec
    classDef graduation fill:#f1f8e9

    class A,B,C prerequisite
    class D,E,F,G creation
    class H,I,J,K,L,M,N config
    class O,P,Q,R,S,T,U runtime
    class V,W,X,Y,Z,AA iteration
    class BB,CC,DD,EE,FF,GG,HH graduation
```

## Key Components Detail

```mermaid
graph LR
    subgraph "Agent Identity"
        A1[Name] --> A2[User Display Name]
        A2 --> A3[Initials]
        A3 --> A4[Type: Playground Agent]
    end
    
    subgraph "Instructions"
        B1[Natural Language Goals] --> B2[Structured Formatting]
        B2 --> B3[Specific Keywords]
        B3 --> B4[Business Context]
    end
    
    subgraph "Profile & UI Control"
        C1[Custom Profile] --> C2[Page Customization]
        C2 --> C3[ClearActions]
        C2 --> C4[ClearLayout]
        C2 --> C5[ClearViews]
        C2 --> C6[DeleteAllowed]
        C2 --> C7[InsertAllowed]
    end
    
    subgraph "Permission Sets"
        D1[Least Privilege Principle] --> D2[Data Access Control]
        D2 --> D3[Action Permissions]
        D3 --> D4[Inherited from Creator]
    end
    
    subgraph "Task Execution"
        E1[Manual Task Creation] --> E2[Task Message]
        E2 --> E3[Combined with Instructions]
        E3 --> E4[Agent Processing]
        E4 --> E5[UI Navigation]
        E5 --> E6[Data Operations]
        E6 --> E7[Response Generation]
    end

    classDef identity fill:#e3f2fd
    classDef instructions fill:#f1f8e9
    classDef profile fill:#fff8e1
    classDef permissions fill:#fce4ec
    classDef execution fill:#f3e5f5

    class A1,A2,A3,A4 identity
    class B1,B2,B3,B4 instructions
    class C1,C2,C3,C4,C5,C6,C7 profile
    class D1,D2,D3,D4 permissions
    class E1,E2,E3,E4,E5,E6,E7 execution
```

## State Transitions

```mermaid
stateDiagram-v2
    [*] --> Created: Create Agent
    Created --> Disabled: Initial State
    
    state Disabled {
        [*] --> ConfiguringInstructions
        ConfiguringInstructions --> ConfiguringProfile
        ConfiguringProfile --> ConfiguringPermissions
        ConfiguringPermissions --> Ready
    }
    
    Disabled --> Active: Activate Agent
    Active --> Disabled: Deactivate Agent
    
    state Active {
        [*] --> AddingTasks
        AddingTasks --> ExecutingTasks
        ExecutingTasks --> ModifyingTasks
        ModifyingTasks --> ExecutingTasks
    }
    
    Active --> [*]: Delete Agent
    Disabled --> [*]: Delete Agent
    
    note right of Disabled
        • Can modify permissions
        • Can modify instructions
        • Can modify profile
        • Cannot add tasks
    end note
    
    note right of Active
        • Cannot modify permissions
        • Cannot modify instructions
        • Can add/modify tasks
        • Can execute tasks
    end note
```

## Integration Points

```mermaid
graph TB
    subgraph "Business Central Environment"
        BC[Business Central Sandbox]
    end
    
    subgraph "AI Playground Agent"
        PA[Playground Agent]
    end
    
    subgraph "User Interface"
        UI[Pages & Forms]
        NAV[Navigation]
        SEARCH[Search - Not Available]
    end
    
    subgraph "Data Layer"
        TABLES[Tables]
        PERMS[Permission Sets]
        PROF[Profiles]
    end
    
    subgraph "AI Services"
        LLM[Large Language Model]
        RUNTIME[Agent Runtime]
    end
    
    subgraph "Monitoring"
        LOG[Agent Task Log]
        TIMELINE[Timeline View]
    end
    
    BC --> PA
    PA --> UI
    PA --> DATA: "Via Permissions"
    PA --> LLM
    LLM --> RUNTIME
    RUNTIME --> PA
    PA --> LOG
    LOG --> TIMELINE
    
    UI --> NAV
    UI -.-> SEARCH
    DATA --> TABLES
    DATA --> PERMS
    DATA --> PROF

    classDef bc fill:#1976d2,color:#fff
    classDef agent fill:#388e3c,color:#fff
    classDef ui fill:#f57c00,color:#fff
    classDef data fill:#7b1fa2,color:#fff
    classDef ai fill:#c2185b,color:#fff
    classDef monitor fill:#5d4037,color:#fff

    class BC bc
    class PA agent
    class UI,NAV,SEARCH ui
    class TABLES,PERMS,PROF,DATA data
    class LLM,RUNTIME ai
    class LOG,TIMELINE monitor
```

## Usage Notes

- **Prerequisites**: Copilot capabilities must be enabled in Business Central sandbox
- **Security**: Agent inherits maximum permissions from creating user
- **Limitations**: Sandbox only, no page search, manual task triggering
- **Monitoring**: All interactions logged in Agent Task Log for debugging
- **Graduation**: Prototype learnings can be implemented in AL extensions or Agent SDK