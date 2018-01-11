var express = require('express');
var app = express();

app.get('/', function(request, response) {
    response.send('Hello World!\n')
});

//start server
var port = process.env.PORT || 3000;
var server = app.listen(port, function() {
    console.log(`Listening on port ${port}`);
});