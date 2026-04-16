---
applyTo: '**/*.al'
---

# Advanced Copilot Instructions for AL Development

## Purpose
Improve reliability and accuracy when working with AL and Business Central.

---

# Tool Usage Strategy

When available, prefer tools that provide:
- Symbol navigation
- Definitions and references
- Structured code discovery

Before reading entire files:
- Locate specific symbols or methods first

Use text search as a fallback, not the default.

---

# Verification First

Before claiming what code does:
- Read the implementation
- Verify behavior in code
- Prefer evidence over inference

Avoid:
- Guessing base app behavior
- Assuming from naming alone
- Concluding non-existence from a single search

If unsure, say so and investigate.

---

# Event Subscribers

When implementing subscribers:
- Match types with the event definition
- Verify signature against the publisher
- Include only parameters you use

The event definition is authoritative, not the call site.

---

# Object Identification

When discussing AL objects, include:
- Object type
- Object name
- Relevant context

Example:
- Table "Sales Header"
- Codeunit "Gen. Jnl.-Post Line"

This reduces ambiguity.

---

# Coding Conventions

Projects typically define:
- Naming rules
- ID ranges
- Field requirements
- Access modifiers

Copilot should adapt to project conventions.

---

# Token Discipline

For large codebases:
- Avoid reading whole files unnecessarily
- Explore structure first
- Read only what is needed

This improves focus and performance.

---

# Practical Advice

Copilot performs best when:
- Questions are precise
- Context is provided
- Important claims are verified
- You treat it as a collaborator, not authority