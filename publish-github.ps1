param(
  [string]$RepoName = "zhongkeintl-website",
  [string]$Visibility = "public"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw "GitHub CLI is not installed. Install it first, then run this script again."
}

gh auth status
if ($LASTEXITCODE -ne 0) {
  throw "GitHub CLI is not logged in. Run: gh auth login"
}

if (-not (git rev-parse --is-inside-work-tree 2>$null)) {
  throw "Run this script inside the website repository folder."
}

$remote = git remote get-url origin 2>$null
if (-not $remote) {
  $visibilityFlag = "--$Visibility"
  gh repo create $RepoName $visibilityFlag --source . --remote origin --push
} else {
  git push -u origin main
}

$repoFullName = gh repo view --json nameWithOwner --jq ".nameWithOwner"

try {
  gh api "repos/$repoFullName/pages" `
    -X POST `
    -f "source[branch]=main" `
    -f "source[path]=/" `
    | Out-Null
} catch {
  gh api "repos/$repoFullName/pages" `
    -X PUT `
    -f "source[branch]=main" `
    -f "source[path]=/" `
    | Out-Null
}

Write-Host "Repository published: https://github.com/$repoFullName"
Write-Host "GitHub Pages source set to main / root."
Write-Host "In GitHub Settings -> Pages, confirm custom domain: zhongkeintl.com, then enable HTTPS after DNS is ready."
