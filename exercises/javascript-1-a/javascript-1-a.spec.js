// @ts-check

import { rearrange, arrange } from './javascript-1-a';

const CARDS = ['\u2660', '\u2663', '\u2665', '\u2666', '\u2728']

/**
 * SLice the fruit
 * @param  {...number} indices
 * @returns {typeof CARDS}
 */
function cardify(...indices) {
  return indices.map((i) => CARDS[i - 1])
}

function card(index) {
  return CARDS.slice(index).shift()
}

describe('magic-moves', () => {
  describe('rearrange', () => {
    test(`rearrange([ ${CARDS.join(', ')} ], 3, 0): it moves the ${card(3)} (index 3) to the front (index 0)`, () => {
      expect(rearrange(CARDS.slice(), 3, 0)).toEqual(cardify(4, 1, 2, 3, 5))
    })

    test(`rearrange([ ${CARDS.join(', ')} ], 3, 0): it mutates the input`, () => {
      const before = CARDS.slice()
      const magixs = rearrange(before, 3, 0)
      expect(before).toBe(magixs)
      expect(before).toEqual(cardify(4, 1, 2, 3, 5))
    })

    test(`rearrange([ ${CARDS.join(', ')} ], -1, 0): moves the ${card(-1)} (size - 1) to the front (index 0)`, () => {
      expect(rearrange(CARDS.slice(), -1, 0)).toEqual(cardify(5, 1, 2, 3, 4))
    })

    test(`rearrange([ ${CARDS.join(', ')} ], 1, -2): moves the ${card(1)} (index 1) just before the back (size - 2)`, () => {
      expect(rearrange(CARDS.slice(), 1, -2)).toEqual(cardify(1, 3, 4, 2, 5))
    })

    test(`rearrange([ ${CARDS.join(', ')} ], -3, -4): moves the ${card(-3)} (size - 3) one to the left (size - 4)`, () => {
      expect(rearrange(CARDS.slice(), -3, -4)).toEqual(cardify(1, 3, 2, 4, 5))
    })

    test(`rearrange([ ${CARDS.join(', ')} ], 0, 0): keeps ${card(0)} (index 0) in place`, () => {
      expect(rearrange(CARDS.slice(), 0, 0)).toEqual(cardify(1, 2, 3, 4, 5))
    })
  })

  describe('arrange', () => {
    test(`arrange([ ${CARDS.join(', ')} ], 3, 0): it moves the ${card(3)} (index 3) to the front (index 0)`, () => {
      expect(arrange(CARDS.slice(), 3, 0)).toEqual(cardify(4, 1, 2, 3, 5))
    })

    test(`arrange([ ${CARDS.join(', ')} ], 3, 0): it does not mutate the input`, () => {
      const before = CARDS.slice()
      const magixs = arrange(before, 3, 0)
      expect(before).not.toBe(magixs)
      expect(before).toEqual(CARDS)
      expect(magixs).toEqual(cardify(4, 1, 2, 3, 5))
    })

    test(`arrange([ ${CARDS.join(', ')} ], -1, 0): moves the ${card(-1)} (size - 1) to the front (index 0)`, () => {
      expect(arrange(CARDS, -1, 0)).toEqual(cardify(5, 1, 2, 3, 4))
    })

    test(`arrange([ ${CARDS.join(', ')} ], 1, -2): moves the ${card(1)} (index 1) just before the back (size - 2)`, () => {
      expect(arrange(CARDS, 1, -2)).toEqual(cardify(1, 3, 4, 2, 5))
    })

    test(`arrange([ ${CARDS.join(', ')} ], -3, -4): moves the ${card(-3)} (size - 3) one to the left (size - 4)`, () => {
      expect(arrange(CARDS, -3, -4)).toEqual(cardify(1, 3, 2, 4, 5))
    })

    test(`arrange([ ${CARDS.join(', ')} ], 0, 0): keeps ${card(0)} (index 0) in place`, () => {
      expect(arrange(CARDS, 0, 0)).toEqual(cardify(1, 2, 3, 4, 5))
    })
  })
})
