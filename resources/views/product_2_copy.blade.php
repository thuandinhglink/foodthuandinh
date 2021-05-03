<!DOCTYPE html>

<html lang="en">



    

<!-- Mirrored from shreethemes.in/landrick/layouts/index-classic-saas.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Aug 2020 05:20:42 GMT -->

<head>

        <meta charset="utf-8" />
        @foreach($metaTagData as$value)
            <meta {{$value['attr']}}="{{$value['value']}}" content="{{$value['content']}}" />
        @endforeach
        <title>{{$page_title}}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />

        <meta name="keywords" content="Saas, Software, multi-uses, HTML, Clean, Modern" />

        <meta name="author" content="Shreethemes" />

        <meta name="email" content="shreethemes@gmail.com" />

        <meta name="website" content="http://www.shreethemes.in/" />

        <meta name="Version" content="v2.5.1" />

        <!-- favicon -->

        <link rel="shortcut icon" href="images/favicon.ico">

        <!-- Bootstrap -->

        <link href="{{$resource_path}}css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Icons -->

        <link href="{{$resource_path}}css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="../../../unicons.iconscout.com/release/v2.1.9/css/unicons.css">

        <!-- Magnific -->

        <link href="{{$resource_path}}css/magnific-popup.css" rel="stylesheet" type="text/css" />

        <!-- Slider -->               

        <link rel="stylesheet" href="{{$resource_path}}css/owl.carousel.min.css"/> 

        <link rel="stylesheet" href="{{$resource_path}}css/owl.theme.default.min.css"/> 

        <!-- Main Css -->

        <link href="{{$resource_path}}css/style.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <link href="{{$resource_path}}css/colors/default.css" rel="stylesheet" id="color-opt">

        <link rel="stylesheet" href="{{$resource_path}}css/slick.css"/> 

        <link rel="stylesheet" href="{{$resource_path}}css/slick-theme.css"/>

        <link href="{{$resource_path}}css/flexslider.css" rel="stylesheet" type="text/css" />

    </head>



    <body>

    <header id="topnav" class="defaultscroll sticky">
    <div class="container">
        <?php $logo= json_decode('{"file":"606e8ec7e4ba1.png"}', true); $logo['multipleData'] = json_decode('[]', true); ?><div>
    <a class="logo" href="index.html">
        <img src="{{$file_path}}{{$logo['file']}}" height="24" alt="">
    </a>
</div>                 
<div class="buy-button">
    <a href="https://1.envato.market/4n73n" target="_blank" class="btn btn-primary">Buy Now</a>
