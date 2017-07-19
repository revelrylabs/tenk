Master build status: ![TravisCI Build Status](https://travis-ci.org/revelrylabs/tenk.svg?branch=master)

# Tenk

Tenk is an API wrapper Ruby gem for the 10,000ft Plans API. See
https://github.com/10Kft/10kft-api for the API documentation.

## Installation

Add to your Gemfile:

```ruby
gem 'tenk'
```

## Configuration

```ruby

Tenk::Client.new(
  token: 'DEADBEEF', # Your 10k API key
  api_base: 'https://api.10000ft.com/api/v1', # Defaults to live API, but you can switch to sandbox
  logger: Logger.new, # Defaults to the Rails logger if in a Rails app, or a new logger otherwise
)
```

## Usage Example

```ruby
client = Tenk.new token: 'YOUR-API-TOKEN'

client.projects.list
```

The resources at the root of the API (Approvals, Bill Rates, Placeholder Resources, Projects, Time Entries, and Users)
can bet accessed directly off of the client like:

```ruby
client.approvals.get(approval_id)
client.bill_rates.get(bill_rate_id)
# etc
```

Resources nested under a Project or User can be accessed like so:

```ruby
client.projects.phases.list(project_id)
client.projects.phases.get(project_id, phase_id)

# or

client.users.assignments.list(user_id)

# etc
```

Most resources have `#list`, `#get`, `#create`, and `#update` methods. Assignments
also have a `#delete` method. Tags have `#list`, `#add`, and `#remove` methods
and tags are automatically created when needed to attach to a user or project.

Complete documentation is available here: http://www.rubydoc.info/github/revelrylabs/tenk/master

## Current Limitations

The following resources are currently unavailable or limited due to limitations
in the staging API that make them difficult to test:

- Placeholder Resources
- Custom Fields
- Creating or Updating Approvals
- Listing or Creating Bill Rates

## Contributing

Bug reports and pull requests are welcome. See CONTRIBUTING.md for instructions
on contributing pull requests to the project.

Everyone is welcome to participate in the project. We expect contributors to
adhere the Contributor Covenant Code of Conduct (see CODE_OF_CONDUCT.md).
