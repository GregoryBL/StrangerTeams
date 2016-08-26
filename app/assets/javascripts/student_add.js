$(function(){
  $("#all-students-table").on("change", ".teacher-drop-down", updateTableFromDropDown);

  $("#all-students-table").on("submit", ".add-form, .remove-form", addStudent)
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
    var IDOfRowToReplace = $(data).attr("id")
    $('#' + IDOfRowToReplace).replaceWith(data);
  });
}

var addStudent = function(event){
  event.preventDefault();
  var $that = $(this);
  $.ajax({
    url: $that.attr('action'),
    method: "patch"
  })
  .done(function(data){
    var IDOfRowToReplace = $(data).attr("id");
    console.log($("#all-students-table").parent().attr("id"))
    if ($("#all-students-table").parent().attr("id") != "teacher-profile-students-table") {
      $('#' + IDOfRowToReplace).replaceWith(data);
    } else {
      $('#' + IDOfRowToReplace).remove();
    }
  })
}
