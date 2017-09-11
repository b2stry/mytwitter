!(function($, window, document, undefined) {

	var Plugin = function(elem, options) {
		this.$elem = elem;
		this.$btn = $('#fatui');
		this.$oMask = $('#mask_shadow');
		this.$oTitle = this.$elem.find('.title');
		this.$title_text = this.$oTitle.find('p');
		this.$close = this.$oTitle.find('span');
		this.$tweet = $('#tweet2');

		this.b_stop = true; // 防止重复点击
		this.page_w = $(window).width();
		this.page_h = $(window).height();

		this.defaults = {
			ifDrag : false,
			dragLimit : false
		};

		this.opts = $.extend({}, this.defaults, options);
	};

	Plugin.prototype = {
		inital : function() { // 初始化
			var self = this;
			this.$tweet.attr("autofoucs", "autofocus");
			this.$title_text.text(this.$title_text.attr('data-title'));
			this.$elem.css({
				left : (this.page_w - this.$elem.width()) / 2
			});

			this.$elem.on('click', function() {
				return false;
			});

			this.$btn.on('click', function() {
				self.popbox();

				self.b_stop = false;

				return false;
			});

			this.$close.on('click', function() {
				self.closePopbox();

				return false;
			});
			/*
			      $(document.body).on('click', function () {
			        self.closePopbox();
			      });*/

			// 拖拽事件
			this.$oTitle.on('mousedown', function(ev) {
				if (self.opts.ifDrag) {
					self.drag(ev);
				}

				return false;
			});
		},

		popbox : function() { // 显示弹窗
			var self = this;

			this.$oMask.show().animate({
				opacity : 1
			});
			this.$elem.show().animate({
				opacity : 1,
				top : 120
			}, function() {
				self.b_stop = true;
			});
		},

		closePopbox : function() { // 关闭弹窗

			if (this.b_stop) {
				this.$oMask.animate({
					opacity : 0
				}, function() {
					$(this).hide();
				});
				this.$elem.animate({
					opacity : 0,
					top : 150
				}, function() {
					$(this).hide();
				});
			}
		},

		drag : function(ev) { // 拖拽事件
			var self = this;
			var oEvent = ev || window.event;
			var disX = oEvent.clientX - this.$elem.offset().left;
			var disY = oEvent.clientY - this.$elem.offset().top;
			var _move = true;

			$(document).mousemove(function(ev) {
				if (_move) {
					var oEvent = ev || window.event;
					var offset_l = oEvent.clientX - disX;
					var offset_t = oEvent.clientY - disY;

					if (self.opts.dragLimit) {
						if (offset_l <= 0) {
							offset_l = 0;
						} else if (offset_l >= self.page_w - self.$elem.width()) {
							offset_l = self.page_w - self.$elem.width();
						}

						if (offset_t <= 0) {
							offset_t = 0;
						} else if (offset_t >= self.page_h - self.$elem.height()) {
							offset_t = self.page_h - self.$elem.height();
						}
					}

					self.$elem.css({
						left : offset_l,
						top : offset_t
					});
				}
			}).mouseup(function() {
				_move = false;
			});
		},

		constructor : Plugin
	};

	$.fn.popup = function(options) {
		var plugin = new Plugin(this, options);

		return plugin.inital();
	};

})(window.jQuery, window, document);