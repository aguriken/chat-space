$(function() {
  function buildHTML(message) {

    var html = `<li class="chat-messages__message">
                  <div class="chat-messages__message__header">
                    <p class="chat-messages__message__header--name">
                      ${ message.name }
                    </p>
                    <p class="chat-messages__message__header--time" id="li">
                      ${ message.date }
                    </p>
                  </div>
                  <p class="chat-messages__message__content" id="li">
                    ${ message.body }
                  </p>
                </li>`;
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-messages-list').append(html)
      $('.chat-footer__body--text').val('')
    })
    .fail(function(data){
      alert("メッセージを入力してください。");
    })
  })
});
