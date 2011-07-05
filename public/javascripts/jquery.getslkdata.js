/********************************************************/
/* getSlkData usage:                                    */
/* $('#selectorOfElementToReplace').getSlkData(options) */
/* options = {'site':'slkdemos', 'slug':'page-slug'}    */
/********************************************************/

(function($){
  $.fn.getSlkData = function( options ) {  

    var settings = {
      'server' : 'ajax.slkdesign.net',
      'site'   : 'slkdemos',
      'slug'   : 'example'
    };

    return this.each(function() {        
      // If options exist, lets merge them with the defaults
      if ( options ) { 
        $.extend( settings, options );
      }
      var modal_container = $(this);
      var url = 'http://'+settings['server']+'/pages/'+settings['site']+'/'+settings['slug']+'.jsonp?callback=?'
      jQuery.getJSON(url, function(data) {
        modal_container.html(data);
      });
    });
    
  };
})( jQuery );