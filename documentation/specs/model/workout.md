# Workout

We will not have Custom types at the start, but, all the types will have the right property list set, to have retro-compatibility in the future.

## Properties

---

##### name: String

##### type: String

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

---
---

## Specs

## [01] Default list of types aka Implementations of the Type

---

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

- type = "Elliptical"
- name = "Elliptical"
- icon = "elliptical.png"

#### StationaryBike extends CardioExercise

- type = "StationaryBike"
- name = "StationaryBike"
- icon = "stationary_bike.png"

#### RowingMachine extends CardioExercise

- type = "RowingMachine"
- name = "Rowing Machine"
- icon = "rowing_machine.png"

#### Treadmill extends CardioExercise

- type = "Treadmill"
- name = "Threadmill"
- icon = "threadmill.png"

#### StairMill extends CardioExercise

- type = "StairMill"
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

- type = "MachineExercise"
- icon = "machine_exercise.png"

#### SimpleExercise extends Exercise

- type = "SimpleExercise"
- icon = "simple_exercise.png"

## [02] Custom Workouts
---

- The workout type can be custom and the workout info have a dynamic list of properties please check the [Property](./property.md)
- Create custom workout parser with custom properties

#### Status: Planned
