/* �������?����֮�� www.lanrenzhijia.com */
function Slide(container, options, callback, obj){
	this.container=$(container);
	this.list=$(container+' .J_slide_list');
	this.handle=$(container+' .J_slide_trigger li');
	this.item=$(container+' .J_slide_item');
	this.itemWH=0;
	this.count=this.handle.length;
	this.timer=null;
	this.eTime=null;
	this.options=$.extend({
		auto:true,
		delay:4,
		duration:500,
		effect:'fade',
		event:'mouseover',
		firstDelay:null,
		index:1,
		vertical:false
		},options);
	this.init();
	if(callback){
		callback.call(this, obj);
		}
	}
Slide.prototype={
	init:function(){
		var slideClip, itemW, itemH, itemWH,
			that=this,
			list=this.list, item=this.item, count=this.count,
			op=this.options, auto=!!op.auto, vertical=!!op.vertical;
		if(op.effect==='fade'){
			list.css({position:'relative'});
			item.css({position:'absolute'});
			}
		if(op.effect==='slide'){
			list.css({position:'absolute'});
			if(!list.parent().hasClass('J_slide_clip')){
				list.wrap('<div class="J_slide_clip"></div>');
				}
			itemW=item.outerWidth(true);
			itemH=item.outerHeight(true);
			//this.container.find('.J_slide_clip').css({position:'relative',overflow:'hidden',height:itemH,width:itemW});
			this.container.find('.J_slide_clip').css({position:'relative',overflow:'hidden',height:itemH});
			this.itemWH=vertical?itemH:itemW;
			if(!vertical){
				item.css({'float':'left'});
				list.width(item.width()*item.length);
			}
			}
		this.handle.bind(op.event, function(){that._trigger(this)});
		if(op.index==='r'){
			op.index=this._random(count);
			}
		if(op.index> count||op.index<1){
			op.index=1;
			}
		this._showFirst(op.index);
		if(auto){
			this._auto(op.firstDelay);
			this.container.hover(function(){that._stop();},function(){that._auto();});
			}
		},
	_random:function(max){
		return parseInt(Math.random() * max + 1);
		},
	_trigger:function(o){
		var index, op=this.options, handle=this.handle;
		if(op.index===(handle.index(o)+1)){
			return;
			}
		index=op.index=handle.index(o)+1;
		this._show(index);
		},
	_show:function(i){
		var that=this, op=this.options, vertical=!!op.vertical;
		this.handle.removeClass('cur').eq(i-1).addClass('cur');
		if(op.effect==='fade'){
			clearTimeout(this.eTime);
			this.eTime=setTimeout(function(){that.item.not(that).css({zIndex:-1}).eq(i-1).css({zIndex:9}).animate({opacity:1},that.options.duration,function(){
				that.item.not(this).css({opacity:0})
				});},150);
			}
		if(op.effect==='slide'){
			itemWH=this.itemWH;
			if(vertical){
				this.list.stop().animate({left:-itemWH*(i-1)},this.options.duration);
			}else{
				this.list.stop().animate({left:-itemWH*(i-1)},this.options.duration);
			}	
			}
		},
	_showFirst:function(i){
		var op=this.options, vertical=!!op.vertical;
		this.handle.removeClass('cur').eq(i-1).addClass('cur');
		if(op.effect==='fade'){
			this.item.not(this).css({zIndex:-1, opacity:0}).eq(i-1).css({zIndex:9, opacity:1});
			}
		if(op.effect==='slide'){
			itemWH=this.itemWH;
			if(vertical){
				this.list.css({top:-itemWH*(i-1)});
			}else{
				this.list.css({left:-itemWH*(i-1)});
			}		
			}
		},
	_auto:function(delay){
		var that=this,
			op=that.options;
		this.timer=setTimeout(function(){
			op.index = op.index< that.count? ++op.index: 1;
			that._show(op.index);
			that._auto();
			}, delay ? delay*1000 : op.delay*1000);
		},
	_stop:function(){
		clearTimeout(this.timer);
		}
	};
/* �������?����֮�� www.lanrenzhijia.com */

function Tab(container, options, callback){
	this.container=$(container);
	this.handle=$(container+' .J_tab_nav li');
	this.panel=$(container+' .J_tab_panel');
	this.count=this.handle.length;
	this.timer=null;
	this.eTime=null;
	this.options=$.extend({
		auto:false,
		delay:4,
		event:'mouseover',
		index:1
		},options);
	this.init();
	if(callback){
		callback.call(this);
		}
	}
Tab.prototype={
	init:function(){
		var that=this,
			count=this.count, op=this.options, auto=!!op.auto;
		this.handle.bind(op.event, function(){
			that._trigger(this);
			});
		if(op.index==='r'){
			op.index=this._random(count)
			}
		this._show(op.index);
		if(auto){
			this._auto();
			this.container.hover(function(){that._stop();},function(){that._auto();});
			}
		},
	_random:function(max){
		return parseInt(Math.random() * max + 1);
		},
	_trigger:function(o){
		var index, op=this.options, handle=this.handle;
		if(op.index===(handle.index(o)+1)){
			return;
			}
		index=op.index=handle.index(o)+1;
		this._show(index);
		},
	_show:function(i){
		this.handle.removeClass('cur').eq(i-1).addClass('cur');
		this.panel.addClass('none').eq(i-1).removeClass('none');
		},
	_auto:function(){
		var that=this,
			op=that.options;
		this.timer=setTimeout(function(){
			op.index = op.index< that.count? ++op.index: 1;
			that._show(op.index);
			that._auto();
			},op.delay*1000);
		},
	_stop:function(){
		clearTimeout(this.timer);
		}
	};
/* �������?����֮�� www.lanrenzhijia.com */