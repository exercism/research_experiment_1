// @ts-check

/**
 * Re-arranges the input array by moving an item from one position to another position.
 * Does not mutate the input array.
 *
 * @template T
 *
 * @param {T[]} array the input array
 * @param {number|array} from the position to move from, or an array of from/to pairs
 * @param {number=} to the position to move to, only used when from is a number
 *
 * @returns {T[]}
 */
export function arrange(array, from, to) {
  return rearrange([...array], from, to);
}

/**
 * Re-arranges the input array by moving an item from one position to another position.
 * Mutates the input array.
 *
 * @template T
 *
 * @param {T[]} array the input array
 * @param {number|array} from the position to move from, or an array of from/to pairs
 * @param {number=} to the position to move to, only used when from is a number
 *
 * @returns {T[]}
 */
export function rearrange(array, from, to) {
  let steps = Array.isArray(from) ? from : [[from, to]];
  steps.forEach(([from, to]) => {
    if (to < 0) to++;
    array.splice(to, 0, ...array.splice(from, 1));
  });
  return array;
}
