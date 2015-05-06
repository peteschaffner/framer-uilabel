# Framer `UILabel` module

Create a layer that is the intrinsic size (height and width) of the text content
it contains. API and behavior ~inspired by iOS `UILabel`s.

## Usage
```shell
$ git clone https://github.com/peteschaffner/framercli.git myProject
$ cd myProject
$ npm install --save peteschaffner/framer-uilabel
```

app.coffee:
```coffeescript
UILabel = require "framer-uilabel"

myLabel = new UILabel
  text: "Hello World"
```
