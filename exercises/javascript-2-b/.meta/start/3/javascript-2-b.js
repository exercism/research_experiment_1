// @ts-check

/**
 * Extract a value from an object using a path
 *
 * @template T
 *
 * @param {object} object the input object
 * @param {string} path the path to the value in the object
 *
 * @returns {T}
 */
export function extract(object, path) {
  /**
   * Recursively extract a value from an object using a path
   *
   * @template T
   *
   * @param {object} object the input object
   * @param {string[]} parts the path parts to the value in the object
   *
   * @returns {T}
   */
  function extractRecursive(object, [head, ...tail]) {
    return head === undefined
      ? object
      : extractRecursive((object && object[head]) || null, tail);
  }

  return extractRecursive(object, path.split("."));
}
