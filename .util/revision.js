const revisions = require('../node_modules/puppeteer/lib/cjs/revisions.js');
const args = process.argv.slice(2);

console.log(revisions['PUPPETEER_REVISIONS'][args[0]]);
