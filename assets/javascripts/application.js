$(function(){
	var bl = new Blacklight();
});
	function makeFolderLinks(){
		$('.addFolderForm .submitForm').click(function(e){
			e.preventDefault();
			var el=$(this);
			el.parent().ajaxSubmit({
				success:function(){
					el.parent().html('This item is in <a href="/folder">Marked List</a>')
				}
			});
		})
	}
$(document).ready(function() {
  // adds classes for zebra striping table rows
  $('table.zebra tr:even').addClass('zebra_stripe');
  $('ul.zebra li:even').addClass('zebra_stripe');
	makeFolderLinks();

});
