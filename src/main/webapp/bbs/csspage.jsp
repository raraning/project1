<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%> 
<style>
.cptop{
	width:1200px;
	border-bottom:1px solid #ddd;
	font-weight:bold;
	font-size:30px;
}
.cpsubject{
	font-weight:bold;
	font-size:20px;
}
.csslink{
	cursor:pointer;
}
.csslink:hover{
	text-decoration:underline;
}
</style>
<div style="height:15px;"> </div>
<div style="padding-left:420px;">
	<div class="cptop">CSS 기초</div>
	<br>
	<div class="cpsubject">CSS를 배우기 위한 사전지식</div>
	<div style="height:10px;"></div>
	<div>CSS를 배우기 전에 여러분은 다음과 같은 기초 지식이 필요합니다.</div>
	<div style="height:10px;"></div>
	<div>- HTML</div>
	<div>- XHTML</div>
	<br>
	<div class="cptop"> </div>
	<br>
	<div class="cpsubject">CSS란?</div>
	<div style="height:10px;"></div>
	<div>CSS는 Cascading Style Sheets의 약자입니다.</div>
	<div>CSS는 HTML 요소들이 각종 미디어에서 어떻게 보이는가를 정의하는 데 사용되는 스타일 시트 언어입니다.</div>
	<div>HTML4 부터는 이러한 모든 서식 설정을 HTML 문서로부터 따로 분리하는 것이 가능해졌습니다.</div>
	<div>오늘날 대부분의 웹 브라우저들은 모두 CSS를 지원하고 있습니다.</div>
	<br>
	<div class="cptop"> </div>
	<br>
	<div class="cpsubject">CSS를 사용하는 이유</div>
	<div style="height:10px;"></div>
	<div>CSS는 Cascading Style Sheets의 약자입니다.</div>
	<div>HTML만으로 웹 페이지를 제작할 경우 HTML 요소의 세부 스타일을 일일이 따로 지정해 주어야만 합니다.</div>
	<div>이 작업은 매우 많은 시간이 걸리며, 완성한 후에도 스타일의 변경 및 유지 보수가 매우 힘들어집니다.</div>
	<div>이러한 문제점을 해소하기 위해 W3C(World Wide Web Consortium)에서 만든 스타일 시트 언어가 바로 CSS입니다.</div>
	<div style="height:10px;"></div>
	<div>CSS는 웹 페이지의 스타일을 별도의 파일로 저장할 수 있게 해주므로 사이트의 전체 스타일을 손쉽게 제어할 수 있습니다.</div>
	<div>또한, 웹 사이트의 스타일을 일관성 있게 유지할 수 있게 해주며, 그에 따른 유지 보수 또한 쉬워집니다.</div>
	<div>이러한 외부 스타일 시트는 보통 확장자를 .css 파일로 저장합니다.</div>
	<br>
	<div class="cptop"> </div>
	<br>
	<div class="cpsubject">CSS 버전</div>
	<div style="height:10px;"></div>
	<div>인터넷의 발전에 따라 CSS는 현재까지 새로운 버전이 계속해서 발표되고 있습니다.</div>
	<div style="height:10px;"></div>
	<div>1996년에 최초의 CSS1이 W3C 표준 권고안으로 제정됩니다.</div>
	<div>그 이후 1998년에 CSS2가 발표되었으며, 2005년부터는 현재 사용 중인 CSS3가 개발되고 있습니다.</div>
	<div>CSS는 현재 모듈(module)별로 개발되고 있으며, 브라우저 공급자가 지원할 모듈을 자유롭게 선택할 수 있도록 하고 있습니다.</div>
	<div>따라서 현재 최신 버전의 CSS 표준 권고안은 CSS Level 2 Revision 1 (CSS 2.1)입니다.</div>
	<div style="height:10px;"></div>
	<div>최신 버전의 CSS 표준 권고안에 대한 더 자세한 정보를 원한다면, W3C 공식 사이트를 방문하여 확인할 수 있습니다.</div>
	<div style="height:10px;"></div>
	<div class="csslink"><a href="https://www.w3.org/TR/CSS/">W3C CSS Snapshot 2017 : W3C Working Group Note, 31 January 2017 =></a></div>
	<div style="height:10px;"></div>
	<div>CSS 표준 권고안의 모듈별 현재 상태에 대해 자세히 알고 싶다면, 다음 링크를 방문하여 확인할 수 있습니다.</div>
	<div style="height:10px;"></div>
	<div class="csslink"><a href="https://www.w3.org/Style/CSS/current-work">W3C CSS current work & how to participate =></a></div>
	<br>
	<div class="cptop"> </div>
	<br>
	<div class="csslink">참고사이트 : <a href="http://www.tcpschool.com/">[TCP School]http://www.tcpschool.com/</a></div>
	<br>
	<br>
</div>
<%@include file="/include/footer.jsp"%>