return class Event
  new: (name, subject, data) =>
    @_data = data
    @_name = name
    @_subject = subject
  name: =>
    @_name

  subject: =>
    @_subject

  data: =>
    @_data