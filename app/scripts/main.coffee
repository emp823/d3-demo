dataset = _.map(_.range(75), (i) -> Math.random() * 50)
w = 400
h = 300

svg =
  d3.select('#chartArea').append('svg')
    .attr('width', w)
    .attr('height', h);

xScale = d3.scale.ordinal()
  .domain(dataset)
  .rangeBands([0, w], 0.2, 0)

yScale = d3.scale.linear()
  .domain([0, d3.max(dataset) * 1.1])
  .range([0, h])

colorScale = d3.scale.linear()
  .domain([0, d3.max(dataset)])
  .range(['red', 'yellow'])

multiplier = 4

svg.selectAll('rect')
  .data(dataset)
  .enter()
  .append('rect')
  .attr('class', 'bar')
  .attr('x', (d, i) -> xScale(d))
  .attr('y', (d) -> h - yScale(d))
  .attr('width', xScale.rangeBand())
  .attr('height', (d) -> yScale(d))
  .attr('fill', colorScale)
