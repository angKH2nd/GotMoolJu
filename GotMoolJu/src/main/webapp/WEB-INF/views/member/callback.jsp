<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("opjzzdCNjEas6y2mkSia", "http://localhost:8222/got/naver.me");
  // 접근 토큰 값 출력
 console.log(naver_id_login);
  alert("token : " + naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('phone'));
    location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=opjzzdCNjEas6y2mkSia&redirect_uri=http://localhost:8222/got/naver.me'
  }
</script>
</body>
</html>