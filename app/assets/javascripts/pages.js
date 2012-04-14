jQuery ->
  $(window).scroll ->
	$("#container-bg").html( $(window).scrollTop().alert("test") +" | " + $(document).height().alert("test2") +" | " + $(window).height().alert("test3") );
		alert($('.pagination .next_page').attr('href'));