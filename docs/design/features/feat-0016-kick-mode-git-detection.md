# feat-0016: Kick Mode Git Repository Detection

## Status
**Proposed**

## Executive Summary
Enhance kick mode to detect and validate git repository state before attempting any operations, providing foundation for automated project setup and preventing errors from attempting git operations without proper repository context.

## Problem Statement
### Current State
Kick mode currently focuses only on template customization and lacks any git repository detection. When future git operations are added (repository initialization, GitHub repo creation, branch setup), kick mode needs to understand the current git context to make appropriate decisions.

### Desired State
Kick mode should detect and report git repository status early in the workflow, enabling informed decisions about subsequent git operations and providing clear feedback to operators about repository state.

### Success Criteria
- [ ] Detects presence and validity of git repository
- [ ] Reports repository status (clean, dirty, conflicts, etc.)
- [ ] Handles edge cases (bare repos, corrupted repos, submodules)
- [ ] Provides clear status information for subsequent workflow steps
- [ ] Integrates seamlessly with existing kick mode workflow

## Proposed Solution

### High-Level Approach
Add git repository detection as an early step in kick mode's initial status update, using standard git commands to assess repository state and provide structured status information that guides subsequent operations.

### Technical Architecture
```
Kick Mode Workflow
├── Initial Status Update
│   ├── Template Status (existing)
│   └── Git Repository Status (NEW)
│       ├── Repository Detection
│       ├── Repository Validation  
│       ├── Repository State Check
│       └── Status Reporting
├── TodoWrite Checklist (updated)
└── Template Customization (existing)
```

### Key Components
1. **Git Detection Module**
   - Purpose: Determine if git repository exists
   - Responsibilities: Check for .git directory and validate repository
   - Dependencies: Git CLI commands

2. **Repository State Analyzer**
   - Purpose: Assess current repository condition
   - Responsibilities: Check for uncommitted changes, conflicts, corruption
   - Dependencies: Git status and validation commands

3. **Status Reporter**
   - Purpose: Format repository information for operator
   - Responsibilities: Generate clear status messages and recommendations
   - Dependencies: Repository detection and state analysis results

## Implementation Details

### Git Commands Used
```bash
# Repository detection
git rev-parse --git-dir 2>/dev/null          # Find .git directory
git rev-parse --is-inside-work-tree 2>/dev/null  # Verify working tree

# Repository validation
git fsck --unreachable 2>/dev/null           # Check repository integrity
git rev-parse --is-bare-repository 2>/dev/null   # Check if bare repository

# Repository state
git status --porcelain 2>/dev/null           # Check for uncommitted changes
git diff --check 2>/dev/null                 # Check for whitespace issues
```

### Status Response Format
```markdown
**Git Repository:**
- Status: [Found/Not Found/Corrupted]
- Type: [Normal/Bare/Submodule] 
- State: [Clean/Dirty/Conflicts]
- Health: [Healthy/Issues Detected]
```

### Integration with Kick Mode
Update kick mode's initial status section to include git repository status alongside existing template status checks.

### Security Considerations
- Authentication: Uses local git configuration (no authentication changes)
- Authorization: No permission changes (read-only git operations)
- Data Protection: No sensitive data exposure (git metadata only)

## Testing Strategy

### Unit Tests
- Test git repository detection with valid repository
- Test behavior with no repository present
- Test handling of corrupted repository
- Test bare repository detection
- Test submodule detection

### Integration Tests  
- Test integration with existing kick mode workflow
- Test status reporting format and accuracy
- Test error handling and graceful degradation

### End-to-End Tests
- Operator starts kick mode in directory with git repository
- Operator starts kick mode in directory without git repository
- Operator starts kick mode in directory with corrupted repository

## Rollout Plan

### Phase 1: Core Detection
- Timeline: 1 development session
- Scope: Basic git repository detection and status reporting
- Success Metrics: Accurate detection of git repository presence/absence

### Phase 2: Enhanced Validation  
- Timeline: Follow-up enhancement if needed
- Scope: Advanced validation and error handling for edge cases
- Success Metrics: Robust handling of all repository states

## Risks and Mitigations

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|-------------------|
| Git CLI not available | Medium | Low | Check for git command availability, graceful fallback |
| Corrupted repository detection | Low | Medium | Use git fsck for validation, clear error messages |
| Performance with large repos | Low | Low | Commands are metadata-only, minimal performance impact |

## Dependencies
- Git CLI tool installed and available
- Standard shell command execution capabilities
- Existing kick mode workflow structure

## Open Questions
- [ ] Should detection include remote repository information?
- [ ] Should we validate git configuration (user.name, user.email)?
- [ ] Should we check for uncommitted changes and warn/prevent operations?

## Decision Log
| Date | Decision | Rationale | Made By |
|------|----------|-----------|---------|
| 2025-07-15 | Use git CLI commands vs git libraries | Follows existing pattern of bash scripts with CLI tools | George |
| 2025-07-15 | Integrate into initial status vs separate step | Maintains existing kick mode user experience | George |

## References
- [Issue #16: Add git repository detection to kick mode](https://github.com/charleslbryant/cmds/issues/16)
- [CRD #4: Kick mode should handle git/GitHub repository setup](https://github.com/charleslbryant/cmds/issues/4)
- [Git Documentation: Plumbing Commands](https://git-scm.com/book/en/v2/Git-Internals-Plumbing-and-Porcelain)
- [Existing kick mode implementation](/.claude/commands/kick.md)