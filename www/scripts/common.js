/*
 * array, string ,date utils and other stuff
 */
var CONTEXT_PATH = '';

function defaultEqualsFunc(x, y){
	return x == y;
}
/**
 * 
 * @param arr
 * @param searchKey
 * @param equalsFunc
 * @returns {Boolean}
 */
function arrayContains(arr, searchKey, equalsFunc){
	if(arr.lengh == 0 || !searchKey){
		return false;
	}
	if(typeof equalsFunc == 'undefined'){
		equalsFunc = defaultEqualsFunc;
	}
	
	for (var i = 0; i < arr.length; i++) {
		if(equalsFunc( arr[i] , searchKey) ){
			return true;
		}
	}
	
	return false;
}

//============================================================
String.prototype.trim = function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.trimLeft = function(){
    return this.replace(/^\s*/, "");
};
String.prototype.trimRight = function(){
    return this.replace(/\s*$/, "");
};
 
String.prototype.contains = function(key){
    return this.indexOf(key) != -1;
};
//=============================================================

function favorateMe(){
	//如果是浏览器
	alert('请使用Ctrl+D快捷键进行收藏!');

}
 
 
