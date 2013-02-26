@chosenify = (entry) ->
  entry.chosen
    allow_single_deselect: true

$ -> 
  chosenify $(".chosen")

  $("form.formtastic .inputs .has_many").click ->
    $(".chosen").chosen
      allow_single_deselect: true