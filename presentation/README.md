# Claude Code Multi-Agent Orchestration Workshop

This presentation covers breakthrough discoveries in multi-agent orchestration using Claude Code, including practical patterns for autonomous software development.

## 🚀 Quick Start - Browser Rendering with Marp

### Option 1: Use Marp for VS Code (Recommended)

1. **Install the Marp VS Code Extension**:
   - Open VS Code
   - Go to Extensions (Cmd+Shift+X on Mac, Ctrl+Shift+X on Windows/Linux)
   - Search for "Marp for VS Code"
   - Install the extension by Marp Team

2. **Preview the Slides**:
   - Open `slides.md` in VS Code
   - Click the preview button in the top right (or press Cmd+K V / Ctrl+K V)
   - You'll see the formatted slides in the preview pane

3. **Export to HTML**:
   - Open Command Palette (Cmd+Shift+P / Ctrl+Shift+P)
   - Type "Marp: Export Slide Deck"
   - Choose HTML format
   - Open the generated HTML file in your browser

### Option 2: Use Marp CLI

1. **Install Marp CLI**:
```bash
# Using npm
npm install -g @marp-team/marp-cli

# Or using Homebrew (Mac)
brew install marp-cli
```

2. **Generate HTML and View**:
```bash
# Generate HTML file
marp slides.md -o slides.html --html

# Open in browser (Mac)
open slides.html

# Open in browser (Windows/Linux)
xdg-open slides.html  # Linux
start slides.html      # Windows
```

3. **Live Preview with Auto-Reload**:
```bash
# Start Marp server with live reload
marp -s slides.md

# This will open http://localhost:8080 in your browser
# Changes to slides.md will auto-refresh
```

### Option 3: Use Online Marp Editor

1. Visit [Marp Web](https://web.marp.app/)
2. Copy the contents of `slides.md`
3. Paste into the editor
4. View and present directly in browser

### Option 4: Local Development Setup

1. **Create package.json**:
```bash
cd presentation
npm init -y
npm install --save-dev @marp-team/marp-cli
```

2. **Add to package.json scripts**:
```json
{
  "scripts": {
    "build": "marp slides.md -o index.html --html",
    "watch": "marp slides.md -o index.html --html --watch",
    "serve": "marp -s slides.md",
    "pdf": "marp slides.md -o slides.pdf --pdf --allow-local-files"
  }
}
```

3. **Run commands**:
```bash
# Build HTML once
npm run build

# Watch and rebuild on changes
npm run watch

# Serve with live reload
npm run serve

# Generate PDF
npm run pdf
```

## 📋 Presentation Content

### Key Topics Covered

1. **Agent Orchestration Patterns** - Sequential vs parallel execution strategies
2. **Git Worktrees** - True filesystem isolation for parallel agents
3. **Context Management** - The "context abundance" philosophy
4. **Self-Healing Systems** - Three-layer quality assurance
5. **MCP Servers** - Persistent external context across sessions
6. **Common Pitfalls** - What fails and how to avoid it

### Presentation Structure

- **Opening**: Introduction to multi-agent orchestration
- **Problem Definition**: Why coordination is the next frontier
- **Core Discoveries**: Three breakthrough patterns
- **Technical Deep Dive**: Implementation details
- **Practical Guide**: Anti-patterns and best practices
- **Call to Action**: Using the orchestrator framework

## 🎨 Customization

### Modifying Content
- Edit `slides.md` using standard Markdown
- Slides are separated by `---`
- Use HTML for advanced formatting

### Changing Theme
- Modify the `style:` section in the frontmatter
- Current theme uses orange accent (#ff4500)
- Supports light/dark mode automatically

### Adding Images
- Place images in a `presentation/images/` folder
- Reference with standard Markdown: `![alt text](images/filename.png)`

## 🎯 Presenter Mode

When presenting:
1. Press `P` key to open presenter view (shows notes)
2. Use arrow keys or spacebar to navigate
3. Press `F` for fullscreen
4. Press `G` to go to specific slide number

## 📊 Key Messages

1. **Context is abundant** - Don't restrict Claude unnecessarily
2. **Dependencies determine execution** - Map before building
3. **Git worktrees enable parallelism** - True isolation
4. **Self-healing prevents drift** - Three layers of protection
5. **Clear narrative prevents confusion** - Agents need clarity

## 🔧 Troubleshooting

### Common Issues

**Marp not recognized**: Make sure it's installed globally or use npx:
```bash
npx @marp-team/marp-cli slides.md -o slides.html
```

**Styles not rendering**: Use the `--html` flag to enable HTML content:
```bash
marp slides.md -o slides.html --html
```

**PDF generation fails**: Install Chrome/Chromium (required for PDF):
```bash
# Mac
brew install --cask chromium

# Linux
sudo apt-get install chromium-browser
```

## 📁 File Structure
```
presentation/
├── slides.md        # Main presentation content
├── README.md        # This documentation
├── slides.html      # Generated HTML (after build)
└── slides.pdf       # Generated PDF (optional)
```

## 🌐 Resources

- [Marp Documentation](https://marp.app/)
- [Marp CLI Guide](https://github.com/marp-team/marp-cli)
- [Markdown Syntax](https://marpit.marp.app/markdown)
- [Orchestrator Repository](https://github.com/danialhasan/orchestrator)

---

*Built with Marp • Multi-Agent Orchestration Framework*