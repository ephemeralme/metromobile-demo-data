# Switch Metromobile Cursor demo mode: raw | rules | skills
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("raw", "rules", "skills")]
    [string]$Mode
)

$Root = Split-Path $PSScriptRoot -Parent

$ModesDir = Join-Path $Root "_cursor_modes"
$ActiveCursor = Join-Path $Root ".cursor"
$BackupCursor = Join-Path $Root ".cursor.demo-backup"

Write-Host "Metromobile demo mode: $Mode" -ForegroundColor Cyan
Write-Host "Project root: $Root"

# Remove active .cursor
if (Test-Path $ActiveCursor) {
    Remove-Item -Recurse -Force $ActiveCursor
}

$Source = Join-Path (Join-Path $ModesDir $Mode) ".cursor"
if ($Mode -eq "raw") {
    Write-Host ""
    Write-Host "[raw] No rules or skills — agent runs on prompts + CSVs only." -ForegroundColor Yellow
}
else {
    if (-not (Test-Path $Source)) {
        Write-Error "Mode template not found: $Source"
        exit 1
    }
    Copy-Item -Recurse -Force $Source $ActiveCursor
    $ruleCount = (Get-ChildItem (Join-Path $ActiveCursor "rules") -Filter "*.mdc" -ErrorAction SilentlyContinue).Count
    $skillDirs = Get-ChildItem (Join-Path $ActiveCursor "skills") -Directory -ErrorAction SilentlyContinue
    Write-Host ""
    Write-Host "[$Mode] Installed .cursor/  Rules: $ruleCount  Skills: $($skillDirs.Count)" -ForegroundColor Green
}

Write-Host ""
Write-Host ">>> Reload Cursor window (Ctrl+Shift+P -> Developer: Reload Window) before running prompts." -ForegroundColor Magenta
