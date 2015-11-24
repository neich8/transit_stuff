$(document).ready ->
  $("#schedule").hide()

  $("#trains").change ->
    showAll()
    $("#train-text").empty()
    $("#train-text").removeClass()
    $("#train-text").append(selectedTrain().text()).addClass(getColor(selectedTrain().text()))
    newDropdown(selectedTrain().val())
    return

  $("#stations").change ->
    clearTable()
    selectedStation = $("#stations option:selected").val()
    requestSchedule(selectedStation)
    return

  $("#direction").click ->
    schedule = $("tr.at")
    firstGroupText = schedule.first().find(".direction").text()
    firstGroup = $("tr:contains('#{firstGroupText}')")
    firstGroup.detach()
    $("#schedule tbody").append firstGroup


  selectedTrain = ()->
    $("#trains option:selected")


  requestSchedule = (selectedStation) ->
    clearTable()
    $.get "/stations/#{selectedStation}",{train: selectedTrain().val()} , (data) ->
      $("#schedule").show()
      $.each data, (i, arrival) =>
        display(arrival)
      return

  display = (arrival) ->
    $("#schedule").append "<tr class='at'><td class='text-color'>#{arrival.train}</td><td>#{arrival.time_left} minutes</td><td class='direction'>#{arrival.heading}</td><tr>"


  newDropdown = (train)->
    if train == "false"
      showAll()
    else
      $('#stations option').each (i, element) =>
        if !$(element).hasClass(train)
          $(element).hide()

  clearTable = () ->
    $("#schedule").hide()
    $(".at").each (i, element) =>
      $(element).remove()

  showAll = () ->
    $('#stations option').each (i, element) =>
      $(element).show()

  getColor = (trainText) ->
    train = trainText.split(" ")[0]
    return train.toLowerCase()

