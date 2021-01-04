<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../../css/main.css">
<link rel = "shortcut icon" href="#">
</head>
<body>

<table><caption>사진 업로드</caption>
	<tr>
		<td>
			<img id = "preview" src = "">
		</td>
	</tr>
	<tr>
		<td>
			<form action = "picture.me" method = "post" enctype = "multipart/form-data">
				<input type = "file" name = "picture" id = "imageFile" accept = "img/*">
				<input type = "submit" value = "사진등록">
			</form>
		</td>
	</tr>	
</table>
<script type = "text/javascript">
let imagefile = document.querySelector('#imageFile');
//<img id = "preview" ...>
let preview = document.querySelector('#preview');
//addEventListener : 이벤트 등록.
imagefile.addEventListener('change',function(e){
	let get_file = e.target.files; //선택된 이미지 파일
	let reader = new FileReader(); // 파일 선택.
	reader.onload = (function(Img){
		return function(e){
			Img.src = e.target.result;
		}
	})(preview);
	if(get_file){
		reader.readAsDataURL(get_file[0]);
	}
});
</script>
</body>
</html>