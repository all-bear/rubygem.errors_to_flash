# Errors To Flash

Add all errors of model to flash[:error].

Example:
```ruby
class UserController < ApplicationController
  # errors_to_flash :fields => [:user], :except => [:create] # fields - name of object variables (@user)
  # errors_to_flash :fields => [:user] # fields - name of object variables (@user)
  # errors_to_flash :fields => [:user], :only => [:create, :new] # fields - name of object variables (@user)
end
```

