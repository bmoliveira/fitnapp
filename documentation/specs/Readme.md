# Specs

## FitNapp

### [Model](./model)

The model sync and user storage will be for now all made with Firebase tools.

### [Content](./content)

The app after a user is logged in.

### [Register](./register)

All the screens and logic related to the sign up of a user.

### [Login](./login)

All the screens and behavior for a login

---

## Guide

Here on the specs you can find the specs for the core features of the app, in order to help future debugging and development.

For other types of documentation please check [documentation](documentation/).

### Format

The specs can be a file if it does not contain descendats or a folder if it has a more complex structure.

#### Folder format

If there is need to a folder, add Readme.md to the root of the folder, and afterwards link all the other files.md to it.

#### Linking

The specs should all link to a parent spec, so all the specs are connected to each other.

#### Template

```markdown
filename: <Feature>.md

# <Feature>

## Description

## Status
  - Possibly link the related roadmap change to the feature.
```
