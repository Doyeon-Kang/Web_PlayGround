

$(document).ready(function() {
    $(".navbar__logo").click(function() {
        location.href="user_main.jsp";
    }); 

    const navbar = document.querySelector('#navbar');
    const navbarHeight = navbar.getBoundingClientRect().height;

    document.addEventListener('scroll', () => {
        if(window.scrollY > navbarHeight) {
            $('#navbar').addClass('navbar--dark');
        } else {
            navbar.classList.remove('navbar--dark');
        }
    });
    
    const arrowUp = document.querySelector('.arrow-up');
	document.addEventListener('scroll', () => {
    if(window.scrollY > (navbarHeight/2)) {
        arrowUp.classList.add('visible');
    } else {
        arrowUp.classList.remove('visible');
    }
    
    //Handle click on the "arrow up" button
	arrowUp.addEventListener('click', () => {
	    scrollIntoView('#home');
	})
	
	function scrollIntoView(selector) {
	    const scrollTo = document.querySelector(selector);
	    scrollTo.scrollIntoView({behavior: 'smooth'});
	}
});
});
