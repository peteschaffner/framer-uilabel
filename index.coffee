
module.exports = class Label extends Layer
  constructor: (options={}) ->
    options.name ?= "Label"
    options.text ?= "Label Text"
    options.html ?= options.text
    options.lineHeight ?= "normal"
    options.backgroundColor ?= "transparent"
    options.lineClamp ?= 1

    # Create and style a temp text node and style it accordingly
    # in order to get the intrinsic width and height
    tempEl = document.createElement "div"
    tempEl.innerText = options.text
    applyStyles tempEl, options
    tempEl.style.display = "inline-block"
    tempEl.style.visibility = "hidden"
    document.body.appendChild tempEl

    super _.extend options,
      width: options.width or tempEl.offsetWidth
      height: options.height or tempEl.offsetHeight

    # Remove temp text node after creating our `Layer` object
    tempEl.remove()

    # Apply the text styling to the `Layer`
    applyStyles @, options

    # Handle label overflow (currently only string-end ellipsis support)
    # `@width + 1` is a hack to ensure we don't truncate prematurely
    labelText = @querySelector "div"
    labelText.style.width = "#{@width + 1}px"
    labelText.style.overflow = "hidden"
    labelText.style.textOverflow = "ellipsis"
    labelText.style.display = '-webkit-box'
    labelText.style.webkitLineClamp = options.lineClamp
    labelText.style.webkitBoxOrient = 'vertical'

    @on "change:width", -> labelText.style.width = "#{@width + 1}px"

  @define "text",
    get: ->
      @_text
    set: (text) ->
      @_text = text

applyStyles = (el, props) ->
  for prop, value of props
    unless Layer.prototype.hasOwnProperty prop
      el.style[prop] = value
