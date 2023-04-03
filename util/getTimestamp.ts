export const getTimestamp = () => {
  const now = new Date();
  const monthNumber = now.getUTCMonth() + 1;
  
  return {
    short: now.getHours() + ':' + now.getMinutes(),
    longPretty: now.toDateString() + ' ' + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds(),
    long: now.getUTCFullYear() + '/' + monthNumber + '/' + now.getUTCDate() + " " + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds(),
  }
}