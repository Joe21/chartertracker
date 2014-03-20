var data = [
  {"name": "Freeport", "rating": 4},
  {"name": "Captree", "rating": 3},
  {"name": "World's Fair Marina", "rating": 3}
];

var width = 960,
  height = 500;

var x = d3.scale.ordinal()
  .rangeRoundBands([0, width], .1)
  .domain(data.map(function(d) { return d.name; }));

var y = d3.scale.linear()
  .range([height, 0])
  .domain([0, d3.max(data, function (d) { return d.rating; })]);

var chart = d3.select(".chart")
  .attr("width", width)
  .attr("height", height);

var bar = chart.selectAll("g")
  .data(data)
  .enter().append("g")
  .attr("transform", function(d) { return "translate(" + x(d.name) + ",0)"; });

bar.append("rect")
  .attr("y", function(d) { return y(d.rating); })
  .attr("height", function(d) { return height - y(d.rating); })
  .attr("width", x.rangeBand());

bar.append("text")
  .attr("x", x.rangeBand() / 2)
  .attr("y", function(d) { return y(d.rating) + 3; })
  .attr("dy", ".75em")
  .text(function(d) { return d.rating; });

function type(d) {
  d.rating = +d.rating; // coerce to number
  return d;
}