# GitHub Action - Publish Gem to Rubygems

This is a GitHub Action written to streamline the Ruby gem publication process.  The action sets the Gem Credentials from `GITHUB_TOKEN` and `RUBYGEMS_API_KEY`secrets, and then runs `rake release` in your project root.  You can override this command by setting `RELEASE_COMMAND` environment variable to the script that creates and publishes (this is usually only the case when a repository hosts multiple gems together).

# Secrets Needed

`GITHUB_TOKEN` - Bundler needs this to create tags on your repo for the release
`RUBYGEMS_API_KEY` - The Rubygems API Key for an Owner of the Gem you wish to publish.  You can find your API Key by looking in `~/.gem/credentials` or using the [Rubygems API](https://guides.rubygems.org/rubygems-org-api/#misc-methods)

# Environment Variables

`RELEASE_COMMAND` - By default, this will invoke `rake release` to build and publish the gem to Rubygems.  Set this environment variable if you have a custom release command to be invoked

# Example

```yml
name: Publish Gem

on:
  push:
    branches:
      - "*"
    tags:
      - v*
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1

      - name: Release Gem
        if: contains(github.ref, 'refs/tags/v')
        uses: cadwallion/publish-rubygems-action@master
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
          RUBYGEMS_API_KEY: ${{secrets.RUBYGEMS_API_KEY}}
          RELEASE_COMMAND: rake release
```
