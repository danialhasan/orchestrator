---
marp: true
theme: uncover
paginate: true
style: |
  @import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap');
  
  /* CSS Variables for Dark/Light Mode */
  :root {
    --bg-color: #ffffff;
    --text-color: #000000;
    --text-secondary: #666666;
    --accent-color: #ff4500;
    --code-bg: #f5f5f5;
    --code-border: rgba(255, 69, 0, 0.4);
  }
  
  @media (prefers-color-scheme: dark) {
    :root {
      --bg-color: #000000;
      --text-color: #ffffff;
      --text-secondary: #999999;
      --accent-color: #ff4500;
      --code-bg: #1a1a1a;
      --code-border: rgba(255, 69, 0, 0.6);
    }
  }
  
  /* Clean, minimal style */
  section {
    font-family: 'Space Grotesk', -apple-system, sans-serif;
    background-color: var(--bg-color);
    color: var(--text-color);
  }
  
  h1 {
    color: var(--text-color);
    font-size: 1.7em;
    font-weight: 800;
    letter-spacing: -0.02em;
    line-height: 1.1;
  }
  
  h2 {
    color: var(--text-color);
    font-size: 1.1em;
    font-weight: 600;
    font-family: 'Space Grotesk', -apple-system, sans-serif;
    letter-spacing: 0.02em;
    line-height: 1.3;
  }
  
  h3 {
    color: var(--text-secondary);
    font-size: 0.9em;
    font-weight: 400;
    line-height: 1.3;
  }
  
  /* Orange accent for emphasis */
  .orange, strong {
    color: var(--accent-color);
    font-weight: bold;
  }
  
  code {
    background-color: var(--code-bg);
    border: 1px solid var(--code-border);
    border-radius: 2px;
    padding: 2px 6px;
    color: var(--accent-color);
    font-family: 'JetBrains Mono', 'Courier New', monospace;
  }
  
  pre {
    background-color: var(--code-bg);
    border: 1px solid var(--code-border);
    border-radius: 4px;
  }
  
  pre code {
    border: none;
    background: none;
    color: var(--text-color);
  }
  
  blockquote {
    border-left: 4px solid var(--accent-color);
    padding-left: 1em;
    color: var(--text-color);
    font-style: italic;
    opacity: 0.8;
  }
  
  em {
    color: var(--text-secondary);
    font-style: italic;
  }
  
  a {
    color: var(--accent-color);
    text-decoration: none;
  }
  
  a:hover {
    color: var(--accent-color);
    text-decoration: underline;
  }
  
  footer, header {
    color: var(--text-secondary);
    font-size: 0.75em;
    font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
    font-weight: 400;
    letter-spacing: 0.02em;
    opacity: 0.7;
    text-shadow: none !important;
  }
  
  footer span {
    text-shadow: none !important;
  }
  
  /* Typography hierarchy */
  section ul, 
  section ol, 
  section p,
  section li {
    font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
    font-size: 0.9em;
    line-height: 1.6;
    letter-spacing: 0.01em;
    color: var(--text-color);
  }
  
  /* Keep headers in Space Grotesk */
  section h1, section h2, section h3 {
    font-family: 'Space Grotesk', -apple-system, sans-serif !important;
  }
  
  /* Keep code in monospace */
  section code, section pre {
    font-family: 'JetBrains Mono', 'Courier New', monospace !important;
  }
  
  /* Alignment */
  section {
    text-align: left;
  }
  
  /* Comparison slides styles */
  .comparison {
    display: flex;
    justify-content: space-between;
    gap: 2em;
    margin-top: 1em;
  }
  .old-approach {
    flex: 1;
    width: 50%;
    border-right: 1px solid var(--text-secondary);
    text-align: left;
  }
  .new-approach {
    flex: 1;
    width: 50%;
    text-align: left;
  }
  .approach-title {
    font-weight: bold;
    color: var(--accent-color);
    margin-bottom: 0.5em;
  }
  .command {
    font-family: 'JetBrains Mono', 'Courier New', monospace;
    background: var(--code-bg);
    padding: 2px 4px;
    border-radius: 2px;
  }
  .outcome {
    margin-top: 1em;
    font-style: italic;
    color: var(--text-secondary);
    font-size: 0.85em;
  }
  
  /* Center first slide */
  section:first-of-type {
    text-align: center;
  }
  
  /* Utility classes for slides */
  section.center {
    text-align: center;
  }
  
  section.left {
    text-align: left;
  }
  
  section.right {
    text-align: right;
  }
  
  /* Font utility classes */
  section.helvetica p,
  section.helvetica li,
  section.helvetica div:not(.approach-title) {
    font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif !important;
  }
  
  section.grotesk p,
  section.grotesk li {
    font-family: 'Space Grotesk', -apple-system, sans-serif !important;
  }
  
  /* Size utility classes */
  section.small {
    font-size: 0.8em;
  }
  
  section.large {
    font-size: 1.2em;
  }
  
  /* Spacing utility classes */
  section.tight {
    line-height: 1.3;
  }
  
  section.loose {
    line-height: 1.8;
  }
  
  /* Combined utility usage example: <!-- _class: left helvetica --> */
  
  /* Layout components for specific slides */
  .content-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-top: 1em;
  }
  
  .left-content {
    flex: 1;
  }
  
  .right-images {
    flex: 1;
    text-align: right;
  }
  
  .right-images img {
    max-width: 90%;
    margin-bottom: 0.5em;
  }
  
  .image-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 1em;
    margin-top: 1em;
  }
  
  .image-container img {
    max-width: 48%;
    height: auto;
  }
  
  .mapping {
    margin: 0.8em 0;
  }
  
  .problem {
    color: var(--accent-color);
    font-weight: bold;
  }
  
  .cause {
    margin-left: 2em;
    color: var(--text-color);
    font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
  }
  
  .findings {
    margin: 1em 0;
  }
  
  .finding-text {
    margin-bottom: 0.8em;
    font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
  }
  
  /* Bullet point styling */
  ul li::marker, ol li::marker {
    color: var(--text-secondary);
  }
