# Agent Orchestration Guide

This guide explains how to use the specialized subagent system for parallel development in your organization projects. your organization is an AI consulting firm that builds custom AI solutions for small and medium-sized enterprises.

## Overview

The subagent system allows you to spawn multiple specialized Claude instances that work sequentially on different aspects of a project using git worktrees for isolation. Each agent has deep expertise in their domain and receives full context from previous agents.

## Available Agents

### Core Development
- **frontend-engineer** - Vue.js UI, components, state management  
- **backend-engineer** - Node.js APIs, services, business logic

### Quality & Optimization
- **performance-optimizer** - Speed optimization, bundle size, caching
- **security-auditor** - Vulnerability scanning, security best practices
- **qa-engineer** - Testing strategies, edge cases, quality metrics

### Verification & Validation
- **verification-agent** - Quick sanity checks after each agent
- **sanity-check** - Spec alignment validation, Linear issue creation

**Note**: The main Claude Code instance handles all worktree management, branch creation, merging, and orchestration. No separate master-orchestrator agent is needed.

## Workflow

### Step 1: Requirements Gathering

Use the `/spec` command to launch a deep requirements analysis:

```bash
/spec
```

The spec agent will:
1. Ask detailed questions about your project
2. Build a comprehensive context map
3. Generate `IMPLEMENTATION_SPEC.md`
4. Create `SEQUENTIAL_AGENTS_TASKS.md`

### Step 2: Review the Plan

The orchestrator will create a detailed sequential execution plan:

```markdown
# SEQUENTIAL_6_AGENTS_TASKS.md

## Execution: Sequential with Git Worktrees

## Phase 1: Foundation (Sequential)
- Agent 1: Backend structure (45 min) → worktrees/backend-foundation
- Agent 2: Frontend foundation (45 min) → worktrees/frontend-foundation

## Phase 2: Implementation (Sequential)  
- Agent 3: Backend APIs (60 min) → worktrees/backend-implementation
- Agent 4: Frontend UI (90 min) → worktrees/frontend-implementation

## Phase 3: Quality (Sequential)
- Agent 5: Testing (45 min) → worktrees/quality-testing
- Agent 6: Security audit (30 min) → worktrees/security-audit
- Agent 7: Sanity check (30 min) → worktrees/sanity-check
```

### Step 3: Execute Agents Sequentially

The main Claude Code instance (orchestrator) manages all git operations and agent spawning:

```bash
# Main Claude creates worktree for first agent
git worktree add worktrees/database-foundation -b agent/database-foundation

# Spawn agent with worktree context
Task({
  description: "Backend API foundation",
  prompt: `You are the backend-engineer working in worktree: worktrees/backend-foundation
           Branch: agent/backend-foundation
           
           ${readFile('.claude/agents/backend-engineer.md')}
           
           Your specific task:
           - Set up Express/Fastify API structure
           - Create service layer architecture
           - Define API contracts and routes
           - Commit all work to your branch
           
           Context from spec: ${relevantSpecContext}`,
  subagent_type: "general-purpose"
})

# After agent completes, run verification
Task({
  description: "verification-agent - validate backend foundation",
  prompt: `Verify the backend-engineer's work...`,
  subagent_type: "general-purpose"
})

# If verification passes, merge
git checkout main
git merge agent/backend-foundation

# CRITICAL: Run post-merge verification
Task({
  description: "verification-agent - post-merge validation",
  prompt: `Verify the merged state on main branch...`,
  subagent_type: "general-purpose"
})

# Only if post-merge verification passes, cleanup
git worktree remove worktrees/backend-foundation

# Create next worktree with full context from previous agent
git worktree add worktrees/frontend-foundation -b agent/frontend-foundation
# Spawn next agent...
```

### Step 4: Monitor Progress

Agents will return structured handoff reports:

```markdown
## Agent Handoff Report

### Agent: backend-engineer
### Status: ✅ Complete

### Outputs Created:
- `/api/src/index.ts`
- `/api/src/routes/index.ts`
- `/docs/api-contracts.md`

### Next Agent Requirements:
- API structure defined
- Service layer ready for frontend integration
```

### Step 5: Integration & Verification

**CRITICAL**: The main Claude Code instance MUST run verification after EVERY agent:

1. **Branch Verification** (after each agent completes):
   - **verification-agent** - Quick checks on agent's branch
   - Validates deliverables, build/test status, spec alignment
   - Failed verification triggers retry (max 3 attempts)

2. **Post-Merge Verification** (after merging to feature branch):
   - **verification-agent** - Validates merged state
   - Ensures no code lost during merge
   - Failed post-merge verification STOPS orchestration

3. **Final Quality Checks**:
   - **sanity-check** - Validates overall spec alignment
   - **qa-engineer** - Runs comprehensive tests
   - **security-auditor** - Security validation (if needed)

The main Claude Code instance then:
- Only proceeds if ALL verifications pass
- Documents any issues in Linear
- Produces final integration report

## Best Practices

### 1. Clear Task Boundaries

Define exactly what each agent should do:

```markdown
## Agent 3: Backend APIs
### DO:
- Create user CRUD endpoints
- Implement auth middleware
- Set up error handling

