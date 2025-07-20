# Context-Managed Development System (CMDS)

*This repo is still very much experimental and messy. Things may be deleted or changed at any moment, sometimes daily. Use at your own risk and share what your thinking about in AI Engineering and AgenticOps.*

A comprehensive AI-assisted development methodology that maintains context across sessions and ensures consistent, high-quality software development through structured workflows and documentation.

## Overview

The Context-Managed Development System (CMDS) is a methodology developed for AI-assisted software development and agentic software development. CMDS currently focuses on software development with GitHub and Claude Code Agent, but can be adapted to other AI assistants and agentic software development frameworks. It was influenced by Cline Memeory-Bank and our work implementing development workflows in Aider, VS Code Copilot, Cursor, and Claude Code.

CMDS solves the key challenges of:

- **Context Loss**: Between AI sessions and team handoffs
- **Inconsistent Development Practices**: Across different developers and AI assistants
- **Quality Assurance**: Maintaining code quality and test coverage
- **Process Compliance**: Ensuring all team members follow the same workflow
- **Documentation Drift**: Keeping documentation synchronized with code changes

## Core Components

### 1. Claude Commands System (`.claude/commands/`)
Mode-based workflow commands that provide structured entry points for different development phases:

- **`/kick`** - Project kickoff and template customization (new projects)
- **`/begin`** - Session startup and task selection
- **`/plan`** - Task planning and breakdown
- **`/design`** - Technical design and architecture planning
- **`/dev`** - Test-driven development implementation
- **`/deliver`** - Code delivery and PR creation
- **`/qa`** - Quality assurance and validation

### 2. Rule-Based Governance (`/docs/rules/`)
Comprehensive rules that govern development practices:

- **`session-workflow.md`** - Session startup and completion procedures
- **`task-management.md`** - GitHub issue management and prioritization
- **`git-workflow.md`** - Branching, commits, and merge procedures
- **`check-in-formats.md`** - Structured communication templates
- **`documentation-rules.md`** - Documentation requirements and standards
- **`design-phase.md`** - Technical design process and requirements
- **`cmds-promotion-criteria.md`** - Criteria for promoting changes between environments

### 3. Session Context Management (`/docs/session-context/`)
Persistent state tracking across development sessions:

- **`CURRENT_STATE.md`** - Current project status and recent completion
- **`NEXT_TASKS.md`** - Prioritized task queue with labels
- **`ACTIVE_SESSION.md`** - Current session state and selected task
- **`SESSION_HANDOFF_TEMPLATE.md`** - Template for session transitions

### 4. Project Context (`/docs/product/`, `/docs/architecture/` & `/docs/design/`)
Foundational project information that provides context for all development:

- **Product Context**: Vision, strategy, and business requirements
- **Architecture Context**: Technical architecture, ADRs, and system-wide decisions
- **Design Context**: Feature designs, API specifications, and implementation planning

## Key Innovations

### 1. Mode-Based Development
Each development phase has its own mode with specific responsibilities, tools, and transition logic. This creates clear boundaries and ensures appropriate context is loaded for each phase.

### 2. Mandatory Context Loading
Every mode requires reading specific context files before proceeding, ensuring consistent understanding across sessions and developers.

### 3. Structured Check-ins
Predefined communication templates ensure consistent information flow between AI assistants and human operators.

### 4. One-Task Focus
Strict adherence to working on one GitHub issue at a time prevents scope creep and maintains focus.

### 5. Design-First Development
Formal design phase between planning and implementation ensures thoughtful technical decisions and reduces implementation surprises.

### 6. Test-Driven Development Integration
Built-in TDD workflow ensures code quality and maintainability through red-green-refactor cycles.

## Implementation Analysis

### Strengths
- **Scalability**: System grows with project complexity
- **Consistency**: Same workflow regardless of developer or AI assistant
- **Quality**: Built-in TDD and documentation requirements
- **Auditability**: All decisions and changes are documented
- **Flexibility**: Can adapt to different project types and technologies

### Challenges
- **Learning Curve**: Initial setup and training required
- **Overhead**: Additional documentation and process steps
- **Discipline**: Requires consistent adherence to rules and procedures

## Usage Patterns

### Daily Development Flow
1. **Session Start**: `/begin` → Load context → Select task → Create branch
2. **Planning**: `/plan` → Break down work → Create tasks → Set priorities
3. **Design**: `/design` → Create technical design → Document decisions → Review approach
4. **Development**: `/dev` → TDD cycle → Commit changes → Update context
5. **Delivery**: `/deliver` → Final testing → Create PR → Merge → Update context
6. **Quality**: `/qa` → Validate functionality → Close issues → Prepare next session

