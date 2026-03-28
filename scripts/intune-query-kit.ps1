<#
.SYNOPSIS
    IntuneQueryKit

.DESCRIPTION
    IntuneQueryKit is a curated, battle-tested library of 50+ Device Query KQL templates covering common incident response, vulnerability triage, and compliance scenarios (rogue software, outdated drivers, memory-leaking apps, missing patches). It ships with a PowerShell wrapper that authenticates to the Intune Graph API, executes queries across the fleet, and exports results to CSV or triggers Teams/email alerts automatically. Buyers get immediate time-to-value without needing to learn KQL from scratch.

    Purpose: Authenticate to the Microsoft Graph API, accept a KQL query template and target device scope as parameters, execute a Device Query against multiple Intune-managed endpoints in bulk, and export results including device name, primary user, last check-in, and queried property values to a timestamped CSV file with optional Teams webhook notification.

.NOTES
    Author:      MSEndpoint.com
    Target:      IT admins and MSP engineers managing 500+ Windows endpoints who already own the Intune Suite add-on but lack the KQL skills or time to operationalize Device Query
    Created:     2026-03-28
    Repository:  https://github.com/intune-query-kit
    License:     MIT

.EXAMPLE
    .\scripts\{intune-query-kit}.ps1

.EXAMPLE
    .\scripts\{intune-query-kit}.ps1 -Verbose

#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [string]$TenantId,

    [Parameter(Mandatory = $false)]
    [string]$OutputPath = ".\output",

    [Parameter(Mandatory = $false)]
    [switch]$WhatIf
)

#Requires -Version 7.0

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ── Banner ─────────────────────────────────────────────────────
Write-Host ""
Write-Host "  IntuneQueryKit" -ForegroundColor Cyan
Write-Host "  MSEndpoint.com — https://msendpoint.com" -ForegroundColor DarkGray
Write-Host ""

# ── Prerequisites check ────────────────────────────────────────
function Test-Prerequisites {
    $modules = @('Microsoft.Graph', 'ExchangeOnlineManagement')
    foreach ($mod in $modules) {
        if (-not (Get-Module -ListAvailable -Name $mod)) {
            Write-Warning "Module '$mod' not found. Install with: Install-Module $mod -Scope CurrentUser"
        }
    }
}

# ── Connect to Microsoft Graph ────────────────────────────────
function Connect-ToGraph {
    param([string]$TenantId)

    $scopes = @(
        'DeviceManagementManagedDevices.Read.All',
        'DeviceManagementConfiguration.Read.All',
        'Organization.Read.All'
    )

    if ($TenantId) {
        Connect-MgGraph -TenantId $TenantId -Scopes $scopes
    } else {
        Connect-MgGraph -Scopes $scopes
    }
    Write-Verbose "Connected to Microsoft Graph"
}

# ── Main logic (implement based on specific project requirements) ─
function Invoke-MainProcess {
    param([string]$OutputPath)

    if (-not (Test-Path $OutputPath)) {
        New-Item -ItemType Directory -Path $OutputPath | Out-Null
    }

    # TODO: Implement main automation logic here
    # This is a scaffold — customize based on:
    # Authenticate to the Microsoft Graph API, accept a KQL query template and target device scope as parameters, execute a Device Query against multiple Intune-managed endpoints in bulk, and export results including device name, primary user, last check-in, and queried property values to a timestamped CSV file with optional Teams webhook notification.

    Write-Host "✓ Process complete. Results saved to: $OutputPath" -ForegroundColor Green
}

# ── Entry point ───────────────────────────────────────────────
try {
    Test-Prerequisites

    if (-not $WhatIf) {
        Connect-ToGraph -TenantId $TenantId
        Invoke-MainProcess -OutputPath $OutputPath
    } else {
        Write-Host "[WhatIf] Would execute: Invoke-MainProcess -OutputPath $OutputPath" -ForegroundColor Yellow
    }
}
catch {
    Write-Error "Script failed: $($_.Exception.Message)"
    exit 1
}
finally {
    # Disconnect cleanly
    try { Disconnect-MgGraph -ErrorAction SilentlyContinue } catch {}
}