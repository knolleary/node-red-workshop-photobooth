# 4 - TensorFlow

## Displaying the detected objects

In this part we're going to display the detected objects on the dashboard in two
different ways.

First we will display an annotated version of the captured image with all of the
objects highlighted. We will then add a table to the dashboard that lists them out.

## Displaying an annotated image

The `tf coco ssd` node has an option to output an annotated version of the image
with all of the detected objects highlighted. The image is set on the `msg.image`
message property.

1. Edit the `tf` node and configure the "Passthru" field to `Annotated Image`
2. Add a Change node, wired to the output of the `tf` node and configure it to move
   `msg.image` to `msg.payload`.
3. Wire the Change node to the input of the WebCam node.
4. Click the Deploy button to save your changes.

Now when you take an image on the dashboard, you should see the annotated version
of the image.


!!! information "Placeholder for the flow"
    ```
    [{"id":"20d0c025.0aa2a","type":"tensorflowCoco","z":"1662a311.2e126d","name":"","modelUrl":"http://localhost:1880/coco/model.json","scoreThreshold":0.5,"passthru":"bbox","lineColour":"magenta","x":570,"y":200,"wires":[["c9600f43.50d92","2ca16ff4.f672"]]},{"id":"64d6315f.021f5","type":"ui_webcam","z":"1662a311.2e126d","name":"","group":"c6201fc5.15816","order":1,"width":"10","height":"7","countdown":false,"autoStart":false,"hideCaptureButton":false,"showImage":"2","format":"jpeg","x":700,"y":80,"wires":[["20d0c025.0aa2a"]]},{"id":"c9600f43.50d92","type":"change","z":"1662a311.2e126d","name":"","rules":[{"t":"move","p":"image","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":790,"y":200,"wires":[["64d6315f.021f5"]]},{"id":"2ca16ff4.f672","type":"debug","z":"1662a311.2e126d","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"false","statusVal":"","statusType":"auto","x":760,"y":320,"wires":[]},{"id":"f565dd3b.7aa15","type":"change","z":"1662a311.2e126d","name":"","rules":[{"t":"set","p":"capture","pt":"msg","to":"true","tot":"bool"}],"action":"","property":"","from":"","to":"","reg":false,"x":360,"y":80,"wires":[["64d6315f.021f5"]]},{"id":"aa4ef8d2.b052f8","type":"ui_button","z":"1662a311.2e126d","name":"Clear","group":"c6201fc5.15816","order":3,"width":1,"height":1,"passthru":false,"label":"","tooltip":"","color":"","bgcolor":"","icon":"fa-trash fa-2x","payload":"\"\"","payloadType":"json","topic":"","x":110,"y":140,"wires":[["64d6315f.021f5"]]},{"id":"1af198c4.d75057","type":"ui_button","z":"1662a311.2e126d","name":"Capture","group":"c6201fc5.15816","order":2,"width":9,"height":1,"passthru":false,"label":"","tooltip":"","color":"","bgcolor":"","icon":"fa-camera fa-2x","payload":"","payloadType":"str","topic":"","x":120,"y":80,"wires":[["f565dd3b.7aa15"]]},{"id":"c6201fc5.15816","type":"ui_group","name":"WebCam","tab":"bc670075.d57e5","order":1,"disp":false,"width":"10","collapse":false},{"id":"bc670075.d57e5","type":"ui_tab","name":"Tab 2","icon":"dashboard","order":2}]
    ```

## Adding a table of objects

Install the module `node-red-node-ui-table` using the Manage Palette option in the
editor, or be running the following command in `~/.node-red`:

```
npm install node-red-node-ui-table
```

This adds the `ui_table` node to the palette which can be used to display tabular
data.

1. In the Dashboard sidebar of the Node-RED editor, hover over the `AI Photo Booth`
   tab and click the `+ group` button.
2. Edit the new group and set its properties:
    - Set the name to 'Objects'
    - Set the width to `6` by clicking the button and dragging the box out to 6
      units wide.
    - Untick the 'Display group name' option
3. Add a new `ui_table` node from the "dashboard" section of the palette into your
   workspace. Edit its properties as follows:
    - Add it to the 'Objects' group
    - Set its size to `6x8`
    - Add two columns by clicking the `+ add` button at the bottom. Configure them as:
        - Property: `class`, Title: `Object Type`
        - Property: `score`, Title: `Score`, Format: `Progress (0-100)`
4. Add a Change node to the workspace. Configure it to set `msg.payload` to the
   expression `$append([],payload.{"class":class,"score":score*100,"bbox":bbox})`

    !!! note
        Make sure you select the `expression` type for the `to` field of the Change node.
        This uses the [JSONata](https://jsonata.org) expression language.

5. Create the following wires between nodes:
    - wire the output of the `tf` node to the Change node.
    - wire the output of the Change node to the Table node
6. Click the Deploy button to save your changes.

Now when you capture an image on the dashboard, the table should list the detected
objects.


!!! idea "Side Quest #1"
    The JSONata expression used in the Change node mapped the `score` property
    of each detected object from its original `0-1` range to the `0-100` range
    expected by the `ui_table` node's "Progress" column type.

    The table supports a number of other formats of displaying numeric values.
    For example, it can map a number in the 0-100 range to a traffic light colour.
    It can also display a value in the range 0-5 as a number of stars.

    Edit the table node to display the score using the star format. See if you can
    modify the expression in the Change node to map the original score to the required
    `0-5` range.


!!! idea "Side Quest #2"
    With the current dashboard, when an image is captured it gets displayed in
    place of the live web cam view until the clear button is clicked.

    However clicking the button does not clear the table we've just added.

    Using what you've learnt so far, build a flow between the Clear button and
    the table node that will clear the table when the button is clicked.

    *Hint:* think about what payload must be passed to the table in order to clear it.


!!! information "Placeholder for the flow"
    ```
    [{"id":"e45861b7.8d0be","type":"change","z":"1662a311.2e126d","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"$append([],payload.{\"class\":class,\"score\":score*100,\"bbox\":bbox})","tot":"jsonata"}],"action":"","property":"","from":"","to":"","reg":false,"x":370,"y":360,"wires":[["f5b8e3f0.cd3a6"]]},{"id":"f5b8e3f0.cd3a6","type":"ui_table","z":"1662a311.2e126d","group":"c6201fc5.15816","name":"","order":3,"width":"6","height":"8","columns":[{"field":"class","title":"Object Type","width":"","align":"left","formatter":"plaintext","formatterParams":{"target":"_blank"}},{"field":"score","title":"Score","width":"","align":"left","formatter":"progress","formatterParams":{"target":"_blank"}}],"outputs":0,"cts":false,"x":550,"y":360,"wires":[]},{"id":"c6201fc5.15816","type":"ui_group","name":"WebCam","tab":"bc670075.d57e5","order":1,"disp":false,"width":"10","collapse":false},{"id":"bc670075.d57e5","type":"ui_tab","name":"Tab 2","icon":"dashboard","order":2}]
    ```