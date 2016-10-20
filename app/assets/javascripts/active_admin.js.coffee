#= require active_admin/base
#= active_admin/select2/base

# Swich  add/remove button for has_one car
$(document).on 'has_many_add:after', '.has_many_container.car', (e) ->
  if $(@).children('fieldset').length >= 1
    $('.has_many_add').hide()

$(document).on 'has_many_remove:after', '.has_many_container.car', (e) ->
  if $(@).children('fieldset').length == 0
    $('.has_many_add').show()
