$(document).ready ->
  height = 50
  spacing = 15
  $.ajax
    url: '/d3graph.json'
    method: 'get'
    dataType: 'json'
    success: (d3data) ->
      svg_element = d3.select('div#d3container svg').selectAll('rect').data(d3data)
      svg_element.enter()
        .append('rect')
        .attr('height', height)
        .attr('width', 0)
        .attr('y', (value, i) -> i * (height + spacing) - spacing)
        .transition()
        .duration(1000)
        .style('fill', 'yellow')
        .attr('width', (gitInfo) -> gitInfo.value * 10)
        
