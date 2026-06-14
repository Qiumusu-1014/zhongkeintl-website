# Zhongke International Website

Static GitHub Pages website for Zhongke International.

## Domain

Primary domain:

```text
zhongkeintl.com
```

The `CNAME` file is included for GitHub Pages.

## Publish With GitHub CLI

After logging in with GitHub CLI:

```powershell
gh auth login
gh repo create zhongkeintl-website --public --source . --remote origin --push
```

Then open the repository on GitHub:

```text
Settings -> Pages -> Deploy from a branch -> main -> / (root)
```

Custom domain:

```text
zhongkeintl.com
```

Enable HTTPS after DNS has propagated.
