# Feature Design Documents

This directory contains technical design documents for features being developed in CMDS.

## Purpose

Feature design documents serve as:
- **Pre-implementation planning** - Think through technical approach before coding
- **Decision record** - Document why certain approaches were chosen
- **Reference material** - Guide implementation and future maintenance
- **Review artifact** - Enable design review before development

## Relationship to ADRs

While Architecture Decision Records (ADRs) in `/docs/architecture/adr/` capture significant architectural decisions that affect the overall system, feature design documents focus on:
- **Feature-specific implementation details**
- **Component interactions within a feature**
- **API contracts for new endpoints**
- **Data models and schemas**
- **Testing strategies**

When a feature design includes architectural decisions:
1. Document the decision in the feature design
2. Create a corresponding ADR for significant architectural choices
3. Link between the feature design and ADR

## Design Document Structure

### Feature Designs
Each feature design follows the template in `feature-design-template.md`:
- Problem statement and requirements
- Technical approach and architecture
- Implementation details
- Testing strategy
- Risk assessment
- Migration/rollout plan

### API Designs
For features that include API endpoints, use `api-design-template.md`:
- Resource models and schemas
- Endpoint specifications
- Request/response formats
- Error handling
- Authentication and authorization
- Rate limiting and performance

## Workflow

1. **Create Design** - Copy template and fill out for your feature
2. **Review Design** - Get feedback before implementation
3. **Update During Development** - Keep design current with learnings
4. **Archive After Completion** - Mark as implemented with links to code

## Naming Convention

All design documents should be named:
```
feat-xxxx-feature-name.md      # Feature designs
api-xxxx-api-name.md           # API-specific designs
```

Examples: 
- `feat-0001-cmds-design-phase.md`
- `api-0001-user-authentication.md`

## Design Status

Each design document should include a status (matching ADR format):
- **Proposed** - Initial design, awaiting review
- **Accepted** - Approved and ready for/in implementation
- **Deprecated** - No longer relevant, replaced by newer design
- **Superseded** - Replaced by a specific newer design

## Example Usage

```bash
# Create new feature design
cp feature-design-template.md feat-0002-my-feature.md

# Create new API design
cp api-design-template.md api-0001-my-api.md

# Edit the design
vim feat-0002-my-feature.md

# After implementation, update status
# Status: **Accepted** | Proposed | Deprecated | Superseded
# Implementation: PR #123, commits abc123, def456
```

## Integration with Commands

The `/design` command in CMDS will:
1. Check this directory for existing designs
2. Create new designs using appropriate templates (feature or API)
3. Update design status during development
4. Link designs to pull requests

## Best Practices

1. **Design Before Code** - For non-trivial features
2. **Keep It Current** - Update design if approach changes
3. **Link Everything** - Connect to issues, PRs, ADRs
4. **Be Specific** - Include concrete examples
5. **Consider Alternatives** - Document why you chose this approach