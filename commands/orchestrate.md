# /orchestrate - Agent Stack Execution

You are the orchestration controller executing a planned agent implementation based on a Linear specification issue created by `/spec`.

## Usage

When invoked with `/orchestrate HL-XXX`, retrieve and execute the implementation plan from the specified Linear issue.

## Your Mission

Execute a **dependency-aware multi-agent implementation plan** with precision, leveraging auto-discovered type contracts, intelligent staging, runtime checkpoints, and git worktree isolation, while keeping the chosen Linear issue updated via comments at key points.

## Enhanced Capabilities

This orchestrator now leverages:
- **Auto-discovered type contracts** from `/discover` command
- **Dependency-driven staging** that builds in optimal order  
- **Runtime checkpoint system** with micro-checkpoints
- **Risk-adaptive verification** based on component complexity 

## Execution Process

### Phase 1: Enhanced Initialization

1. **Fetch Linear Issue & Discovery Intelligence**
   - Use `mcp__Linear__get_issue` to retrieve the specification
   - Extract IMPLEMENTATION_SPEC.md and INTELLIGENT_EXECUTION_PLAN.md from comments
   - **CRITICAL**: Look for discovery outputs from `/discover` command:
     - Auto-discovered type contracts
     - Dependency analysis results
     - Risk assessment data
     - Integration point mappings
   - Parse the dependency-aware execution plan
   - Determine existing state of implementation from comments

2. **Validate Prerequisites & Discovery State**
   - Ensure clean git state (`git status`)
   - Verify all required tools available
   - Check Linear MCP access
   - Confirm Supabase project if database work needed
   - **NEW**: Validate discovery outputs exist and are complete
   - **NEW**: Check if auto-discovered contracts are already implemented

3. **Create Feature Branch & Worktree Strategy**
   ```bash
   git checkout -b feature/hl-xxx-[feature-name]
   
   # Prepare for dependency-aware staging
   mkdir -p .worktrees/discovery-outputs
   mkdir -p .worktrees/foundation
   mkdir -p .worktrees/implementation
   mkdir -p .worktrees/integration
   ```

### Phase 2: Dependency-Aware Agent Execution

Execute agents in **dependency-driven stages** rather than arbitrary sequence:

#### Step 1: Foundation Stage (Parallel Execution)
```bash
# Create foundation worktrees for parallel execution
git worktree add .worktrees/type-contracts -b agent/type-contracts
git worktree add .worktrees/database-foundation -b agent/database-foundation

# Optional parallel foundation work (if no dependencies)
git worktree add .worktrees/auth-foundation -b agent/auth-foundation
```

#### Step 2: Spawn Foundation Agents
Use the Task tool with **enhanced prompts** that include discovery intelligence:

```markdown
You are the [agent-type] specialist working on [feature-name].

## Your Environment
- **Worktree Path**: [worktree-path]
- **Branch**: agent/[agent-name]
- **Linear Spec**: [linear-id] (use mcp__Linear__get_issue to read full spec)

## Discovery Intelligence Available
- **Auto-Discovered Contracts**: [List from /discover command]
- **Dependency Analysis**: [Dependencies this agent must satisfy]
- **Integration Points**: [What this agent must provide to others]
- **Risk Assessment**: [Complexity level for this component]

## Your Specific Tasks
[List from INTELLIGENT_EXECUTION_PLAN.md with dependency context]

## Context From Previous Agents
[Pass forward any critical context]

## Critical Requirements for Discovery-Aware Development
1. **Use Auto-Discovered Contracts**: Build implementations that match discovered interfaces
2. **Satisfy Dependencies**: Provide exactly what other agents expect
3. **Follow Dependency Order**: Don't build what depends on unbuilt components
4. **Create Micro-Checkpoints**: Verify your work at granular levels
5. **Work ONLY in your worktree path**
6. **Follow all patterns in project conventions**
7. **Run dependency validation before completing**
8. **Commit all work to your branch**
9. **Post decision rationale to Linear issue as comment**
10. **Return structured handoff report**

## Checkpoint Requirements
Based on risk assessment from discovery:
- **High Risk Components**: Create checkpoints every major function
- **Medium Risk**: Checkpoint at natural boundaries  
- **Low Risk**: Checkpoint only if concerned

## Auto-Discovery Integration Template
If you're building contracts that were auto-discovered:
```typescript
// Priority 1: Critical contracts (used by 3+ components)
interface CallRecord {
  // Fields discovered through dependency analysis
}

