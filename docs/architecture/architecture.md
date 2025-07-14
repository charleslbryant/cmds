# CMDS Architecture

## Product Overview

**Context-Managed Development System (CMDS)** is a comprehensive methodology and toolset for AI-assisted software development that maintains context across sessions and ensures consistent, high-quality development through structured workflows and documentation.

## Core Purpose
- Eliminate context loss between AI-assisted development sessions
- Ensure consistent development practices across different AI assistants and developers
- Maintain high code quality and test coverage in AI-assisted projects
- Provide structured workflows that can be validated and enforced

## Architecture Overview

CMDS is architected as a methodology framework with lightweight tooling support, designed to be tool-agnostic and language-independent. The system is built around persistent context management, mode-based workflows, and rule-driven governance.

### Key Components

```
cmds/
├── .claude/commands/           # Mode-based workflow system
├── docs/                       # Context management system
│   ├── rules/                  # Rule-based governance
│   ├── product/                # Product context
│   ├── architecture/           # Architecture context & ADRs
│   ├── design/features/        # Design context
│   └── session-context/        # Session state management
└── CLAUDE.md                   # AI assistant instructions
```

### Mode-Based Workflow System (`.claude/commands/`)
- **Purpose**: Provide structured entry points for different development phases
- **Dependencies**: YAML configuration, markdown documentation
- **Responsibilities**: Guide AI assistants through proper workflows, enforce context loading, manage transitions

### Rule-Based Governance (`/docs/rules/`)
- **Purpose**: Define and enforce development practices and standards
- **Dependencies**: None (standalone documentation)
- **Responsibilities**: Establish workflows, define quality standards, provide compliance framework

### Context Management System (`/docs/`)
- **Purpose**: Maintain persistent project context across sessions and handoffs
- **Dependencies**: Structured documentation, consistent file formats
- **Responsibilities**: Store product/architecture/design context, track session state, enable seamless handoffs

## Key Design Decisions

### Technology Choices
- **Documentation Format**: Markdown for maximum accessibility, version control, and tool compatibility
- **Configuration Format**: YAML for command system configuration (readable, parseable)
- **File Organization**: Hierarchical structure that mirrors mental models of development context
- **AI Interface**: Text-based commands and instructions for maximum AI assistant compatibility

### Architectural Patterns
- **Context Separation**: Clear boundaries between product, architecture, design, and session contexts
- **Mode-Based Operation**: Discrete phases with specific responsibilities and transition rules
- **Rule-Driven Governance**: Explicit rules that can be validated and enforced automatically
- **Template-Based Customization**: Systematic approach to adapting CMDS for specific projects

## Integration Points

### AI Assistants (Claude, Copilot, Cursor, etc.)
- **Purpose**: Primary interaction interface for development work
- **Method**: Text-based commands, document reading, structured workflows
- **Dependencies**: Ability to read files, follow multi-step instructions, maintain context within sessions

### Development Tools (Git, GitHub, IDEs)
- **Purpose**: Standard development workflow integration
- **Method**: Command-line tools, file-based configuration, standard development practices
- **Dependencies**: Git for version control, GitHub for issue/PR management, standard IDE capabilities

### Project Technologies (Language/Framework Agnostic)
- **Purpose**: Apply CMDS methodology regardless of technical stack
- **Method**: Technology-agnostic rules and workflows, customizable templates
- **Dependencies**: Ability to run tests, build systems, development tools for chosen technology

## Development Approach

### Current Implementation Status
- **Mode System**: ✅ Complete (7 modes: kick, begin, plan, design, dev, deliver, qa)
- **Rule Framework**: ✅ Complete (7 rule files covering all development aspects)
- **Context Management**: ✅ Complete (4 context domains with templates and guides)
- **Design Phase Integration**: ✅ Complete (design-first development workflow)
- **Template System**: ✅ Complete (customization framework for new projects)
- **Documentation**: ✅ Complete (comprehensive guides and examples)
- **Tooling Integration**: ⏳ Planned (IDE extensions, GitHub Actions)

### Testing Strategy
- **Self-Application**: CMDS is developed using CMDS methodology for validation
- **Case Studies**: Multiple real projects using CMDS to prove effectiveness
- **Community Validation**: Open-source approach allows community testing and feedback
- **Coverage Goals**: 95%+ test coverage for any code projects developed using CMDS

## File Organization

### Project Structure
```
cmds/
├── .claude/commands/         # Mode system (7 modes + configuration)
├── docs/                     # Context management
│   ├── rules/                # 7 rule files + README
│   ├── product/              # Vision, strategy + README
│   ├── architecture/         # Architecture, ADRs + README
│   ├── design/features/      # Feature designs, API specs + README
│   └── session-context/      # Session state files + README
├── README.md                 # Project overview and setup
└── CLAUDE.md                 # AI assistant instructions
```

### Key Files
- **index.yaml**: Defines mode system, transitions, and context loading rules
- **CLAUDE.md**: High-level instructions for AI assistants including identity and workflow rules
- **README.md**: Comprehensive project documentation and setup guide

## Future Architecture Considerations

### Planned Enhancements
- **IDE Extensions**: VS Code, Cursor extensions for seamless mode switching and context loading
- **GitHub Actions**: Automated validation of CMDS compliance and context consistency
- **CLI Tools**: Command-line utilities for CMDS project management and validation
- **Template Gallery**: Curated collection of CMDS-ready project templates for popular stacks

### Scalability
- **Team Usage**: Support for multiple developers using CMDS on same project with conflict resolution
- **Enterprise Integration**: SSO, compliance reporting, metrics dashboards for organizational adoption
- **Multi-Project**: Portfolio-level context management for teams working on multiple CMDS projects

### Quality Assurance
- **ADR Documentation**: All architectural decisions recorded in `/docs/architecture/adr/`
- **Test Coverage**: 95%+ coverage for any software projects developed using CMDS
- **Code Quality**: Built-in quality gates through mode checklists and rule enforcement
- **Error Handling**: Graceful degradation when tools or integrations are unavailable

## Context for Development Sessions

### Essential Context
1. **Product**: AI-assisted development methodology focusing on context management and consistency
2. **Technology Stack**: Markdown documentation, YAML configuration, tool-agnostic approach
3. **Current Focus**: Methodology refinement, community building, tooling development
4. **Architecture**: Mode-based workflows with persistent context management

### Session Startup Context
1. Read `/docs/product/` for CMDS vision: reliable AI-assisted development
2. Read `/docs/session-context/CURRENT_STATE.md` for current development status
3. Read `/docs/session-context/NEXT_TASKS.md` for prioritized work queue
4. Review this architecture document for technical approach and component structure
5. Check `/docs/architecture/adr/` for recent architectural decisions affecting development

---

*This architecture document provides the technical foundation for developing and extending CMDS. All development should align with these architectural principles and patterns.*