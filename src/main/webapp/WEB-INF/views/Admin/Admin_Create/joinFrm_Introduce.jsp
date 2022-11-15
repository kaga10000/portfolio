<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Home</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 로컬 파일 summernote css/js -->
<!-- <script src="../4.surmmernote/lib/summernote-bs4.js"></script> -->
<!-- <link rel="stylesheet" href="../4.surmmernote/lib/summernote-bs4.css"> -->
<!-- CDN 파일 summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- CDN 한글화 -->
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style type="text/css">
.Goods_main_border {
	width: 200px;
	height: 300px;
	border: 5px solid black;
	margin: 25px 25px 25px 25px;
	padding: 0;
}

.Goods_absolute {
	position: absolute;
	top: 25%;
	left: 25%;
}

.first_shot {
	width: 35%;
	height: 500px;
	margin-left: 150px;
}

#foo {
	width: 400px;
	height: 600px;
}

.iconright {
	padding-left: 150px;
}

dt {
	margin-top: 5px;
	text-align: center;
}

section {
	float: left;
}
</style>
<body>
	<jsp:include page="../Admin_include/admin_header.jsp"></jsp:include>
	<h4>국어 상품 등록</h4>
	<hr style="color: red;">
	<a href="admin_category_goods"><button style="float: right;">홈</button></a>
<body>
	<div class="first_shot">
		<img id="foo" src="#">
	</div>
	<form action="joinFrm_introduce" method="post" enctype="multipart/form-data">
		<section>
			<!-- 상품 정보 설정 -->
			<div class="goods_right" style="height: 650px; width: 350px;">
				<dl>
					<dt>
						이름 : <input type="text" id="introduce_name" name="name">
					</dt>
					<dt>
						사진등록 <input type="file" id="introduce_firstshot"
							name="firstshot" multiple>
					</dt>
					<dt>
						<input type="hidden" id="fileCheck" name="fileCheck" value="0">
					</dt>
					<dt>
						경력사항 : <input type="text" id="introduce_profile"
							name="profile">
						<button type="button" id="introduce_profile_plus" onclick="profile_plus();">추가</button>
					</dt>
					<dt id="profile_plus_list"></dt>
					<dt>
						진행 프로젝트 : <input type="text" id="introduce_project"
							name="project">
						<button type="button" id="introduce_project_plus"  onclick="project_plus();">추가</button>
					</dt>
					<dt id="project_plus_list"></dt>
					<dt>
						<select name="category">
							<option value="nu" selected>선택</option>
							<option value="ko">국어</option>
							<option value="ma">수학</option>
							<option value="en">영어</option>
							<option value="so">사회</option>
							<option value="sc">과학</option>
							<option value="pr">프로그래밍</option>
						</select>
					</dt>
					<dt>
						아이디 : <input type="text" id="introduce_id" name="id">
					</dt>
					<dt>
						비밀번호 : <input type="password" id="introduce_pw"
							name="pw"> <br>비밀번호 확인 :<input
							type="password"> <input type="button"
							id="introduce_pw_check" value="확인">
					</dt>
					<dt>
						핸드폰 : <input type="text" placeholder="-없이 핸드폰번호만 입력"
							id="introduce_phone" name="phone">
					</dt>
					<dt>
						<input type="submit" id="submit" value="업로드">
					</dt>
				</dl>
			</div>
		</section>
	</form>
</body>
<script type="text/javascript">
var profile_count = 0;
var project_count = 0;
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#foo').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#introduce_firstshot").change(function() {
		readURL(this);
	});
	$('#introduce_firstshot').on('change', function() {
		console.dir(this);
		console.dir(this.value);
		if ($(this).val() == '') {
			console.log("empty");
			$('#fileCheck').val(0); //첨부 안됨
		} else {
			console.log("not empty");
			$('#fileCheck').val(1); //첨부됨
		}
		console.log($('#fileCheck').val()); //1
	});

/* 	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/admin_home";

		})

		$("#submit").on("click", function() {
			if ($("#introduce_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#introduce_id").focus();
				return false;
			}
			if ($("#introduce_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#introduce_pw").focus();
				return false;
			}
			if ($("#introduce_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#introduce_name").focus();
				return false;
			}
		});
	}) */
function profile_plus(){
		profile_count++
		console.log(profile_count);
            $('#profile_plus_list').append ("<dt id='profile_plus"+profile_count+"'><input type='text' name='profile_plus'> <input type='button' id='profile_plus_remove"+profile_count+"' name='introduce_profile' onclick='profile_remove_btn(this);' value='삭제'></dt>");                                      		
	}   
function project_plus(){
	project_count++
            $('#project_plus_list').append ("<dt id='project_plus"+project_count+"'><input type='text' name='project_plus'> <input type='button' id='project_plus_remove"+project_count+"' name='introduce_project' onclick='project_remove_btn(this);' value='삭제'></dt>");                                      		
	}   
function profile_remove_btn(e){
	profile_count--
	console.log($(e).attr('id'));
	var ths =$(e).parent().attr('id');
 $('#'+ ths).remove();
}
function project_remove_btn(e){
	project_count--
	console.log($(e).attr('id'));
	var ths =$(e).parent().attr('id');
 $('#'+ ths).remove();
}
</script>
</body>
</html>
