$ ->
  reindexSort = (context, inputName) ->
    sortInputs = $("input[name$='[#{inputName}]']", context)
    sortInputs.each (index) -> $(this).val index

  $("[data-sortable]").each ->
    context   = $(this)
    inputName = $(this).attr("data-sortable")
    
    reindexSort context, inputName

    $(this).sortable
      items: "fieldset"
      update: (event, ui) -> reindexSort context, inputName