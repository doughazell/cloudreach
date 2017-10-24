jQuery.ajaxSetup({
   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
	this.submit(function() {
    alert('submitWithAjax() in cloudreach.js');
    
    //http://www.w3schools.com/jquery/ajax_post.asp
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
	return this;
};


$(document).ready(function() {
  //alert('$(document).ready javascript func in cloudreach.js');
  $("#new_email").submitWithAjax();
  $("#new_telephone_number").submitWithAjax();
  
  // 14/8/16 DH: Removing flash notices in screen updated by JS.
  setTimeout(function() {
    $('#flash_notice').slideUp();
  }, 3000);

})