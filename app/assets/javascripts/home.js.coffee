$("#shareme").sharrre
  share:
    googlePlus: true
    facebook: true
    twitter: true
    linkedin: true
    digg: true
    delicious: true

  enableTracking: true
  buttons:
    googlePlus:
      size: "tall"
      annotation: "bubble"

    facebook:
      layout: "box_count"

    twitter:
      count: "vertical"

    linkedin:
      counter: "top"
    digg:
      type: "DiggMedium"

    delicious:
      size: "tall"

  hover: (api, options) ->
    $(api.element).find(".buttons").show()
    return

  hide: (api, options) ->
    $(api.element).find(".buttons").hide()
    return