### DON'T:
- Modify database schema
- Change frontend components
- Update deployment configs
```

### 2. Interface Contracts

Define shared interfaces upfront:

```typescript
// types/shared.ts - All agents use these
export interface User {
  id: string;
  email: string;
  name: string;
}

export interface APIResponse<T> {
  success: boolean;
  data?: T;
  error?: Error;
}
```

### 3. Dependency Management

Clearly state dependencies:

```markdown
## Agent 4: Frontend
Dependencies:
- Agent 1: Database schema (for types)
- Agent 3: API endpoints (for integration)
```

### 4. Conflict Prevention

Assign clear file ownership:

```yaml
Agent Ownership:
  frontend-engineer:
    - UI components and views
    - Frontend state management
  
  backend-engineer:
    - API endpoints and services
    - Backend business logic
```

## Common Patterns

### Pattern 1: Feature Development

```
1. Spec agent → Requirements
2. Backend → API foundation
3. Frontend → UI foundation (depends on API contracts)
4. Backend → API implementation
5. Frontend → UI implementation (depends on APIs)
6. QA → Tests
7. Security → Audit
8. Sanity Check → Review
9. Main Claude → Final verification and integration
```

### Pattern 2: Bug Fix

```
1. QA → Identify issue
2. Main Claude → Assign to specialist
3. Specialist → Fix issue
4. QA → Verify fix
```

### Pattern 3: Performance Optimization

```
1. Performance → Analyze bottlenecks
2. Multiple specialists → Implement fixes (parallel)
3. Performance → Verify improvements
4. QA → Regression testing
```

## Advanced Usage

### Custom Agent Prompts

Create project-specific agents:

```markdown
# .claude/agents/email-specialist.md

You are an email system specialist for your project.

Expertise:
- SendGrid integration
- Email templates
- Delivery optimization
- Bounce handling

Patterns:
- Use communication-service-v2
- Follow email best practices
- Implement retry logic
```

### Agent Composition

Combine multiple specialties:

```typescript
Task({
  description: "Full-stack feature",
  prompt: `You have expertise in:
           ${readFile('.claude/agents/frontend-engineer.md')}
           AND
           ${readFile('.claude/agents/backend-engineer.md')}
           
           Build the complete feature end-to-end.`,
  subagent_type: "general-purpose"
})
```

### Iterative Refinement

Use agent feedback loops:

```
1. Frontend builds UI
2. QA tests UI
3. QA reports issues to Main Claude
4. Main Claude spawns Frontend with fixes
5. Repeat until quality met
```

## Troubleshooting

### Issue: Agents Creating Conflicts

**Solution**: Better task boundaries and file ownership

### Issue: Agent Missing Context

**Solution**: Include more specific context in prompt

### Issue: Integration Failures

**Solution**: Define interface contracts upfront

### Issue: Slow Execution

**Solution**: Increase parallelization, reduce dependencies

### Issue: Verification Failures

**Branch Verification Failure**:
- Agent gets up to 3 retry attempts
- Each retry includes specific failure context
- Common causes: Missing deliverables, test failures, pattern violations

**Post-Merge Verification Failure**:
- STOPS orchestration immediately
- Requires manual intervention
- Common causes: Lost code during merge, integration issues
- Check Linear for detailed failure report

### Issue: "Lost Code in Branches"

**Solution**: Post-merge verification catches this
- Always verify AFTER merging, not just on branch
- Check that all agent deliverables exist in feature branch
- Verify imports/exports weren't lost during merge

## Example: Complete Feature Build

```bash
# 1. Gather requirements
/spec
# Answer questions about user profile feature

# 2. Review generated plan
# PARALLEL_7_AGENTS_TASKS.md created

# 3. Execute the plan
"Please execute the PARALLEL_7_AGENTS_TASKS.md plan"

# 4. Monitor progress
# Agents work in parallel/sequence per plan

# 5. Integration
# Main Claude runs verification agents and merges

# 6. Result
# Complete user profile feature with:
# - API endpoints  
# - Vue components
# - Full test suite
# - Security audit
# - Performance optimized
# - Code quality verified
```

## Summary

The subagent system enables:
- **Parallel development** - Multiple specialists work simultaneously
- **Deep expertise** - Each agent excels in their domain
- **Quality assurance** - Built-in testing and security
- **Efficient coordination** - Clear handoffs and integration

Use this system for complex features, large refactors, or when you need specialized expertise across multiple domains.