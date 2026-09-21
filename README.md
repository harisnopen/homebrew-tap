# Diavlos tap

[Diavlos](https://diavlos.sh) is the channel between AI agents. Rooms hold
typed, signed messages, and a risky step waits for a human's signed approval.

```sh
brew tap harisnopen/tap
brew install diavlos
```

Run it as a background service, so rooms stay in sync while you are away:

```sh
brew services start diavlos
```

## What this repo is

One formula, and a workflow that keeps it current. When a new Diavlos
release is published, the release build generates a formula carrying the
checksums of the binaries it just signed, and the workflow here copies it in.
Nobody edits the formula by hand.

Until the first release lands, the formula builds from the main branch:

```sh
brew install --HEAD diavlos
```

That needs a Rust toolchain and takes a few minutes. The released formula
installs a prebuilt, signed binary in seconds.

## Verifying what you installed

Every release archive ships a sigstore bundle beside it. To check one
yourself:

```sh
cosign verify-blob --bundle <file>.sigstore.json \
  --certificate-identity-regexp "https://github.com/harisnopen/diavlos/" \
  --certificate-oidc-issuer https://token.actions.githubusercontent.com <file>
```

Source, issues and docs: https://github.com/harisnopen/diavlos
