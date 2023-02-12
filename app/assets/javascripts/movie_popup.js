var MoviePopup = {
	setup: function(){
		// add hidden div to the end of the page to display popup
		let popupDiv = $('<div id="movieInfo"></div>');
		popupDiv.hide().appendTo($('body'));
		$(document).on('click', '#movies a', MoviePopup.getMovieInfo);
	},

	getMovieInfo: function(){
		$.ajax({type: 'GET',
				url: $(this).attr('href'),
				timeout: 5000,
				success: MoviePopup.showMovieInfo,
				error: function(xhrObj, textStatus, exception){ alert('Error!'); }
			});
		return(false); // don't process further click
	},
	
	showMovieInfo: function(data, requestStatus, xhrObject){
		// center a floater 1/2 wide and 1/4 tall of the screen
		let oneFourth = Math.ceil($(window).width()/4);
		$('#movieInfo').
			css({'left': oneFourth, 'width': 2*oneFourth, 'top': 250}).
			html(data).
			show();
		// make the Close link in the hidden element work
		$('#closeLink').click(MoviePopup.hideMoveInfo);
		return(false); // prevent default link action
	},

	hideMovieInfo: function(){
		$('#movieInfo').hide();
		return(false);
	}
};

$(MoviePopup.setup);
