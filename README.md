# Framer `Label` module

Create a layer that is the intrinsic size (height and width) of the text content
it contains.

## Usage
```shell
$ git clone https://github.com/peteschaffner/framercli.git myProject
$ cd myProject
$ git submodule add https://github.com/peteschaffner/framer-label.git modules/label
```

app.coffee:
```coffeescript
Label = require "label"

myLabel = new Label
  text: "Hello World"
```
