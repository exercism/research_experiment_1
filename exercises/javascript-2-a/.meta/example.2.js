// @ts-check
// Using iteration to move, then splice, using concat to copy


/**
 * Re-arranges the input array by moving an item from from, to to.
 * Mutates the input array.
 *
 * @template T
 *
 * @param {T[]} array the input array
 * @param {number} from the position to move from
 * @param {number} to the position to move to
 *
 * @returns {T[]}
 */
export function rearrange(array, from, to) {
  while (from < 0) {
    from += array.length;
  }

  while (to < 0) {
    to += array.length;
  }

  if (to >= array.length) {
    let k = to - array.length;
    while ((k--) + 1) {
      array.push(undefined);
    }
  }

  array.splice(to, 0, array.splice(from, 1)[0]);
  return array;
}

/**
 * Re-arranges the input array by moving an item from from, to to.
 * Does not mutate the input array.
 *
 * @template T
 *
 * @param {T[]} array the input array
 * @param {number} from the position to move from
 * @param {number} to the position to move to
 *
 * @returns {T[]}
 */
export function arrange(array, from, to) {
  return rearrange(array.concat([]), from, to)
}

