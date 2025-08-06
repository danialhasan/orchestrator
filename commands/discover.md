# /discover - Intelligent System Discovery Workflow

Orchestrates specialized discovery agents to perform comprehensive system analysis and automatically discover architectural foundations like type contracts, dependencies, and integration points.

## Functionality

This command runs our breakthrough **dependency-driven discovery process** that automatically uncovers the architectural foundations needed for successful multi-agent development. Unlike manual specification, this process discovers what type contracts and interfaces naturally emerge from system requirements.

## Process

### Phase 1: Parallel Discovery Agents (5 agents, 10-15 minutes)

Launch all discovery agents simultaneously to gather comprehensive system intelligence:

#### Agent 1: Code Archaeologist
- **Mission**: Map existing system architecture and patterns
- **Discovers**: Current components, service boundaries, data flow
- **Output**: Architecture map, integration points, legacy constraints

#### Agent 2: Dependency Scanner  
- **Mission**: Identify all internal and external dependencies
- **Discovers**: Service dependencies, API integrations, database connections
- **Output**: Dependency graph, external service inventory, coupling analysis

#### Agent 3: Pattern Detective
- **Mission**: Identify coding patterns and conventions
- **Discovers**: Naming conventions, error handling patterns, architectural styles
- **Output**: Pattern library, anti-patterns, team preferences

#### Agent 4: Documentation Scanner
- **Mission**: Extract business requirements and technical decisions
- **Discovers**: Domain knowledge, business rules, compliance requirements
- **Output**: Requirements summary, constraints, success criteria

#### Agent 5: Health Checker
- **Mission**: Assess current system health and deployment state
- **Discovers**: System status, performance bottlenecks, operational concerns
- **Output**: Health assessment, risk factors, operational requirements

### Phase 2: Intelligent Synthesis (Deep-Think Agent, 5-10 minutes)

The **deep-think** agent synthesizes all discovery findings to:

1. **Analyze Cross-Agent Patterns**: Find connections between different discovery outputs
2. **Identify System Boundaries**: Understand where components naturally separate
3. **Discover Communication Patterns**: See what talks to what and how

### Phase 3: Type Contract Auto-Discovery (Revolutionary Insight)

**This is our breakthrough capability**: Automatically discover required type contracts by analyzing:

```typescript
interface ContractDiscovery {
  sharedDataStructures: DiscoveredContract[];
  communicationInterfaces: DiscoveredInterface[];
  integrationPoints: IntegrationContract[];
  domainModels: DomainContract[];
}

interface DiscoveredContract {
  name: string;
  reason: string; // Why this contract exists
  usedBy: string[]; // Which components need it
  fields: ContractField[];
  priority: 'critical' | 'important' | 'nice-to-have';
}
```

**Auto-Discovery Logic**:
- **Shared Data**: If 2+ components reference same data → generate shared type
- **API Contracts**: If services communicate → generate interface contracts  
- **Domain Models**: If business logic references entities → generate domain types
- **Integration Types**: If external services involved → generate integration contracts

**Example Discovery**:
```yaml
discovered_contracts:
  - name: "CallRecord"
    reason: "Referenced by twilio-webhook, ai-processor, and database"
    usedBy: ["twilio-integration", "ai-service", "user-dashboard"] 
    fields:
      - name: "id"
        type: "string"
        required: true
      - name: "phoneNumber" 
        type: "string"
        source: "twilio-webhook"
      - name: "transcript"
        type: "string"
        source: "ai-processor"
    priority: "critical"
```

### Phase 4: Dependency-Aware Execution Plan

Based on discovered contracts and dependencies, create intelligent staging:

```yaml
execution_plan:
  foundation_stage:
    # Discovered contracts come FIRST
    contracts_discovered:
      - CallRecord
      - UserSession  
      - DocumentAnalysis
    
    agents:
      - type-contract (builds discovered contracts)
      - database-schema (uses discovered contracts)
  
  implementation_stages:
    # Stages based on actual discovered dependencies
    stage_1: [auth-service]      # No dependencies
    stage_2: [user-service]      # Depends on auth
    stage_3: [ai-service]        # Depends on user + contracts
```

