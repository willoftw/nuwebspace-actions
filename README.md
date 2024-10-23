# Bonus Status Badge
[![Deploy to NuWebspace](https://github.com/willoftw/nuwebspace-actions/actions/workflows/github-actions-deploy-nuwebspace.yml/badge.svg)](https://github.com/willoftw/nuwebspace-actions/actions/workflows/github-actions-deploy-nuwebspace.yml)

# Automatic Deployment to NuWebspace on Push
To enable automatic deployment, add `NUSPACE_USR` and `NUSPACE_PWD` to the repository secrets.

![NuWebspace Deployment Flow](images/image.png)

By default, this action is disabled. To enable it, remove the following line from `.github/github-actions-deploy-nuwebspace.yml`:

![Disable Line](images/image-1.png)
