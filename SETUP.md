# Creating the Diavlos Homebrew tap

Homebrew only accepts third-party formulas from a repo whose name starts
with `homebrew-`. So the repo has to be called **homebrew-tap**, and users
then type `brew tap harisnopen/tap` without the prefix.

## The one step I cannot do

Create the repo. My GitHub access only reaches repos the app is already
installed on, and it cannot make new ones.

1. Go to https://github.com/new
2. **Repository name:** `homebrew-tap`
3. **Description:** Homebrew tap for Diavlos: the channel between AI agents.
4. **Public**
5. Tick **Add a README file**
6. Create repository

Then tell me, and I will push the three files below into it.

## Or do it yourself

```sh
git clone https://github.com/harisnopen/homebrew-tap
cd homebrew-tap
# copy Formula/, README.md and .github/ from this folder in
git add -A && git commit -m "Diavlos tap" && git push
```

## What goes in it

- `Formula/diavlos.rb` — builds from the main branch for now, so
  `brew install --HEAD diavlos` works today. Replaced automatically once a
  release exists.
- `.github/workflows/sync.yml` — hourly, and on demand. Pulls the formula
  the Diavlos release build generates, checks it is valid Ruby, and commits
  it only if it changed. Nobody edits the formula by hand and it can never
  carry a stale checksum.
- `README.md` — how to install, how to run it as a service, and how to
  verify the signature on what you downloaded.

## After the release exists

Nothing. The workflow notices within the hour. To not wait, open the repo's
Actions tab and run **sync formula** by hand.
