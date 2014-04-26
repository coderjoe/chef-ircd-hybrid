# ircd-hybrid cookbook

[![Build Status](https://travis-ci.org/coderjoe/chef-ircd-hybrid.svg?branch=master)](https://travis-ci.org/coderjoe/chef-ircd-hybrid)

A cookbook designed to build and install ircd-hybrid from the official repository.
Due to the complex nature of ircd configuration only the default configuration is installed.
Configuration of ircd is left as an exercise for any recipes using this cookbook.

## Supported Platforms

This cookbook has only tested under:
 - Ubuntu 12.04
 - Ubuntu 13.10
 - Ubuntu 14.04
 - Debian 7.4

It may work on other Unix like operating systems, but your mileage may differ.

## Attributes

| Key                                | Type    | Default                           | Description                                                          |
|------------------------------------|---------|-----------------------------------|----------------------------------------------------------------------|
| ['ircd']['user']                   | String  | "ircd"                            | The user to create that ircd will be installed as                    |
| ['ircd']['group']                  | String  | "ircd"                            | The group to be created that ircd will be installed as               |
| ['ircd']['directory']              | String  | "/usr/local/ircd"                 | The install directory "/usr/local/ircd"                              |
| ['ircd']['repository']['uri']      | String  | ircd-hybrid subversion repo       | The ircd-hybrid source repository                                    |
| ['ircd']['repository']['revision'] | String  | "HEAD"                            | The repository revision to check out                                 |
| ['ircd']['source']['directory']    | String  | "/usr/local/ircd/ircd-hybrid-src" | The source code directory                                            |
| ['ircd']['source']['openssl']      | Boolean | false                             | Build ircd-hybrid with openssl support                               |
| ['ircd']['source']['openssl_dir']  | Boolean | nil                               | The openssl directory for building (use only if autodetection fails) |

## Usage

### ircd-hybrid::default

Include `ircd-hybrid` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ircd-hybrid::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Joseph Bauser (coderjoe@coderjoe.net)
