$(document).ready ->

  $("body").show()
  NProgress.start()
  setTimeout (->
    NProgress.done()
    $(".fade").removeClass "out"
    return
  ), 1000

  ###*
  COUNTRY LIST
  ###
$('select#user_country').change (event) ->
    select_wrapper = $('#user_subregion_wrapper')

    $('select', select_wrapper).attr('disabled', true)
    country = $(this).val()

    url = "/users/subregion_options?parent_region=#{country}"
    select_wrapper.load(url)

  ###*
  MENU
  ###
  jQuery("ul.nav li.dropdown").hover (->
    jQuery(this).find(".dropdown-menu").stop(true, true).delay(200).fadeIn()
    jQuery("a").hover ->
      height = jQuery(this).offset()
      jQuery(this).parent().find(".sub-menu").css "top", height.top - +106
      return

    return
  ), ->
    jQuery(this).find(".dropdown-menu").stop(true, true).delay(200).fadeOut()
    return

  jQuery(".btn-navbar").on "click", ->
    jQuery("nav#main_menu > .nav-collapse > ul.navbar-nav").slideDown()
    return

  
  ###*
  TOOLTIP & POPOVER
  ###
  $("[rel=tooltip]").tooltip()
  $("[data-rel=tooltip]").tooltip()
  
  ###*
  CAROUSEL - STOP AUTO CYCLE
  ###
  $(".carousel").carousel interval: false
  
  ###*
  HOVERS
  ###
  $(".hover_img, .hover_colour").on "mouseover", ->
    info = $(this).find("img")
    info.stop().animate
      opacity: 0.1
    , 500
    return

  $(".hover_img, .hover_colour").on "mouseout", ->
    info = $(this).find("img")
    info.stop().animate
      opacity: 1
    , 800
    return

  
  ###*
  BACK TO TOP LINK
  ###
  $(window).scroll ->
    if $(this).scrollTop() > 200
      $(".go-top").fadeIn 200
    else
      $(".go-top").fadeOut 200
    return

  
  # Animate the scroll to top
  $(".go-top").click (event) ->
    event.preventDefault()
    $("html, body").animate
      scrollTop: 0
    , 300
    return

  return


###*
IFRAME
###
$("iframe").each ->
  ifr_source = $(this).attr("src")
  wmode = "wmode=transparent"
  unless ifr_source.indexOf("?") is -1
    getQString = ifr_source.split("?")
    oldString = getQString[1]
    newString = getQString[0]
    $(this).attr "src", newString + "?" + wmode + "&" + oldString
  else
    $(this).attr "src", ifr_source + "?" + wmode
  return


###*
ANIMATIONS
###
$ ->
  $(".welcome").show().addClass "animated fadeInDown"
  $(".welcome_index").show().addClass "animated fadeInDown"
  $(".intro_sections h6").show().addClass "animated fadeInUp"
  $(".fadeinup").show().addClass "animated fadeInUp"
  $(".fadeindown").show().addClass "animated fadeInDown"
  return


###*
PRETTYPHOTO
###
$("a[data-rel]").each ->
  $(this).attr("rel", $(this).attr("data-rel")).removeAttr "data-rel"
  return

$("a[rel^='prettyPhoto']").prettyPhoto()
jQuery("a[rel^='prettyPhoto'], a[rel^='lightbox']").prettyPhoto
  overlay_gallery: false
  social_tools: false
  deeplinking: false
