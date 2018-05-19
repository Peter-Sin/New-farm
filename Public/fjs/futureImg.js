console.log("图片开始懒加载")
var defau;
var imgss; 
$(".aheihei").click(()=>{
	defau =$(".jb2").attr("src");
	imgss =$(".jb2").attr("data-src")
	defau = imgss;
	$(".jb2").attr("src",defau);
	$(".J_lis1").attr("src",$(".J_lis1").attr("data-src"))
	$(".J_lis11").attr("src",$(".J_lis11").attr("data-src"))
	$(".J_lis2").attr("src",$(".J_lis2").attr("data-src"))
	$(".J_lis22").attr("src",$(".J_lis22").attr("data-src"))
	$(".J_lis3").attr("src",$(".J_lis3").attr("data-src"))
	$(".J_lis33").attr("src",$(".J_lis33").attr("data-src"))
	// one-img1
	$(".one-img1").attr("src",$(".one-img1").attr("data-src"))
})

$(".GetG").click(()=>{
	// Z_b2
	// 
	$(".Z_b2").attr("src",$(".Z_b2").attr("data-src"))
})

$(".futureimg2").click(()=>{
	// Eb2
	$(".Eb2").attr("src",$(".Eb2").attr("data-src"))
	// Eclose
	$(".Eclose").attr("src",$(".Eclose").attr("data-src"))
})
$(".TB-right").click(()=>{
	// Z_b2Z_b2
	$(".Z_b2").attr("src",$(".Z_b2").attr("data-src"))
})
$(".T_Q").click(()=>{
	// Z_b2Z_b2
	$(".Z_b2").attr("src",$(".Z_b2").attr("data-src"))
})
