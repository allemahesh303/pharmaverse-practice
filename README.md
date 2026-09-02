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
2. **Clone** your fork to wherever you run R (your laptop, Posit Cloud, Codespaces).
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

### 2. Clone your fork

In a terminal (or the RStudio **Terminal** tab, or **File → New Project → Version
Control → Git** in RStudio):

```bash
git clone https://github.com/YOUR-USERNAME/pharmaverse-practice.git
cd pharmaverse-practice
```

> Coming from SAS: cloning is like copying a study area from a shared drive to
> your own working directory — except Git remembers where it came from and every
> change you make along the way.

### 3. Make a branch

Never work directly on `main`. Create a branch named for what you are doing:

```bash
git checkout -b explore-sex-distribution
```

### 4. Install the packages (first time only)

Open R in the project folder and run:

```r
source("install_packages.R")
```

This installs [`{pharmaversesdtm}`](https://pharmaverse.github.io/pharmaversesdtm/)
(CDISC pilot SDTM data, straight from CRAN — no download to manage) and
[`{dplyr}`](https://dplyr.tidyverse.org/).

### 5. Run the script

```r
source("R/explore_dm.R")
```

You should see two small tables printed: subject counts by treatment arm, and an
age summary by arm. If you do, your environment works.

### 6. Do the exercise

Open [`R/explore_dm.R`](R/explore_dm.R) and find the block marked:

```r
# ============================  YOUR TURN  ============================
```

Follow the instructions there. It asks you to add one short `dplyr` summary of
the `dm` data. There is no single right answer.

### 7. Commit

```bash
git add R/explore_dm.R
git commit -m "Add sex distribution summary by treatment arm"
```

End the message with what you did and why, not "changes" or "update".

### 8. Push to your fork

```bash
git push -u origin explore-sex-distribution
```

### 9. Open a pull request

Go to your fork on GitHub. It will show a **Compare & pull request** button.
Click it, write a sentence about what you changed, and submit. Done — that is a
complete contribution loop.

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
| `could not find function "%>%"` or `|>` errors | Update R to 4.1+ (`|>` is the native pipe) |
| `git push` asks for a password and rejects it | GitHub needs a Personal Access Token, not your password — see [Happy Git, ch. 9](https://happygitwithr.com/https-pat) |
| Pushed to the wrong place | You cloned this repo instead of *your fork*. Re-clone from `github.com/YOUR-USERNAME/...` |

---

## License

Code is released under the [MIT License](LICENSE). The pilot SDTM data is
distributed by CDISC via `{pharmaversesdtm}` under that package's own terms.
