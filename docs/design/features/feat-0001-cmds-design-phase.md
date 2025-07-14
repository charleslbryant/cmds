# feat-0001: CMDS Design Phase Integration

## Status
**Accepted** | Proposed | Deprecated | Superseded

## Executive Summary
Integrate a formal design phase into CMDS workflow to ensure thoughtful technical planning before implementation, particularly important for CMDS developing CMDS itself.

## Problem Statement
### Current State
CMDS workflow transitions directly from planning (/plan) to development (/dev), missing a crucial design step where technical architecture and implementation approach are thoughtfully considered.

### Desired State
A design phase between planning and development that ensures:
- Technical approaches are documented before coding
- Architecture decisions are captured
- Alternative solutions are considered
- Testing strategies are defined upfront

### Success Criteria
- [x] Design command created and integrated into workflow
- [x] Transitions updated to include design phase
- [ ] Design templates and documentation complete
- [ ] All commands reflect new workflow
- [ ] Documentation updated across the project

## Proposed Solution

### High-Level Approach
Add a `/design` command that sits between `/plan` and `/dev` in the CMDS workflow, with its own checklist, templates, and integration points.

### Technical Architecture
```
Current Flow:
/begin → /plan → /dev → /deliver → /qa

New Flow:
/begin → /plan → /design → /dev → /deliver → /qa
                     ↑         ↓
                     ←---------←
```

### Key Components
1. **Design Command (/design)**
   - Purpose: Guide technical design process
   - Responsibilities: Design documentation, architecture decisions, API specs
   - Dependencies: Follows /plan, precedes /dev

2. **Design Documentation Structure**
   - Purpose: Organize design artifacts
   - Responsibilities: Store feature designs, templates, relationships to ADRs
   - Dependencies: Links to architecture docs

3. **Updated Commands**
   - Purpose: Reflect new workflow transitions
   - Responsibilities: Guide users through design phase
   - Dependencies: All existing commands need updates

## Implementation Details

### File Structure
```
/home/cbryant/projects/cmds/
├── .claude/commands/
│   ├── design.md (new)
│   └── index.yaml (updated)
├── docs/
│   ├── design/
│   │   ├── features/
│   │   │   ├── README.md
│   │   │   ├── feature-design-template.md
│   │   │   └── 2025-07-14-cmds-design-phase.md
│   │   └── api-design-template.md
│   └── rules/
│       ├── design-phase.md
│       └── cmds-promotion-criteria.md
```

### Command Updates
1. `/plan` → transitions to `/design` instead of `/dev`
2. `/design` → new command, transitions to `/dev` or back to `/plan`
3. `/dev` → transitions to `/design` instead of `/plan`
4. `/begin` → can transition to `/design` for well-defined tasks

### Design Document Requirements
- Problem statement and requirements
- Technical approach with alternatives
- Architecture diagrams where helpful
- API specifications if applicable
- Test strategy
- Risk assessment
- Migration plan

## Testing Strategy

### Manual Testing
- Test all command transitions work correctly
- Verify design templates are usable
- Ensure documentation is clear

### Integration Testing
- Complete full workflow from /begin through /deliver
- Verify design artifacts are created and referenced
- Test rollback scenarios

### Validation
- Use CMDS to develop a feature using the new design phase
- Gather feedback on workflow effectiveness

## Rollout Plan

### Phase 1: Core Implementation
- Timeline: Immediate
- Scope: Command creation, transition updates
- Success Metrics: Commands work, transitions correct

### Phase 2: Documentation
- Timeline: Same session
- Scope: Templates, guides, relationship docs
- Success Metrics: Clear documentation, examples provided

### Phase 3: Integration
- Timeline: Next feature development
- Scope: Use design phase for next CMDS feature
- Success Metrics: Design phase adds value, no workflow friction

## Risks and Mitigations

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|-------------------|
| Added complexity slows development | Medium | Medium | Make design optional for trivial changes |
| Design docs become stale | High | High | Update designs during development |
| Unclear when to use design vs ADR | Medium | Medium | Document clear criteria |

## Dependencies
- Existing CMDS command system
- Documentation structure
- Git workflow

## Open Questions
- [ ] Should design reviews be mandatory?
- [ ] How to handle emergency fixes?
- [ ] Integration with GitHub issues?

## Decision Log
| Date | Decision | Rationale | Made By |
|------|----------|-----------|---------|
| 2025-07-14 | Add design phase | Improve planning before coding | Team |
| 2025-07-14 | Design between plan and dev | Natural workflow progression | Team |
| 2025-07-14 | Keep design artifacts in /docs/design | Separation from architecture | Team |

## References
- Original discussion in conversation
- /docs/rules/design-phase.md
- /docs/architecture/adr/ for ADR patterns