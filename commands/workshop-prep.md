Prepare for Claude Code Workshop - consolidate attendee info, content, and logistics.

## Functionality

This command helps you prepare for workshops by:
1. Pulling attendee information from Linear research
2. Checking workshop content status
3. Verifying logistics and setup
4. Creating a pre-workshop checklist

## Process

### Step 1: Gather Workshop Details
- Find workshop Linear issue (e.g., HL-145)
- Extract date, time, location, format
- Check registration count and attendee list

### Step 2: Attendee Analysis
Pull from Linear research:
- Company/role breakdown
- Tier 1 (high-value) attendees
- Technical vs business audience split
- Special interests or requests

### Step 3: Content Readiness
Verify:
- Presentation materials complete
- Demo environments ready
- Git worktree examples prepared
- Backup plans for technical issues

### Step 4: Generate Prep Checklist

## Output Format

```markdown
# 🎯 Claude Code Workshop Prep Summary

## 📅 Workshop Details
- **Date**: [Date and time]
- **Location**: [Venue]
- **Duration**: [Length]
- **Registrations**: [Count]

## 👥 Attendee Breakdown
### Tier 1 (High Value)
- [Name] - [Company] - [Role] - [Opportunity]

### By Category
- Founders/CEOs: X
- Technical Leaders: X
- Developers: X
- Students: X

## 📚 Content Status
- [ ] Core presentation ready
- [ ] Git worktree demo environment
- [ ] Agent orchestration examples
- [ ] Backup demos prepared
- [ ] CLAUDE.md templates for attendees

## 🔧 Technical Setup
- [ ] Laptop charged
- [ ] Demos tested
- [ ] Internet backup (hotspot)
- [ ] Screen recording ready
- [ ] Microphone tested

## 🎯 Key Messages
1. "Code generation is conquered, orchestration is next"
2. "From 73% to 0% integration failures"
3. "Deploy 10 agents in parallel"

## 💰 Pipeline Opportunities
- Total potential: $XXX,000
- Hot leads: [List with context]
- Follow-up strategy: [Plan]

## ⚡ Pre-Workshop Checklist
### Night Before
- [ ] Test all demos
- [ ] Review attendee list
- [ ] Prepare name tags/materials
- [ ] Set multiple alarms

### Morning Of
- [ ] Arrive 1 hour early
- [ ] Test AV equipment
- [ ] Set up demo stations
- [ ] Welcome slide on screen
```

## Usage

Type `/workshop-prep` to:
- Get comprehensive workshop preparation summary
- Ensure nothing is forgotten
- Review attendee opportunities
- Generate last-minute action items

Best used 1-2 days before workshop for final preparation.