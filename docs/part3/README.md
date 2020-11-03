# Introducing TensorFlow

TensorFlow is open source library for Machine Learning. It provides a platform
that can be used to develop and train ML models and integrate them into applications.

The project also provides TensorFlow.js - a JavaScript library that makes it
easy to bring TensorFlow into browser and node applications.

Once you have a trained model, you can pass it some input data, such as an image,
and it will give you back the result of the model - such as identifying objects
in the image.

This is well suited to a Node-RED programming environment - where the underlying
complexity of the TensorFlow model can be hidden behind a node. As an low-code
developer, you just need to take care of passing in data to the model and then
doing something with the resulting output.

### Models

The key to creating a TensorFlow backed application is the model it uses. The model
is what transforms the input to the output. TensorFlow provides the tools for
developing and training custom models for specific applications. That's beyond the
scope of this workshop. Thankfully, they provide a number of pre-trained models
that can be used.

The one we're interested in is the [Object Detection](https://github.com/tensorflow/models/blob/master/research/object_detection/README.md) model - commonly refered to as `coco-ssd`.
Given an image in jpeg format, the model is capable of detecting 80 types of object, such as
`cat`, `tennis racket`, `banana` amongst many others.


## TensorFlow nodes

The Node-RED community have created a number of different nodes that wrap
TensorFlow.js. In this section we'll briefly look at three of the modules that are
available.

!!! warning
    Each of the modules takes a slightly different approach in how it handles its
    dependency on the TensorFlow libraries. Do not install all of the modules
    listed here at the same time as that will cause conflicts.



### `node-red-contrib-tfjs-coco-ssd`

The [node-red-contrib-tfjs-coco-ssd](https://flows.nodered.org/node/node-red-contrib-tfjs-coco-ssd) module provides a single node that wraps the Object Detection coco-ssd
model and is based on TensorFlow 1.x.

You pass the node an image as either a `Buffer` object, or a string containing the
filename to load. It will then return an array of the detected objects and optionally
the image with all of the detected objects highlighted and labelled.

This is the module we'll be using in the workshop.


### `node-red-contrib-tf-model`

The [node-red-contrib-tf-model](https://flows.nodered.org/node/node-red-contrib-tf-model)
module provides a node based on TensorFlow 2.x. It does not come with any model
built-in and you must provide the url of a model in JSON format. That makes it
useful if you have a custom model, or want to quickly switch what model it is using.
The downside is you either need to be online or host the model locally for the node
to access it.

This module has a [companion module](https://flows.nodered.org/node/node-red-contrib-tf-function)
that provides a custom Function node with the TensorFlow.js APIs exposed. This
has to be used to prepare the image data before it gets passed to the model node.

Whilst that allows for more flexible use the nodes, they do have a steeper
learning curve as you need to be familiar with the APIs.

This module also requires you to manually install the `@tensorflow/tfjs-node`
dependency before installing the node.

### `node-red-contrib-tensorflow`

The [node-red-contrib-tensorflow](https://flows.nodered.org/node/node-red-contrib-tensorflow)
module provides a set of nodes that each wraps a different pre-built model.
This includes the CoCo-SSD Object Detection model, as well as human pose and hand
pose detection.

## Next Steps

Having introduced some of the TensorFlow nodes available in Node-RED,
in this part of the workshop you will:

  - [Add TensorFlow to the Photo Booth dashboard](adding-tf.md)
  - [Display detected objects on the dashboard](display-objects.md)
  - [Allow the user to select what object to display](select-objects.md)
