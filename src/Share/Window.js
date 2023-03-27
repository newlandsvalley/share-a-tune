"use strict";

var wrapper = function() {

  return {

    print : function(title) {
       // set the window title temporarily so that it sets the printed document name
       window.document.title = title;
       window.print();
       // and put it back
       window.document.title = "Share a Tune"
    }
    
  }

}();

export var print = wrapper.print;
