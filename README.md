# Framer `UILabel` module

Create a layer that is the intrinsic size (height and width) of the text content
it contains. API and behavior ~inspired by iOS `UILabel`s.

## Usage
```shell
$ framer myProject &
$ cd myProject
$ npm install --save peteschaffner/framer-uilabel
```

index.js:
```javascript
var UILabel = require('framer-uilabel')

var myLabel = new UILabel({ text: 'Hello World' })
```
