// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// install bootstrap and dependencies
import "bootstrap"
// install fonteawesome
import "@fortawesome/fontawesome-free";

import jquery from 'jquery';

window.jQuery = jquery
window.$ = jquery


document.addEventListener("DOMContentLoaded", function(){
  var scene = $('.scene').get(0);
  var parallaxInstance = new Parallax(scene);

  var scene2 = $('.scene2').get(0);
  var parallaxInstance2 = new Parallax(scene2);
});


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

// Start changing text animation
const elts = {
    text1: document.getElementById("text1"),
    text2: document.getElementById("text2")
};

const texts = [
    "If",
    "You",
    "Like",
    "to",
    "contact me",
    "just",
    "click",
    "the", 
    "button",
    ";)"
];

const morphTime = 1;
const cooldownTime = 0.25;

let textIndex = texts.length - 1;
let time = new Date();
let morph = 0;
let cooldown = cooldownTime;

elts.text1.textContent = texts[textIndex % texts.length];
elts.text2.textContent = texts[(textIndex + 1) % texts.length];

function doMorph() {
    morph -= cooldown;
    cooldown = 0;

    let fraction = morph / morphTime;

    if (fraction > 1) {
        cooldown = cooldownTime;
        fraction = 1;
    }

    setMorph(fraction);
}

function setMorph(fraction) {
    elts.text2.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
    elts.text2.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

    fraction = 1 - fraction;
    elts.text1.style.filter = `blur(${Math.min(8 / fraction - 8, 100)}px)`;
    elts.text1.style.opacity = `${Math.pow(fraction, 0.4) * 100}%`;

    elts.text1.textContent = texts[textIndex % texts.length];
    elts.text2.textContent = texts[(textIndex + 1) % texts.length];
}

function doCooldown() {
    morph = 0;

    elts.text2.style.filter = "";
    elts.text2.style.opacity = "100%";

    elts.text1.style.filter = "";
    elts.text1.style.opacity = "0%";
}

function animate() {
    requestAnimationFrame(animate);

    let newTime = new Date();
    let shouldIncrementIndex = cooldown > 0;
    let dt = (newTime - time) / 1000;
    time = newTime;

    cooldown -= dt;

    if (cooldown <= 0) {
        if (shouldIncrementIndex) {
            textIndex++;
        }

        doMorph();
    } else {
        doCooldown();
    }
}

animate();
};

