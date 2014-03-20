var data = [
  {"name": "Freeport", "rating": 4},
  {"name": "Captree", "rating": 3},
  {"name": "World's Fair Marina", "rating": 3}
];

var width = 420,
  barHeight = 20;

var x = d3.scale.linear()
  .domain([0, d3.max(data, function(d) { return d.rating; })])
  .range([0, width]);

var chart = d3.select(".chart")
  .attr("width", width)
  .attr("height", barHeight * data.length);

var bar = chart.selectAll("g")
  .data(data)
  .enter().append("g")
  .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });

bar.append("rect")
  .attr("width", function(d) { return x(d.rating); })
  .attr("height", barHeight - 1);

bar.append("text")
  .attr("x", function(d) { return x(d.rating) - 3; })
  .attr("y", barHeight / 2)
  .attr("dy", ".35em")
  .text(function(d) { return d.rating; });

function type(d) {
  d.rating = +d.rating; // coerce to number
  return d;
}