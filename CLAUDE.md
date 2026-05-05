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
