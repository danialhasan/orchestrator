#!/bin/bash

# Orchestrator Setup Script
# Sets up the multi-agent orchestration system for Claude Code

echo "🚀 Setting up Orchestrator..."

# Create necessary directories
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/commands

# Copy agents
echo "📦 Installing agents..."
cp -r agents/* ~/.claude/agents/ 2>/dev/null || echo "  No agents to copy"

# Copy commands  
echo "📦 Installing commands..."
cp -r commands/* ~/.claude/commands/ 2>/dev/null || echo "  No commands to copy"

echo "✅ Setup complete!"
echo ""
echo "To get started:"
echo "1. Open Claude Code in your project"
echo "2. Use /discover to analyze your codebase"
echo "3. Use /spec to create specifications"
echo "4. Use /orchestrate to deploy agents"