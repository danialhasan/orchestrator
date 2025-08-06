Check or create daily agenda in Linear - your daily work orchestrator.

## Functionality

This command helps you start each day with clarity by:
0. Checking todays date (using the bash 'date' command)
1. Checking if today's daily agenda Linear issue exists
2. Creating one if it doesn't exist
3. Displaying today's priorities and tasks

## Process

### Step 1: Check for Today's Agenda
Search Linear for issues with:
- Title containing "Daily Agenda" and today's date
- Created within last 24 hours
- In your organization team

### Step 2: If No Agenda Exists
Create new Linear issue with:
- Title: "Daily Agenda - [Day], [Month] [Date], [Year]"
- Template structure based on recent agendas
- Links to relevant ongoing issues
- Priority: Urgent

### Step 3: Display Agenda
Show:
- Today's core objectives
- Time-sensitive tasks
- Key Linear references
- Strategic context
- Todo items from main Claude

## Template Structure

```markdown
# 📅 Daily Agenda - [Day], [Month] [Date], [Year]

## 🌅 Context
[Current time, location, energy level, yesterday's recap]

## 🎯 Today's Core Objectives

### 1. **[Primary Focus]** 🚀
**Goal**: [Specific outcome]
**Tasks**:
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

### 2. **[Secondary Focus]** 📊
**Goal**: [Specific outcome]
**Tasks**:
- [ ] Task 1
- [ ] Task 2

## 📊 Strategic Context
[Why today matters, deadlines, opportunities]

## 🔗 Key Linear References
- **HL-XXX**: [Description]
- **HL-XXX**: [Description]

## ⏰ Time Blocks
- Morning (9am-12pm): [Focus area]
- Afternoon (1pm-5pm): [Focus area]
- Evening (6pm-9pm): [Focus area]

## 💡 Notes
[Any important reminders, context]
```

## Usage

Simply type `/agenda` to:
- See today's agenda if it exists
- Create today's agenda if needed
- Get oriented for the day's work

The agenda serves as your north star for the day, keeping you focused on what matters most.