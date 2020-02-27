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
    const indexStart = part.indexOf("[");
    const indexEnd = part.indexOf("]");

    if (indexStart !== -1 && indexEnd !== -1) {
      const index = parseInt(part.substring(indexStart + 1, indexEnd));
      const indexPart = part.substring(0, indexStart);
      current = (current && current[indexPart] && current[indexPart][index]) || null;
    } else {
      current = (current && current[part]) || null;
    }
  }

  return current;
}
