$ ->
  linkClicked = (event) ->
    console.log(event)
    console.log(event.target)
    alert("you clicked me")

  virtualDom = React.DOM.div(
    {id: "render-me-react-please"},
    React.DOM.a(
      {href:"javascript:void(0)", onClick: linkClicked, id: "do-nothing-link"},
      "Click me"
    )
  )

  ReactDOM.render(
    virtualDom,
    document.getElementById("start")
  )