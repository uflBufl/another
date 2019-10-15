# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

animateTextCS = (textArea) ->
  text = textArea.value
  to = text.length
  from = 0
  animate
    duration: 5000
    timing: bounceCS
    draw: (progress) ->
      result = (to - from) * progress + from
      textArea.value = text.substr(0, Math.ceil(result))
      return
  return

bounceCS = (timeFraction) ->
  a = 0
  b = 1
  result = undefined
  loop
    if timeFraction >= (7 - (4 * a)) / 11
      return -((11 - (6 * a) - (11 * timeFraction)) / 4) ** 2 + b ** 2
    a += b
    b /= 2
  return
