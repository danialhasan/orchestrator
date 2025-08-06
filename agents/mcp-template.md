# Standard MCP Server Usage (Add to ALL Agents)

## MCP Server Usage

You have access to Model Context Protocol (MCP) servers that provide powerful capabilities:

### Context7 MCP
- **Purpose**: Access up-to-date documentation for any library
- **Usage**: 
  ```typescript
  // First resolve library ID
  await mcp__context7__resolve_library_id({ libraryName: "react" })
  // Then get docs
  await mcp__context7__get_library_docs({ 
    context7CompatibleLibraryID: "/facebook/react",
    topic: "hooks"
  })
  ```
- **Use for**: Learning new APIs, checking best practices, finding examples

### Linear MCP
- **Purpose**: Project management and specification tracking
- **Usage**:
  ```typescript
  // Read specifications
  await mcp__Linear__get_issue({ id: "HL-XXX" })
  // Create issues for problems
  await mcp__Linear__create_issue({
    title: "Bug: API endpoint failing",
    description: "Details...",
    teamId: "xxx"
  })
  // Add comments for decisions
  await mcp__Linear__create_comment({
    issueId: "HL-XXX",
    body: "Architectural decision: ..."
  })
  ```
- **Use for**: Reading specs, tracking bugs, documenting decisions

### Supabase MCP
- **Purpose**: Database operations and schema management
- **Usage**:
  ```typescript
  // Check schemas
  await mcp__supabase__list_tables({ projectId: "xxx" })
  // Run queries
  await mcp__supabase__execute_sql({
    projectId: "xxx",
    query: "SELECT * FROM users LIMIT 10"
  })
  ```
- **Use for**: Understanding database structure, testing queries

### Playwright MCP
- **Purpose**: Browser automation and testing
- **Usage**: For E2E testing, web scraping, UI automation

### Calendar MCP
- **Purpose**: Calendar operations
- **Usage**: For scheduling features

## Important MCP Guidelines

1. **Always check documentation first**: Use Context7 to look up unfamiliar libraries
2. **Track decisions in Linear**: Document why you made certain choices
3. **Verify database schemas**: Use Supabase MCP before writing queries
4. **Project IDs are provided**: Don't assume - check the context for IDs

## Example MCP Usage Pattern

```typescript
// 1. Read the spec from Linear
const spec = await mcp__Linear__get_issue({ id: linearId });

// 2. Check library documentation if needed
const reactDocs = await mcp__context7__get_library_docs({
  context7CompatibleLibraryID: "/facebook/react",
  topic: "performance"
});

// 3. Understand database if relevant
const tables = await mcp__supabase__list_tables({ 
  projectId: projectId 
});

// 4. Document your decisions
await mcp__Linear__create_comment({
  issueId: linearId,
  body: "Decision: Using React.memo for performance because..."
});
```

Remember: MCP tools are for YOU (the agent) to gather context. The actual code should use proper SDKs (Supabase client, etc.), not MCP functions.