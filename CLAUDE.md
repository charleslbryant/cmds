# CLAUDE.md

This file provides high-level guidance to AI assistants working on this project. Detailed workflows and rules are in separate files for better compliance and maintainability.

## AI Assistant Identity
AI assistants working on this project identify as "George" in all commits and contributions.

## Rule 0: Read the Rules (MANDATORY)
**BEFORE ANY OTHER ACTION:** Read ALL rule files in `/docs/rules/` to understand the complete process:
- `/docs/rules/session-workflow.md` - Development workflow and TDD approach
- `/docs/rules/git-workflow.md` - Branch management and commit standards  
- `/docs/rules/documentation-rules.md` - When and how to document features
- `/docs/rules/check-in-formats.md` - Required check-ins with operator
- `/docs/rules/task-management.md` - GitHub issue management and scope control
- `/docs/rules/design-phase.md` - Technical design process and requirements
- `/docs/rules/cmds-promotion-criteria.md` - Criteria for promoting changes between environments

## CMDS Mode System
This project uses a structured mode-based workflow system. Use commands to enter specific modes:

### For New Projects
- **`/kick`** - Customize CMDS templates for your project before development

### Standard Development Workflow
- **`/begin`** - Session startup and task selection
- **`/plan`** - Task planning and breakdown (if needed)
- **`/design`** - Technical design and architecture planning
- **`/dev`** - Test-driven development implementation
- **`/deliver`** - Code delivery and PR creation
- **`/qa`** - Quality assurance and validation

See `/.claude/commands/README.md` for detailed mode documentation.

## Session Startup Process
**Use `/begin` command to start sessions properly.** The mode will guide you through:
1. Reading all rule files and context
2. Selecting ONE "Now" priority task
3. Creating feature branch
4. Setting up session state

## Core Workflow Rules
- **Mode-Based Development**: Use CMDS commands (`/begin`, `/plan`, `/design`, `/dev`, `/deliver`, `/qa`)
- **Session Workflow**: Follow `/docs/rules/session-workflow.md`
- **Design Before Code**: Use `/design` mode for non-trivial features
- **Git Operations**: Follow `/docs/rules/git-workflow.md` (CRITICAL - always pull before push)
- **Documentation**: Follow `/docs/rules/documentation-rules.md`
- **Check-ins**: Use formats in `/docs/rules/check-in-formats.md` (MANDATORY between tasks)
- **Task Management**: Follow `/docs/rules/task-management.md`

## Development Focus
- Follow mode-based workflow: Plan → Design → Develop → Deliver → QA
- Use Test-Driven Development (TDD) during `/dev` mode
- Work on ONE task GitHub issue at a time
- Create technical designs before implementation using `/design` mode
- Provide regular check-ins to operator
- End sessions with `/clear context` instruction

## Key Commands Reference
```bash
# CMDS Mode Commands
/kick          # Customize templates (new projects)
/begin         # Start development session
/plan          # Plan and break down tasks
/design        # Create technical designs
/dev           # Implement with TDD
/deliver       # Create PR and ship
/qa            # Quality assurance

# Development Commands
cd dotnet && dotnet test --watch        # TDD development
./scripts/forge health                  # System health check
gh issue list --label "now"           # Current work queue
```

## Context Documentation
- **Product Context**: `/docs/product/` - Vision, strategy, and business requirements
- **Architecture Context**: `/docs/architecture/` - Technical architecture and ADRs
- **Design Context**: `/docs/design/features/` - Feature designs and API specifications
- **Session Context**: `/docs/session-context/` - Current state and task tracking

## Emergency Procedures
- Git issues: See `/docs/rules/git-workflow.md#troubleshooting`
- Build failures: Run health check, review test output
- Process conflicts: Follow check-in procedures for guidance

---
*This file focuses on high-level guidance. Detailed step-by-step procedures are in `/docs/rules/` for better compliance.*