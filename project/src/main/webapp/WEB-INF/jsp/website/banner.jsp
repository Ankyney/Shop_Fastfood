<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="static/js/jssor.slider-24.1.5.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jssor_1_slider_init = function() {

            var jssor_1_SlideoTransitions = [
              [{b:900,d:2000,x:-379,e:{x:7}}],
              [{b:900,d:2000,x:-379,e:{x:7}}],
              [{b:-1,d:1,o:-1,sX:2,sY:2},{b:0,d:900,x:-171,y:-341,o:1,sX:-2,sY:-2,e:{x:3,y:3,sX:3,sY:3}},{b:900,d:1600,x:-283,o:-1,e:{x:16}}]
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideDuration: 800,
              $SlideEasing: $Jease$.$OutQuint,
              $CaptionSliderOptions: {
                $Class: $JssorCaptionSlideo$,
                $Transitions: jssor_1_SlideoTransitions
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*responsive code begin*/
            /*remove responsive code if you don't want the slider scales while window resizing*/
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 1920);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*responsive code end*/
        };
    </script>
    <style>
        /* jssor slider bullet navigator skin 05 css */
        /*
        .jssorb05 div           (normal)
        .jssorb05 div:hover     (normal mouseover)
        .jssorb05 .av           (active)
        .jssorb05 .av:hover     (active mouseover)
        .jssorb05 .dn           (mousedown)
        */
        .jssorb05 {
            position: absolute;
        }
        .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
            position: absolute;
            /* size of bullet elment */
            width: 30px;
            height: 30px;
            background: url('static/images/slider/b05.png') no-repeat;
            overflow: hidden;
            cursor: pointer;
        }
        .jssorb05 div { background-position: -7px -7px; }
        .jssorb05 div:hover, .jssorb05 .av:hover { background-position: -37px -7px; }
        .jssorb05 .av { background-position: -67px -7px; }
        .jssorb05 .dn, .jssorb05 .dn:hover { background-position: -97px -7px; }

        .jssora031 {display:block;position:absolute;cursor:pointer;}
        .jssora031 .a {fill:#fff;}
        .jssora031:hover {opacity:.8;}
        .jssora031.jssora031dn {opacity:.5;}
        .jssora031.jssora031ds { opacity: .3; pointer-events: none; }
    </style>

<div class="banner">
	<div class="container">
		<div class="banner-text">
			<div class="col-sm-5 banner-left wow fadeInLeft animated" data-wow-delay=".5s">
				<div class="count main-row">
					<ul id="example">
						<c:forEach var="category" items="${cate6}">
							<a href="searchProduct?cateID=${category.id}">
								<li><span>${category.name}</span></li>
							</a>
						</c:forEach>
					</ul>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-sm-7 banner-right wow fadeInRight animated"	data-wow-delay=".5s">
				<div id="jssor_1" style="position:relative;margin:0 auto;top:-25px;left:0px;width:1800px;height:1100px;overflow:hidden;visibility:hidden;border:7px solid #FFF;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position:absolute;top:300px;left:0px;background:url('static/images/slider/loading.gif') no-repeat 50% 50%;background-color:rgba(0, 0, 0, 0.7);"></div>
        <div data-u="slides" style="cursor:default;position:relative;top:1px;left:0px;width:1800px;height:1100px;overflow:hidden;">
            <div>
                <img data-u="image" src="static/images/slider/slider1.jpg" />
            </div>
            <div>
                <img data-u="image" src="static/images/slider/slider2.jpg" />
            </div>
            <div>
                <img data-u="image" src="static/images/slider/slider3.jpg" />
            </div>
            
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb05" style="bottom:16px;right:16px;" data-autocenter="1">
            <!-- bullet navigator item prototype -->
            <div data-u="prototype" style="width:16px;height:16px;"></div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora031" style="width:50px;height:50px;top:0px;left:20px;" data-autocenter="2">
            <svg viewbox="-12986 -2977 16000 16000" style="width:100%;height:100%;">
                <polygon class="a" points="-1182.1,12825.5 -792,12435.4 -8204.5,5023 -792,-2389.4 -1182.1,-2779.5 -8984.8,5023"></polygon>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora031" style="width:50px;height:50px;top:0px;right:20px;" data-autocenter="2">
            <svg viewbox="-12986 -2977 16000 16000" style="width:100%;height:100%;">
                <polygon class="a" points="-8594.7,12825.5 -8984.8,12435.4 -1572.3,5023 -8984.8,-2389.4 -8594.7,-2779.5 -792,5023"></polygon>
            </svg>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>