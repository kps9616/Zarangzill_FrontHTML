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
    function AddComma(num) {
        var regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
    }

    function fn_createDiv() {

        $.ajax({
            url: 'http://localhost:9090/api/v1/win/week/list/old',
            method: 'GET',
            dataType: 'json',
            data: $("#weekForm").serialize(),
            success: function(response) {
                var winPredWList = response.winPredWList;
                console.log(winPredWList);
                var html = "";

                for(var i = 0; i < winPredWList.length; i++) {
                    var winPredInfo = winPredWList[i];
                    console.log(winPredInfo);
                    var totalScore = winPredInfo.total_score_1 + winPredInfo.total_score_2 + winPredInfo.total_score_3;
                    html += '<li>';
                    html += '    <div class="rank-num"><strong>'+winPredInfo.week_idx+'.</strong>'+AddComma(totalScore)+' <span>/ '+winPredInfo.judge_cnt+'명</span></div>';
                    html += '    <div class="bigthum">';
                    html += '       <div class="rank-badge">';
                    html += '            <img src="images/icon/m-winner.png">';
                    html += '        </div>';
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

                $("#weekWinList").html(html);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    function fn_beforeList() {
        $("#dType").val("before");

        const wForm = $("#weekForm");
        wForm.submit();
    }


    function fn_afterList() {
        $("#dType").val("after");

        const sYear = $("#sYear").val();
        const nowDate = new Date();

        if(sYear == nowDate.getFullYear()) {
            $("#isEnd").val("Y");
        }

        const wForm = $("#weekForm");
        wForm.submit();
    }

</script>
<body>

    <form id="weekForm" name="weekForm" method="get" action = "/weekWinnerList">
        <input type="hidden" id="sYear" name="sYear" value="${sYear}"/>
        <input type="hidden" id="dType" name="dType" value=""/>
        <input type="hidden" id="isEnd" name="isEnd" value="N"/>
        <input type="hidden" id="searchType" name="searchType" value="total"/>
    </form>

    <div class="container">
        <div class="tab-2th">
            <a href="/monthWinner" class="mleft">월 우승</a><a href="/weekWinner" class="mright on">주 우승</a>
        </div>

        <div class="data-nav">
            <a href="#" title="이전" onclick="fn_beforeList()"><em uk-icon="icon: chevron-left; ratio: 1.2"></em></a>
            <h3>${sYear}년 </h3>
            <a href="#" title="다음" onclick="fn_afterList()"><em uk-icon="icon: chevron-right; ratio: 1.2"></em></a>
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
            <ul id="weekWinList">

               
            </ul>

        </div>
        
        
    </div>

  
</body>

</html>