</div><?php $menu= json_decode('[]', true); $menu['multipleData'] = json_decode('[]', true); ?><?php $widgetUseData = json_decode('[{"id":2,"name":"main menu","description":null,"created_at":"2021-03-22 10:03:54","updated_at":"2021-03-22 15:24:18","chidData":[{"id":1,"name":"Home","menu_id":2,"parent_id":null,"type":2,"page_id":31,"type_show":null,"index":0,"created_at":"2021-03-22 15:43:25","updated_at":"2021-03-24 12:53:27","link":"home","chidData":[]},{"id":23,"name":"Tin m\u1edbi","menu_id":2,"parent_id":null,"type":3,"page_id":60,"type_show":1,"index":0,"created_at":"2021-03-24 14:56:11","updated_at":"2021-03-24 14:56:11","link":"hot","chidData":[]},{"id":27,"name":"Page","menu_id":2,"parent_id":null,"type":1,"page_id":null,"type_show":null,"index":1,"created_at":"2021-03-26 10:28:40","updated_at":"2021-03-26 10:28:40","link":"#","chidData":[{"id":34,"name":"Tin m\u1edbi","menu_id":2,"parent_id":27,"type":3,"page_id":60,"type_show":0,"index":1,"created_at":"2021-03-26 10:41:29","updated_at":"2021-03-26 10:41:29","link":"hot","chidData":[],"colspan":1},{"id":38,"name":"Qu\u1ea7n \u00e1o","menu_id":2,"parent_id":27,"type":4,"page_id":61,"type_show":0,"index":1,"created_at":"2021-03-26 10:48:58","updated_at":"2021-03-26 10:48:58","link":"shirt","chidData":[],"colspan":1},{"id":46,"name":"Th\u1eddi trang","menu_id":2,"parent_id":27,"type":4,"page_id":62,"type_show":1,"index":1,"created_at":"2021-04-13 11:40:33","updated_at":"2021-04-13 11:44:41","link":"non","chidData":[],"colspan":1},{"id":47,"name":"Summer Collection","menu_id":2,"parent_id":27,"type":6,"page_id":14,"type_show":null,"index":2,"created_at":"2021-04-13 11:44:58","updated_at":"2021-04-13 11:44:58","link":"summer","chidData":[],"colspan":1}]},{"id":14,"name":"Home","menu_id":2,"parent_id":null,"type":2,"page_id":31,"type_show":null,"index":2,"created_at":"2021-03-24 11:11:38","updated_at":"2021-03-24 11:11:38","link":"home","chidData":[]}]}]', true); ?><div id="navigation">
	<ul class="navigation-menu">
		@foreach($widgetUseData[0]['chidData'] as $value)
			@if($value['type'] == 1)
				<li class="has-submenu">
		            <a href="javascript:void(0)">{{$value["name"]}}</a><span class="menu-arrow"></span>
		            <ul class="submenu">
		            	@foreach($value["chidData"] as $valueChid1)
			            	@if($valueChid1['type'] == 1)
			                	<li class="has-submenu"><a href="javascript:void(0)"> {{$valueChid1["name"]}}</a><span class="submenu-arrow"></span>
                                    <ul class="submenu">
                                    	@foreach($valueChid1["chidData"] as $valueChid2)
			            					@if($valueChid2['type'] == 1)
			            						<li class="has-submenu"><a href="javascript:void(0)"> {{$valueChid2["name"]}}</a><span class="submenu-arrow"></span>
		            							<ul class="submenu">
				            						@foreach($valueChid2["chidData"] as $valueChid3)
				            							@if($valueChid3['type'] == 1)
						            						<li><a href="javascript:void(0)"> {{$valueChid3["name"]}}</a></li>
						            					@else
						            						<li><a href="{{$valueChid3['link']}}"> {{$valueChid3["name"]}}</a></li>
						            					@endif
				            						@endforeach
				            					</ul>
			            					@else
			            						<li><a href="{{$valueChid2['link']}}"> {{$valueChid2["name"]}}</a></li>
			                				@endif
		                				@endforeach
                                    </ul> 
                                </li>
			                @else
			                	<li><a href="{{$valueChid1['link']}}">{{$valueChid1["name"]}}</a></li>
			                @endif
		                @endforeach
		            </ul>
		        </li>
			@else
				<li><a href="{{$value['link']}}">{{$value["name"]}}</a></li>
			@endif
		@endforeach
	</ul>
</div>
    </div>
</header><?php $product_detail= json_decode('[]', true); $product_detail['multipleData'] = json_decode('[]', true); ?><?php $widgetUseData = json_decode('[]', true); ?><section class="bg-half bg-light d-table w-100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12 text-center">
                <div class="page-next-level">
                    <h4 class="title"> {{$currentProductData["name"]}} </h4>
                    <div class="page-next">
                        <nav aria-label="breadcrumb" class="d-inline-block">
                            <ul class="breadcrumb bg-white rounded shadow mb-0">
                                <li class="breadcrumb-item"><a href="index.html">Landrick</a></li>
                                <li class="breadcrumb-item"><a href="index-shop.html">Shop</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Product Details</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div> <!--end container-->
