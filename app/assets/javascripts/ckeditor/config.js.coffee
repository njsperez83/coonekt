CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = ''
  config.height = ''
  config.toolbar_Pure = [
    #{ name: 'document',    items: [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
    #{ name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    #{ name: 'editing',     items: [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
    #{ name: 'tools',       items: [ 'Maximize', 'ShowBlocks','-','About' ] }
    #'/',
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
    '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    #{ name: 'insert',      items: [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
  ]
  config.toolbar = 'Pure'
  true

