# firebase_installations

Firebase Flutter Installations SDK integration for Android and iOs.

## WTF

The Firebase installations service (FIS) provides a Firebase installation ID (FID) for each installed instance of a Firebase app.

Firebase installation IDs are different for every installation of every application; different applications on the same device have different Firebase installation IDs. Firebase installation IDs identify app installations and data tied to those app installations.

When you delete an installation ID, the data tied to that installation ID is removed from live and backup systems of all Firebase services that use Firebase installation IDs to identify installations within 180 days. This process is described at a high level in Google’s statement on deletion and retention.

## Firebase installation ID lifecycle

During the normal operation of an app, Firebase installation IDs (FIDs) don't require special monitoring. However, apps that explictly retrieve and use FIDs should add logic to monitor the potential deletion or rotation of the FID. Here are some cases where FIDs could be deleted or rotated:

- Uninstallation or reinstallation of the app, for instance when an end user installs on a new device.
- The end user clears the cache of the app or the device.
- FID deletion is triggered in the backend due to app inactivity (currently the threshold for this is 270 days of inactivity).

> Source: https://firebase.google.com/docs/projects/manage-installations#monitor-id-lifecycle

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

