# Model

The Model spec group is a root group of [specs](../) for all the base models of the app.

## Classes

### User

#### Properties

- name: String

### ActivitySession

#### Properties

- exercises: List\<Exercise>
- start_date: Date
- end_date: Date

### [Exercise](./exercise.md)

#### Properties

- name
- properties: List\<Property>
- exercise_type: ExerciseType
- image: String (ResourceName)

### [ExerciseType](./exercise_type.md)

#### Properties

- name: String
- icon: String (ResourceName)
- default_exercises: List\<Property>

### [Property\<T>](./property.md)

#### Properties

- type: String
  - Type of the property T
- key: String
  - Key to parse on the object
- nested_type: String
  - Optional
  - If the type is a list the T type to parse

### SerieRepetition

#### Properties
