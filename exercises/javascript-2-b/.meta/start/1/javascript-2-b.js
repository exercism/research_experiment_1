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
  let current = object;
  let parts = path.split(".");

  for (const part of parts) {
    current = (current && current[part]) || null;
  }

  return current;
}
