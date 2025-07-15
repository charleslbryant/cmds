# GitHub Label System Design

## Problem Statement
Create a comprehensive GitHub label system for CMDS project management that enables effective categorization and tracking of issues across Priority, Status, Scope, and Type dimensions.

## Requirements
- 18 total labels across 4 categories (3 Priority + 6 Status + 3 Scope + 6 Type)
- Consistent color scheme and naming conventions
- Clear descriptions for each label
- Support for CMDS workflow methodology

## Architecture

### Label Categories
1. **Priority**: Workflow urgency (now, next, future)
2. **Status**: Current state (to-do, in-progress, on-hold, blocked, done, cancelled)
3. **Scope**: Issue type (prd, crd, task)
4. **Type**: Work category (feature, bug, documentation, refactor, test, other)

### Color Strategy
- Priority: Red spectrum (urgency indication)
- Status: Blue/Green spectrum (workflow states)
- Scope: Green/Teal spectrum (categorization)
- Type: Purple/Orange spectrum (work types)

## Implementation Plan

### Phase 1: Label Creation
```bash
# Execute GitHub CLI commands to create all 18 labels
gh label create [name] --color [hex] --description [desc]
```

### Phase 2: Verification
- List all labels to confirm creation
- Verify colors and descriptions match specification
- Test label application on sample issues

### Phase 3: Documentation
- Update task-management.md if needed
- Document label usage guidelines

## Label Specifications

| Label | Color | Description |
|-------|-------|-------------|
| **Priority Labels** |
| now | #d73a49 | Current active work (limit 1-2) |
| next | #ff8c00 | Ready for work after current |
| future | #ffd700 | Planned but not yet ready |
| **Status Labels** |
| to-do | #0366d6 | Planned but not started |
| in-progress | #28a745 | Currently being worked on |
| on-hold | #ffc107 | Temporarily paused |
| blocked | #dc3545 | Blocked by dependency |
| done | #6f42c1 | Completed successfully |
| cancelled | #6c757d | Cancelled/abandoned |
| **Scope Labels** |
| prd | #20c997 | Product Requirement Document |
| crd | #17a2b8 | Change Request Document |
| task | #198754 | Individual task |
| **Type Labels** |
| feature | #6610f2 | New feature development |
| bug | #e83e8c | Bug fix |
| documentation | #fd7e14 | Documentation work |
| refactor | #20c997 | Code refactoring |
| test | #6f42c1 | Test development |
| other | #adb5bd | Other work type |

## Testing Strategy
1. **Creation Verification**: Confirm all 18 labels exist with correct properties
2. **Color Validation**: Visual review of color scheme consistency  
3. **Usage Testing**: Apply labels to existing issues #1-6
4. **Workflow Integration**: Verify labels support CMDS methodology

## Risk Assessment
- **Low Risk**: Standard GitHub feature with CLI automation
- **Mitigation**: Manual verification step before marking complete

## Timeline
- Design: 30 minutes (current)
- Implementation: 15 minutes
- Testing: 15 minutes
- Total: 1 hour

## Success Criteria
- [ ] All 18 labels created with correct names, colors, descriptions
- [ ] Labels visible in GitHub repository
- [ ] Ready for application to existing issues
- [ ] Supports CMDS workflow requirements