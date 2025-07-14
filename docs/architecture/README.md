# Architecture Documentation

This directory contains the technical architecture documentation that defines how your system is built and how technical decisions are made.

## Structure

```
architecture/
├── README.md                    # This file
├── architecture.md              # Main architecture document
└── adr/                         # Architecture Decision Records
    ├── README.md               # ADR process guide
    ├── adr-template.md         # Template for new ADRs
    └── ADR-XXXX-*.md           # Individual decision records
```

## Architecture Context in CMDS Workflow

Architecture documentation provides the foundation for all technical work:
1. **Plan** - Use architecture context to understand system constraints
2. **Design** - Create designs that align with architectural decisions
3. **Develop** - Implement following established patterns
4. **QA** - Validate against architectural requirements
5. **Deliver** - Ensure delivery maintains architectural integrity

## Files Overview

### architecture.md
Contains your system's high-level technical architecture:
- System overview and key components
- Technology stack and frameworks
- Architectural patterns and principles
- Performance and scalability considerations
- Security architecture
- Deployment and infrastructure overview

### adr/ Directory
Contains Architecture Decision Records documenting significant technical decisions:
- Each ADR captures the context, decision, and consequences of architectural choices
- Maintains historical record of why decisions were made
- Helps teams understand and maintain consistency
- See `/docs/architecture/adr/README.md` for detailed ADR process

## Architecture vs Design vs Product

### Architecture Documentation (YOU ARE HERE)
Located in `/docs/architecture/`

**Purpose**: Document system-wide technical decisions that:
- Define overall system structure and patterns
- Establish technology choices and standards
- Set constraints and guidelines for all development
- Document cross-cutting concerns (security, performance, etc.)
- Have long-term implications across the entire system

**Examples**:
- System architecture overview
- Technology stack decisions
- Database design patterns
- Security frameworks
- Performance requirements
- Deployment strategies

### Feature Design Documents
Located in `/docs/design/features/`

**Purpose**: Document implementation details for specific features:
- Component design within a feature
- Feature-specific data models and APIs
- Implementation approach for individual features
- Testing strategies for specific functionality

### Product Documentation
Located in `/docs/product/`

**Purpose**: Document business context and product direction:
- Product vision and goals
- Target audience and use cases
- Business requirements and constraints
- Strategic priorities and roadmap

## Relationship Between Context Domains

```
Product Context (What & Why)
     ↓
Architecture Context (How - System Level)
     ↓
Design Context (How - Feature Level)
     ↓
Implementation (Code)
```

### When to Update Each
- **Product**: When business requirements or strategy changes
- **Architecture**: When making system-wide technical decisions
- **Design**: When implementing new features or changing existing ones

### Integration Points
1. **Product → Architecture**: Business requirements drive architectural decisions
2. **Architecture → Design**: Architectural patterns constrain feature designs
3. **Design → Architecture**: Feature needs may require new architectural decisions (create ADRs)

## Usage in CMDS

AI assistants use architecture documentation to:
- Make implementation decisions that follow your architectural patterns
- Understand system constraints and requirements
- Ensure new features integrate properly with existing system
- Maintain consistency with established technical standards
- Create feature designs that align with architectural decisions

## Templates

- **Architecture Decisions**: Use `/docs/architecture/adr/adr-template.md`
- **Feature Designs**: Use `/docs/design/features/feature-design-template.md`

## Integration with CMDS Commands

The `/design` command will:
- Reference architecture documentation when creating feature designs
- Prompt for ADR creation when designs include architectural decisions
- Ensure feature designs align with established architectural patterns
- Link feature designs to relevant ADRs