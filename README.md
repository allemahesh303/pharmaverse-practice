# pharmaverse-practice

A low-stakes sandbox for practising the **GitHub workflow** — fork, clone, branch,
commit, push, pull request — while running a small piece of real R code against
[pharmaverse](https://pharmaverse.org) source data.

Nothing here is graded and nothing you do can break anything. Make a mess, delete
your fork, start again. That is the point.

This repo is the hands-on companion to the
[Pharmaverse Onboarding site](https://jeffreyad.github.io/pharmaverse-onboarding/).
If you have not set up R and a GitHub account yet, start with
[Getting Started](https://jeffreyad.github.io/pharmaverse-onboarding/steps.html).

---

## What you will do

1. **Fork** this repo to your own GitHub account.
2. **Open** your fork in [Posit Cloud](https://posit.cloud) — the same browser-based
   RStudio the [pharmaverse examples site](https://pharmaverse.github.io/examples/)
   assumes. Nothing to install.
3. **Branch**, then run [`R/explore_dm.R`](R/explore_dm.R) and confirm you see output.
4. **Edit** the `YOUR TURN` section of the script so it answers one more question
   about the data.
5. **Commit and push** your change to your fork.
6. **Open a pull request** back to this repo.

Steps 5 and 6 are the part worth practising. The R code is deliberately tiny.

---

## The Git workflow, step by step

### 1. Fork

Click **Fork** (top-right of this page on GitHub) and create the fork under your
own account. You now have `https://github.com/YOUR-USERNAME/pharmaverse-practice`.

### 2. Open your fork in Posit Cloud

[Posit Cloud](https://posit.cloud) runs RStudio in your browser — no local install,
and the same environment this guide recommends in
[Getting Started, Step 1](https://jeffreyad.github.io/pharmaverse-onboarding/steps.html).

1. Sign in at [posit.cloud](https://posit.cloud)
2. **New Project → New Project from Git Repository**
3. Paste **your fork's** URL: `https://github.com/YOUR-USERNAME/pharmaverse-practice.git`
4. Click **OK**. Posit Cloud clones your fork and opens it in RStudio.

> Check that the URL has *your* username in it, not `jeffreyad`. You can only push
> to your own fork.

> Coming from SAS: cloning is like copying a study area from a shared drive to your
> own working directory — except Git remembers where it came from and every change
> you make along the way.

<details>
<summary><strong>Prefer to work locally instead?</strong></summary>

You need [Git for Windows](https://git-scm.com/download/win) (or Git on macOS /
Linux) plus RStudio Desktop. GitHub Desktop is optional, is **not** supported on
Windows Server, and is not needed for this repo. Then, in a terminal or the
RStudio **Terminal** tab:

```bash
git clone https://github.com/YOUR-USERNAME/pharmaverse-practice.git
cd pharmaverse-practice
```

The rest of the steps below are the same; use the RStudio **Git pane** either way.
</details>

### 3. Connect Git to GitHub (one time)

To push from Posit Cloud you need a **Personal Access Token (PAT)** — GitHub does
not accept an account password. In the RStudio **Console**:

```r
usethis::create_github_token()   # opens GitHub in a new tab — generate, then copy the token
gitcreds::gitcreds_set()         # paste the token when prompted
```

`{usethis}` is already installed on Posit Cloud's default image. If Posit Cloud
asks for your GitHub username and password on a later push, run
`gitcreds::gitcreds_set()` again and paste the same token as the password.

### 4. Make a branch

Never work directly on `main`. In the RStudio **Git pane** (top-right), click the
**New Branch** button, name it for what you are doing — e.g.
`explore-sex-distribution` — and click **Create**.

<details>
<summary>Terminal equivalent</summary>

```bash
git checkout -b explore-sex-distribution
```
</details>

### 5. Install the packages (first time only)

In the RStudio **Console**:

```r
source("install_packages.R")
```

This installs [`{pharmaversesdtm}`](https://pharmaverse.github.io/pharmaversesdtm/)
(CDISC pilot SDTM data, straight from CRAN — no download to manage) and
[`{dplyr}`](https://dplyr.tidyverse.org/).

### 6. Run the script

```r
source("R/explore_dm.R")
```

You should see two small tables printed: subject counts by treatment arm, and an
age summary by arm. If you do, your environment works.

### 7. Do the exercise

Open [`R/explore_dm.R`](R/explore_dm.R) and find the block marked:

```r
# ============================  YOUR TURN  ============================
```

Follow the instructions there. It asks you to add one short `dplyr` summary of
the `dm` data. There is no single right answer.

### 8. Commit

In the **Git pane**: tick the checkbox next to `R/explore_dm.R`, click **Commit**,
type a message, and click **Commit** again.

```
Add sex distribution summary by treatment arm
```

Say what you did and why — not "changes" or "update".

### 9. Push to your fork

In the **Git pane**, click the green **Push** (up-arrow) button. Enter your GitHub
username and paste your PAT as the password if prompted.

### 10. Open a pull request

Go to your fork on GitHub. It will show a **Compare & pull request** button. Click
it, write a sentence about what you changed, and submit. Done — that is a complete
contribution loop.

You do not need this PR to be merged. Submitting it is the practice.

---

## The data

[`{pharmaversesdtm}`](https://pharmaverse.github.io/pharmaversesdtm/) bundles the
CDISC pilot SDTM datasets — `dm`, `ae`, `vs`, `lb`, `ex`, and more — as ordinary
R data frames. This repo uses `dm` (Demographics), the SDTM domain most SAS
programmers already know cold.

```r
library(pharmaversesdtm)
data("dm")
?dm        # variable-level help
```

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| `there is no package called 'pharmaversesdtm'` | Run `source("install_packages.R")` |
| `could not find function "%>%"` or `|>` errors | Update R to 4.1+ (`|>` is the native pipe); Posit Cloud is already current |
| Push rejected, or GitHub keeps asking for a password | Your PAT is not set. Run `gitcreds::gitcreds_set()` and paste the token (step 3). Background: [Happy Git, ch. 9](https://happygitwithr.com/https-pat) |
| No **Git pane** in Posit Cloud | The project was not created from Git. Delete it and redo step 2 with **New Project from Git Repository** |
| Pushed to the wrong place | You used this repo's URL instead of *your fork's*. Redo step 2 with `github.com/YOUR-USERNAME/...` |

---

## License

Code is released under the [MIT License](LICENSE). The pilot SDTM data is
distributed by CDISC via `{pharmaversesdtm}` under that package's own terms.
