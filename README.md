# latex-builder

This repository is a showcase for

- [ ] Manually generate pdf and diff using Docker
- [ ] Automatically generate pdf and diff using GitHub Workflow
- [ ] Automatically send pdf and diff per Email using SendGrid
   - [ ] Email body uses PullRequest body

pdf and diff will be called _artifacts_.

## Manually build artifacts

Artifacts will be placed in /out folder.

Note: if your latex repository is a private repository, then run docker-compose build with PAT as build argument when facing the following error _fatal: could not read Username for 'https://github.com': No such device or address_
Reason: for creating the diff, the master branch has to be cloned

```bash
docker-compose build --build-arg PAT=<Personal Access Token>
docker-compose up
```

When running _docker-compose up_ and the following error occurs _standard_init_linux.go:219: exec user process caused: no such file or directory_, check the end of line sequence of the __entrypoint.sh__ file. It should be set to __LF__ instead of __CRLF__.

## Useful links

### Docker

- https://vsupalov.com/docker-arg-vs-env/

### GitHub Action / Workflow

- https://docs.github.com/en/free-pro-team@latest/actions/reference/authentication-in-a-workflow
- https://docs.github.com/en/free-pro-team@latest/actions/reference/environment-variables
- https://github.com/actions/cache
- https://docs.github.com/en/actions/reference/environment-variables
- https://docs.github.com/en/actions/guides/publishing-docker-images

#### Test GitHub Workflow locally

- https://github.com/nektos/act

When running act and the following error occurs __standard_init_linux.go:219: exec user process caused: no such file or directory__, check the end of line sequence of corresponding workflow / action / entrypoint.sh files. They should be set to __LF__ instead of __CRLF__.

Check out the [.actrc](.actrc) file for applied default parameters.

Note: Artifacts are not supported atm.

Run __act__ without the _.actrc_ file

```bash
 act -s PAT=<Personal Access Token>
```
