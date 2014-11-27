# Form Verification

This gem allows simple form protection against robots for Rails.

It works by adding a token to your form, filling it with javascript,
and verifying its presence in a `before_action` hook in your controller.

## Installation

Add the gem to your Gemfile and bundle :

```ruby
gem 'form_verification', github: 'glyph-fr/form_verification'
```

## Usage

This lib is made of two parts, one for the front and one for the server.

### Javascript

Add to your js manifest file one of the following :

1) You have a classic app that binds `$(document).ready` :

```javascript
//= require form_verification/standard
```

2) You use Turbolinks

```javascript
//= require form_verification/turbolinks
```

### Server side

In your form, add `form.verification_token_field` :

```erb
<%= form_for @model_name do |form| %>
  <%= form.verification_token_field %>
<% end %>
```

Then in your controller, add :

```ruby
class ModelsController < ApplicationController
  verify_form_token :model_name, only: [:create]

  def create
    # Nothing to add here
  end
end
```

If the token is not present in the form, a
`FormVerification::VerificationTokenNotFound` error will be raise.

You can catch it with a `rescue_from` hook in your controller, or in your
`ApplicationController`. You can for example, do the following :

```ruby
class ApplicationController < ActionController::Base
  rescue_from FormVerification::VerificationTokenNotFound, with: :token_not_found

  def token_not_found
    flash[:error] = "Verification token not found"
    redirect_to root_path
  end
end
```

## Licence

This project rocks and uses MIT-LICENSE.