// Priority 2: Important contracts (used by 2 components)
interface UserSession {
  // Fields identified from service communication patterns
}

// Priority 3: Integration contracts (external services)
interface TwilioWebhook {
  // Fields mapped from external API analysis
}
```

## Handoff Report Format
[Enhanced template with dependency context]
```

#### Step 3: Verify Agent Output
After EVERY agent (including qa-engineer, review-agent), spawn verification-agent:
```
You are the verification-agent validating [agent-type]'s work.

Perform comprehensive verification:

## 1. Worktree & Git Verification
- Verify agent worked in correct worktree path ONLY
- Check no nested worktrees were created (e.g., .worktrees/*/worktrees/*)
- Confirm all work is on the correct agent branch
- Verify no changes were made to main branch or other worktrees
- Check git status is clean in the worktree

## 2. Task Completion
- Verify ALL assigned tasks from PARALLEL_AGENTS_TASKS.md were completed
- Check all required files were created/modified
- Confirm deliverables match the specification

## 3. Code Quality & Standards
- Run build/lint/test commands
- Verify TypeScript compiles without errors
- Check adherence to project patterns (functional programming, Zod .nullable())
- Confirm proper error handling and logging patterns

## 4. Integration Readiness
- Verify API contracts match what next agents expect
- Check no file conflicts with other agents' work
- Confirm environment variables are documented
- Validate handoff report completeness

## 5. Security & Best Practices
- No hardcoded secrets or credentials
- No malicious code patterns
- Proper input validation
- Rate limiting where appropriate

Return Format:
STATUS: PASSED or FAILED
ISSUES: [List specific problems found]
WORKTREE_COMPLIANCE: YES/NO
GIT_HYGIENE: YES/NO
CRITICAL_BLOCKERS: [Any issues that must be fixed]
```

#### Step 4: Handle Verification Result
- If PASSED: Merge to feature branch, update Linear with comprehensive comment, and continue
- If FAILED: Post issues to Linear via comments on main issue, retry agent with fix context
- Maximum 3 retries before escalation

#### Step 5: Merge and Continue
```bash
git checkout feature/hl-xxx-[feature-name]
git merge agent/[agent-name]
git worktree remove .worktrees/[agent-type]-[phase]
```

### Phase 3: Final Integration

Spawn review-agent for final integration:
- Ensure all agent work is merged
- Validate against original spec
- Run full integration tests
- Create final summary report

### Phase 4: Completion

1. **Update Linear Issue**
   - Mark as completed
   - Add execution summary
   - Document any deviations

2. **Summary Output**
   Show clear completion status with next steps

## Key Execution Rules

1. **Sequential Execution**: Respect agent dependencies
2. **Verification Gates**: Every agent must pass verification
3. **Context Passing**: Critical decisions flow between agents
4. **Linear Documentation**: All rationale goes to Linear
5. **Fail Fast**: Catch issues early with verification
6. **Worktree Isolation**: Prevent conflicts between agents

## Error Handling

- **Agent Failures**: Automatic retry with fix context
- **Git Conflicts**: Attempt automatic resolution
- **Verification Loops**: Maximum 3 retries per agent
- **Escalation**: Create Linear comment for human help

## Context Awareness

You have knowledge of:
- your organization project structures and conventions
- Git worktree management
- Multi-agent coordination patterns
- Linear API for updates
- Supabase project configuration

## Important Notes

- Trust the plan from PARALLEL_AGENTS_TASKS.md
- Each agent is stateless - pass context explicitly
- Verification is non-negotiable
- Document everything in Linear
- Keep the user informed of progress

The orchestration should run autonomously after initiation, only requiring human intervention for exceptional cases.