# CVEs

Security vulnerability research and proof-of-concept material for issues I've reported.
All testing is performed against local, isolated instances of the affected software. No
third-party or production systems are accessed.

## Findings

| Product | Vulnerability | Type | Auth | Details |
|---|---|---|---|---|
| code-projects Inventory Management System 1.0 | `fetchSelectedUser.php` `userid` SQL injection | CWE-89 | None | [write-up](inventory-management-system-1.0-fetchSelectedUser-sqli/) |

Each folder contains a full write-up (root cause, PoC, impact, remediation), evidence
screenshots, and a one-command Docker reproduction lab.
