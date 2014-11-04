(function() {
  CKEDITOR.editorConfig = function(config) {
    config.language = 'en';
    config.width = '';
    config.height = '';
    config.toolbar_Pure = [
      {
        name: 'basicstyles',
        items: ['Bold', 'Italic', 'Underline', 'Strike']
      }, {
        name: 'paragraph',
        items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
      }, '/', {
        name: 'styles',
        items: ['Styles', 'Format', 'Font', 'FontSize']
      }, {
        name: 'colors',
        items: ['TextColor', 'BGColor']
      }
    ];
    config.toolbar = 'Pure';
    return true;
  };

}).call(this);
