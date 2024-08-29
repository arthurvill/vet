@extends('back.layout.EcommerceLayout.headerfooter-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Vet')
@section('content')
  <!-- service section -->
  <section class="service_section layout_padding">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 offset-md-2">
          <h2 class="custom_heading">
            Our <span>Services</span>
          </h2>
          <div class="container layout_padding2">
   
              
            <div class="row">
              <div class="col-md-4">
                <div class="img_box">
                  <img src="/assets petology/images/s-1.png" alt="">
                </div>
                <div class="detail_box">
                  <h6>
                   Check-up
                  </h6>
                  <p>
                  Treat your furry friend to a pampering session at Central Bark, 
                  where our expert groomers will have them looking and feeling their best in no time.
                  </p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="img_box">
                  <img src="/assets petology/images/s-2.png" alt="">
                </div>
                <div class="detail_box">
                  <h6>
                    Vacination
                  </h6>
                  <p>
                  When you're away, you can trust Central Bark to 
                  provide a safe and comfortable stay for your beloved pets, 
                  with attentive care and plenty of love.
                  </p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="img_box">
                  <img src="/assets petology/images/s-3.png" alt="">
                </div>
                <div class="detail_box">
                  <h6>
                    Selling of Pet Products
                  </h6>
                  <p>
                  From pet foods to toys, accessories, and grooming supplies, 
                  find everything you need to keep your pets happy and healthy at Central Bark.
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div>
            <a href="">
              Read More
            </a>
          </div>
        </div>
        <div class="col-md-4">
          <img src="/assets petology/images/tool.png" alt="" class="w-100">
        </div>
      </div>
    </div>
  </section>
  <!-- end service section -->
  @endsection
