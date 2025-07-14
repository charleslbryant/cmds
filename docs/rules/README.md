# Rule-Based Governance

This directory contains the comprehensive rules that govern all development practices in CMDS. These rules ensure consistent, high-quality development across AI assistants and human developers.

## Purpose

Rule files serve as the foundation for CMDS's structured workflow by:
- **Defining Processes**: Step-by-step procedures for all development activities
- **Ensuring Consistency**: Same workflow regardless of who (human or AI) is developing
- **Maintaining Quality**: Built-in quality gates and requirements
- **Enabling Compliance**: Clear standards that can be validated and enforced
- **Providing Context**: Background and rationale for development decisions

## Files Overview

### Core Workflow Rules

**`session-workflow.md`**
Defines the complete development workflow from session startup to completion:
- Session startup procedures and context loading
- Development cycle: Plan → Design → Develop → QA → Evaluate
- TDD approach and quality requirements
- Session handoff and completion procedures

**`git-workflow.md`**
Establishes Git practices and branch management:
- Branch naming conventions and lifecycle
- Commit message standards and attribution
- Pull request creation and review process
- Merge procedures and cleanup

### Development Process Rules

**`design-phase.md`**
Defines the technical design process and requirements:
- Design workflow and artifacts
- Design document templates and standards
- Relationship between designs and ADRs
- Design review and approval process

**`task-management.md`**
Governs GitHub issue management and work prioritization:
- Issue types (PRD, CRD, Task) and their purposes
- Priority labels (Now, Next, Future) and assignment rules
- Scope management and one-task focus
- Issue lifecycle and completion tracking

### Communication and Documentation Rules

**`check-in-formats.md`**
Provides structured communication templates:
- Regular status update formats
- Handoff communication templates
- Problem escalation procedures
- Consistent information sharing standards

**`documentation-rules.md`**
Defines when and how to create documentation:
- User documentation requirements
- Developer documentation standards
- API documentation guidelines
- Documentation maintenance procedures

### Environment Management Rules

**`cmds-promotion-criteria.md`**
Establishes criteria for promoting changes between environments:
- Quality gates and prerequisites for promotion
- Testing requirements and validation procedures
- Rollback criteria and emergency procedures
- Version management and sync strategies

## Rule Integration in CMDS Workflow

### Mandatory Rule Reading
- Every CMDS mode requires reading relevant rule files at startup
- Ensures fresh context and prevents assumption-based errors
- Creates consistent behavior across sessions and developers

### Context Loading Order
1. **Mode-specific rules** - Rules relevant to current development phase
2. **Cross-cutting rules** - Git, documentation, communication standards
3. **Project context** - Product, architecture, and design documentation
4. **Session context** - Current state and task information

### Rule Enforcement
- Rules are enforced through mode checklists and procedures
- AI assistants follow rules as mandatory requirements
- Human developers use rules as guidelines and standards
- Violations are caught through review processes

## Usage in CMDS Commands

Different CMDS modes reference different combinations of rules:

**`/kick`**: Documentation rules, session workflow
**`/begin`**: Session workflow, task management, git workflow, check-in formats
**`/plan`**: Task management, check-in formats, documentation rules, git workflow
**`/design`**: Design phase, session workflow, documentation rules, git workflow
**`/dev`**: Session workflow, git workflow, check-in formats, documentation rules
**`/deliver`**: Git workflow, documentation rules, check-in formats
**`/qa`**: Check-in formats, documentation rules

## Best Practices

### For Rule Maintenance
- Keep rules focused and actionable
- Update rules based on lessons learned
- Ensure rules align with project goals
- Document rationale for rule changes

### For Rule Usage
- Read rules completely before starting work
- Follow rules as written, don't interpret or modify
- Ask for clarification when rules are unclear
- Suggest improvements through proper channels

### For Rule Evolution
- Rules should evolve with project needs
- Changes should be discussed and approved
- Document rule changes and their rationale
- Maintain backward compatibility when possible

## Integration with Other Context

### Relationship to Product Context
- Rules implement product development philosophy
- Process efficiency serves product delivery goals
- Quality standards align with product requirements

### Relationship to Architecture Context
- Rules support architectural decision-making
- Technical standards complement architectural patterns
- Change management protects architectural integrity

### Relationship to Design Context
- Rules guide design document creation
- Design review processes ensure quality
- Implementation rules maintain design fidelity

## Compliance and Validation

CMDS rules are designed to be:
- **Verifiable**: Can be checked through automation or review
- **Actionable**: Provide clear steps and requirements
- **Consistent**: Work together without conflicts
- **Maintainable**: Can evolve with project needs

The rule-based approach ensures that CMDS delivers consistent, high-quality results regardless of who is doing the development work.