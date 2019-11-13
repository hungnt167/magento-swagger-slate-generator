const swaggerJson = require('./swagger.json');
const fs = require('fs');
const path = require('path');


if (process.argv.length < 3) {
    console.log("queries parameter is required.");
    process.exit(-1);
}
const queries = process.argv[2].split(',');

queries.forEach(function(query) {
    Object.keys(swaggerJson.paths).forEach(function(endPoint) {
        if (!endPoint.includes(query)) {
            delete swaggerJson.paths[endPoint];
        }
    });
});

const data = JSON.stringify(swaggerJson);
fs.writeFileSync('filtered_swagger.json', data);