## Output Format

### 1. DISCOVERY_ANALYSIS.md
```markdown
# System Discovery Analysis

## 🔍 Discovery Summary
- **System Type**: [API, Full-stack, Integration, etc.]
- **Complexity Level**: [Simple, Moderate, Complex]
- **Architecture Pattern**: [Microservices, Monolith, Serverless]
- **Discovery Confidence**: [High, Medium, Low]

## 🏗️ Current Architecture
[Synthesized from code-archaeologist]

## 🔗 Dependencies Discovered
[Synthesized from dependency-scanner]

## 📋 Patterns & Conventions
[Synthesized from pattern-detective]

## 📚 Business Context
[Synthesized from documentation-scanner]

## 🚦 System Health
[Synthesized from health-checker]

## 🎯 Auto-Discovered Type Contracts

### Critical Contracts (Must Build First)
- **CallRecord**: Used by 3+ components
- **UserSession**: Shared authentication state

### Important Contracts (Stage 2)
- **DocumentAnalysis**: AI processing interface
- **NotificationEvent**: Cross-service communication

### Integration Contracts (External)
- **TwilioWebhook**: Inbound call data
- **OpenAIRequest**: AI service communication

## 🔄 Recommended Architecture Changes
[Based on discovery findings]

## ⚠️ Risk Factors Identified
[Integration risks, performance concerns, etc.]
```

### 2. INTELLIGENT_EXECUTION_PLAN.md
```markdown
# Intelligent Execution Plan

## 📊 Plan Overview
- **Total Stages**: [number]  
- **Estimated Time**: [total]
- **Parallel Opportunities**: [identified]
- **Critical Path**: [bottleneck analysis]

## 🏗️ Foundation Stage (Auto-Discovered)
Based on dependency analysis, these contracts emerged:

### Type Contracts (Parallel)
- **Agent**: type-contract
- **Contracts**: [List of discovered contracts]
- **Time**: 15-20 minutes
- **Critical**: These enable all subsequent stages

### Database Foundation (Parallel)  
- **Agent**: database-architect
- **Uses**: Discovered contracts
- **Time**: 20-30 minutes

## 🚀 Implementation Stages (Dependency-Ordered)
[Stages based on actual discovered dependencies]

## 🧪 Integration Checkpoints
[Runtime verification points between stages]

## 🎛️ Parallel Execution Matrix
[Which agents can run simultaneously]
```

## Integration with Other Commands

### Enhanced /spec Workflow
```bash
/discover HL-123    # Auto-discovers contracts and dependencies
/spec HL-123        # Uses discovery outputs for smarter specification
```

### Enhanced /orchestrate Workflow  
```bash
/orchestrate HL-123 # Uses intelligent execution plan from discovery
```

## Usage

Type `/discover HL-XXX` where HL-XXX is a Linear issue containing:
- High-level requirements
- System context
- Business goals

The command will automatically:
1. **Deploy 5 discovery agents** in parallel
2. **Synthesize findings** with deep-think agent  
3. **Auto-discover type contracts** through dependency analysis
4. **Generate intelligent execution plan** based on real dependencies
5. **Create comprehensive documentation** for next phases

## Revolutionary Capabilities

1. **Type Contract Auto-Discovery**: No more guessing what interfaces you need
2. **Dependency-Driven Staging**: Build in the right order automatically  
3. **Integration Point Identification**: Know where things will break before building
4. **Pattern-Aware Planning**: Leverage existing system conventions
5. **Risk-Aware Execution**: Identify failure modes early

## Success Metrics

- **Discovery Accuracy**: Do discovered contracts match actual needs?
- **Integration Success**: Do agents build compatible components?
- **Time Efficiency**: Does discovery reduce overall implementation time?
- **Failure Prevention**: Do fewer integration issues occur?

This command transforms development from "hope it works" to "know it works" by understanding the system architecture before any code is written.