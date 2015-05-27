//@see http://stefangabos.ro/jquery/jquery-plugin-boilerplate-revisited/
//@see how to develop a plugin:  http://www.iteye.com/topic/545971
//@see http://stackoverflow.com/questions/210717/using-jquery-to-center-a-div-on-the-screen
jQuery.fn.center = function (options) {
	  var defaults = {    
			    toTop: 0,    //中间向上偏移,正数向上
			    toLeft: 0    //中间向左偏移,正数向左
	 };    
	 // Extend our default options with those provided.    
	var opts = $.extend(defaults, options);    

    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
                                                $(window).scrollTop() -  opts.toTop ) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft() -  opts.toLeft ) + "px");
    return this;
};

/**
 * 清除form的text value ,不同于reset
 * options: {name:'clearTo'}
 * array ignoredInputTypes: 忽略清空类型
 * map resetValues:不置空，设置默认值: id:value
 */
jQuery.fn.clearForm = function (options) {
	  var defaults = {    
		 ignoredInputTypes:['hidden','submit','reset','image','button'],
		 resetValues: {}
	 };    
	 // Extend our default options with those provided.    
	var opts = $.extend(defaults, options);    

	//包括input,select,textarea,button标签！
	this.find(":input").each(function(){
		var id = $(this).attr('id');
		if(opts.resetValues[id]){
			$(this).val(opts.resetValues[id]);
			return true;
		}
		var type = $(this).attr('type') || 
			($(this).is('select') ? 'select': 
				$(this).is('textarea') ? 'textarea':
					$(this).is('textarea') ? 'button':''
				);
//		alert(type);
		for (var i = 0; i < opts.ignoredInputTypes.length; i++) {
			if(type == opts.ignoredInputTypes[i].toLowerCase()){ 
				return true;//continue each
			} 
		}
		
		$(this).val('');
	});//each input control

    return this;
};