</section><!--end section-->
<div class="position-relative">
    <div class="shape overflow-hidden text-white">
        <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
        </svg>
    </div>
</div>
<!-- Hero End -->
<section class="section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-5">
                <div class="slider slider-for">
                    @foreach($currentProductData["image"] as $value)
                        <div><img src="{{$file_path}}{{$value['url']}}" class="img-fluid rounded" alt=""></div>
                    @endforeach
                </div>
                <div class="slider slider-nav">
                    @foreach($currentProductData["image"] as $value)
                        <div><img src="{{$file_path}}{{$value['url']}}" class="img-fluid" alt=""></div>
                    @endforeach
                </div>
            </div><!--end col-->

            <div class="col-md-7 mt-4 mt-sm-0 pt-2 pt-sm-0">
                <div class="section-title ml-md-4">
                    <h4 class="title">{{$currentProductData["name"]}}</h4>
                    <h5 class="text-muted">$21.00 <del class="text-danger ml-2">$25.00</del> </h5>
                    <ul class="list-unstyled text-warning h5 mb-0">
                        <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                        <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                        <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                        <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                        <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    </ul>
                    
                    <h5 class="mt-4 py-2">Overview :</h5>
                    {!!$currentProductData["content"]!!}

                    <div class="row mt-4 pt-2">
                        @foreach($currentProductData["properties"] as $value)
                        
                            <div class="col-lg-6 col-12">
                                <div class="d-flex align-items-center">
                                    <h6 class="mb-0">{{$value["options_name"]}}:</h6>
                                    <ul class="list-unstyled mb-0 ml-3">
                                        @foreach($value["propertiesValue"] as $propertiesValue)
                                            <li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-icon btn-soft-primary">{{$propertiesValue["name"]}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div><!--end col-->
                            
                        @endforeach
                        

                        <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                            <div class="d-flex shop-list align-items-center">
                                <h6 class="mb-0">Quantity:</h6>
                                <div class="ml-3">
                                    <input type="button" value="-" class="minus btn btn-icon btn-soft-primary font-weight-bold">
                                    <input type="text" step="1" min="1" name="quantity" value="1" title="Qty" class="btn btn-icon btn-soft-primary font-weight-bold">
                                    <input type="button" value="+" class="plus btn btn-icon btn-soft-primary font-weight-bold">
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="mt-4 pt-2">
                        <a href="javascript:void(0)" class="btn btn-primary">Shop Now</a>
                        <a href="shop-cart.html" class="btn btn-soft-primary ml-2">Add to Cart</a>
                    </div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->

    <div class="container mt-100 mt-60">
        <div class="row">
            <div class="col-12">
                <h5 class="mb-0">Related Products</h5>
            </div><!--end col-->

            <div class="col-12 mt-4">
                <div id="client-four" class="owl-carousel owl-theme">
                    @foreach($currentProductData["related"] as $value)
                    <div class="card shop-list border-0 position-relative overflow-hidden m-2">
                        <div class="shop-image position-relative overflow-hidden rounded shadow">
                            <a href="{{$public_path}}{{$value['link']}}"><img src="{{$file_path}}{{$value['avatar']}}" class="img-fluid" alt=""></a>
                            <a href="{{$public_path}}{{$value['link']}}" class="overlay-work">
                                <img src="{{$file_path}}{{$value['avatar']}}" class="img-fluid" alt="">
                            </a>
                            <ul class="list-unstyled shop-icons">
                                <li><a href="javascript:void(0)" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                                <li class="mt-2"><a href="{{$public_path}}{{$value['link']}}" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                <li class="mt-2"><a href="{{$public_path}}{{$value['link']}}" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                            </ul>
                        </div>
                        <div class="card-body content pt-4 p-2">
                            <a href="shop-product-detail.html" class="text-dark product-name h6">{{$value["name"]}}</a>
                            <div class="d-flex justify-content-between mt-1">
                                <h6 class="text-muted small font-italic mb-0 mt-1">{{$currentProductData["price"]}}<del class="text-danger ml-2">{{$currentProductData["compare_price"]}}</del> </h6>
                                <ul class="list-unstyled text-warning mb-0">
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </div><!--end container-->
</section><footer class="footer">
    <div class="container">
        <div class="row">
            <?php $footer= json_decode('[]', true); $footer['multipleData'] = json_decode('[]', true); ?><div class="col-lg-4 col-12 mb-0 mb-md-4 pb-0 pb-md-2">
    <a href="#" class="logo-footer">
        <img src="{{$resource_path}}images/logo-light.png" height="24" alt="">
    </a>
    <p class="mt-4">Start working with Landrick that can provide everything you need to generate awareness, drive traffic, connect.</p>
    <ul class="list-unstyled social-icon social mb-0 mt-4">
        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
    </ul><!--end icon-->
