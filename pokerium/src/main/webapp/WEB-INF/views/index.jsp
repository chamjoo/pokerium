<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>
<script src="/resources/lib/jquery-3.6.0.js"></script>
<script src="/resources/lib/jquery-ui-1.10.3.custom.min.js"></script>
<style>
section {
background:url(/resources/img/icon/background_check.png);
background-repeat : repeat;
}

/* 이미지 슬라이드 */
.d_imgSlides img { object-fit:cover;}
.d_imgSlide { background:#fff; margin:0 auto; height:500px; width:100%; overflow:hidden; border:0; position:relative; z-index:10;}
.d_imgSlides { height:100%; width:100%; position:absolute; }
.d_imgSlides .slide { height:100%; width:100%; overflow:hidden; position:absolute; z-index:11;}
.d_imgSlides .slide img { left:50%; }
.d_slideshowNav a, .d_slideshow-indicator a { background:rgba(0, 0, 0, 0); overflow:hidden; }
.d_slideshowNav a:before { content:url("/resources/img/slides/sprites.png"); display:inline-block; font-size:0; line-height:0; }
.d_slideshow-indicator a:before { content:url("/resources/img/slides/sprites.png"); display:inline-block; font-size:0; line-height:0; }
.d_slideshowNav a { position:absolute; top:50%; left:50%; width:72px; height:72px; margin-top:-36px; z-index:12;}
.d_slideshowNav a.prev { margin-left:-850px; }
.d_slideshowNav a.prev:before { margin-top:-20px; }
.d_slideshowNav a.next { margin-left:770px; }
.d_slideshowNav a.next:before { margin:-20px 0 0 -80px; }
.d_slideshowNav a.disabled { display:none; }

.d_slideshow-indicator { bottom:30px; height:16px; left:0; position:absolute; right:0; text-align:center; }
.d_slideshow-indicator a { display:inline-block; width:16px; height:16px; margin:0 3px; }
.d_slideshow-indicator a.active { cursor:default; }
.d_slideshow-indicator a:before { margin-left:-110px; }
.d_slideshow-indicator a.active:before { margin-left:-130px; }
</style>

<script>
$(document).ready(function() {
	$(".d_imgSlide").each(function() {
		var $container = $(this), 
		$slideGroup = $container.find(".d_imgSlides"),
		$slides = $slideGroup.find(".slide"),
		$nav = $container.find(".d_slideshowNav"),
		$indicator = $container.find(".d_slideshow-indicator"),
		slideCount = $slides.length,
		indicatorHTML = "",
		currentIndex = 0,
		duration = 500,
		easing = "easeInOutExpo",
		interval = 4000,
		timer;

		$slides.each(function(i) {
			$(this).css({ left:100 * i + "%" });
			indicatorHTML += "<a href='#'>" + (i + 1) + "</a>";
		});
		$indicator.html(indicatorHTML);

		function goToSlide(idx) {
			$slideGroup.animate({ left:-100 * idx + "%" }, duration, easing);
			currentIndex = idx;
			updateNav();
		}

		function updateNav() {
			var $navPrev = $nav.find(".prev");
			var $navNext = $nav.find(".next");

			if (currentIndex == 0) {
				$navPrev.addClass("disabled");
			} else {
				$navPrev.removeClass("disabled");
			}
			if (currentIndex == slideCount - 1) {
				$navNext.addClass("disabled");
			} else {
				$navNext.removeClass("disabled");
			}

			$indicator.find("a").removeClass("active").eq(currentIndex).addClass("active");
		}

		function startTimer() {
			timer = setInterval(function() {
				var nextIndex = (currentIndex + 1) % slideCount;
				goToSlide(nextIndex);
			}, interval);
		}
		
		function stopTimer() {
			clearInterval(timer);
		}

		$nav.on("click", "a", function(event) {
			event.preventDefault();

			if ($(this).hasClass("prev")) {
				goToSlide(currentIndex - 1);
			} else {
				goToSlide(currentIndex + 1);
			}
		});

		$indicator.on("click", "a", function(event) {
			event.preventDefault();
			if (!$(this).hasClass("active")) {
				goToSlide($(this).index());
			}
		});

		$container.on({
			mouseenter:stopTimer,
			mouseleave:startTimer
		});

		goToSlide(currentIndex);
		
		startTimer();
	});
});
</script>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	
	<section>
		<div class="d_imgSlide" style="text-align:center;">
			<div class="d_imgSlides">
				<a href="" class="slide" id="slide-1"><img src="/resources/img/slides/slide-1.png" width="100%" height="500" /></a>
				<a href="" class="slide" id="slide-2"><img src="/resources/img/slides/slide-2.png" width="100%" height="500" /></a>
				<a href="" class="slide" id="slide-3"><img src="/resources/img/slides/slide-3.png" width="100%" height="500" /></a>
				<a href="" class="slide" id="slide-4"><img src="/resources/img/slides/slide-4.png" width="100%" height="500" /></a>
				<a href="" class="slide" id="slide-5"><img src="/resources/img/slides/slide-5.png" width="100%" height="500" /></a>
			</div>
			<div class="d_slideshowNav">
				<a href="#" class="prev">Prev</a>
				<a href="#" class="next">Next</a>
			</div>
			<div class="d_slideshow-indicator"></div>
		</div>
		<br>
		<div style="width:100%;height:600px;">
			<H1>소식</H1>	
		</div>
	</section>
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>