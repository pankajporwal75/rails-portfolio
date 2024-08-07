customConfirmationWithJqueryConfirm = function () {
  $.rails.allowAction = function (link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };

  $.rails.confirmed = function (link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };

  $.rails.showConfirmDialog = function (link) {
    var message;
    message = link.attr('data-confirm');
    $.confirm({
      title: 'Confirm Deletion',
      backgroundDismiss: true,
      content: message, // Use the stored confirm message
      buttons: {
        confirm: {
          text: 'Yes',
          action: function () {
            link.removeAttr('data-confirm'); // Ensure UJS does not interfere
            $.rails.confirmed(link);
          }
        },
        cancel: {
          text: 'No',
          action: function () {
          }
        }
      }
    });
  };
};

$(document).on('DOMContentLoaded', function () {
  customConfirmationWithJqueryConfirm();
});