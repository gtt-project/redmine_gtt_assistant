# Redmine GTT Assistant

Get some help from your "smart assistant".

- TBD

## Requirements

- Redmine >= 5.0.0

## Installation

To install Redmine GTT Assistant plugin, download or clone this repository in
your Redmine installation plugins directory!

```sh
cd path/to/plugin/directory
git clone https://github.com/gtt-project/redmine_gtt_assistant.git
```

Then run

```sh
bundle install
bundle exec rake redmine:plugins:migrate
```

After restarting Redmine, you should be able to see the Redmine GTT Assistant
plugin in the Plugins page.

More information on installing (and uninstalling) Redmine plugins can be found
[here](http://www.redmine.org/wiki/redmine/Plugins).

## How to use

- Ensure that the following environment variables are set:

```env
OPENAI_API_ACTIVE=true
OPENAI_API_ORG=your_org_id
OPENAI_API_KEY=your_secret_key
```

- Make sure REST web services is enabled: http://localhost:3000/settings?tab=api
- Configure the plugin in plugin settings.
- Enable the plugin in project settings.
- Adjust permissions for specific roles role.

## Contributing and Support

The GTT Project appreciates any [contributions](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md)!
Feel free to contact us for [reporting problems and support](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md).

## Version History

See [all releases](https://github.com/gtt-project/redmine_gtt_assistant/releases)
with release notes.

## Authors

- [Daniel Kastl](https://github.com/dkastl)
- ... [and others](https://github.com/gtt-project/redmine_gtt_assistant/graphs/contributors)

## LICENSE

This program is free software. See [LICENSE](LICENSE) for more information.
