<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <link rel="stylesheet" type="text/css"  href="css/uikit.css" >
    <link rel="stylesheet" type="text/css"  href="css/reset.css" >    
    <link rel="stylesheet" type="text/css"  href="css/video.css" >
    <link rel="stylesheet" type="text/css"  href="css/style.css" >

    <script src="js/jquery.min.js"></script>
    <script src="js/uikit.js"></script>
    <script src="js/uikit-icons.js"></script>
    <script src="js/script.js"></script>
    <script src="js/ajax.js"></script>

    <!--스와이퍼슬라이더-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <title>자랑질앱</title>
  
</head>
<script>


    $( document ).ready(function() {
        var response;
        $.ajax({
            url: 'http://1.226.83.35:9090/api/v1/channel/fans/list',
            method: 'GET',
            dataType: 'json',
            data: $("#channelForm").serialize(),
            success: function(response) {
                console.log(response);
                var recomList = response.recomList;
                var recomListSize = response.recomListSize;
                var userChanList = response.channelList;
                var userChanListSize = response.channelListSize;

                var html = "";
                for(var i = 0; i < recomListSize; i++) {
                    var recChannelInfo = recomList[i];
                    console.log(recChannelInfo);
                    html += '<div class="swiper-slide">';
                    html += '  <div class="swp-img" title="비디오 썸네일" style="background-image: url(\'images/thum/thum0'+(i+1)+'.jpg\');"></div> ';
                    html += '      <div class="swp-info">';
                    html += '          <a href="#">';
                    html += '             <img src="images/thum/face0'+(i+1)+'.jpg">';
                    html += '                  <span>'+recChannelInfo.userName+'</span>';
                    html += '          </a>';
                    html += '          <div class="swp-txt ellipsis2">';
                    html += '              '+recChannelInfo.channelDescription+'';
                    html += '          </div>';
                    html += '      </div>';
                    html += '  </div>';
                }

                $("#recomChanList").html(html);
                html = "";

                for(var i = 0; i < userChanListSize; i++) {
                    var userChannelInfo = userChanList[i];
                    html += '   <li>';
                    html += '      <a href="#none">';
                    html += '          <img src="images/thum/face0'+(i+1)+'.jpg">';
                    html += '              <div>'+userChannelInfo.channelName+' <span>'+userChannelInfo.channelDescription+'</span></div>';
                    html += '      </a>';
                    html += '       <button type="button" class="bt_subscribe_blue" onclick="fnUpdateUserFanStat(this,\"'+userChannelInfo.channelId+'\",'+userChannelInfo.userId+'\");">팬</button>';
                    html += '   </li>';
                }
                $("#userChanList").html(html);
            },
            error: function(error) {
                console.log(error);
            }
        });

    });

    function fnUpdateUserFanStat(btn,channel_id,user_id) {

        $("#channelId").val(channel_id);
        $("#userId").val(user_id);

        if($(btn).hasClass("bt_subscribe")) {
            fn_post("channelForm", "channel/fans/ins");
        }
        else {
            fn_post("channelForm", "channel/fans/del");
        }
    }
</script>
<body>
<form id="channelForm" name="channelForm" method="post">
    <input type="hidden" id="userId" name="userId" value="1"/>
    <input type="hidden" id="channelId" name="channelId" value=""/>
