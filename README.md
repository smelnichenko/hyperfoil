# Hyperfoil

Custom Hyperfoil load-tester image with the MinIO `mc` client preinstalled, used to upload run reports to the cluster MinIO bucket.

## Base image

`quay.io/hyperfoil/hyperfoil:0.28.0` + MinIO `mc`.

## Usage

Built by Woodpecker CI and pushed to `git.pmon.dev/schnappy/hyperfoil`. The platform Helm chart deploys it as both a CronJob (`hyperfoil-load-cronjob`) and an on-demand Job (`hyperfoil-stress-job`), both driven from configmaps in `platform/helm/schnappy/templates/`.

Run scenarios from the ops repo:

```bash
task test:hyperfoil:load    # baseline load
task test:hyperfoil:stress  # stress
task test:hyperfoil:spike   # spike
task test:hyperfoil:soak    # soak
```

See `project_microservice_cicd` and Plan 058 (custom Hyperfoil image) for context.
