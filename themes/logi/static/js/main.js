/*
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	var	$window = $(window),
		$body = $('body'),
		$main = $('#main');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ],
			xxsmall:  [ null,      '360px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Nav.
		var $nav = $('#nav');

		if ($nav.length > 0) {

			// Shrink effect.
				$main
					.scrollex({
						mode: 'top',
						enter: function() {
							$nav.addClass('alt');
						},
						leave: function() {
							$nav.removeClass('alt');
						},
					});

		}

	// Scrolly.
		$('.scrolly').scrolly({
			speed: 1000
		});

		$('#contrast-switch').click(function(event) {
			$body.toggleClass('high-contrast');
			event.stopPropagation();
			return false;
		});

		if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
			$body.addClass('high-contrast');
		}

		$('#language-switcher li.active a').click(function(event) {
			event.stopPropagation();
			return false;
		})

		$('#navbar-toggler a').click(function (event) {
			$('#nav .nav').toggle()
			event.stopPropagation();
			return false;
		});

		$(document).click(function (event) {
			if ($('#nav .nav').is(':visible') && $('#navbar-toggler a').is(':visible')) {
				$('#nav .nav').toggle()
			}
		})

    // Mailto link
    // Select all links with the attribute 'data-gen-email'
    var emailLinks = document.querySelectorAll('[data-gen-email]');
    var emailAddress = atob("bWFpbHRvOmNvbnRhY3RAbG9naXVuaW9uLmNvbQ==");

    emailLinks.forEach(link => {
        link.onmouseover = link.ontouchstart = () => link.setAttribute('href', emailAddress);
    });


})(jQuery);