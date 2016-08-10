//= require form_verification/plugin

(function() {
  // Add Handler on document page:change, and ensure it is reattached
  //
  $(document).on('page:change turbolinks:load', function() {
    $.formVerification().addHandler();
  });
})();
