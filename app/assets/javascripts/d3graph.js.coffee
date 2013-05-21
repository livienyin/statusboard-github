container = document.getElementById('d3container')

$(document).ready ->
  $.ajax
    url: '/d3graph.json'
    method: 'get'
    dataType: 'json'
    success: (data) ->
      svg = d3.select('div#d3container svg')
      d3data = data
      svg.selectAll('rect')
      .data(d3data)
      .enter()
      .append('rect')
      .attr('height', 30)
      .attr('width', 0)
      .transition()
      .duration(2000)
      .attr('width', (value) -> value * 4)
      .attr('y', (value, i) -> i * 40)
