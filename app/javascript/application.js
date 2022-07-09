// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// install bootstrap and dependencies
import "bootstrap"
// install fonteawesome
import "@fortawesome/fontawesome-free";

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

document.onreadystatechange = function() {
  var paperMenu = {
		$window: $('#paper-window'),
		$paperFront: $('#paper-front'),
		$hamburger: $('.hamburger'),
		offset: 1800,
		pageHeight: $('#paper-front').outerHeight(),
		
		open: function() {
			this.$window.addClass('tilt');
			this.$hamburger.off('click');
			$('#container, .hamburger').on('click', this.close.bind(this));
			this.hamburgerFix(true);
			console.log('opening...');
		},
		close: function() {
			this.$window.removeClass('tilt'); 
			$('#container, .hamburger').off('click');
			this.$hamburger.on('click', this.open.bind(this));
			this.hamburgerFix(false);
			console.log('closing...');
		},
		updateTransformOrigin: function() {
			var scrollTop = this.$window.scrollTop();
			var equation = (scrollTop + this.offset) / this.pageHeight * 100;
			this.$paperFront.css('transform-origin', 'center ' + equation + '%');
		},
		//hamburger icon fix to keep its position
		hamburgerFix: function(opening) {
				if(opening) {
					$('.hamburger').css({
						position: 'absolute',
						top: this.$window.scrollTop() + 30 + 'px'
					});
				} else {
					setTimeout(function() {
						$('.hamburger').css({
							position: 'fixed',
							top: '30px'
						});
					}, 300);
				}
			},
		bindEvents: function() {
			this.$hamburger.on('click', this.open.bind(this));
			$('.close').on('click', this.close.bind(this));
			this.$window.on('scroll', this.updateTransformOrigin.bind(this));
		},
		init: function() {
			this.bindEvents();
			this.updateTransformOrigin();
		},
	};

paperMenu.init();
};