</form>
     <!--탑-->
     <div class="top-bx bline">        
         팬    
    </div>
    
        <h3 class="swp-tit">추천채널</h3>
        <!-- Swiper -->
     <div class="swiper mySwiper">
       <div class="swiper-wrapper" id="recomChanList">
        <!--
         <div class="swiper-slide">
           <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum01.jpg);"></div>
           <div class="swp-info">
               <a href="#">
                   <img src="images/thum/face01.jpg">
                   <span>TWICE</span>
               </a>
               <div class="swp-txt ellipsis2">
                   완벽한 궁극의 아이돌 트와이스<span>#트와이스 #TWICE #공연</span> 
               </div>             
           </div>        
         </div>
   
         <div class="swiper-slide">
           <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum02.jpg);"></div>
           <div class="swp-info">
               <a href="#">
                   <img src="images/thum/face02.jpg">
                   <span>newjeans</span>
               </a>
               <div class="swp-txt ellipsis2">
                   홍대 아이돌 뉴진스 댄스 동아리<span>#뉴진스 #댄스동아리</span> 
               </div>             
           </div>        
         </div>
   
         <div class="swiper-slide">
           <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum03.jpg);"></div>
           <div class="swp-info">
               <a href="#">
                   <img src="images/thum/group04.jpg">
                   <span>Nya</span>
               </a>
               <div class="swp-txt ellipsis2">
                   아이돌 트와이스의 공연 #역대급 팬덤<span>#트와이스 #TWICE #공연</span> 
               </div>             
           </div>        
         </div>

         <div class="swiper-slide">
            <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum01.jpg);"></div>
            <div class="swp-info">
                <a href="#">
                    <img src="images/thum/face01.jpg">
                    <span>TWICE</span>
                </a>
                <div class="swp-txt ellipsis2">
                    완벽한 궁극의 아이돌 트와이스<span>#트와이스 #TWICE #공연</span> 
                </div>             
            </div>        
          </div>
    
          <div class="swiper-slide">
            <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum02.jpg);"></div>
            <div class="swp-info">
                <a href="#">
                    <img src="images/thum/face02.jpg">
                    <span>newjeans</span>
                </a>
                <div class="swp-txt ellipsis2">
                    댄스 동아리 트와이스걸<span>#트와이스걸 #댄스동아리</span> 
                </div>             
            </div>        
          </div>
    
          <div class="swiper-slide">
            <div class="swp-img" title="비디오 썸네일" style="background-image: url(images/thum/thum03.jpg);"></div>
            <div class="swp-info">
                <a href="#">
                    <img src="images/thum/group04.jpg">
                    <span>Nya</span>
                </a>
                <div class="swp-txt ellipsis2">
                    아이돌 트와이스의 공연 #역대급 팬덤<span>#트와이스 #TWICE #공연</span> 
                </div>             
            </div>        
          </div>
            -->
       </div>
       <div class="swiper-pagination"></div>
     </div>

   


    <div class="container"> 
        <div class="pan-list">
            <ul id="userChanList">
                <!--
                <li>
                    <a href="#none">
                        <img src="images/thum/face01.jpg">
                        <div>bts.official <span>방탄소년단댄스동아리</span></div>
                    </a>
                    <button type="button" class="bt_subscribe_blue">팬</button>
                </li>
                <li>
                    <a href="#none">
                        <img src="images/thum/face02.jpg">
                        <div>hing Dae <span>홍대여신 공식팬 채널</span></div>
                    </a>
                    <button type="button" class="bt_subscribe_blue">팬</button>
                </li>
                <li>
                    <a href="#none">
                        <img src="images/thum/grup01.jpg">
                        <div>hing Dae.official <span>아이돌 트와이스의 공연</span></div>
                    </a>
                    <button type="button" class="bt_subscribe_blue">팬</button>
                </li>
                <li>
                    <a href="#none">
                        <img src="images/thum/grup03.jpg">
                        <div>hing Dae.official <span>홍대여신 공식팬 채널</span></div>
                    </a>
                    <button type="button" class="bt_subscribe_blue">팬</button>
                </li>
                -->
            </ul>
        </div>
     
    </div>


    <!--구독 버튼-->
    <script>
    // 구독버튼 class로 버튼 요소들 가져오기
    const subscribeButtons = document.querySelectorAll('.bt_subscribe_blue');

    // 각 버튼에 대해 이벤트 리스너 추가
    subscribeButtons.forEach(button => {
        // 클릭 상태를 저장하는 변수
        let isClicked = false;

    button.addEventListener('click', function() {
        if (!isClicked) {
            button.classList.add('bt_subscribe'); // 클릭 시 'bt_subscribe' 클래스 추가
        } else {
            button.classList.remove('bt_subscribe'); // 다시 클릭하면 'bt_subscribe' 클래스 제거
        }
        isClicked = !isClicked; // 클릭 상태 토글
        });
    });
    </script>    
    <!--스와이퍼슬라이더-->
    <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: "2.3",
      spaceBetween: 10,
     
      breakpoints: {
        640: {
          slidesPerView: 2.3,
          spaceBetween: 20,
        },
        768: {
          slidesPerView: 4,
          spaceBetween: 40,
        },
        1024: {
          slidesPerView: 5,
          spaceBetween: 50,
        },
      },
    });
  </script>
</body>

</html>