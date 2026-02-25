## [1.0.5] - 2026-02-25

### 📚 Documentation
- Added `docs/architecture.md` — architecture guidance and operational checklist
- Added `docs/io.md` — full inputs/outputs reference table

### 💡 Examples
- Added `_examples/basic/` — minimal usage example
- Added `_examples/terragrunt/` — Terragrunt example with DO Spaces remote state and OpenTofu support

### 👷 CI/CD & GitHub
- Added `.github/ISSUE_TEMPLATE/` — bug report, feature request, and config templates
- Added `SECURITY.md` — vulnerability reporting policy
- Standardized all workflow SHA pins and removed `workflows.old/`
- Updated `dependabot.yml` to track `_examples/basic/`
- Upgraded `.pre-commit-config.yaml` to gruntwork-io/pre-commit v0.1.23 and pre-commit-hooks v4.5.0

## [1.0.3] - 2026-02-06

### Changes
- 🐛 fix: update tf-checks workflow to match available examples
- ⬆️ upgrade: update examples to use provider >= 2.70.0
- 📚 Add comprehensive CONTRIBUTING.md
- ⬆️ Upgrade provider & standardize workflows
- 📝 Update CHANGELOG for v1.0.2
- chore: update Terraform version requirement to >= 1.5.4
- Merge pull request #36 from terraform-do-modules/dependabot/github_actions/clouddrove/github-shared-workflows/dot-github/workflows/tf-checks.yml-1.4.1
- build(deps): bump clouddrove/github-shared-workflows/.github/workflows/tf-checks.yml
- Merge pull request #35 from terraform-do-modules/fix/workflow
- fix: removed unused variables

# Changelog
All notable changes to this project will be documented in this file.


## [1.0.2] - 2026-02-06

### ⬆️ Dependencies
- Updated Terraform version requirement to >= 1.5.4

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2023-07-25
### :bug: Bug Fixes
- [`5471e8a`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/5471e8a7619362103639096dc1006acb6161c1ba) - update module structure and GitHub workflows *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`80443db`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/80443db9e1ec3880b885065ddafe53356f1b20bb) - update firewall name format *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`12e7c33`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/12e7c3380b2746698232f6fa02901c38051ea99f) - update firewall name format *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`48248d0`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/48248d0652d3db8abe4a3b28522aa5bd6309f5f2) - firewall inbound rules make dynamic *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`de9df63`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/de9df63fff16900a092df03fba7911cc1010d762) - firewall inbound rules make dynamic *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`623114b`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/623114b0bba878529268625f8dc57087044d41e6) - update license name in readme.yaml *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`ca5d8bc`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/ca5d8bcefae9a9ea0234790b80e6bcfcd0d3fcac) - update user_data variable *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`c3ee568`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/c3ee568b659d44e9f2a6e9c91a2334e3dd73174b) - update vpc and labels module tag and update readme.yml file *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`41eb5e1`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/41eb5e1518f37a0fe567db8b25e02a5d6c65107b) - update dependabot.yml file *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*
- [`59f8a65`](https://github.com/terraform-do-modules/terraform-digitalocean-droplet/commit/59f8a657c4e3df574adec95573e1a0e64c068398) - update dependabot.yml file *(commit by [@themaheshyadav](https://github.com/themaheshyadav))*


[1.0.0]: https://github.com/terraform-do-modules/terraform-digitalocean-droplet/compare/0.15.0...1.0.0