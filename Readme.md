# Codefresh pypi-publish Plugin

Codefresh plugin `release-to-pypi` can be used to publish images to pypi (or a private pip repository) using [twine](https://pypi.org/project/twine/).

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

- **optional** `TWINE_REPOSITORY_URL` - repository to upload to
- **optional** `TWINE_USERNAME` - username to authenticate to the repository as
- **optional** `TWINE_PASSWORD` - password to authenticate to the repository as

## How to use

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