class @Hello
  good = () ->
    alert('hey')
  @notgood = () ->
    box = document.getElementById('box')
    box.innerHtml = 'hey'
    $(box).html('hou')
