Analyze system health across all your project production services using parallel agents.

## Functionality

This command provides a comprehensive health assessment of the your project production system by spawning specialized agents to analyze each Heroku service concurrently. It aggregates findings into a unified health report with actionable recommendations.

## Process

### Step 1: Initialize Health Check
- Capture current timestamp for context
- Identify target services:
  - ai-service-v2
  - legalflow-comms-service
  - legalflow-jobs-service
  - legalflow-postal

### Step 2: Spawn Service Analysis Agents
Launch parallel agents using Task tool, each analyzing:
- Recent application logs (200 lines)
- Error patterns and frequencies
- Performance indicators
- Database connectivity
- API response times
- Memory/CPU usage indicators
- Recent activity levels

### Step 3: Aggregate Service Reports
Collect individual service analyses containing:
- Health status (HEALTHY/DEGRADED/CRITICAL/UNKNOWN)
- Key findings and error counts
- Performance metrics
- Recent activity summary
- Specific recommendations

### Step 4: Generate Unified Report
Synthesize findings into comprehensive overview:
- Overall system status
- Service summary table
- Critical issues requiring attention
- Prioritized recommendations
- Cross-service patterns and trends

## Output Format

```markdown
# your project System Health Report
**Timestamp**: [Date/Time]

## Overall System Status: [HEALTHY/DEGRADED/CRITICAL]

## Service Summary:
| Service | Status | Key Issues | Last Activity |
|---------|---------|------------|---------------|
| ai-service-v2 | HEALTHY ✅ | None | 5 min ago |
| legalflow-comms-service | DEGRADED ⚠️ | Slow DB queries | 2 min ago |
| legalflow-jobs-service | HEALTHY ✅ | None | 1 min ago |
| legalflow-postal | CRITICAL ❌ | Connection failures | 45 min ago |

## Critical Issues:
- **legalflow-postal**: Repeated connection failures to external mail service
- **legalflow-comms-service**: Database query times exceeding 5s threshold

## Performance Indicators:
- **AI Service**: Avg response time: 250ms (✅ within target)
- **Comms Service**: Avg response time: 3.2s (⚠️ above 1s target)
- **Jobs Service**: Queue depth: 45 jobs (✅ normal range)
- **Postal Service**: 0 emails sent last hour (❌ service disruption)

## Recent Activity:
- **AI Service**: Processing 120 requests/hour (normal volume)
- **Comms Service**: Handling user notifications, some delays
- **Jobs Service**: Background processing active, no backlogs
- **Postal Service**: No activity due to connection issues

## Recommendations:
1. **URGENT**: Investigate legalflow-postal external connection issues
2. **HIGH**: Optimize slow database queries in comms service
3. **MEDIUM**: Monitor comms service performance degradation trend
4. **LOW**: Schedule routine maintenance window for updates

## System Trends:
- Overall system load: 65% (healthy range)
- Cross-service error correlation: Postal failures may impact comms
- Performance trend: Gradual degradation in comms service over 24h
- Suggested action: Address postal service to prevent cascade
```

## Usage

Type `/system-health` to:
- Get instant comprehensive system overview
- Identify services requiring immediate attention
- Understand cross-service dependencies and impacts
- Receive prioritized action items
- Track system performance trends

Run this command:
- During incidents for rapid diagnosis
- Daily for proactive monitoring
- After deployments to verify system stability
- When users report issues to pinpoint problems

## Technical Implementation

- Uses Task tool to spawn concurrent analysis agents
- Each service gets dedicated agent for thorough analysis
- Agents run `heroku logs --app=[service] --lines=200 --source=app`
- Results aggregated into unified actionable report
- Focus on patterns and correlations across services