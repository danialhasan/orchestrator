Update Linear issues after completing development work - automate the post-development coordination workflow.

## Context Analysis
First, analyze recent development work to identify completed tasks:

1. **Check recent git commits** (last 5 commits) for:
   - Issue references (LF-XXX patterns)
   - Keywords like "fix", "auth", "demo blocker", "inbox", "standardize"
   - Branch name patterns (feature/lf-xxx, fix/auth-xxx)

2. **Detect related Linear issues** via:
   - Direct issue refs: LF-139, [LF-118], etc.
   - Keyword matching: "auth standardization" → LF-118, "inbox" → LF-139
   - Demo dependencies: Issues with "Demo Dependency" label or due within 48 hours

3. **Determine deployment status** from:
   - Recent commits showing production deployment
   - Build/test status mentions
   - User-specified --deploy flag context

## Linear Updates to Perform

For each identified issue, execute via Linear MCP:

### 1. Status Updates
- If `--deploy` flag context: Update status to "Done"
- Otherwise: Add progress comment only

### 2. Completion Comments
Generate structured comment with:

```markdown
## ✅ Development Work Complete

**Status**: [Deployed to production ✅ | Progress update]
**Build**: [All tests passing | Build details]
**Verification**: [Production confirmed | Local testing complete]

### Recent Changes
- [List last 3 commits with descriptions]

### [If deployed] Deployment Details
- **Repository**: [Git remote URL]
- **Commit**: [Latest commit hash]
- **Deployed at**: [Current timestamp]

### [If demo-ready flag] Demo Readiness
Technical implementation complete and verified. Ready for demo testing.

🤖 Generated with [Claude Code](https://claude.ai/code)
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 3. Cross-Agent Coordination
- Update coordination hub issues (LF-118, LF-119, etc.)
- Mark demo dependencies as ready if applicable
- Check for any blocked agents waiting on these completions

## Command Flags Support

Handle these usage patterns:
- `/update-linear` - Auto-detect from recent commits
- `/update-linear --issue=LF-139` - Update specific issue
- `/update-linear --deploy` - Mark as deployed to production  
- `/update-linear --demo-ready` - Verify demo dependencies resolved

## Git Analysis Commands

Use these to gather context:
```bash
git log --oneline -5
git branch --show-current
git remote get-url origin
git rev-parse HEAD
```

## Linear MCP Commands

Execute these for updates:
- `mcp__linear-server__list_issues` - Find coordination hub issues
- `mcp__linear-server__create_comment` - Add completion updates
- `mcp__linear-server__update_issue` - Change status if deployed

## Success Criteria

1. ✅ All related Linear issues identified and updated
2. ✅ Appropriate status changes (In Progress → Done for deployed work)
3. ✅ Clear completion comments with deployment verification
4. ✅ Demo dependencies marked as ready if applicable
5. ✅ Cross-agent coordination hub updated for visibility

Always end with a summary of what was updated and any remaining action items for other agents.