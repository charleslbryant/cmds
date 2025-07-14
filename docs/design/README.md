# Design Documentation

This directory contains feature and API design documentation that bridges product requirements and technical implementation.

## Structure

```
design/
├── README.md                    # This file
└── features/                    # All design documents
    ├── README.md               # Guide for feature and API designs
    ├── feature-design-template.md
    ├── api-design-template.md
    ├── feat-xxxx-*.md          # Individual feature designs
    └── api-xxxx-*.md           # Individual API designs
```

## Design Phase in CMDS Workflow

The design phase sits between planning and development:
1. **Plan** - Break down work into tasks
2. **Design** - Create technical approach (YOU ARE HERE)
3. **Develop** - Implement with TDD
4. **QA** - Test and validate
5. **Deliver** - Ship the work

## ADRs vs Feature Designs

### Architecture Decision Records (ADRs)
Located in `/docs/architecture/adr/`

**Purpose**: Document significant architectural decisions that:
- Affect multiple components or features
- Have long-term implications
- Establish patterns or standards
- Choose between competing technologies
- Define system boundaries

**Examples**:
- Choosing a database technology
- Defining API versioning strategy
- Establishing error handling patterns
- Setting security standards

### Feature Design Documents
Located in `/docs/design/features/`

**Purpose**: Document implementation details for specific features:
- Component design within a feature
- Data models and schemas
- API endpoints and contracts
- User interface flows
- Testing strategies
- Rollout plans

**Examples**:
- Adding user authentication
- Implementing search functionality
- Creating a new command
- Building an integration

## When to Use Each

### Create an ADR when:
- The decision affects the overall architecture
- Multiple features will depend on this decision
- You're establishing a new pattern
- The decision is hard to reverse
- You're choosing between technologies

### Create a Feature Design when:
- Planning a new feature or significant enhancement
- The implementation is non-trivial
- Multiple components need coordination
- API contracts need definition
- You need stakeholder review before coding

## Linking ADRs and Feature Designs

When a feature design leads to architectural decisions:

1. **In the Feature Design**:
   ```markdown
   ## Architecture Decisions
   This feature requires choosing a state management approach.
   See: [ADR-0001: State Management Pattern](../../architecture/adr/0001-state-management.md)
   ```

2. **In the ADR**:
   ```markdown
   ## Context
   This decision was prompted by the design of the User Settings feature.
   See: [User Settings Design](../../design/features/feat-0002-user-settings.md)
   ```

## Best Practices

1. **Start with Design** - For non-trivial features, design first
2. **Extract ADRs** - When design reveals architectural decisions
3. **Keep Synchronized** - Update both when decisions change
4. **Reference Code** - Link to implementations after building
5. **Review Together** - Consider both in design reviews

## Design Review Process

1. Create feature design document
2. Identify architectural decisions
3. Create ADRs for significant decisions
4. Review both in design review
5. Update based on feedback
6. Proceed to development

## Templates

- **Feature Design**: Use `/docs/design/features/feature-design-template.md`
- **API Design**: Use `/docs/design/features/api-design-template.md`
- **ADR**: Use `/docs/architecture/adr/adr-template.md`

## Integration with CMDS Commands

The `/design` command will:
- Guide you through creating feature designs
- Prompt for ADR creation when needed
- Link related documents
- Ensure designs are reviewed before development