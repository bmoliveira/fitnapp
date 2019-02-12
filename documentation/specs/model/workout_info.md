# WorkoutInfo

We will not have Custom types at the start, but, all the types will have the right property list set, to have retro-compatibility in the future.

## Properties

---

##### name: String

##### icon: String (ResourceName)

##### properties: List\<[Property](./property.md)>

Example

```json
[
  {
    "key": "name",
    "type": "string"
  },
  {
    "key": "icon",
    "type": "string"
  }
]
```

## Specs

---

## [01] Default list of types aka Implementations of the Type

### CardioExercise extends WorkoutInfo

##### start_date: Date

- optional

##### end_date: Date

- optional

##### time: Int

- optional
- automatic after end date
- in seconds

##### distance: Double

- In meters

#### Elliptical extends CardioExercise

- name = "Elliptical"
- icon = "elliptical.png"

#### StationaryBike extends CardioExercise

- name = "StationaryBike"
- icon = "stationary_bike.png"

#### RowingMachine extends CardioExercise

- name = "Rowing Machine"
- icon = "rowing_machine.png"

#### Treadmill extends CardioExercise

- name = "Threadmill"
- icon = "threadmill.png"

#### StairMill extends CardioExercise

- name = "Stairmill"
- icon = "stairmill.png"

##### stairs_climbed: Int

- (Is it a thing?)
- Ask Iolanda

### Exercise extends WorkoutInfo

##### name: String

- Ideally the machine name

##### List\<[SerieRepetition](./serie_repetition.md)>

#### MachineExercise extends Exercise

- icon = "machine_exercise.png"

#### SimpleExercise extends Exercise

- icon = "simple_exercise.png"
