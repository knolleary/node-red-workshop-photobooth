# Resources

Here are some useful links and information to help you to continue to explore Node-RED
and TensorFlow.js.

## Node-RED Resources

 - You can find a complete copy of the Node-RED project this workshop creates
   [here](https://github.com/knolleary/node-red-workshop-photobooth-project){:target="blank"}.


     This includes the [flow file](https://github.com/knolleary/node-red-workshop-photobooth-project/blob/main/flows.json){:target="blank"}
     you can import if you want to skip to the end.

 - Alternatively, you can access the final flow from this repository [here](flow-final.md).

 - For more information about using Node-RED, start with the [Node-RED Essentials playlist](https://www.youtube.com/playlist?list=PLyNBB9VCLmo1hyO-4fIZ08gqFcXBkHy-6)
   on YouTube.

 - The [Working with Messages](https://nodered.org/docs/user-guide/messages) section
   of the documentation provides a good introduction to understanding the structure
   of a message.

 - The [Flow Developer Guide](https://nodered.org/docs/developing-flows/) provides
   lots of useful information on best practices in creating flows. It covers how
   to layout your flows, how to structure your messages and also how to properly
   document your flows (something this workshop hasn't really touched on).

 - The [Node-RED community forum](https://discourse.nodered.org) is a great place to get help,
   as is the project's [Slack](https://nodered.org/slack).


## TensorFlow.js Resources

 - You can find out more about TensorFlow.js at its site [here](https://www.tensorflow.org/js)

 - We've used the Object Detection model in this workshop. For more information
   about other pre-trained models that are available, check out [this page](https://www.tensorflow.org/js/models).

 - To use a different model, you'll need to change over to the [node-red-contrib-tf-model](https://flows.nodered.org/node/node-red-contrib-tf-model)
   set of nodes. Make sure you read its documentation before installing it as you
   have to manually install the TensorFlow libraries first.

    You should not try installing it at the same time as the `node-red-contrib-tfjs-coco-ssd` module
   we've used in this workshop.