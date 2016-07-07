```moon
ModelObservable = require("lapis.db.model.model_observable")
class MyModel extends ModelObservable
  after_create: =>
    @say_created_success!

  say_created_success: =>
    print("after create executed...")
```