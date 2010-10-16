
$(document).ready( function () {

	var results = [];
	var max_question = 0;

	// functions
	var get_question = function(tag) {
		var question = tag.className.match(/c(\d+)(?:\W|$)/);
		return question[1];
	};

	// set up stuff
	$('table.c1').css('display', 'table');
	$('#prev1').attr('disabled', 'disabled');
	var questions = $('.question');
	max_questions = get_question( questions.get( questions.length - 1 ) );
	$('#next' + max_questions).attr('disabled', 'disabled');
	var score = $('span.score');
	var attempted = $('span.attempted');
	var percent = $('span.percent');
	var count = $('span.count');
	var total = $('span.total');

	var set_stats = function(current) {
		var questions = results.length ? results.length - 1 : 0;
		var correct = 0;
		for ( var i = 1; i < results.length; i++ ) {
			if ( results[i] ) correct++;
		}
		score.text(correct);
		attempted.text(questions);
		percent.text( questions ? Math.floor( 100 * correct / questions ) + '%' : '0%' );
		count.text(current);
		total.text(max_questions);
	};
	set_stats(1);

	// set up event handlers
	var answers = $('input.answer');
	answers.click( function() {
		var input = $(this);
		var tbody = input.parent().parent().parent();
		var current_answers = $(".answer", tbody);
		current_answers.parent().removeClass('tick');
		current_answers.parent().removeClass('cross');

		var question = get_question(tbody.get(0));

		if ( input.hasClass('1') ) {
			input.parent().addClass('tick');
			results[question] = true;
		}
		else {
			input.parent().addClass('cross');
			results[question] = false;
		}
		set_stats(question);
	});

	var prev = $('input.prev');
	prev.click(function() {
		var question = get_question(this);
		if (question == 1) {
		}
		else {
			if ( !results[question] ) results[question] = false;
			$('table.c' + question).hide();
			question--;
			$('table.c' + question).show();
		}
		set_stats(question);
	});

	var next = $('input.next');
	next.click(function() {
		var question = get_question(this);
		if (question == max_question) {
		}
		else {
			if ( !results[question] ) results[question] = false;
			$('table.c' + question).hide();
			question++;
			$('table.c' + question).show();
		}
		set_stats(question);
	});

});
