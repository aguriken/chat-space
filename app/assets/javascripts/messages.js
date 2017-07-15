$(document).on('turbolinks:load', function() {
  function buildHTML(message) {
    if (message.image){
      var image = `< ${ message.image } >`
    } else {
      var image = ''
    };

    var html = `<li class="chat-messages__message">
                  <div class="chat-messages__message__header">
                    <p class="chat-messages__message__header--name">
                      ${ message.name }
                    </p>
                    <p class="chat-messages__message__header--time">
                      ${ message.date }
                    </p>
                  </div>
                  <p class="chat-messages__message__header--picture">
                    <img src="${ message.image }">
                  </p>
                  <p class="chat-messages__message__content">
                    ${ message.body }
                  </p>
                </li>`;
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    // console.log(this)
    // console.log(formData)
    var href = window.location.href
    // console.log(href)
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // console.log(data);
      var html = buildHTML(data);
      // console.log(html);
      $('.chat-messages-list').append(html)
      $('.js-form')[0].reset();
      $('input').prop('disabled', false);
    })
    .fail(function(data){
      alert("メッセージを入力してください。");
      $('input').prop('disabled', false);
    })
  })
});
