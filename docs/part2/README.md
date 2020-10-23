# 2 - Node-RED

## Introducing Node-RED

Node-RED is a programming tool for building event-driven application. It takes
a low-code approach - which means rather than write lots of code, you build
applications by using its visual editor to create flows of nodes that describe
what should happen when particular events happen.

For example, the `HTTP In` node can be configured to list on a particular path.
When an HTTP request arrives on that path the node is triggered. It generates
a message containing information about the request and passes it on to the nodes
it is wired to. They in turn do whatever work they need to do using the message.

Such as generating HTML content and adding it to the message before being
passed on through the flow. In this example, the flow ends with an `HTTP Response`
node which responds to the original HTTP request using the information in the
message.