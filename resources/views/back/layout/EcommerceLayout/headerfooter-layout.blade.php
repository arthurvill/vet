<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Central Bark</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="/assets petology/css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/assets petology/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="/assets petology/css/responsive.css" rel="stylesheet" />

  <style>
   	 		.light-blue-btn {
        	background-color: #37B5B6; /* Light blue color */
        	color: #fff; /* Text color */
    		}
		</style>
</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <img src="back/images/new logo.png" alt="">
            <span>
              Central Bark
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex mx-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
                <li class="nav-item active">
                  <a class="nav-link" href="{{ route('home') }}">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('ourClinic') }}">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('services') }}">Services</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('ourGallery') }}">Pet's gallery </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('ourShop') }}"> Products </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{{ route('contactUs') }}">Our Location</a>
                </li>
              </ul>
            </div>
            <div class="quote_btn-container  d-flex justify-content-center">
              <button class="btn light-blue-btn" onclick="location.href='{{ route('login') }}'">Login</button>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  <body>
    @yield('content')
  </body>  
  

  <!-- info section -->
  <section class="info_section layout_padding2">
    <div class="container">
      <div class="info_items">
        <a href="">
          <div class="item ">
            <div class="img-box box-1">
              <img src="" alt="">
            </div>
            <div class="detail-box">
              <p>
                Located at Tungkop, Minglanilla, Cebu
              </p>
            </div>
          </div>
        </a>
        <a href="">
          <div class="item ">
            <div class="img-box box-2">
              <img src="" alt="">
            </div>
            <div class="detail-box">
              <p>
                +63 9166322586
              </p>
            </div>
          </div>
        </a>
        <a href="">
          <div class="item ">
            <div class="img-box box-3">
              <img src="" alt="">
            </div>
            <div class="detail-box">
              <p>
                centralbark@gmail.com
              </p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </section>
  <!-- end info_section -->

  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      &copy; 2024 All Rights Reserved By Central Bark Veterinary Clinic
    </p>
  </section>
  <!-- footer section -->

  <script type="text/javascript" src="/assets petology/js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="/assets petology/js/bootstrap.js"></script>
</body>

</html>