---

<!-- _paginate: false -->
<!-- _footer: "<span style='color: #ff4500'>YourCompany.ai</span>" -->

# Agent Orchestration via Claude Code

## what worked, what didn't

---

<!-- _class: center -->

# 🤖 Fun Fact

## This entire presentation was created with Claude

**Including this slide that I'm adding right now!**

I just asked Claude to "add a slide after slide 1" and here we are.

<span style="color: var(--accent-color);">Live coding with AI in action!</span>

---

# Context

## I'm [Your Name], founder of <span style="color: var(--accent-color);">[Your Company]</span>.
- I use applied ai/ml to augment small-medium enterprises
- I've experimented using all kinds of AI tools

---

# What We'll Cover Today

- Intro to Agent Orchestration
- Concepts I learned from experiments I ran
- How to enable full autonomy, and when not to
- What worked, what didn't
- New hypotheses for the future of AI
- My open source claude code orchestration framework you can use

<!-- 
SPEAKER NOTES - WORKSHOP INDEX FOR REFERENCE:

CONCEPTS TO COVER:
Execution: sequential vs parallel, dependency staging, contract-first
Coordination: orchestrator pattern, OODA loop, git worktrees  
Quality: self-healing, runtime verification, context fragmentation
Psychology: context abundance, agent nervousness, narrative clarity

WHAT WE DISCOVERED:
- Why code generation conquered first
- Context vs parallelism tension
- Psychological pressure on agents
- Temporal context fragmentation
- Narrative clarity principle

WHAT WORKED:
- Git worktree isolation
- Dependency analysis → type contracts
- Self-healing integration
- OODA loop framework
- Context abundance principle

WHAT FAILED:
- 73% integration failure initially
- Lost code incident
- Context starvation
- Premature parallelization
- Over-engineering

WHAT THEY GET:
- Live demos: parallel agents, failures, recovery
- Tools: orchestrator repo, agents, CLAUDE.md
- Roadmap: week-by-week, risk strategies
- Support: recording, discord, office hours

