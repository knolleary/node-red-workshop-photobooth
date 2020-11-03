# Introducing Node-RED Dashboard


Node-RED Dashboard is a set of nodes you can install into Node-RED that make
is easy to create a web page that can interact with your flows.

It comes with nodes to add buttons, text inputs, charts and other widgets.

It does not provide the full flexibility of creating a page from scratch, but it
is a good choice for getting something created quickly and easily.

!!! info "Other dashboard options"
    There are other sets of nodes available from the community that can be
    used to create web pages connected to Node-RED flows. One such example is
    [UIbuilder](https://flows.nodered.org/node/node-red-contrib-uibuilder) that
    does not provide the pre-build widgets of Node-RED Dashboard, but does allow
    you to build the page from your own HTML/JavaScript/CSS.

    We use Node-RED Dashboard in this workshop for the convenience it provides
    in building the web page with a minimum of any custom coding.

## Installing Node-RED Dashboard

Using the Manage Palette feature in the editor, install the following modules:

 - `node-red-dashboard` - be sure to install this one *first*.
 - `node-red-node-ui-table`
 - `node-red-node-ui-webcam`

## Next Steps

Having installed the dashboard nodes, in this part of the workshop you will:

 - [Create your initial Photo Booth Dashboard](create-dashboard.md)
 - [Add more controls to the dashboard](adding-controls.md)

