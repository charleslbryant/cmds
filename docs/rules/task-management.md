# Task Management Rules

## GitHub Issue Types

### PRD (Product Requirement Document)
- **Scope**: High-level feature specifications  
- **Action**: Do NOT implement directly - too broad for single session
- **Process**: Break down into CRDs (specific user stories)
- **Linking**: Reference parent PRD in each CRD

### CRD (Change Request Document)  
- **Scope**: Specific user stories with acceptance criteria
- **Process**: 
  1. Review "Tasks Breakdown" section in CRD
  2. Create separate GitHub task issues for each breakdown item
  3. Work on ONE task at a time
  4. Use single feature branch for entire CRD

### Task Issues
- **Creation**: One GitHub issue per CRD task breakdown item
- **Format**:
  ```bash
  gh issue create --title "Task: [specific task description]" \
    --body "Part of CRD #[CRD-number] - [CRD title]
  
  ## Summary
  [Task description]
  
  ## Acceptance Criteria
  - [ ] [Specific criteria for this task]
  
  ## Parent Issues
  - Resolves part of #[CRD-number]
  - Depends on #[previous-task-number] (if applicable)"
  ```

## Priority Label Workflow (Single Piece Flow)

### Team Focus Limits
- **PRD Level**: Team focuses on 1 PRD at a time (max 3 PRDs active across entire team)
- **CRD Level**: 1 CRD per operator (CRDs can be "now" for different operators across different PRDs)
- **Task Level**: 1 task per agent session (tasks can be "now" for different agents across PRDs)

### Priority Assignment Rules
- **"now" Priority Assignment**: When a task is labeled "now", it MUST be assigned to the agent's operator
- **Single Piece Flow**: Maintain focus by limiting active work at each level
- **Cross-PRD Work**: Different operators can work on different PRDs simultaneously
- **Parallel Tasks**: Different agents can work on different tasks simultaneously within workflow limits

### Priority Labels
- **now**: Current active work assigned to specific operator/agent
- **next**: Ready for work after current tasks complete
- **future**: Planned but not yet ready for development

**Status**:
- **to-do**: Planned but not yet ready
- **in-progress**: Current active work (limit 1-2 tasks)
- **on-hold**: Ready for work after current tasks
- **blocked**: Blocked by another task or external dependency
- **done**: Completed
- **cancelled**: Cancelled

**Scope**:
- **prd**: Product requirement document (feature)
- **crd**: Change request document (user story)
- **task**: Task issue (task)

**Type**:
- **feature**: New feature development
- **bug**: Bug fix
- **documentation**: Documentation update
- **refactor**: Code refactoring
- **test**: Test development
- **other**: Other type of task

### Branch Strategy
- **One branch per CRD**: `feature/crd-[issue-number]-[description]`
- **All CRD tasks share the same branch**
- **Complete CRD before merging branch**

## Work Process

### Task Assignment (Single Piece Flow)
1. **Priority Assignment**: When labeling a task as "now", assign it to the agent's operator
2. **Operator Focus**: Each operator works on 1 CRD at a time
3. **Agent Focus**: Each agent works on 1 task per session
4. **Work Transition**: Move from "next" to "now" when ready for new work
5. **Assignment Requirement**: "now" tasks MUST have assignee before work begins

### Task Completion
1. Complete implementation and tests
2. Mark GitHub issue as completed with comment
3. Move to next task in same CRD or switch CRDs

### Scope Management
- If work expands beyond original task: STOP and check with operator
- If multiple concerns discovered: create separate tasks/branches
- When in doubt about scope: ask operator before proceeding

## Assignment Workflow Examples

### Scenario: Multiple Operators on Different PRDs
- **Operator A**: Working on PRD #1, CRD #3 labeled "now", assigned to Operator A
- **Operator B**: Working on PRD #2, CRD #5 labeled "now", assigned to Operator B  
- **Result**: Single piece flow maintained across different product streams

### Scenario: Multiple Agents on Same PRD
- **Agent 1**: Working on Task #7 (part of CRD #3), labeled "now", assigned to Operator A
- **Agent 2**: Working on Task #8 (part of CRD #3), labeled "now", assigned to Operator A
- **Result**: Parallel task execution within same CRD workflow

### Scenario: Task Priority Transition
1. **Current State**: Task #7 labeled "now", assigned to Operator A
2. **Completion**: Task #7 completed, labeled "done"
3. **Transition**: Task #8 moved from "next" to "now", assigned to Operator A
4. **Assignment**: Agent begins work on newly prioritized task

## TodoWrite Integration
Task management todos:
- [ ] Review task breakdown in assigned CRD
- [ ] Create GitHub issues for each CRD task if not already created
- [ ] Label and assign current "now" priority task following single piece flow rules
- [ ] Verify current branch matches the task being worked on
- [ ] Complete current task before starting new work
- [ ] Ensure "now" tasks have proper assignee before development begins