</div>

<div class="col-lg-2 col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
    <h4 class="text-light footer-head">Company</h4>
    <ul class="list-unstyled footer-list mt-4">
        <li><a href="page-aboutus.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> About us</a></li>
        <li><a href="page-services.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Services</a></li>
        <li><a href="page-team.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Team</a></li>
        <li><a href="page-pricing.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Pricing</a></li>
        <li><a href="page-work-modern.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Project</a></li>
        <li><a href="page-jobs.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Careers</a></li>
        <li><a href="page-blog-grid.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Blog</a></li>
        <li><a href="auth-cover-login.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Login</a></li>
    </ul>
</div>

<div class="col-lg-3 col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
    <h4 class="text-light footer-head">Usefull Links</h4>
    <ul class="list-unstyled footer-list mt-4">
        <li><a href="page-terms.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Terms of Services</a></li>
        <li><a href="page-privacy.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Privacy Policy</a></li>
        <li><a href="documentation.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Documentation</a></li>
        <li><a href="changelog.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Changelog</a></li>
        <li><a href="components.html" class="text-foot"><i class="mdi mdi-chevron-right mr-1"></i> Components</a></li>
    </ul>
</div>

<div class="col-lg-3 col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
    <h4 class="text-light footer-head">Newsletter</h4>
    <p class="mt-4">Sign up and receive the latest tips via email.</p>
    <form>
        <div class="row">
            <div class="col-lg-12">
                <div class="foot-subscribe form-group position-relative">
                    <label>Write your email <span class="text-danger">*</span></label>
                    <i data-feather="mail" class="fea icon-sm icons"></i>
                    <input type="email" name="email" id="emailsubscribe" class="form-control pl-5 rounded" placeholder="Your email : " required>
                </div>
            </div>
            <div class="col-lg-12">
                <input type="submit" id="submitsubscribe" name="send" class="btn btn-soft-primary btn-block" value="Subscribe">
            </div>
        </div>
    </form>
</div>
        </div>
    </div>
</footer><footer class="footer footer-bar">
    <div class="container text-center">
        <div class="row align-items-center">
            <?php $copyright= json_decode('[]', true); $copyright['multipleData'] = json_decode('[]', true); ?><div class="col-sm-6">
    <div class="text-sm-left">
        <p class="mb-0">© 2019-20 Landrick. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="http://www.shreethemes.in/" target="_blank" class="text-reset">Shreethemes</a>.</p>
    </div>
</div><!--end col-->

<div class="col-sm-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
    <ul class="list-unstyled text-sm-right mb-0">
        <li class="list-inline-item"><a href="javascript:void(0)"><img src="{{$resource_path}}payments/american-ex.png" class="avatar avatar-ex-sm" title="American Express" alt=""></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)"><img src="{{$resource_path}}payments/discover.png" class="avatar avatar-ex-sm" title="Discover" alt=""></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)"><img src="{{$resource_path}}payments/master-card.png" class="avatar avatar-ex-sm" title="Master Card" alt=""></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)"><img src="{{$resource_path}}payments/paypal.png" class="avatar avatar-ex-sm" title="Paypal" alt=""></a></li>
        <li class="list-inline-item"><a href="javascript:void(0)"><img src="{{$resource_path}}payments/visa.png" class="avatar avatar-ex-sm" title="Visa" alt=""></a></li>
    </ul>
