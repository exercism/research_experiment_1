# Instructions

You're working on a website for basketball team. The website displays lots of data, but unfortunately what is displayed changes often. As the data is stored in a single object, this is not hard to do, but it is time-consuming and boring. You've therefore decided to automate things. Your goal is to allow the content team to select which data to display by themselves. They'll do this by specifying a _path_ to the data to be displayed in the website's content editor.

Your task is to create a function `extract` that takes:

- an `object` (the `Object` which data to extract),
- a `path` (a `String` with the data's path, separated by dot characters)

The function should then return the value within the object that matches the path:

```javascript
const team = { coach: { name: "Jane" }, name: "Hoop Masters" };

extract(team, "name");
// => "Hoop Masters"

extract(team, "coach.name");
// => "Jane"
```

If the path does not point to an actual value, `null` should be returned.
