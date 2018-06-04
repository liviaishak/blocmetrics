## Blocmetrics
Blocmetrics is a web app that allows users to easily track custom events across several web apps. Users first register their apps with Blocmetrics, and then add some custom javascript code to their apps that will then automatically send API requests to Blocmetrics.

## How to Use:
<p>Go into the webpage that you'd like to track</p>
<p>Add this code in app/assets/javascripts/application.js</p>
blocmetrics.report = function(eventName) {
   var event = {event: { name: eventName }};

   var request = new XMLHttpRequest();

   request.open("POST", "http://localhost:3000/api/events", true);

   request.setRequestHeader('Content-Type', 'application/json');

   request.send(JSON.stringify(event));
}
<p>Add event listeners of your wish</p>
<p>Run a callback on blocmetrics.report.</p>

## Technologies used:
<p>Rails 5</p>
<p>Devise</p>
<p>Chartkick and Groupdate gems to display informational graphs</p>
<p>PostGreSQL database</p>
