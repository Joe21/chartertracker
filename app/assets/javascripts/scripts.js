var data;

var margin = { top: 20, right: 30, bottom: 30, left: 40},
  width = 960 - margin.left - margin.right,
  height = 500 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
  .rangeRoundBands([0, width], .1)
  //  Should be called back in function upon complete download of json object
  // .domain(data.map(function(d) { return d.name; }));

var y = d3.scale.linear()
  .range([height, 0])
  //  Should be called back in function upon complete download of json object
  .domain([0, 5]);

var xAxis = d3.svg.axis()
  .scale(x)
  .orient("bottom");

var yAxis = d3.svg.axis()
  .scale(y)
  .orient("left")
  .ticks(10, "");

var chart = d3.select(".chart")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// Insert json d3 function
d3.json("/tracker", type, function(error, data){
  x.domain(data.map(function(d) { return d.name; }));
  y.domain([0, d3.max(data, function(d) { return d.rating; })]);

  chart.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

  chart.append("g")
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Rating");

  chart.selectAll(".bar")
    .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.name); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.rating); })
      .attr("height", function(d) { return height - y(d.rating); });
});

function type(d) {
  d.rating = +d.rating;
  return d;
}

var aspect = 960 / 500,
    chart = $(".chart");

$(window).on("resize", function() {
    var targetWidth = chart.parent().width();
    chart.attr("width", targetWidth);
    chart.attr("height", targetWidth / aspect);
});


function jsonReceiver() {
  var request = $.ajax({
    url: '/tracker',
    method: 'GET',
    dataType: 'json',
    success: function(warhead) {
      data = warhead;
      alert("good to go");
    }
  });
}
