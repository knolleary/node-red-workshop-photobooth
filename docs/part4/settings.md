# 4 - Containerization

## Add a `settings.js` file

You are already familiar with the Node-RED `settings.js` file you had to edit
in the earlier part of the workshop.

The containerized version of your application will need its own settings file to
use.

Create the file `~/.node-red/projects/<name-of-project>/settings.js` with the following
contents:

```
module.exports = {
    uiPort: process.env.PORT || 1880,
    credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET,
    httpAdminRoot: false,
    ui: { path: "/" }
}
```

- Setting `httpAdminRoot` to `false` will disable the Node-RED editor entirely - we
  do not want the flows to be edited directly in our production environment.
- `credentialSecret` is how you can provide the key for decrypting your credentials
  file. Rather than hardcode the key in the file - which is a bad idea - we set
  it using the environment variable `NODE_RED_CREDENTIAL_SECRET`.
- Having disabled the editor, the `ui` setting moves the root url of the dashboard
  page back to `/` rather than its default `/ui`.

