$(document).on('turbolinks:load', function() {
  function buildHTML(user) {
    var html = `<li class="chat-group-user">
                  <div class="chat-group-user__name">${ user.name }</div>
                  <div class="chat-group-user__btn chat-group-user__btn--add" data-name="${ user.name }" data-id="${ user.id }">追加</div>
                </li>`;
    return html;
  }

  function removeHTML(name, id) {
    var html = `<li class="chat-group-user">
                  <div class="chat-group-user__name">${ name }</div>
                  <div class="chat-group-user__btn chat-group-user__btn--remove" data-name="${ name }" data-id="${ id }">削除</div>
                  <input type='hidden' value="${ id }" name="group[user_ids][]">
                </li>`;
    return html;
  }

  $(document).on('click', '.chat-group-user__btn--add', function(e){
    var name = $(this).data('name');
    var id = $(this).data('id');
    var removeHtml = removeHTML(name,id);
    $('#chat-group-users').append(removeHtml);
    $(this).parent().remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function(e){
     var user = {name: $(this).data('name'), id: $(this).data('id')};
     $("#user-search-result").append(buildHTML(user));
    $(this).parent().remove();
  });

  var beforeWord = "";
  $('#user_ids').on('keyup', function(e) {
    var keyword = $(this).val();
    if(beforeWord != keyword){
      beforeWord = keyword;
      $.ajax({
        type: 'GET',
        url: '/users/search',
        data: {keyword: keyword},
        dataType: 'json'
      })
      .done(function(data) {
        var html = "";
        var usersList = $('#user-search-result li');
        if(usersList)usersList.remove();
        if(keyword.length != 0)
        $.each(data.users, function(i,user){
          html += buildHTML(user);
        });
        $('#user-search-result').append(html);
      })
      .fail(function() {
        alert("error");
      });
    }
    return false;
  });
});
