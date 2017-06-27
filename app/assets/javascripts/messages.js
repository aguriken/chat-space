$(function() {
  function buildHTML(message) {

    var html = `<p class="chat-messages__message__header--name" id="li">
                  ${ message.name }
                </p>
                <p class="chat-messages__message__header--time" id="li">
                  ${ message.date }
                </p>
                <p class="chat-messages__message__content" id="li">
                  ${ message.body }
                </p>`;
    return html;
  }
  
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formDate = new FormDate(this);
    var href = window.location.href + '/messages'
    $.ajax({
      url: href,
      type: "POST",
      date: formDate,
      dateType: 'json',
      processDate: false,
      contentType: false
    })
    .done(function(date){
      var html = buildHTML(date);
      $('').append(html)
      $('.chat-footer__body--text').val('')
    })
  })
});