</div>
        </div>
    </div>
</footer>

        <!-- Start Style switcher -->

        <div id="style-switcher" style="left: 0px;" class="bg-light border p-3 pt-2 pb-2">

            <h3 class="title text-center">Select Your Color</h3>

            <ul class="pattern text-center mb-2">

                <li class="list-inline-item">

                    <a class="default" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="green" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="purple" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="red" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="skyblue" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="skobleoff" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="cyan" href="#"></a>

                </li>

                <li class="list-inline-item">

                    <a class="slateblue" href="#"></a>

                </li>

            </ul>



            <h3 class="title text-center pt-3 mb-0 border-top">Theme Option</h3>

            <div class="text-center">

                <a href="#" class="btn btn-sm w-100 btn-primary rtl-version t-rtl-light mt-2">RTL</a>

                <a href="#" class="btn btn-sm w-100 btn-primary ltr-version t-ltr-light mt-2">LTR</a>

                <a href="#" class="btn btn-sm w-100 btn-primary dark-rtl-version t-rtl-dark mt-2">RTL</a>

                <a href="#" class="btn btn-sm w-100 btn-primary dark-ltr-version t-ltr-dark mt-2">LTR</a>

                <a href="#" class="btn btn-sm w-100 btn-dark dark-version t-dark mt-2">Dark</a>

                <a href="#" class="btn btn-sm w-100 btn-dark light-version t-light mt-2">Light</a>

            </div>

            <div class="bottom">

                <a href="#" class="settings bg-white shadow d-block"><i class="mdi mdi-cog ml-1 mdi-24px position-absolute mdi-spin text-primary"></i></a>

            </div>

        </div>

        <!-- End Style switcher -->



        <!-- Back to top -->

        <a href="#" class="btn btn-icon btn-soft-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>

        <!-- Back to top -->



        <!-- javascript -->

        <script src="{{$resource_path}}js/jquery-3.5.1.min.js"></script>

        <script src="{{$resource_path}}js/bootstrap.bundle.min.js"></script>

        <script src="{{$resource_path}}js/jquery.easing.min.js"></script>

        <script src="{{$resource_path}}js/scrollspy.min.js"></script>

        <!-- Magnific Popup -->

        <script src="{{$resource_path}}js/jquery.magnific-popup.min.js"></script>

        <script src="{{$resource_path}}js/magnific.init.js"></script>

        <!-- SLIDER -->

        <script src="{{$resource_path}}js/owl.carousel.min.js"></script>

        <script src="{{$resource_path}}js/owl.init.js"></script>

        <script src="{{$resource_path}}js/slick.min.js"></script>

        <script src="{{$resource_path}}js/slick.init.js"></script>

        <script src="{{$resource_path}}js/jquery.flexslider-min.js"></script>

        <script src="{{$resource_path}}js/flexslider.init.js"></script>

        <!-- Counter -->

        <script src="{{$resource_path}}js/counter.init.js"></script>

        <!-- Icons -->

        <script src="{{$resource_path}}js/feather.min.js"></script>

        <script src="{{$resource_path}}../../../unicons.iconscout.com/release/v2.1.9/script/monochrome/bundle.js"></script>

        <!-- Switcher -->

        <script src="{{$resource_path}}js/switcher.js"></script>

        <!-- Main Js -->

        <script src="{{$resource_path}}js/app.js"></script>

    </body>



<!-- Mirrored from shreethemes.in/landrick/layouts/index-classic-saas.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Aug 2020 05:20:55 GMT -->

</html>