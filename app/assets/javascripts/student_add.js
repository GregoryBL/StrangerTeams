$(function(){
  $("#all-students-table").on("change", ".teacher-drop-down", updateTableFromDropDown);
});

var updateTableFromDropDown = function(){
  var $that = $(this);
  var studentUrl = $that.parent().attr('action');
  var selectedTeacherId = $that.val();
  var url = studentUrl + "/teachers/" + selectedTeacherId;
  $.ajax({
    method: "patch",
    url: url
  })
  .done(function(data){
    $('#student_row_' + $that.attr('id')).replaceWith(data);
  });
}
