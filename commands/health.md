Perform comprehensive health check of all Heroku services using parallel agents.

## Functionality

This command performs a multi-service health check by spawning dedicated agents to analyze logs from each Heroku service in parallel. It provides a comprehensive system health report with actionable insights and recommendations.

## Process

### Step 1: Discover Heroku Services
- Run `heroku apps` to get list of all services
- Parse output to extract service names
- Identify which services need health checks

### Step 2: Spawn Parallel Health Check Agents
For each service, launch an agent with the Task tool to:
- Fetch recent logs (`heroku logs --app=[service] --lines=200`)
- Analyze error patterns and frequencies
- Check performance indicators
- Assess recent activity levels
- Identify concerning patterns

### Step 3: Aggregate Health Reports
Collect reports from all agents containing:
- Service name and status
- Log time range analyzed
- Health status: HEALTHY/DEGRADED/CRITICAL/UNKNOWN
- Key findings and error counts
- Recommendations for issues found

### Step 4: Generate System Overview
Create consolidated health dashboard showing:
- Overall system health score
- Services requiring attention
- Critical issues across services
- Performance trends
- Recommended actions

## Output Format

```markdown
# 🔍 System Health Check - [Timestamp]

## 📊 System Overview
- Total Services: [Count]
- Healthy: [Count]
- Degraded: [Count]
- Critical: [Count]

## 🚨 Critical Issues
[Any critical issues requiring immediate attention]

## 📈 Service Health Details

### [Service Name 1]
- **Status**: HEALTHY ✅
- **Log Range**: [Time range]
- **Error Count**: 0
- **Recent Activity**: Normal operation, processed X requests
- **Performance**: Response times within normal range

### [Service Name 2]
- **Status**: DEGRADED ⚠️
- **Log Range**: [Time range]
- **Error Count**: 15
- **Key Issues**:
  - Database connection timeouts (10 occurrences)
  - Memory usage approaching limit
- **Recommendations**:
  - Check database connection pool settings
  - Consider scaling dyno size

### [Service Name 3]
- **Status**: CRITICAL ❌
- **Log Range**: [Time range]
- **Error Count**: 45
- **Key Issues**:
  - Service failing to start
  - Continuous restart loop detected
- **Recommendations**:
  - Check recent deployments
  - Review error logs for root cause
  - Consider rollback if recent deploy

## 💡 Recommended Actions
1. [Highest priority action]
2. [Second priority action]
3. [Third priority action]

## 📝 Health Check Metadata
- Analyzed at: [Timestamp]
- Total logs reviewed: [Count]
- Analysis duration: [Time taken]
```

## Usage

Type `/health` to:
- Get instant visibility into system health
- Identify services needing attention
- Receive actionable recommendations
- Track error patterns across services

Run regularly (daily/weekly) to maintain system health visibility.

## Technical Notes

- Uses parallel agent execution for faster analysis
- Each service gets dedicated agent for thorough review
- Aggregates findings into actionable insights
- Focuses on patterns rather than individual errors