### New Project Setup Flow
1. **Project Kickoff**: `/kick` → Customize templates → Set up project context → Define architecture
2. **First Session**: `/begin` → Start with customized project context

### Task Management Flow
1. **PRD Creation**: High-level feature specifications
2. **CRD Breakdown**: Specific user stories with acceptance criteria
3. **Task Creation**: Individual implementable tasks
4. **Priority Management**: Now/Next/Future labels
5. **Completion Tracking**: GitHub issues and context updates

## Benefits Observed

### For AI Assistants
- Consistent behavior across sessions
- Clear objectives and constraints
- Reduced context confusion
- Structured problem-solving approach

### For Human Developers
- Predictable AI behavior
- Clear project status visibility
- Consistent code quality
- Reduced onboarding time

### For Projects
- Maintained code quality
- Complete documentation
- Predictable delivery timelines
- Reduced technical debt

## Adaptation Guidelines

### Small Projects
- Simplify mode structure (combine `/plan` and `/dev`)
- Reduce documentation requirements
- Focus on core context files

### Large Projects
- Add specialized modes for different domains
- Expand rule sets for specific technologies (currently used in React/.NET projects)
- Implement automated context validation

### Team Projects
- Add role-specific modes and rules
- Implement approval workflows
- Expand check-in templates for coordination

## Success Metrics

Based on recentFlowForge implementation:
- **Test Coverage**: 100% on implemented features
- **Code Quality**: Zero warnings/errors in builds
- **Documentation**: Complete user and developer guides
- **Consistency**: 40+ consecutive successful TDD cycles
- **Delivery**: Predictable feature completion times

## Future Enhancements

### Automation Opportunities
- Automated context file updates
- Integration with CI/CD pipelines
- Automated compliance checking
- Context validation tools

### Tool Integration
- IDE extensions for mode switching
- Git hooks for rule enforcement
- Automated documentation generation
- Metrics dashboards

## Getting Started with CMDS

### Quick Setup

1. Copy the entire contents of the `/cmds/` folders to your project root
2. Use `/kick` mode to customize templates for your project's specific needs
3. Train on the workflow and modes  
4. Start your first session with `/begin`

### Directory Structure

```
your-project/
├── .claude/
│   └── commands/
│       ├── index.yaml          # Mode definitions and transitions
│       ├── README.md           # Mode system overview
│       ├── kick.md             # Project kickoff mode (template customization)
│       ├── begin.md            # Session startup mode
│       ├── plan.md             # Task planning mode
│       ├── design.md           # Design mode (architecture & technical planning)
│       ├── dev.md              # Development mode (TDD)
│       ├── deliver.md          # Delivery mode
│       └── qa.md               # Quality assurance mode
├── docs/
│   ├── rules/
│   │   ├── session-workflow.md     # Session procedures
│   │   ├── task-management.md      # GitHub issue management
│   │   ├── git-workflow.md         # Git procedures
│   │   ├── check-in-formats.md     # Communication templates
│   │   ├── documentation-rules.md  # Documentation standards
│   │   ├── design-phase.md         # Design process requirements
│   │   └── cmds-promotion-criteria.md  # Promotion criteria
│   ├── session-context/
│   │   ├── CURRENT_STATE.md        # Project status
│   │   ├── NEXT_TASKS.md           # Task queue
│   │   ├── ACTIVE_SESSION.md       # Current session
│   │   └── SESSION_HANDOFF_TEMPLATE.md  # Handoff template
│   ├── product/
│   │   ├── README.md               # Product overview
│   │   ├── product-vision.md       # Vision and strategy
│   │   └── product-strategy.md     # Strategic approach
│   ├── architecture/
│   │   ├── README.md               # Architecture overview
│   │   ├── architecture.md         # Technical architecture
│   │   └── adr/                    # Architecture Decision Records
│   │       ├── README.md           # ADR process guide
│   │       └── adr-template.md     # ADR template
│   └── design/                     # Design documentation
│       ├── README.md               # Design overview and ADR relationship
│       └── features/               # Feature and API design documents
│           ├── README.md           # Design guide
│           ├── feature-design-template.md  # Feature design template
│           └── api-design-template.md      # API design template
└── CLAUDE.md                       # AI assistant instructions
```

### File Descriptions

#### Core Command Files (`.claude/commands/`)

