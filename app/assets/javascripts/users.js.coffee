$("input[type=\"file\"]").inputfile
  uploadText: "<i class=\"fa fa-folder-open-o\"></i> Select a file"
  removeText: "<i class=\"fa fa-trash-o\"></i>"
  restoreText: "<i class=\"fa fa-remove\"></i>"
  uploadButtonClass: "btn btn-primary"
  removeButtonClass: "btn btn-danger"

$("#birthday").datepicker()  unless Modernizr.inputtypes.date
