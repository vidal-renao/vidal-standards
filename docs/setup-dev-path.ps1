# VIDAL ECOSYSTEM - Windows developer PATH setup for VS Code and GitHub CLI.
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$Machine
)

$ErrorActionPreference = 'Stop'

$target = if ($Machine) { 'Machine' } else { 'User' }
$requiredPaths = @(
    "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin",
    "$env:ProgramFiles\GitHub CLI"
) | Where-Object { $_ -and (Test-Path -LiteralPath $_) }

if ($requiredPaths.Count -eq 0) {
    Write-Warning 'No VS Code CLI or GitHub CLI folders were found. Install VS Code and GitHub CLI, then rerun this script.'
    exit 0
}

$currentPath = [Environment]::GetEnvironmentVariable('Path', $target)
$pathParts = @()

if ($currentPath) {
    $pathParts = $currentPath -split ';' | Where-Object { $_.Trim().Length -gt 0 }
}

$changed = $false

foreach ($path in $requiredPaths) {
    $alreadyPresent = $pathParts | Where-Object { $_.TrimEnd('\') -ieq $path.TrimEnd('\') }

    if (-not $alreadyPresent) {
        $pathParts += $path
        $changed = $true
        Write-Host "Added to $target PATH: $path"
    }
    else {
        Write-Host "Already in $target PATH: $path"
    }
}

if ($changed) {
    $newPath = ($pathParts | Select-Object -Unique) -join ';'

    if ($PSCmdlet.ShouldProcess("$target PATH", 'Update environment variable')) {
        [Environment]::SetEnvironmentVariable('Path', $newPath, $target)
        Write-Host 'PATH updated. Open a new terminal before using code or gh.'
    }
}
else {
    Write-Host 'PATH already satisfies the VIDAL developer standard.'
}

Write-Host 'Verification commands:'
Write-Host '  code --version'
Write-Host '  gh --version'
