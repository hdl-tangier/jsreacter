DOM = React.DOM


FormInputWithLabel = React.createClass
  getDefaultProps: ->
    elementType: "input"
    inputType:   "text"
  displayName: "FormInputWithLabel"
  render: ->
    DOM.div
      className: "form-group"
      DOM.label
        htmlFor: @props.id
        className: "col-lg-2 control-label"
        @props.labelText
      DOM.div
        className: "col-lg-10"
        DOM[@props.elementType]
          className: "form-control"
          placeholder: @props.placeholder
          id: @props.id
          value: @props.value
          onChange: @props.onChange
          type: @tagType()
  tagType: -> {
    "input":    @props.inputType,
    "textarea": null,
  }[@props.elementType]

formInputWithLabel = React.createFactory(FormInputWithLabel)

window.CreateNewMeetupForm = React.createClass
  displayName: "CreateNewMeetupForm"
  getInitialState: ->
    {
      meetup: {
        title: "",
        description: "",
      }
    }

  titleChanged: (event) ->
    @state.meetup.title = event.target.value
    @forceUpdate()

  descriptionChanged: (event) ->
    @state.meetup.description = event.target.value
    @forceUpdate()

  formSubmitted: (event) ->
    event.preventDefault()

    $.ajax
      url: "/meetups.json"
      type: "POST"
      dataType: "JSON"
      contentType: "application/json"
      processData: false
      data: JSON.stringify({meetup: @state.meetup})

  render: ->
    DOM.form
      onSubmit: @formSubmitted
      className: "form-horizontal"
      DOM.fieldset null,
        DOM.legend null, "New Meetup"

        formInputWithLabel
          id: "title"
          value: @state.meetup.title
          onChange: @titleChanged
          placeholder: "Meetup title"
          labelText: "Title"

        formInputWithLabel
          id: "description"
          value: @state.meetup.description
          onChange: @descriptionChanged
          placeholder: "Meetup description"
          labelText: "Description"
          elementType: "textarea"

        DOM.div
          className: "form-group"
          DOM.div
            className: "col-lg-10 col-lg-offset-2"
            DOM.button
              type: "submit"
              className: "btn btn-primary"
              "Save"

createNewMeetupForm = React.createFactory(CreateNewMeetupForm)