return class EventManager
  @instance = false

  @get_instance: =>
    unless @instance
      @instance = EventManager!
    @instance

  new: =>
    @listeners = {}

  attach: (o) =>
    if o.implemented_events
      @_attach_subscribers(o)


  dispatch: (event) =>
    if type(event) == "string"
      -- ToDo
      event = event

    listeners = @listeners[event\name!]
    unless listeners
      return
    
    for _,listener in pairs(listeners)
      o = listener.o
      method = listener.method
      if o[method]
        method = o[method]
        method(o)

  -- Private methods
  _attach_subscribers: (o) =>
    for k,method in pairs(o.implemented_events!)
      unless @listeners[k]
        @listeners[k] = {}

      idx = #@listeners[k] + 1
      @listeners[k][idx] = :o, :method
      

