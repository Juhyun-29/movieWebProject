$(function(){

	var urlParams=new URL(location.href).searchParams;
	var searchType=urlParams.get('searchType');

	console.log(searchType);

	$("#searchType").val(searchType).prop("selected",true);

})    