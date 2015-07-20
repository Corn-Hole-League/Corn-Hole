Four models are included:
 - Leagues
 - Teams
 - Events
 - Results

-------------------

##### Leagues
 - available actions:
     - index
     - create
     - show
     - update
     - destroy
 - to create a new league:
     - `:name` is required
     - currently, no other attributes may be assigned

##### Teams
 - Teams are nested under Leagues
 - All relevant routes require `/leagues/:league_id`
 - available actions:
     - create
     - show
     - update
     - destroy
 - to create a new team:
     - `:league_id` is required. This parameter is determined by the route; should not need to be selected by user.
     - `:name` is required. Value must be a string.
     - `:ranking` can be assigned, but will default to 0 if omitted. Value must be an integer.
     - `:logo` may be assigned, but is not required. Value must be a string.
     - `:location` may be assigned, but is not required. Value must be a string.

##### Events
 - available actions:
     - index
     - create
     - show
     - update
     - destroy
 - to create a new event:
     - `:league_id` is required. This will not be determined automatically; host league must be chosen via some user-selection.
     - `:name` is required. Value must be a string.
     - `:location` is required. Value must be a string.
     - `:occurs_on` is required. Value must be a date.
     - `:starts_at` is required. Value must be a string.

##### Results
 - available actions must be performed through either an Event or Team view.
     - create - a Team may join an Event, a new Result will be created.
     - update - `:score` may be added to a Result through an Event. Value must be an integer. Updating the `:score` attribute will also update the `:ranking` attribute of the required Team.

---------------------------------------

### All available routes:

```
Prefix            Verb   URI Pattern                                 Controller#Action
api_league_teams  GET    /api/leagues/:league_id/teams(.:format)     api/teams#index {:format=>"json"}
                  POST   /api/leagues/:league_id/teams(.:format)     api/teams#create {:format=>"json"}
 api_league_team  GET    /api/leagues/:league_id/teams/:id(.:format) api/teams#show {:format=>"json"}
                  PATCH  /api/leagues/:league_id/teams/:id(.:format) api/teams#update {:format=>"json"}
                  PUT    /api/leagues/:league_id/teams/:id(.:format) api/teams#update {:format=>"json"}
                  DELETE /api/leagues/:league_id/teams/:id(.:format) api/teams#destroy {:format=>"json"}
     api_leagues  GET    /api/leagues(.:format)                      api/leagues#index {:format=>"json"}
                  POST   /api/leagues(.:format)                      api/leagues#create {:format=>"json"}
      api_league  GET    /api/leagues/:id(.:format)                  api/leagues#show {:format=>"json"}
                  PATCH  /api/leagues/:id(.:format)                  api/leagues#update {:format=>"json"}
                  PUT    /api/leagues/:id(.:format)                  api/leagues#update {:format=>"json"}
                  DELETE /api/leagues/:id(.:format)                  api/leagues#destroy {:format=>"json"}
      api_events  GET    /api/events(.:format)                       api/events#index {:format=>"json"}
                  POST   /api/events(.:format)                       api/events#create {:format=>"json"}
       api_event  GET    /api/events/:id(.:format)                   api/events#show {:format=>"json"}
                  PATCH  /api/events/:id(.:format)                   api/events#update {:format=>"json"}
                  PUT    /api/events/:id(.:format)                   api/events#update {:format=>"json"}
                  DELETE /api/events/:id(.:format)                   api/events#destroy {:format=>"json"}
```
