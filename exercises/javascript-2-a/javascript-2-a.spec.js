// @ts-check

import { rearrange, arrange } from "./javascript-2-a";

const CARDS = ["\u2660", "\u2663", "\u2665", "\u2666", "\u2728"];
const cards = CARDS.join(", ");

/**
 * Prepare indices (1-based) as cards
 * @param  {...number} indices
 * @returns {typeof CARDS}
 */
function cardify(...indices) {
  return indices.map(i => CARDS[i - 1]);
}

function card(index) {
  return CARDS.slice(index).shift();
}

describe("magic-moves", () => {
  describe("arrange", () => {
    test(`arrange([ ${cards} ], 3, 0): it moves the ${card(
      3
    )} (index 3) to the front (index 0)`, () => {
      expect(arrange(CARDS.slice(), 3, 0)).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`arrange([ ${cards} ], 3, 0): it does not mutate the input`, () => {
      const before = CARDS.slice();
      const magixs = arrange(before, 3, 0);
      expect(before).not.toBe(magixs);
      expect(before).toEqual(CARDS);
      expect(magixs).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`arrange([ ${cards} ], -1, 0): moves the ${card(
      -1
    )} (size - 1) to the front (index 0)`, () => {
      expect(arrange(CARDS, -1, 0)).toEqual(cardify(5, 1, 2, 3, 4));
    });

    test(`arrange([ ${cards} ], 1, -2): moves the ${card(
      1
    )} (index 1) just before the back (size - 2)`, () => {
      expect(arrange(CARDS, 1, -2)).toEqual(cardify(1, 3, 4, 2, 5));
    });

    test(`arrange([ ${cards} ], -3, -4): moves the ${card(
      -3
    )} (size - 3) one to the left (size - 4)`, () => {
      expect(arrange(CARDS, -3, -4)).toEqual(cardify(1, 3, 2, 4, 5));
    });

    test(`arrange([ ${cards} ], 0, 0): keeps ${card(
      0
    )} (index 0) in place`, () => {
      expect(arrange(CARDS, 0, 0)).toEqual(cardify(1, 2, 3, 4, 5));
    });
  });

  describe("rearrange", () => {
    let freshCards;
    beforeEach(() => {
      freshCards = CARDS.slice();
    });

    test(`rearrange([ ${cards} ], 3, 0): it moves the ${card(
      3
    )} (index 3) to the front (index 0)`, () => {
      expect(rearrange(freshCards, 3, 0)).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`rearrange([ ${cards} ], 3, 0): it mutates the input`, () => {
      const magixs = rearrange(freshCards, 3, 0);
      expect(freshCards).toBe(magixs);
      expect(freshCards).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`rearrange([ ${cards} ], -1, 0): moves the ${card(
      -1
    )} (size - 1) to the front (index 0)`, () => {
      expect(rearrange(freshCards, -1, 0)).toEqual(cardify(5, 1, 2, 3, 4));
    });

    test(`rearrange([ ${cards} ], 1, -2): moves the ${card(
      1
    )} (index 1) just before the back (size - 2)`, () => {
      expect(rearrange(freshCards, 1, -2)).toEqual(cardify(1, 3, 4, 2, 5));
    });

    test(`rearrange([ ${cards} ], -3, -4): moves the ${card(
      -3
    )} (size - 3) one to the left (size - 4)`, () => {
      expect(rearrange(freshCards, -3, -4)).toEqual(cardify(1, 3, 2, 4, 5));
    });

    test(`rearrange([ ${cards} ], 0, 0): keeps ${card(
      0
    )} (index 0) in place`, () => {
      expect(rearrange(freshCards, 0, 0)).toEqual(cardify(1, 2, 3, 4, 5));
    });
  });

  describe("arrange multiple steps", () => {
    test(`arrange([ ${cards} ], [[3, 0]]): moves the ${card(
      3
    )} (index 3) to the front (index 0)`, () => {
      expect(arrange(CARDS, [[3, 0]])).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`arrange([ ${cards} ], [[3, 0]]): it does not mutate the input`, () => {
      const before = CARDS.slice();
      const magixs = arrange(before, [[3, 0]]);
      expect(before).not.toBe(magixs);
      expect(before).toEqual(CARDS);
      expect(magixs).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`arrange([ ${cards} ], [[3, 0], [3,0], [3,0]]): moves the ${card(
      3
    )} (index 3) to the front (index 0) three times`, () => {
      const actual = arrange(CARDS, [
        [3, 0],
        [3, 0],
        [3, 0]
      ]);
      expect(actual).toEqual(cardify(2, 3, 4, 1, 5));
    });

    test(`arrange([ ${cards} ], [[-1, 0],[-1, 0]]): moves the ${card(
      -1
    )} (last card) to the front (index 0) twice`, () => {
      const actual = arrange(CARDS, [
        [-1, 0],
        [-1, 0]
      ]);
      expect(actual).toEqual(cardify(4, 5, 1, 2, 3));
    });

    test(`arrange([ ${cards} ], [[1, 3],[3, 1]]): moves the second ${card(
      1
    )} (index 1) to fourth place (index 3) and then back again`, () => {
      const actual = arrange(CARDS, [
        [1, 3],
        [3, 1]
      ]);
      expect(actual).toEqual(cardify(1, 2, 3, 4, 5));
    });
  });

  describe("rearrange multiple steps", () => {
    let freshCards;
    beforeEach(() => {
      freshCards = CARDS.slice();
    });

    test(`rearrange([ ${cards} ], [[3, 0]]): moves the ${card(
      3
    )} (index 3) to the front (index 0)`, () => {
      expect(rearrange(freshCards, [[3, 0]])).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`rearrange([ ${cards} ], [[3, 0]]): it mutates the input`, () => {
      const magixs = rearrange(freshCards, [[3, 0]]);
      expect(freshCards).toBe(magixs);
      expect(magixs).toEqual(cardify(4, 1, 2, 3, 5));
    });

    test(`rearrange([ ${cards} ], [[3, 0], [3,0], [3,0]]): moves the ${card(
      3
    )} (index 3) to the front (index 0) three times`, () => {
      const actual = rearrange(freshCards, [
        [3, 0],
        [3, 0],
        [3, 0]
      ]);
      expect(actual).toEqual(cardify(2, 3, 4, 1, 5));
    });

    test(`rearrange([ ${cards} ], [[-1, 0],[-1, 0]]): moves the ${card(
      -1
    )} (last card) to the front (index 0) twice`, () => {
      const actual = rearrange(freshCards, [
        [-1, 0],
        [-1, 0]
      ]);
      expect(actual).toEqual(cardify(4, 5, 1, 2, 3));
    });

    test(`rearrange([ ${cards} ], [[1, 3],[3, 1]]): moves the second ${card(
      1
    )} (index 1) to fourth place (index 3) and then back again`, () => {
      const actual = rearrange(freshCards, [
        [1, 3],
        [3, 1]
      ]);
      expect(actual).toEqual(cardify(1, 2, 3, 4, 5));
    });
  });
});
