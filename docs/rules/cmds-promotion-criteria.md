# CMDS Promotion Criteria

## Overview
This document defines the criteria and process for promoting changes from the development CMDS (root directory) to the user CMDS (/cmds directory).

## Promotion Prerequisites

### 1. Design Review Complete
- [ ] Feature has approved design document
- [ ] Architecture decisions are documented
- [ ] API contracts are defined (if applicable)
- [ ] Security implications reviewed

### 2. Implementation Complete
- [ ] All code follows established patterns
- [ ] No TODO or FIXME comments remain
- [ ] Code is properly documented
- [ ] Error handling is comprehensive

### 3. Testing Requirements Met
- [ ] Unit tests written and passing
- [ ] Integration tests written and passing
- [ ] Test coverage meets minimum threshold (80%)
- [ ] Edge cases and error scenarios tested
- [ ] Performance benchmarks acceptable

### 4. Quality Assurance Passed
- [ ] Code review completed
- [ ] Linting rules pass
- [ ] Type checking passes (if applicable)
- [ ] No security vulnerabilities detected
- [ ] Accessibility requirements met

### 5. Documentation Complete
- [ ] User documentation updated
- [ ] Developer documentation updated
- [ ] CHANGELOG.md updated
- [ ] Migration guide provided (if breaking changes)

## Promotion Process

### Step 1: Pre-Promotion Checklist
Run the following checks before promotion:
```bash
# In root cmds directory
npm test
npm run lint
npm run type-check
npm run security-check
```

### Step 2: Create Promotion Branch
```bash
git checkout -b promote/feature-name
```

### Step 3: Selective File Copy Using .cmdsignore
Use the `.cmdsignore` file to control what gets synced:

```bash
# Sync files while respecting .cmdsignore
rsync -av --exclude-from=.cmdsignore /home/cbryant/projects/cmds/ /cmds/
```

The `.cmdsignore` file excludes:
- Development-specific session context files
- Our customized product/architecture docs (users customize their own)
- Our specific design documents and ADRs
- Development artifacts and temporary files
- Experimental/WIP features

**ALWAYS COPY:**
- Command system (`.claude/commands/`)
- Rule files (`docs/rules/`)
- Templates and guidance (`docs/*/README.md`, templates)
- Project documentation (`README.md`, `CLAUDE.md`)

**NEVER COPY:**
- Session state files (users maintain their own)
- Customized content (users create their own)
- Development-specific configurations

### Step 4: Integration Testing
After copying to /cmds:
1. Run full test suite in /cmds directory
2. Perform manual testing of promoted features
3. Verify no regressions in existing functionality
4. Test in isolation from root cmds

### Step 5: Staged Rollout
1. **Alpha**: Internal testing only
2. **Beta**: Limited user testing with feedback
3. **Release Candidate**: Full testing, documentation review
4. **Production**: Final promotion to all users

## Quality Gates

### Must Pass Before Promotion
| Gate | Criteria | Tool/Check |
|------|----------|------------|
| Tests | 100% pass rate | `npm test` |
| Coverage | ≥80% coverage | Coverage report |
| Lint | Zero errors | `npm run lint` |
| Types | Zero errors | `npm run type-check` |
| Security | No high/critical | Security scan |
| Docs | Complete & accurate | Manual review |
| Performance | No regressions | Benchmark tests |

### Rollback Criteria
Immediately rollback if:
- Critical bugs discovered post-promotion
- Performance degradation >10%
- Security vulnerability found
- Data corruption or loss
- User-reported breaking changes

## File Sync Strategy

### Using .cmdsignore for Controlled Sync
The `.cmdsignore` file provides gitignore-style pattern matching to control what gets promoted:

**Sync Command:**
```bash
rsync -av --exclude-from=.cmdsignore /home/cbryant/projects/cmds/ /cmds/
```

### What Gets Synced (Methodology & Templates)
- **Command System**: All files in `.claude/commands/` (modes, configuration)
- **Rules**: All files in `docs/rules/` (governance and standards)
- **Templates**: Template files and README guides in all docs directories
- **Documentation**: Main README.md, CLAUDE.md, and guidance documents

### What Gets Excluded (Development-Specific)
- **Session Context**: Our active session state and task files
- **Customized Content**: Our specific product vision, strategy, architecture
- **Design Artifacts**: Our feature designs and ADRs (users create their own)
- **Development Files**: Git artifacts, IDE configs, temporary files

### Special Handling
1. **Template Files**
   - Copy template versions, not customized versions
   - Users run `/kick` to customize for their projects
   - Maintain template warnings in synced versions

2. **README Files**
   - Always sync README.md files (they're guidance, not state)
   - These help users understand directory purposes

3. **Session Context**
   - Sync SESSION_HANDOFF_TEMPLATE.md (template only)
   - Exclude actual session state files
   - Users maintain their own session context

## Post-Promotion Tasks

### Immediate Actions
1. Tag the promotion in git
2. Update version numbers
3. Publish release notes
4. Monitor for issues

### Within 24 Hours
1. Gather user feedback
2. Monitor error logs
3. Check performance metrics
4. Address critical issues

### Within 1 Week
1. Retrospective on promotion process
2. Update this document with learnings
3. Plan any necessary patches
4. Document known issues

## Emergency Procedures

### Hotfix Process
For critical issues in /cmds:
1. Create hotfix in root cmds
2. Fast-track testing (minimum viable)
3. Emergency promotion with approval
4. Full testing post-deployment
5. Retrospective on root cause

### Communication Plan
- Notify users of planned promotions
- Provide changelog and migration guide
- Set up feedback channels
- Announce completed promotions

## Version Management

### Semantic Versioning
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes

### Version Sync
- Root cmds version: X.Y.Z-dev
- User cmds version: X.Y.Z
- Keep versions aligned but distinguished

## Approval Requirements

### Standard Features
- Developer completes checklist
- One peer review
- Operator approval

### High-Risk Changes
- Two peer reviews
- Operator approval
- Staged rollout required
- Extended monitoring period