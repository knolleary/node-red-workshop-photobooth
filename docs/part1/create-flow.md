# 1 - Node-RED

## Creating a flow

Before we start on the photo booth application, we're going to step through a
quick example to help get you more familiar with Node-RED.

1. From the palette, drag an Inject node into workspace. This node can be
  used to manually inject messages into a flow, or to inject them at a regular
  interval.

2. Drag a Debug node into the workspace. This is a very useful node that can be
   used to examine messages in a flow by displaying them in the Debug sidebar.

3. Drag a wire from the output of the Inject node to the input of the Debug node.
   The wires determine where messages go when they pass from one node to another.

4. Click the red Deploy button to save your changes. At this point your flow is
   now running.

5. Click the button to the left of the Inject node - this triggers it to send
   a message. By default it will send a message with its `payload` set to the
   current time.

 6. You should see the message get displayed in the Debug sidebar.




!!! note "Core Nodes"
    Node-RED comes with a number of core nodes that are the basic building blocks
    for any flow. It's worth spending a bit of time exploring what is available.

    The [documentation has more information](https://nodered.org/docs/user-guide/nodes)
    about them.