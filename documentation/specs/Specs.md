# Specs

Here on the specs you can find the specs for the core features of the app in order to help future debugging and development of the app.

For other types of documentation please check the [documentation](../) folder.

## Format

The specs can be just a file if it does not contain descendats or a folder if it justifies to.

### Folder format

If there is need to a folder, add Feature.md to the root of the folder, and afterwards link all the other mds to it.

### Linking

The specs should all link to a parent spec, so all the specs are connected.

### Template

```markdown
filename: <Feature>.md

## <Feature>

### Description

### Status
  - Possibly link the related roadmap change to the feature.
```

## FitNapp

### [Register](/register)

All the screens and logic related to the sign up of a user.

### [Login](/login)

All the screens and behavior for a login

### [Content](/content)

The app after a user is logged in.

### [Model](/model)

The model sync and user storage will be for now all made with Firebase tools.