**`index.yaml`**: Defines the mode system with transitions and context files for each mode.

**`kick.md`**: Project kickoff mode for customizing templates and setting up new projects.

**`begin.md`**: Session startup mode that loads context and selects a task.

**`plan.md`**: Task planning mode that breaks down PRDs into implementable tasks.

**`design.md`**: Design mode for creating technical designs before implementation.

**`dev.md`**: Development mode with strict TDD workflow.

**`deliver.md`**: Delivery mode for testing, documentation, and PR creation.

**`qa.md`**: Quality assurance mode for validation and testing.

#### Rule Files (`/docs/rules/`)

**`session-workflow.md`**: Defines session startup, development, and completion procedures.

**`task-management.md`**: GitHub issue types (PRD, CRD, Task) and prioritization system.

**`git-workflow.md`**: Branch management, commit standards, and merge procedures.

**`check-in-formats.md`**: Structured communication templates for consistent updates.

**`documentation-rules.md`**: When and how to create documentation.

**`design-phase.md`**: Design process requirements and workflow.

**`cmds-promotion-criteria.md`**: Criteria for promoting changes between environments.

#### Session Context Files (`/docs/session-context/`)

**`CURRENT_STATE.md`**: Current project status, recent completions, and architecture overview.

**`NEXT_TASKS.md`**: Prioritized task queue with Now/Next/Future labels.

**`ACTIVE_SESSION.md`**: Current session state, selected task, and progress tracking.

**`SESSION_HANDOFF_TEMPLATE.md`**: Template for session transitions.

#### Project Context Files

**`CLAUDE.md`**: Instructions for AI assistants including identity and core workflow rules.

**`/docs/product/`**: Product vision, strategy, and overview documents.

**`/docs/architecture/`**: Technical architecture, system overview, and Architecture Decision Records (ADRs).

**`/docs/design/features/`**: Feature designs, API specifications, and implementation planning documents.

## Customization Guide

### 1. Project-Specific Adaptations

**Technology Stack**: Update mode files with your specific build/test commands.

**Team Size**: Adjust check-in requirements and approval workflows.

**Project Complexity**: Simplify or expand mode structure as needed.

### 2. Command Customization

**Build Commands**: Update `dev.md` and `deliver.md` with your project's build commands.

**Test Commands**: Modify test execution commands for your framework.

**Deployment**: Add deployment-specific steps to `deliver.md`.

### 3. Rule Customization

**Git Workflow**: Adapt branching strategy to your team's preferences.

**Documentation**: Adjust documentation requirements based on project needs.

**Code Quality**: Add project-specific quality gates and standards.

## Implementation Steps

### Phase 1: Basic Setup
1. Copy starter pack files to project
2. Run `/kick` mode to customize all templates
3. Work with operator to define project-specific context
4. Remove template warnings from customized files

### Phase 2: Process Integration
1. Train on mode system and commands
2. Implement GitHub issue templates (PRD, CRD, Task)
3. Set up branch protection rules
4. Create initial task queue in `NEXT_TASKS.md`

### Phase 3: Workflow Refinement
1. Run several complete development cycles
2. Refine check-in formats based on feedback
3. Adjust mode transitions and requirements
4. Optimize context file maintenance

### Phase 4: Advanced Features
1. Add project-specific modes if needed
2. Implement automated context validation
3. Create metrics dashboards
4. Add integration with CI/CD pipelines

## Common Pitfalls

### 1. Incomplete Context Loading
**Problem**: Skipping context file reading at mode start
**Solution**: Enforce mandatory context loading in mode templates

### 2. Scope Creep
**Problem**: Working on multiple tasks simultaneously
**Solution**: Strict one-task focus with check-in requirements

### 3. Documentation Lag
**Problem**: Code changes without documentation updates
**Solution**: Built-in documentation requirements in delivery mode

### 4. Process Abandonment
**Problem**: Reverting to ad-hoc development under pressure
**Solution**: Lightweight emergency procedures that maintain core principles

## Conclusion

The Context-Managed Development System provides a robust framework for AI-assisted development that maintains quality, consistency, and context across development sessions. While it requires initial investment in setup and training, the benefits in code quality, documentation completeness, and development predictability make it valuable for serious software projects.

The system's strength lies in its combination of structured processes, persistent context management, and clear communication protocols that work equally well for human developers and AI assistants.

---

*This analysis is based on the implementation and evolution of CMDS in the FlowForge project, where it has successfully managed 40+ development sessions with consistent quality and delivery outcomes.*
