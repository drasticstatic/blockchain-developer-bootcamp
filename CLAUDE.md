# CLAUDE.md — blockchain-developer-bootcamp

**Status:** ⏸️ Inactive — Class homework assignment, now boilerplate code and sandbox environment

---

## Security Rules (Non-Negotiable)

- **Never read, display, or reference `.env` files** — in any repo
- **Never read private keys, seed phrases, wallet files, mnemonic files, or keystore files**
- **Never read or expose API key files** (service accounts, Google credentials, exchange keys, etc.)
- **Never commit secrets** — warn and stop if staged
- If an example env file is needed, create it with placeholder values only (e.g. `API_KEY=your_api_key_here`)
- **Web3:** Never display wallet addresses or private keys from any secret file

---

## Context Rules

- Memory files live in `~/.claude/projects/.../memory/` — MEMORY.md auto-loaded each session
- AGENT-SYNC is private — never reference its contents in public-facing files
- Cross-repo privacy firewall: Alfred does not pass trading or divorce-custody data between repos without explicit instruction

---

## Agent Ecosystem

| Agent | Platform | Domain |
|-------|----------|--------|
| **Alfred** | Claude Code CLI | Primary coordinator — cross-repo housekeeping, free-model sandbox, generalist tasks (default) |
| **Fortuna** | Claude Code CLI | Trading specialist — trading workflow, session analysis, coaching documentation (designated domain) |
| **Kavanah** | Augment Intent | Spec-driven orchestration specialist — cross-repo coordination, documentation |
| **Auggie** | Augment CLI | Code build specialist — Pine Script, Python, MCP servers, web3/dappu |

---

## This Repo

**Purpose:** DAppU Blockchain Developer Bootcamp — comprehensive learning materials and exercises.

**Status:** Inactive. Christopher is not actively working on this repo.

**When Active:** Auggie leads code builds. Fortuna provides trading context if relevant. Alfred handles cross-repo housekeeping.

---

## Cross-Repo Rules

See `AGENT-SYNC/CROSS_REPO_RULES.md` in `trading-assistant` for full governance.

---

## Commit Convention

Full fleet convention, shown here regardless of whether this specific repo currently has an Augment
Intent workspace pairing or NIM in active use — so a new repo (and its memory) doesn't need the
whole multi-agent suite re-explained from scratch. Which *application* launched a session decides
the agent name and engine, not which path — see
`anthropas-argus-alfred/sandbox/AGENT_IDENTITY_REFERENCE.md` and `INTENT_WORKTREE_LEGEND.md` for
the full rule.

- Alfred-Anthropic: `Co-Authored-By: Alfred · ClaudeCodeCLI · Anthropic [Sonnet-5/Opus-#/Haiku-#]`
- Alfred-NIM: `Co-Authored-By: Alfred · ClaudeCodeCLI · NVIDIA NIM [model]`
- Kavanah-AugmentIntentUI-AuggieLogin: `Co-Authored-By: Kavanah · AugmentIntent · [model]`
- Kavanah-AugmentIntentUI-AnthropicLogin ("ClaudeMent"): `Co-Authored-By: Kavanah · ClaudeMent · Anthropic [model]`
- Kavanah-TerminalUI(macOS/Intent/VSCode standard terminal instance)-AnthropicLogin: `Co-Authored-By: Kavanah · ClaudeCodeCLI · Anthropic [model]`
- Mystarch (app-level Chief of Staff, cross-workspace reach): same engine options as Kavanah above, swap the agent name
- Auggie (native Augment CLI — currently hibernating, may return): `Co-Authored-By: Auggie · AugmentCLI · [model]`

## Commit attribution (enforced by hook)

Every commit must carry two git trailers:

```
Co-Authored-By: <Agent> · <Engine> · <Provider> [<Model>]
<Platform>-Session: <full session URL>
```

Four fields, model in **square brackets**, separator is U+00B7 MIDDLE DOT ( · ). The session
trailer is a **separate** line — folding it onto the `Co-Authored-By:` line breaks git trailer
parsing. Use the full session URL, never a truncated prefix. Key varies by platform:
`Claude-Session:` for Claude Code CLI, `Cosmos-Session:` for Cosmos.

`.githooks/commit-msg` rejects non-conforming commits. **Activate it once per clone:**

```sh
sh scripts/install-hooks.sh
```

Human-only commits: `git commit --no-verify`. Canonical convention and rationale:
[`my-template/AGENT-SYNC/README.md`](https://github.com/drasticstatic/my-template/blob/main/AGENT-SYNC/README.md)
