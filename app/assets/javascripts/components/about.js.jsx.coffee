{div, h3, img, p} = React.DOM

@About = React.createClass
  render: ->
    div { className: 'center' },
      h3 {}, 'Обо мне'
      img src: @.props.avatar_url
      p {}, @.props.info
