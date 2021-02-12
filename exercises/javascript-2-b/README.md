# Instructions

Your task is to extend existing code with new functionality. The existing code deals with a website for basketball team. The website displays lots of data, but unfortunately what is displayed changes often. As the data is stored in a single object, this is not hard to do, but it is time-consuming and boring. To automate this, the content team can specify which data to display by specifying a _path_ to the data to be displayed in the website's content editor.

The code you'll be working with has a function named `extract` that takes:

- an `object` (the `Object` which data to extract),
- a `path` (a `String` with the data's path, separated by dot characters)

The function returns the value within the object that matches the path, returning `null` if no value was found:

```javascript
const team = { coach: { name: "Jane" }, name: "Hoop Masters" };

extract(team, "name");
// => "Hoop Masters"

extract(team, "coach.name");
// => "Jane"
```

The content team is very excited about this new functionality, and has already requested a new feature to be added. They'd like to be able to display data of specific elements in an array.

Your job is to extend the `extract` function to allow extracting array data. This will be done by adding an indexer after the array property:

```javascript
const team = {
  players: [
    {
      name: "Becky",
      position: "Point guard"
    },
    {
      name: "Maya",
      position: "Center"
    }
  ]
};

extract(team, "players[0].name");
// => "Becky"

extract(team, "players[1].position");
// => "Center"
```

If the index does not point to an actual value, `null` should be returned.
