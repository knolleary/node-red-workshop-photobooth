# 2 - Node-RED

## Adding controls

The `ui_webcam` node is fairly self-contained - providing both the live view
of the camera as well as the button to trigger taking a photo.

They node also supports being triggered by the flow it is wired to - something
we'll make use of next.

1. Add a `ui_button` node. Configure it as follows:
     - Set its group to the existing `WebCam` group.
     - Set its size to `9x1`
     - Set the icon to `fa-camera fa-2x`
     - Set the name to `Capture`
2. Wire its output to a new Change node, configured to set `msg.capture` to
   the `boolean` value `true`.
3. Wire the output of the Change node to the input of the WebCam node.
4. Edit the WebCam node and select the 'Hide capture button' option
5. Deploy the changes

The Dashboard will now show the new button beneath the webcam widget - clicking
it should trigger a photo to be taken.



