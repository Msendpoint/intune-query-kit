# IntuneQueryKit

> Pre-built KQL query library and PowerShell runner that helps IT admins instantly interrogate their entire Intune fleet during security incidents — no KQL expertise required.

## Overview

IntuneQueryKit is a curated, battle-tested library of 50+ Device Query KQL templates covering common incident response, vulnerability triage, and compliance scenarios (rogue software, outdated drivers, memory-leaking apps, missing patches). It ships with a PowerShell wrapper that authenticates to the Intune Graph API, executes queries across the fleet, and exports results to CSV or triggers Teams/email alerts automatically. Buyers get immediate time-to-value without needing to learn KQL from scratch.

## Problem This Solves

Security and ops teams waste hours during incidents pivoting between Excel exports, CMDBs, and Intune portal reports — Device Query solves this but most admins don't know KQL, so the licensed capability sits unused while breaches or vulnerabilities go uninventoried for days

## Target Audience

IT admins and MSP engineers managing 500+ Windows endpoints who already own the Intune Suite add-on but lack the KQL skills or time to operationalize Device Query

## Tech Stack

PowerShell, KQL, Microsoft Graph API, Gumroad

## Installation

```powershell
# Clone the repository
git clone https://github.com/intune-query-kit.git
cd intune-query-kit

# Review the script before running
Get-Content scripts/intune-query-kit.ps1

# Run with appropriate permissions
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\scripts\{intune-query-kit}.ps1
```

## Usage

Authenticate to the Microsoft Graph API, accept a KQL query template and target device scope as parameters, execute a Device Query against multiple Intune-managed endpoints in bulk, and export results including device name, primary user, last check-in, and queried property values to a timestamped CSV file with optional Teams webhook notification.

## Monetization Strategy

Tiered digital product sold on Gumroad and Lemon Squeezy: Starter pack (15 essential queries + PowerShell runner) at $49 one-time; Pro pack (50+ queries + Teams alerting + monthly new query drops) at $99 one-time or $19/month subscription for ongoing updates; MSP license (unlimited client tenants + white-label branding) at $299/year

| Metric | Value |
|--------|-------|
| Revenue Potential | HIGH |
| Estimated Effort  | 1-2weeks |

## Contributing

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License — see [LICENSE](LICENSE) for details.

---

*Generated from the article: [Device Query for Multiple Devices in Intune Advanced Analytics](https://msendpoint.com/articles/device-query-for-multiple-devices-in-intune-advanced-analytics) on 2026-03-28*
*Blog: [MSEndpoint.com](https://msendpoint.com)*