# Codefresh pypi-publish Plugin

Codefresh plugin `release-to-pypi` can be used to publish images to pypi (or a private pip repository) using [twine](https://pypi.org/project/twine/).
If necessary, [register](https://pypi.org/account/register/) for an account on pypi to obtain the username and password credentials to provide.

## Usage

Set required and optional environment variable and add the following step to your Codefresh pipeline:

```yaml
---
version: '1.0'

steps:

  ...
     deploy_to_pypi:
      title: Publishing To PyPi
      image: codefresh/pypi-publish
      commands:
  ...

```

## Environment Variables

- **required** `TWINE_USERNAME` - username to authenticate to the repository as
- **required** `TWINE_PASSWORD` - password to authenticate to the repository as
- **optional** `TWINE_REPOSITORY_URL` - repository to upload to

## How to build and test

Build the image with the following command:

```bash
docker build -t plugins/pypi-publish .
```

Then in the directory which contains the separately packaged dist to upload;

```bash
docker run -it \
-e TWINE_REPOSITORY_URL=https://private-pypi.example.com/ \
-e TWINE_USERNAME=write_user \
-e TWINE_PASSWORD=password \
-v $(pwd)/dist:/dist \
plugins/pypi-publish
```