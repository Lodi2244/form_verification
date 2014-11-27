(function() {
  var FormVerification = function() {}

  // Delegate submit handler to the body
  //
  FormVerification.prototype.addHandler = function() {
    $('body').on('submit', 'form', $.proxy(this.onSubmit, this))
  }

  // On form submission, set the value attribute of the verification token field
  // with the `data-value` attribute content
  //
  FormVerification.prototype.onSubmit = function(event) {
    var $form = $(event.currentTarget);
    var $tokenField = $form.find('[name="_verification_token"]');

    if($tokenField.length && !$tokenField.val()) {
      $tokenField.val($tokenField.data('value'));
    }
  };

  $.formVerification = function() {
    return new FormVerification();
  }
})();
