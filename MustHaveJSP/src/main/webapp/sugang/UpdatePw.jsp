<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경(오삼대학교)</title>
<link href="../css/updatePw.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	
<style type="text/css">


#backimg{

opacity: 0.3;
width: 100%;
height: 120%;

position: absolute;
left: 0;
top: 30px;
z-index: -10;
} 

</style>	
	
</head>
<body>

 <img src="../img/university.jpg" id="backimg"> 
 
<c:import url="./Header.jsp"/>
	
	
	<div id="wrap">
		<div id="container" style="height:817px;">
			<!-- CONTENTS -->
			<div id="content">
			<!-- section_pwconfirm -->
			<div class="section_pwconfirm">
				<div class="spc_header">
					<h2>비밀번호 변경</h2>
					<p class="contxt contxt_list">
						<em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em>
					</p>
					<p class="contxt contxt_list">
						<em>이전에 사용한 적 없는 비밀번호</em> 가 안전합니다.
					</p>
				</div>
				<div class="spc_content">
					<form id="fm" action="./UpdatePw.sg" method="post">
						<input type="hidden" name="token_help" value="6Wp9bNE9vjkNQ8j1">
						<input type="hidden" name="menu" value="security">
						<input type="hidden" id="encPasswd" name="encPasswd">
						<input type="hidden" id="encNewPasswd" name="encNewPasswd">
						<input type="hidden" id="encNm" name="encNm">
						<input type="hidden" id="captcha_type" name="captcha_type" value="image">
						<input type="hidden" id="chptchakey" name="chptchakey" value="OiJ9zJIC4DR9jXcA">
						<input type="hidden" id="tempAutoValue" name="tempAutoValue">
						<input type="hidden" id="tempChkBlockIp" name="tempChkBlockIp">
						<fieldset>
								<legend>비밀번호 변경</legend>
								<p class="spc_row">
									<input type="password" name="now_pw" id="now_pw" maxlength="20"
									style="color: #8e8e8e; font-weight: 700; font-size: 12px; width:336px" title="현재 비밀번호 입력" onfocus="convertDiv('now_pw', 'none')"
									onblur="convertDiv('now_pw', 'block');" onkeyup="showCapslockForNowPw(1);" onkeypress="capslock(event);" placeholder="현재 비밀번호" >
								</p>
								<div id="help0_1" class="help left" style="top:9px; right:-122px; display:none;">
									<div class="txt">
										<p>키보드에 Caps Lock이 켜져 있습니다.</p>
									</div>
									<span class="shadow1"></span>
									<span class="shadow2"></span>
									<span class="arrow"></span>
								</div>
								<p class="spc_row2">
								<input type="password" name="new_pw" id="new_pw" maxlength="20"
									style="color: #8e8e8e; font-weight: 700; font-size: 12px; width:336px" title="새 비밀번호" onfocus="convertDiv('new_pw', 'none')"
									onblur="convertDiv('new_pw', 'block');" onkeyup="showCapslockForNewPw(1);" onkeypress="capslock(event);" placeholder="새 비밀번호" >
								</p>
								<p class="spc_row3">
								<input type="password" name="conf_pw" id="conf_pw" maxlength="20"
									style="color: #8e8e8e; font-weight: 700; font-size: 12px; width:336px" title="새 비밀번호 확인" onfocus="convertDiv('conf_pw', 'none')"
									onblur="convertDiv('conf_pw', 'block');" onkeyup="showCapslockForConfPw(1);" onkeypress="capslock(event);" placeholder="새 비밀번호 확인" >	
								<!--비밀번호 안전도 말풍선-->
								<div id="help1_1" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br>
							<span class="ex">8~16 자의 영문 대소문자, 숫자 및 특수문자 사용</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help1_2" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt=""><br>
							<span class="ex">안전도가 높은 비밀번호를 권장합니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>	
								<div id="help1_3" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>적정</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar2_140811.gif" width="47" height="3" alt=""><br>
							<span>안전하게 사용하실 수 있는 비밀번호 입니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>	
								<div id="help1_4" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>높음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar3_140811.gif" width="47" height="3" alt=""><br>
							<span>예측하기 힘든 비밀번호로 더욱 안전합니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help1_5" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt=""><br>
								<span>도용 예방을 위해 이전에 사용한 적 없는 새로운 비밀번호를 사용하세요.</span></p>
							<p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help1_6" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>비밀번호는 8자 이상 입력하셔야 합니다.</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help1_7" class="help left" style="top:62px;right:-122px">
						<!-- 사용불가 메시지 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br>
							<span>도용된 비밀번호는 다시 도용될 가능성이 높아 사용하실 수 없습니다. 새로운 비밀번호로 설정해 주세요.</span>
							</p><p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.</p>
						</div>
						<!-- //사용불가 메시지 -->
						<span class="arrow"></span> 
					</div>
								<div id="help2_1" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br>
							<span class="ex" id="p02">8~16 자의 영문 대소문자, 숫자 및 특수문자 사용</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_2" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt=""><br>
							<span class="ex">안전도가 높은 비밀번호를 권장합니다.</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_3" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>적정</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar2_140811.gif" width="47" height="3" alt=""><br>
							<span class="ex">안전하게 사용하실 수 있는 비밀번호 입니다.</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_4" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
								
							비밀번호 안전도 <em>|</em> <strong>높음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar3_140811.gif" width="47" height="3" alt=""><br>
								<span class="ex">예측하기 힘든 비밀번호로 더욱 안전합니다.</span>
								<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span>
							</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_5" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt=""><br>
							<span>도용 예방을 위해 이전에 사용한 적 없는 새로운 비밀번호를 사용하세요.</span>
							</p><p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_6" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
								<span class="ex">비밀번호는 8자 이상 입력하셔야 합니다.</span>
								<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span>
							</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
								<div id="help2_7" class="help left" style="top:62px;right:-122px">
						<!-- 사용불가 메시지 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br>
							<span>도용된 비밀번호는 다시 도용될 가능성이 높아 사용하실 수 없습니다. 새로운 비밀번호로 설정해 주세요.</span>
							</p><p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //사용불가 메시지 -->
						<span class="arrow"></span> 
					</div>
							
									<!-- <div class="txt">
										<p>키보드에 Caps Lock이 켜져 있습니다.</p>
									</div>
									<span class="shadow1"></span>
									<span class="shadow2"></span>
									<span class="arrow"></span>
								</div> -->
								<p class="btn_area_btm">
									<button type="submit" id="changeSubmit">확인</button>
									<button type="button" onclick="location.href='./myPage.sg'">취소</button>
								</p>
						</fieldset>
					</form>
				</div>
			</div>
			</div>	
		</div>
	</div> <!-- wrap -->
</body>
</html>