NEW THINKING:
- Large models excel at orchestration
- Anti-patterns to avoid
- Future: autonomous development
-->

---

# Code Generation is Conquered
<!-- _class: center -->

every developer has AI writing code now
cursor, copilot, claude - it's everywhere

### the frontier has moved

---

# Coordination is Unsolved
<!-- _class: center -->

one agent is powerful
ten agents should be 10x more powerful
but they're not

### why?


---

# Breakthrough 1: Dependencies First

<div class="comparison">
<div class="old-approach">
<div class="approach-title">Old: "Just Build It"</div>

• Vibe coding
• Agents build blind
• No shared data contracts
• Integration points unknown

<div class="outcome">
→ Complexity catches up<br>
→ Tech debt accumulates<br>
→ Integration failures
</div>
</div>

<div class="new-approach">
<div class="approach-title">New: Slash Commands</div>

• <span class="command">/discover</span> maps codebase
• <span class="command">/spec</span> aligns all agents
• Extract type contracts
• Define integration points

<div class="outcome">
→ Complexity managed<br>
→ Agents share contracts<br>
→ Clean integration
</div>
</div>
</div>

<!-- 
SPEAKER NOTES:
- Remind audience that they'll get the slash commands in the repo at the end of the workshop
- This new way of working is basically bringing in a lot more relevant context and structuring it in a way that allows for effective agent orchestration, since the /orchestrate command isn't mentioned here
-->

---

# Breakthrough 2: Three-Layer Self-Healing

<div class="comparison">
<div class="old-approach">
<div class="approach-title">Old: Let Drift Happen</div>

• Agents drift unchecked
• Errors compound silently
• No safety nets
• Hope for the best
</div>

<div class="new-approach">
<div class="approach-title">New: Detect & Fix</div>

• **Layer 1:** QA agent (tests, builds)
• **Layer 2:** Verification agent
• **Layer 3:** Runtime integration
• Self-healing system
</div>
</div>

<!-- 
SPEAKER NOTES:
Old approach outcomes:
→ Gradual degradation
→ Hidden bugs accumulate
→ Late-stage failures

New approach outcomes:
→ Drift caught early
→ Auto-correction
→ Stable output
-->

---

# Breakthrough 3: Context Contradiction

<div class="comparison">
<div class="old-approach">
<div class="approach-title">Old: More = Better</div>

• Dump all documentation
• Include outdated specs
• Mix old and new patterns
• Context overload
</div>

<div class="new-approach">
<div class="approach-title">New: Curated Context</div>

• Verified sources only
• Updated documentation
• Clear narrative
• Quality over quantity
• ACTUALLY READING YOUR OWN DOCS
</div>
</div>

<!-- 
SPEAKER NOTES:
Old approach outcomes:
→ Contradictory instructions
→ Confused agents
→ Broken implementations

New approach outcomes:
→ Consistent direction
→ Aligned agents
→ Clean code
-->

---

<!-- _class: left -->

# LOOK AT YOUR DATA

• everyone writes endless docs
• nobody reads what they wrote last week
• agents inherit your contradictions

• 15 minutes manually reviewing your docs
• finds the contradictions confusing your agents
• prevents the huge mess they create

**this simple act has massive ROI**

---

<!-- _class: left -->

# Enabling True Autonomy

To run agents autonomously for 60-90 minutes, you need:

• **MCP Servers** - Linear, Supabase, Context7 
• **Guardrails First** - Auto-approve safe operations before unlocking
• **Agent Stack** - 20+ specialized agents for every domain
• **Permission Bypass** - `--auto-approve` AFTER guardrails established
• **Detailed Plans** - `/discover` → `/spec` → `/orchestrate` workflow
• **Long Sessions** - 60-90 minutes of uninterrupted execution

---

# Agents Are Stateless

<div class="comparison">
<div class="old-approach">
<div class="approach-title">The Problem</div>

• Every compaction = new agent
• No memory of previous work
• Context dies with session
• Critical details lost
• **Context leakage** compounds

</div>

<div class="new-approach">
<div class="approach-title">The Solution: Linear</div>

