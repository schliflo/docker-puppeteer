const revisions = require('puppeteer/lib/cjs/puppeteer/revisions.js');
const args = process.argv.slice(2);

console.log(revisions['PUPPETEER_REVISIONS'][args[0]]);
