# Property\<T>

## Status: Planned

Initial version will not support dynamic exercises.
But the initial default classes will have the list of properties, just in case.

## Properties

---

##### type: String

- Type of the property T

##### key: String

- Key to parse on the object

##### nested_type: String

- Optional
- If the type is a list the T type to parse

### Example

```json
{
  "key": "name",
  "type": "string"
}
```

This is a "dynamic" property for the type T.
With this a models can be polimorphic.

The reasoning beind this is to be able to in the future build graphics based on certain property types.

---
---

## Specs

## [01] Supported property types

---

- Double
  - key: double

- Int
  - key: int

- String
  - key: string

- Date
  - key: date

- SerieRepetition
  - Key: serie_repetition

- List\<T>
  - key: list
  - nested_type: \<supported_nested_type>

- Property\<T>
  - key: property
  - nested_type: \<supported_nested_type>
