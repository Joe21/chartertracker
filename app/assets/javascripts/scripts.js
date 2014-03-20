var data = [
  {"name": "Freeport", "rating": 4},
  {"name": "Captree", "rating": 4.25},
  {"name": "World's Fair Marina", "rating": 3}
];

var margin = { top: 20, right: 30, bottom: 30, left: 40},
  width = 960 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
  .rangeRoundBands([0, width], .1)
  //  Should be called back in function upon complete download of json object
  .domain(data.map(function(d) { return d.name; }));

var y = d3.scale.linear()
  .range([height, 0])
  //  Should be called back in function upon complete download of json object
  .domain([0, 5]);

var xAxis = d3.svg.axis()
  .scale(x)
  .orient("bottom");

var yAxis = d3.svg.axis()
  .scale(y)
  .orient("left");

var chart = d3.select(".chart")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// Insert json d3 function

chart.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + height + ")")
  .call(xAxis);

chart.append("g")
  .attr("class", "y axis")
  .call(yAxis);

chart.selectAll(".bar")
  .data(data)
  .enter().append("rect")
    .attr("class", "bar")
    .attr("x", function(d) { return x(d.name); })
    .attr("y", function(d) { return y(d.rating); })
    .attr("height", function(d) { return height - y(d.rating); })
    .attr("width", x.rangeBand());

function type(d) {
  d.rating = +d.rating; // coerce to number
  return d;
}

var aspect = 960 / 500,
    chart = $(".chart");

$(window).on("resize", function() {
    var targetWidth = chart.parent().width();
    chart.attr("width", targetWidth);
    chart.attr("height", targetWidth / aspect);
});