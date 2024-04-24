<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("opjzzdCNjEas6y2mkSia", "http://localhost:8222/got/naver.me");

  naver_id_login.get_naver_userprofile("naverSignInCallback()");

  function naverSignInCallback() {
    // alert(naver_id_login.getProfileData('email'));
    // alert(naver_id_login.getProfileData('nickname'));
    // alert(naver_id_login.getProfileData('gender'));

      $.ajax({
        url:"login.na",
        data:{
          email:naver_id_login.getProfileData('email'),
          name:naver_id_login.getProfileData('nickname'),
          gender:naver_id_login.getProfileData('gender')
        },
        success:function(result){
           if(result == 'yes'){
            location.replace("http://localhost:8222/got/home.got");
           }
          
        },
        error:function(){
          console.log("네이버 로그인 실패");
        }
 

      })


    
  }
</script>
</body>
</html>