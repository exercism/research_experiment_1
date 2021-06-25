// @ts-check

import { extract } from "./javascript-1-b";

const TEAM = {
  name: "Buzzer Beaters",
  coach: {
    name: "Nancy",
    achievements: {
      titles: 2,
      hallOfFame: true
    }
  },
  location: {
    town: "Miami",
    state: "Florida"
  }
};

describe("extract", () => {
  test(`property: name`, () => {
    expect(extract(TEAM, "name")).toEqual("Buzzer Beaters");
  });

  test(`property: coach -> name`, () => {
    expect(extract(TEAM, "coach.name")).toEqual("Nancy");
  });

  test(`property: coach -> achievement -> titles`, () => {
    expect(extract(TEAM, "coach.achievements.titles")).toEqual(2);
  });

  test(`property: coach -> achievement -> hallOfFame`, () => {
    expect(extract(TEAM, "coach.achievements.hallOfFame")).toEqual(true);
  });

  test(`property: location`, () => {
    expect(extract(TEAM, "location")).toEqual({ town: "Miami", state: "Florida" });
  });

  test(`property: unknown`, () => {
    expect(extract(TEAM, "unknown")).toEqual(null);
  });
});
