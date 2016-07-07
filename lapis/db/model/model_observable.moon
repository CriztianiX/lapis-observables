Event = require("lapis.event")
EventListener = require("lapis.event.event_listener")
EventManager = require("lapis.event.event_manager")
Model = require("lapis.db.model").Model

return class ModelObservable extends Model
  @implemented_events: =>
    return { ["Model.after_create"]: "after_create" }

  @create: (...) =>
    Model.create @, ...
    event = Event("Model.after_create", @)
    @get_event_manager!\dispatch(event)

  after_create: =>
    true

  @get_event_manager: =>
    unless @_event_manager
      @_event_manager = EventManager!
      @_event_manager\attach @
    @_event_manager

  @_event_manager = false