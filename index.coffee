
module.exports = class Label extends Layer
  constructor: (options={}) ->
    options.name ?= "Label"
    options.text ?= "Label Text"
    options.html ?= options.text
    options.lineHeight ?= "normal"
    options.whiteSpace ?= "nowrap"
    options.backgroundColor ?= "transparent"

    # Create and style a temp text node and style it accordingly
    # in order to get the intrinsic width and height
    tempEl = document.createElement "div"
    tempEl.innerText = options.text
    applyStyles tempEl, options
    tempEl.style.display = "inline-block"
    tempEl.style.visibility = "hidden"
    document.body.appendChild tempEl

    super _.extend options,
      width: tempEl.offsetWidth
      height: tempEl.offsetHeight

    # Remove temp text node after creating our `Layer` object
    tempEl.remove()

    # Apply the text styling to the `Layer`
    applyStyles @, options

  @define "text",
    get: ->
      @_text
    set: (text) ->
      @_text = text

applyStyles = (el, props) ->
  for prop, value of props
    unless Layer.prototype.hasOwnProperty prop
      el.style[prop] = value
