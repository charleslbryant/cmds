# Session Context Management

This directory contains files that maintain persistent state and context across CMDS development sessions. These files enable seamless handoffs between AI assistants, developers, and development sessions.

## Purpose

Session context files solve the critical problem of context loss by:
- **Maintaining State**: Preserving project status across session boundaries
- **Enabling Handoffs**: Providing complete context for session transitions
- **Tracking Progress**: Recording completed work and remaining tasks
- **Guiding Focus**: Ensuring development stays aligned with priorities
- **Supporting Continuity**: Allowing productive work regardless of session gaps

## Files Overview

### Core State Files

**`CURRENT_STATE.md`**
Contains the current project status and recent completions:
- Project overview and current development phase
- Recently completed features and their status
- Active branches and their purposes
- Key architectural decisions and their impact
- Current system health and known issues
- Recent changes to project structure or approach

**`NEXT_TASKS.md`**
Maintains the prioritized task queue with clear labels:
- Now priority tasks (immediate focus)
- Next priority tasks (upcoming work)
- Future priority tasks (planned work)
- Task dependencies and relationships
- Estimated effort and complexity
- Task assignment and ownership

**`ACTIVE_SESSION.md`**
Tracks the current session state and selected task:
- Currently selected task and its details
- Session start time and estimated duration
- Progress made during current session
- Blockers or issues encountered
- Next steps and handoff information
- Session-specific notes and decisions

### Process Support Files

**`SESSION_HANDOFF_TEMPLATE.md`**
Provides structured template for session transitions:
- Standard format for session completion summaries
- Checklist for proper session closure
- Format for communicating blockers and issues
- Template for next session preparation
- Guidelines for context preservation

## File Usage Patterns

### Session Startup (via `/begin` mode)
1. Read `CURRENT_STATE.md` to understand project status
2. Review `NEXT_TASKS.md` to select appropriate task
3. Update `ACTIVE_SESSION.md` with selected task and session info
4. Use context to make informed development decisions

### During Development
- Update `ACTIVE_SESSION.md` with progress and discoveries
- Note any changes that affect `CURRENT_STATE.md`
- Identify new tasks for `NEXT_TASKS.md`
- Document decisions that impact future work

### Session Completion (via `/deliver` mode)
1. Update `CURRENT_STATE.md` with completed work
2. Move completed tasks and add new ones to `NEXT_TASKS.md`
3. Finalize `ACTIVE_SESSION.md` with summary
4. Prepare context for next session using handoff template

## Context Boundaries and Memory Management

### Clean Context Transitions
- Each mode loads only relevant context files
- Session boundaries are explicitly managed
- Context is refreshed at session start
- Memory overload is prevented through structured loading

### Information Persistence
- Important decisions are captured in appropriate files
- Temporary session information is clearly marked
- Long-term context is separated from session-specific data
- Context files serve as project memory bank

### Context Validation
- Context files are validated for consistency
- Outdated information is identified and updated
- Context accuracy is maintained through regular review
- Conflicting information is resolved promptly

## Integration with CMDS Workflow

### Mode Integration
Different CMDS modes interact with session context files:

**`/begin`**: Reads all context files, updates `ACTIVE_SESSION.md`
**`/plan`**: Updates `NEXT_TASKS.md`, references `CURRENT_STATE.md`
**`/design`**: Updates context with design decisions
**`/dev`**: Updates progress in `ACTIVE_SESSION.md`
**`/deliver`**: Updates all context files for session completion
**`/qa`**: Validates context accuracy and completeness

### Context Dependencies
- Session context depends on rule adherence
- Product context influences task prioritization
- Architecture context affects current state assessment
- Design context updates inform session decisions

## Best Practices

### For Context Maintenance
- Update context files promptly and accurately
- Use clear, specific language in all updates
- Maintain consistent format and structure
- Remove outdated or conflicting information

### For Session Management
- Start each session by reading all context files
- Update `ACTIVE_SESSION.md` regularly during work
- Complete sessions by updating all relevant context
- Use handoff template for proper session closure

### For Task Management
- Keep `NEXT_TASKS.md` current and realistic
- Use clear priority labels (Now/Next/Future)
- Break down large tasks into manageable pieces
- Remove completed tasks promptly

### For State Tracking
- Record significant changes in `CURRENT_STATE.md`
- Note architectural decisions and their rationale
- Track system health and known issues
- Document process improvements and lessons learned

## Context File Relationships

### Information Flow
```
CURRENT_STATE.md ← ACTIVE_SESSION.md ← Development Work
       ↓                    ↓
NEXT_TASKS.md ← Task Completion ← Session Progress
```

### Update Patterns
- `ACTIVE_SESSION.md`: Updated frequently during development
- `CURRENT_STATE.md`: Updated at major milestones and session completion
- `NEXT_TASKS.md`: Updated when tasks are completed or new work is identified
- `SESSION_HANDOFF_TEMPLATE.md`: Used as reference, not updated directly

## Context Validation and Quality

### Accuracy Measures
- Regular review of context file accuracy
- Cross-validation between different context sources
- Removal of outdated or incorrect information
- Consistency checks across related information

### Completeness Checks
- Verify all significant decisions are documented
- Ensure task queue reflects actual work priorities
- Confirm current state matches actual project status
- Validate that context supports informed decision-making

The session context management system ensures that CMDS maintains perfect continuity across development sessions, enabling productive work regardless of time gaps or developer changes.