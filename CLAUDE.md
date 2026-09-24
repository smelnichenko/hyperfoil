# Hyperfoil

Custom Hyperfoil load-tester image. Adds `rclone` to the upstream image so runs can upload reports to the cluster's S3 gateway (versitygw) bucket. (It was MinIO's `mc` until 2026-09-24, when MinIO withdrew its downloads.)

## Image

`git.pmon.dev/schnappy/hyperfoil:latest`

Base: `quay.io/hyperfoil/hyperfoil:0.28.0` + the `rclone` RPM from its GitHub release, pinned by version and SHA-256.

## Build

Woodpecker CD builds and pushes on every push to `main` (`.woodpecker/cd.yaml`, Kaniko). No tests — just `docker build`.

## Where it runs

Deployed by the platform `schnappy` chart as:

- `hyperfoil-load-cronjob` — recurring baseline load
- `hyperfoil-stress-job` — on-demand stress / spike / soak

Scenarios live in configmaps (`hyperfoil-load-configmap`, `hyperfoil-stress-configmap`) in the `schnappy/platform` repo.

## Running scenarios from ops

```bash
task test:hyperfoil:load
task test:hyperfoil:stress
task test:hyperfoil:spike
task test:hyperfoil:soak
```

## Full Infrastructure Docs

See `schnappy/ops` repo `CLAUDE.md`.
