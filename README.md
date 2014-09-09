# Create Sysadmin Cookbook

[![Apache License 2.0](http://img.shields.io/badge/license-apache%202.0-green.svg)](http://opensource.org/licenses/Apache-2.0)

A simple cookbook that searches the users databag for user with the
group `sysadmin`. These users are then created on the system and they
are added to the platform specifc sudo groups and get a sane default
shell.

## Requirements

The following cookbooks are required:

* users
* sudo

## Attributes

You may override the following attributes if you like:

* `['sysadmin']['default_sudo_groups']` an array holding the groups the user will be subscribed to.
* `['sysadmin']['shell']` the path to the shell.

### Attention!

The groups in `default_sudo_groups` will get their other entries
removed! Meaning that only the created users will remain in the given
groups!

## Usage

Just include `create-sysadmin` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[create-sysadmin]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

* Freely distributable and licensed under the [Apache 2.0 license](LICENSE).
* Copyright 2014 [Wegtam UG](http://www.wegtam.org)

### Authors:

* [@jan0sch](https://github.com/jan0sch)

