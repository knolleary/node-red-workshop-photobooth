# 4 - Containerization

## Why create a container?

Up to this point in the workshop, you've been developing an application using
Node-RED on your local device.

The fact the editor and runtime are bundled together makes it very convenient
to quickly start building applications.

But that model is less suitable when you think about creating applications that
run in production, or that need to be distributed to remote devices. You don't
want to be using the editor to edit the application directly - you want to be
able to develop and test your application locally and then have a controlled
way to deploy it into your production environment.

In this part of the workshop, we're going to step through the process of
wrapping the application as a Docker container. Once the container has been
created, it can be deployed just as you would any other container - pushing it
to a cloud environment or down to edge devices.

## Preparing your Node-RED project

At the start of this workshop, you enabled the Projects feature. That gave
you a git repository you can use to manage your application.

In this section we are going to make some updates to the project files to help
create a deployable container.

This involves:

 - updating the project's `package.json` file,
 - adding a `settings.js` file
 - adding a `Dockerfile`






