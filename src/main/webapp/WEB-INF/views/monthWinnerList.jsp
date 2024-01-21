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

    <title>자랑질앱</title>
    <style>
      
    </style>
</head>
<script>

    $( document ).ready(function() {
        fn_createDiv();
    });

    function fn_createDiv() {

        $.ajax({
            url: 'http://localhost:9090/api/v1/win/month/list/old',
            method: 'GET',
            dataType: 'json',
            data: $("#monthForm").serialize(),
            success: function(response) {
                var winPredMList = response.winPredMList;
                console.log(winPredMList);
                var html = "";

                for(var i = 0; i < winPredMList.length; i++) {
                    var winPredInfo = winPredMList[i];
                    console.log(winPredInfo);
                    html += '<li>';
                    html += '    <div class="rank-num"><strong>'+(i+1)+'.</strong>'+winPredInfo.video_score+' <span>/ '+winPredInfo.video_score_cnt+'명</span></div>';
                    html += '    <div class="bigthum">';

                    if(i == 0 ) {
                        html += '       <div class="rank-badge">';
                        html += '            <img src="images/icon/m-winner.png">';
                        html += '        </div>';
                    }

                    html += '        <img src="images/thum/thum0'+(i+1)+'.jpg" class="thum">';
                    html += '   </div>';
                    html += '    <div class="list-tit ellipsis2">';
                    html += '        '+winPredInfo.video_description+'<span>'+winPredInfo.video_tags+'</span>';
                    html += '    </div>';
                    html += '    <div class="list-name">';
                    html += '        <a href="91-2채널.html">';
                    html += '           <img class="small-thum mr5" src="images/thum/face0'+(i+1)+'.jpg">';
                    html += '                '+winPredInfo.channel_name;
                    html += '       </a>';
                    html += '   </div>';
                    html += '</li>';
                }

                $("#monthWinList").html(html);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    function fn_beforeList() {
        $("#dType").val("before");

        const mForm = $("#monthForm");
        mForm.submit();
    }


    function fn_afterList() {
        $("#dType").val("after");

        const mForm = $("#monthForm");
        mForm.submit();
    }

    function fn_searchJudgeType(jType,dTmp) {
        $("#searchType").val(jType);
        fn_createDiv();
        $(".sType").removeClass("on sType");
        $(dTmp).addClass("on sType");
    }

</script>
<body>

    <form id="monthForm" name="monthForm" method="get" action = "/monthWinnerList">
        <input type="hidden" id="sYear" name="sYear" value="${sYear}"/>
        <input type="hidden" id="sMonth" name="sMonth" value="${sMonth}"/>
        <input type="hidden" id="dType" name="dType" value=""/>
        <input type="hidden" id="searchType" name="searchType" value="total"/>
    </form>

    <div class="container">
        <div class="tab-2th">
            <a href="/monthWinner" class="mleft on">월 우승</a><a href="/weekWinner" class="mright">주 우승</a>
        </div>

        <div class="data-nav">
            <a href="#" title="이전" onclick="fn_beforeList()"><em uk-icon="icon: chevron-left; ratio: 1.2"></em></a>
            <h3>${sYear}. ${sMonth}월 </h3>
            <a href="#" title="다음" onclick="fn_afterList()"><em uk-icon="icon: chevron-right; ratio: 1.2"></em></a>
        </div>
        
        <div class="rank-nav">
            <ul>
                <li><a href="#" class="on sType" onclick="fn_searchJudgeType('total',this);">종합</a></li>
                <li><a href="#" onclick="fn_searchJudgeType('cute',this);">귀여움</a></li>
                <li><a href="#" onclick="fn_searchJudgeType('hip',this);">힙</a></li>
                <li><a href="#" onclick="fn_searchJudgeType('ind',this);">개성</a></li>
            </ul>
        </div>

        <div class="thum-adv">
            <div class="rank-adv">                    
                <span class="rank-adv-icon">광고</span>
                <div class="rankimg"><a href="#none"><img src="images/thum/thum-cu.jpg"></a></div>
                <div class="rankinfo">
                    <div class="rankinfo-tit ellipsis2"><a href="#none">CU편의점 고인물 편 ♡♡♡편의점 알바이야기 연속 보기</a></div>
                    <div class="c_gray ellipsis">#편의점 #CU편의점 알바이야기 #CU편의점</div>
                    <div class="c_gray font11 mb5">2023.01.02</div>
                    <div class="rankinfo-name"><a href="#none">CU편의점</a></div>
                </div>           
           
            </div>
        </div>

        <div class="thum-list">
            <ul id="monthWinList">
                <!--<li>
                    <div class="rank-num"><strong>1.</strong>2,313 <span>/ 730명</span></div>
                    <div class="bigthum">
                        <div class="rank-badge">
                            <img src="images/icon/m-winner.png">
                        </div>
                        <img src="images/thum/thum04.jpg"  class="thum">
                    </div>
                    <div class="list-tit ellipsis2">
                        홍대 댄스 여신 준비된 아이돌 데뷔 임박 바로 보기!<span> #홍대여신 #아이돌 연습생 #홍대아이돌들</span> 
                    </div>
                    <div class="list-name">
                        <a href="#none">
                            <img class="small-thum mr5" src="images/thum/face01.jpg">
                            Hong Dae
                        </a>
                    </div> 
                </li>
                <li>
                    <div class="rank-num"><strong>2.</strong>2,013 <span>/ 630명</span></div>
                    <div class="bigthum">
                        <img src="images/thum/thum02.jpg"  class="thum">
                    </div>
                    <div class="list-tit ellipsis2">
                        홍대 댄스 여신 준비된 아이돌 데뷔 임박 바로 보기!<span> #홍대여신 #아이돌 연습생 #홍대아이돌들</span> 
                    </div>
                    <div class="list-name">
                        <a href="#none">
                            <img class="small-thum mr5" src="images/thum/face02.jpg">
                            Hong Dae
                        </a>
                    </div> 
                </li>
                
                <li>
                    <div class="rank-num"><strong>3.</strong>1,013 <span>/ 430명</span></div>
                    <div class="bigthum">
                        <img src="images/thum/thum01.jpg"  class="thum">
                    </div>
                    <div class="list-tit ellipsis2">
                        홍대 댄스 여신 준비된 아이돌 데뷔 임박 바로 보기!<span> #홍대여신 #아이돌 연습생 #홍대아이돌들</span> 
                    </div>
                    <div class="list-name">
                        <a href="#none">
                            <img class="small-thum mr5" src="images/thum/face01.jpg">
                            Hong Dae
                        </a>
                    </div> 
                </li>
                <li>
                    <div class="rank-num"><strong>4.</strong>913 <span>/ 330명</span></div>
                    <div class="bigthum">
                        <img src="images/thum/thum02.jpg"  class="thum">
                    </div>
                    <div class="list-tit ellipsis2">
                        홍대 댄스 여신 준비된 아이돌 데뷔 임박 바로 보기!<span> #홍대여신 #아이돌 연습생 #홍대아이돌들</span> 
                    </div>
                    <div class="list-name">
                        <a href="#none">
                            <img class="small-thum mr5" src="images/thum/face02.jpg">
                            Hong Dae
                        </a>
                    </div> 
                </li>                     
               -->
            </ul>

        </div>
        
        
    </div>

    

    <!--
    <div class="full-bottom-bar">
        <div class="v_bottom_nav">                
            <ul>
                <li><a href="#" class="vsicon"><span uk-icon="icon: bottom01;"><i class="sr-only">숏폼</i></span></a></li>
                <li><a href="#" class="vsicon"><span uk-icon="icon: bottomOn02;"><i class="sr-only">우승예측</i></span></a></li>
                <li class="mcircle"><a href="#" class="vsicon"> <em uk-icon="icon: bottom03;"><i class="sr-only">촬영</i></em></a></li>
                <li><a href="#" class="vsicon"><span uk-icon="icon: bottom04;"><i class="sr-only">팬</i></span></a></li>
                <li><a href="#" class="vsicon"><span uk-icon="icon: bottom05;"><i class="sr-only">마이페이지</i></span></a></li>
            </ul>        
        </div>
        <div class="full-bar-bg"><span></span><span class="bg-transparent"></span><span></span></div>
    </div>
        하단메뉴-->
  
</body>

</html>