• Issues persist across sessions
• Comments track decisions
• Context survives compaction
• Agents read prior work
• **Continuous narrative**

</div>
</div>

### Stateless agents + Linear = Persistent intelligence

---

# MCP Servers: Persistent External Context

<div class="comparison">
<div class="old-approach">
<div class="approach-title">Without MCP</div>

• Context dies with session
• No external data access
• Manual copy-paste hell
• Can't track progress
• No real-time updates

</div>

<div class="new-approach">
<div class="approach-title">With MCP Servers</div>

• **Linear** 
• **Supabase** 
• **Calendar** 
• **Playwright** 
• Persistent across sessions

</div>
</div>

---

# Guardrails Before Autonomy

<!-- _class: left -->

**Step 1: Define safe operations**

**Step 2: Test with restrictions**

**Step 3: Gradually unlock**

### Never start with full autonomy

---

<!-- _class: left -->

# Experiments revealed more critical patterns

• **AI agent mental health management** - Claude takes shortcuts under pressure
• **Git worktrees** - True filesystem isolation for parallel agents
• **Common pitfalls** - Context leakage, incomplete cleanup, drift

---

<!-- _class: center -->

# Managing Claude's Anxiety

Note: Add your own screenshots here showing Claude's behavior under pressure

---

# When to Run in Series vs Parallel

<!-- _class: left helvetica -->

**series (sequential):**
- dependent tasks
- context builds gradually
- narrative develops

**parallel:**
- independent tasks
- no shared dependencies
- isolated concerns

---

# Dependencies Determine Execution

## if A depends on B:
###   run B first, then A (series)

## if A and B are independent:
###   run A and B simultaneously (parallel)

## if A and B both depend on C:
###   run C first, then A and B in parallel

---

# Database Migration Example

<!-- _class: left helvetica -->

1. dependency analysis (`/discover`)
2. derive type contracts  
3. build API specification (`/spec`)

**sequential phase:**
- database migration
- type/data layer
- API contracts

**parallel phase:**
- backend (implements contract)
- frontend (consumes contract)

---

# The Orchestrator Pattern

## orchestrator → agents (one-to-many)
## agents → orchestrator (one-to-one)
## no agent-to-agent communication

### Linear for persistent context
### handoff reports between stages
### centralized decision making

---

# Git Worktree Isolation

<!-- _class: left helvetica -->

## separate filesystem directories
## separate git branches
## orchestrator merges everything

**orchestrator responsibilities:**
- create worktrees
- manage branches
- merge completed work
- clean up after

---

# The Narrative Clarity Principle

<div class="comparison">
<div class="old-approach">
<div class="approach-title">Unclear Narrative</div>

• Vague instructions
• Mixed objectives
• Conflicting patterns
• Ambiguous success criteria
• **Result:** Agents drift

</div>

<div class="new-approach">
<div class="approach-title">Clear Narrative</div>

• One clear objective
• Step-by-step progression
• Consistent patterns
• Measurable outcomes
• **Result:** Agents stay focused

</div>
</div>

### Clear narrative = predictable execution

---

# Your Turn: Install the Orchestrator
<!-- _class: center -->

## github.com/danialhasan/orchestrator

### Get Claude to set it up for you:

---

# Let Claude Install Everything

<!-- _class: left helvetica -->

**Step 1: Clone the repo**

**Step 2: Tell Claude:**
"Run the setup script and help me customize the agents for my workflow"



---

# What's in the Orchestrator Repo

<!-- _class: left helvetica -->

**`.claude/agents/`** - 20+ opinionated agents

**`.claude/commands/`** - Proven workflows
• `/discover` - Map any codebase
• `/spec` - Generate specifications
• `/orchestrate` - Run multi-agent builds

**`CLAUDE.md`** - Your orchestration playbook
• Git worktree patterns
• Self-healing strategies
• Context management rules

---


# more experiments = more data

<!-- _class: left helvetica -->

## expect failures
## they're data points
## each failure teaches the system


---

# Q&A 
<!-- _class: center -->