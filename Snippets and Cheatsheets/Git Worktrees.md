# Git Worktrees

A Git worktree is an additional working directory attached to the same repository. It lets you keep one branch open for review or a long-running build while working on another branch, without repeatedly stashing changes.

## Create and use a worktree

From the main repository, create a sibling directory for an existing branch:

```bash
git worktree add ../handbook-fix fix/typo
cd ../handbook-fix
```

Create a new branch and its worktree together:

```bash
git worktree add -b docs/git-worktrees ../handbook-worktrees main
cd ../handbook-worktrees
```

Each worktree has its own checked-out branch and working files, but they share the repository's object database. A branch can be checked out in only one worktree at a time.

## Inspect and remove

```bash
git worktree list
git worktree remove ../handbook-worktrees
git worktree prune
```

Run `git worktree remove` only after committing, stashing, or deliberately discarding changes in that directory. `git worktree prune` removes stale administrative records left by worktrees that were deleted outside Git.

## Practical workflow

Keep `main` in the primary directory and create a sibling worktree for each focused branch:

```text
software-engineering-handbook/          main
software-engineering-handbook-review/   review branch
software-engineering-handbook-feature/  feature branch
```

This is helpful when reviewing a pull request, comparing a regression with `main`, or running two independent local commands. It does not make simultaneous edits to the same file safe: coordinate the changes and merge normally.

## Common pitfalls

- Do not manually delete a worktree with uncommitted work; remove it through Git after checking its status.
- Do not check out the same branch in multiple worktrees.
- Repository-wide configuration is shared. A local Git config change can affect every worktree unless `extensions.worktreeConfig` is enabled and configuration is scoped deliberately.
- Build outputs and tool caches may still collide if they use paths outside the worktree. Give concurrent builds separate output directories when needed.
