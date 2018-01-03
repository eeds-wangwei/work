$(document).ready(function() {
    'use strict';
    /**
     * 虽然不想吐槽，但老实说，但这是一个没什么用的类
     */
    (function() {
        /**
         * 生成数字牌的类
         * @class Tally
         * @constructor
         * @param {Element||Jquery} element		容器
         * @param   {Key-Value}     options         配置
         * @param {Number}			num			数值
         * @param {Number}			speed		翻动速率
         * @param {Function}		callback	回调函数
         */
        var Tally = function(element, options) {
            this.element = $(element);
            this.num = options.num;
            this.speed = options.speed || 100;
            this.callback = options.callback;
            this.start = 0;
            this.imgPath = options.imgPath || "../../static/image/counter";
            this.init();
        };
        Tally.prototype = {
            /**
             * 初始化函数
             * @method init
             * @private
             */
            init: function() {
                !this.element.hasClass("tally-item") && this.element.addClass("tally-item");
                this.createItem();
                this.createBgItem();
                this.refresh(this.num, this.callback);
            },
            /**
             * @method createItem
             * @private
             */
            createItem: function() {
                var upWrap, downWrap;
                this.imgUp = $("<img>").attr("src", this.imgPath + "/up/" + this.start + ".png").css("visibility", "hidden");
                this.imgDown = $("<img>").attr("src", this.imgPath + "/down/" + this.start + ".png").css("visibility", "hidden");
                upWrap = $("<div>").addClass("tally-top").append(this.imgUp);
                downWrap = $("<div>").addClass("tally-bottom").append(this.imgDown);
                this.item = $("<div>").append(upWrap, downWrap).addClass("tally-item-front");
                this.element.append(this.item);
            },
            /**
             * @method createBgItem
             * @private
             */
            createBgItem: function() {
                var upWrap, downWrap;
                this.imgUpBg = $("<img>").attr("src", this.imgPath + "/up/" + this.start + ".png");
                this.imgDownBg = $("<img>").attr("src", this.imgPath + "/down/" + this.start + ".png");
                upWrap = $("<div>").addClass("tally-top").append(this.imgUpBg);
                downWrap = $("<div>").addClass("tally-bottom").append(this.imgDownBg);
                this.itemBg = $("<div>").append(upWrap, downWrap).addClass("tally-item-back");
                this.element.append(this.itemBg);
            },
            /**
             * 刷新已有Tally对象的数值
             * @method refresh
             * @param {Number}		num			新数值
             * @param {Function}	callback	回调函数
             */
            refresh: function(num, callback) {
                this.refreshValue(this.imgUpBg, num);
                this.imgUp.css({
                    "height": "23px",
                    "visibility": "visible"
                }).stop().animate({
                    height: "0"
                }, this.speed, $.proxy(function() {
                    this.refreshValue(this.imgDown, num, "down");

                    this.imgDown.css({
                        "height": "0",
                        "visibility": "visible"
                    }).stop().animate({
                        height: "22px"
                    }, this.speed, $.proxy(function() {
                        this.refreshValue(this.imgDownBg, num, "down");
                        callback && callback();
                    }, this));
                    this.refreshValue(this.imgUp, num);
                }, this));
            },
            /**
             * 刷新图片路径
             * @method refreshValue
             * @param {Jquery} elem			对应图片jquery对象
             * @param {Number} num			新数值
             * @param {String} [type="up"]	图片对应文件夹，值为"up"|"down"
             * @private
             */
            refreshValue: function(elem, num, type) {
                type = type || "up";
                elem.attr("src", this.imgPath + "/" + type + "/" + num + ".png");
            }
        };
        /**
         * @class $.fn
         */
        /**
         * 生成可翻动数字牌，具体效果请参照后台主页，使用类Tally进行初始化
         * @method	$.fn.tally
         * @uses	Tally
         * @param   {Key-Value}     options         配置
         * @param	{Number}		num				数值
         * @param	{Number}		[speed=100]		翻动速率
         * @param	{Function}		[callback]		翻动完成后的回调函数
         * @return	{Jquery}						jQuery对象
         */
        $.fn.tally = function(options) {
            return this.each(function() {
                var that = $(this),
                    thatTally = that.data("tally");
                //未初始化
                if (!thatTally) {
                    that.data("tally", new Tally(that, options));
                } else {
                    //已初始化
                    if (options.speed) {
                        thatTally.speed = options.speed;
                    }
                    options.num !== undefined && thatTally.refresh(options.num, options.callback)
                }
            });
        };
    })();

    //生成日期计数
    (function() {
        /**
         * 生成日期计数
         * @class TallyCounter
         * @constructor
         * @param {Element||Jquery} element		容器节点对象
         * @param   {Key-Value}     options         配置
         * @param {String}			count		数值字符串
         * @param {Number}			[speed=100]	翻动速率
         */
        var TallyCounter = function(element, options) {
            this.element = $(element);
            this.options = options;
            this.count = options.count;
            this.speed = options.speed;
            this.init();
        };
        TallyCounter.prototype = {
                /**
                 * @method init
                 * @private
                 */
                init: function() {
                    this.countArray = String.prototype.split.call(this.count, "");
                    this.build();
                },
                /**
                 * 更新子节点
                 * @method build
                 */
                build: function() {
                    var i = 0,
                        arr = this.countArray,
                        length = arr.length,
                        item;
                    this.element.empty();
                    for (; i < length; i++) {
                        item = $("<div>");
                        this.element.append(item);
                        item.data("start", 0);
                        this.turn(item, arr[i]);
                    }
                },
                /**
                 * 数值轮翻, 从0翻到指定数值
                 * @method turn
                 * @param {Jquery}	item	数值对应的jquery对象
                 * @param {num}		num		数值
                 */
                turn: function(item, num) {
                    var that = this,
                        start = item.data("start");
                    if (start <= num) {
                        item.tally({
                            num: start,
                            speed: that.speed,
                            callback: function() {
                                start++;
                                item.data("start", start);
                                that.turn(item, num);
                            },
                            imgPath: that.options.imgPath
                        });
                    }
                }
            }
            /**
             * @class $.fn
             */
            /**
             * 生成日期计数器，具体效果请参照后台主页，使用类TallyCounter进行初始化
             * @method	$.fn.tallyCounter
             * @uses	TallyCounter
             * @param	{Key-Value}     [options]       配置
             * @param	{String}		count			数值字符串
             * @param	{Number}		[speed=100]		翻动速率
             * @return	{Jquery}						jQuery对象
             */
        $.fn.tallyCounter = function(options) {
            return this.each(function() {
                options.count = options.count || "0";
                var that = $(this),
                    thatTallyCounter = that.data("tallyCounter");
                //未初始化
                if (!thatTallyCounter) {
                    that.data("tallyCounter", new TallyCounter(that, options));
                } else {
                    //已初始化
                    TallyCounter.call(thatTallyCounter, that, options);
                }

            });
        }
    })();


    //日期计数器
    var dateTally = $("#tally");
    var dateCount = Math.floor((Ibos.app.g("nowTime") - Ibos.app.g("installTime")) / (3600 * 24));
    dateCount = dateCount < 10 ? "00" + dateCount : (dateCount < 100 ? "0" + dateCount : dateCount);
    dateTally.tallyCounter({
        count: dateCount,
        speed: 100,
        imgPath: Ibos.app.g("assetUrl") + '/image/counter/'
    });
    //系统开关
    var systemSwitch = $("#system_switch");
    systemSwitch.on("change", function() {
        var enabled = this.checked,
            val = 1,
            url = Ibos.app.url("dashboard/index/switchstatus");
        if (enabled) {
            val = 0;
        }
        $.post(url, {
            val: val
        }, function(data) {
            if (data.IsSuccess) {
                $("#switch_status").parent().toggleClass("card-flip");
                Ui.tip(U.lang("OPERATION_SUCCESS"));
            } else {
                Ui.tip(U.lang("DB.SHUTDOWN_SYSTEM_FAILED"), "danger");
            }
        }, 'json');
    });

    // ajax请求安全提示
    $("#securityTips").html("<img src='" + Ibos.app.getStaticUrl("/image/common/loading.gif") + "' />");
    $.ajax({
        type: "get",
        url: Ibos.app.url("dashboard/index/getsecurity"),
        dataType: 'html',
        timeout: 15000, // 超时15秒
        success: function(data) {
            $("#securityTips").html(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $("#securityTips").html(U.lang("DB.LOAD_SECURITY_INFO_FAILED"));
        }
    });

    var dialogs = {
        inputAuthCode: function() {
            Ui.dialog({
                id: "d_input_auth_code",
                title: U.lang("DB.LICENSE_KEY"),
                content: document.getElementById("input_auth_code_dialog"),
                ok: function() {
                    var content = this.DOM.content,
                        $licenseKey = $("#license_key");
                    $licenseKey.val($.trim($licenseKey.val()));
                    if ($licenseKey.val() === "") {
                        alert(U.lang("DB.ENTER_LICENSEKEY"));
                        return false;
                    }
                    content.find("form").submit();
                },
                width: 400,
                cancel: true
            })
        }
    }

    $(document).on("click", '[data-click="inputAuthCode"]', function() {
            dialogs.inputAuthCode();
        })
        .on("click", '[data-click="showAuthInfo"]', function() {
            $("#show_auth_info_dialog").show().position({
                my: "center center",
                of: window
            });
        })
        .on("click", '[data-click="hideAuthInfo"]', function() {
            $("#show_auth_info_dialog").hide();
        });

    var slideProgress = function(el, options) {
        if (!(this instanceof slideProgress)) {
            return new slideProgress(el, options);
        }

        this.$el = $(el);
        this.options = options;

        this.init();
        return this;
    };

    slideProgress.prototype = {
        constructor: slideProgress,

        init: function() {
            var options = this.options,
                self = this;

            this.$slider = this.$el.find('.upgrade-slider');
            this.$input = this.$el.find('.upgrade-val');
            options.scale = options.scale.sort(function(a, b) {
                return a - b;
            });

            this.$slider.ibosSlider({
                    range: 'min',
                    min: options.min,
                    max: options.max,
                    step: options.step,
                    values: 0,
                    scale: options.scale
                })
                .on('slide', function(evt, data) {
                    $(self).trigger('slidechange.slide', {
                        value: data.value
                    });
                });

            this.btnEvt();
            return this;
        },

        calToVal: function(val) {
            var scaleStep = this.options.scale,
                percent = val / this.options.max,
                steps = scaleStep.length - 1,
                i, _i, res;

            for (i = 0; i < steps; i++) {
                if (percent > (i / steps)) {
                    _i = i;
                    res = scaleStep[i];
                } else {
                    break;
                }
            }

            res += (percent - _i / steps) * steps * (scaleStep[_i + 1] - scaleStep[_i]);
            return Math.round(res);
        },

        calToPercent: function(val) {
            var scaleStep = this.options.scale,
                steps = scaleStep.length - 1,
                i, _i, res;

            for (i = 0; i < steps; i++) {
                if (val > scaleStep[i]) {
                    _i = i;
                    res = _i / steps;
                } else {
                    break;
                }
            }

            res += (val - scaleStep[_i]) / ((scaleStep[_i + 1] - scaleStep[_i]) * steps);
            return Math.round(res * this.options.max);
        },

        btnEvt: function() {
            var self = this,
                _valchange;

            _valchange = function() {
                if (self.value > self.options.max) {
                    self.value = self.options.max;
                }

                if (self.value < self.options.min) {
                    self.value = self.options.min;
                }

                self.$input.val(self.value);
                $(self).trigger('valchange.slide', {
                    value: self.value
                });
            };

            this.$el.on('click', '.upgrade-btn', function(evt) {
                    var $this = $(this),
                        param = $this.data('param');

                    self.value = param === 'up' ? +self.$input.val() + self.options.step : +self.$input.val() - self.options.step;

                    _valchange();
                })
                .on('blur', '.upgrade-val', function(evt) {
                    self.value = this.value;

                    _valchange();
                });

            $(this).on('valchange.slide', function(evt, data) {
                    var percent = self.calToPercent(data.value);

                    self.$slider.slider('value', percent);
                    $(self).trigger('hello.slide', {
                        value: self.value
                    });
                })
                .on('slidechange.slide', function(evt, data) {
                    var value = self.calToVal(data.value);

                    self.value = value;
                    self.$input.val(value);
                    $(self).trigger('hello.slide', {
                        value: self.value
                    });
                });
        },

        getValue: function() {
            return this.value;
        },

        setValue: function(value) {
            var percent = this.calToPercent(value);

            this.$slider.slider('value', percent);
            this.$input.val(value);
            this.value = value;

            $(this).trigger('hello.slide', {
                value: this.value
            });
        }
    }

    var engine = Ibos.app.g('engine');
    if(engine == 'SAAS'){
        BizQQWPA.addCustom([{
            aty: '2',
            a: '3',
            nameAccount: 4008381185,
            selector: 'topqq'
        }, {
            aty: '2',
            a: '3',
            nameAccount: 4008381185,
            selector: 'topqq1'
        }, {
            aty: '2',
            a: '3',
            nameAccount: 4008381185,
            selector: 'topqq2'
        }, {
            aty: '2',
            a: '3',
            nameAccount: 4008381185,
            selector: 'topqq3'
        }]);
        
        Ibos.evt.add({
            'userUpgrade': function(param, elem) {
                Ui.dialog({
                    'id': 'd_user_dialog',
                    'title': '用户数升级',
                    'content': document.getElementById('user_upgrade_dialog'),
                    'padding': '0',
                    'lock': true,
                    'init': function() {
                        var $dom = this.DOM.content,
                            $rmb = $dom.find('.suki-rmb'),
                            _slider;

                        // 用户数升级说明
                        $('#user_tip').tooltip({
                            html: false,
                            title: "如需购买更多用户数请联系客服咨询",
                            trigger: 'hover',
                            placement: 'right'
                        });

                        _slider = slideProgress($dom, {
                            min: 1,
                            max: 2000,
                            step: 10,
                            values: 0,
                            scale: [1, 30, 50, 100, 1000, 2000]
                        });

                        // 用户升级计算
                        $(_slider).on('hello.slide', function(evt, data) {
                            var value = data.value,
                                sukiRMB;

                            sukiRMB = Math.ceil(Ibos.app.g('leftDays') / 30) * Ibos.app.g('univalenceuser') * value;
                            $rmb.text(sukiRMB.toFixed(2));
                        });
                    },
                    'footer': null
                });
            },
            'spaceUpgrade': function(param, elem) {
                Ui.dialog({
                    'id': 'd_space_dialog',
                    'title': '空间升级',
                    'content': document.getElementById('space_upgrade_dialog'),
                    'padding': '0',
                    'lock': true,
                    'init': function() {
                        var $dom = this.DOM.content,
                            $rmb = $dom.find('.suki-rmb'),
                            _slider;

                        $('#space_tip').tooltip({
                            html: false,
                            title: "如需购买更大空间请联系客服咨询",
                            trigger: 'hover',
                            placement: 'right'
                        });

                        _slider = slideProgress($dom, {
                            min: 1,
                            max: 100,
                            step: 2,
                            values: 0,
                            scale: [1, 10, 30, 50, 70, 100]
                        });

                        // 空间升级计算
                        $(_slider).on('hello.slide', function(evt, data) {
                            var value = data.value,
                                sukiRMB;

                            sukiRMB = Math.ceil(Ibos.app.g('leftDays') / 30) * Ibos.app.g('univalencespace') * value;
                            $rmb.text(sukiRMB.toFixed(2));
                        });
                    },
                    'footer': null
                });
            },
            'timeUpgrade': (function(param, elem) {
                var timeSetting = [{
                    'text': 1,
                    'active': '1个月',
                    'value': 1,
                    'discount': '1',
                }, {
                    'text': 2,
                    'active': '2个月',
                    'value': 2,
                    'discount': '1',
                }, {
                    'text': 3,
                    'active': '3个月',
                    'value': 3,
                    'discount': '1',
                }, {
                    'text': 4,
                    'active': '4个月',
                    'value': 4,
                    'discount': '1',
                }, {
                    'text': 5,
                    'active': '5个月',
                    'value': 5,
                    'discount': '1',
                }, {
                    'text': 6,
                    'active': '6个月',
                    'value': 6,
                    'discount': '1',
                }, {
                    'text': 7,
                    'active': '7个月',
                    'value': 7,
                    'discount': '1',
                }, {
                    'text': 8,
                    'active': '8个月',
                    'value': 8,
                    'discount': '1',
                }, {
                    'text': 9,
                    'active': '9个月',
                    'value': 9,
                    'discount': '1',
                }, {
                    'text': '1年',
                    'active': '1年',
                    'value': 12,
                    'discount': Ibos.app.g('onediscount'),
                }, {
                    'text': '2年',
                    'active': '2年',
                    'value': 24,
                    'discount': Ibos.app.g('twodiscount'),
                }, {
                    'text': '3年',
                    'active': '3年',
                    'value': 36,
                    'discount': Ibos.app.g('threediscount'),
                }];

                $('#time_tip').tooltip({
                    html: false,
                    title: "如需购买更多用户数请联系客服咨询",
                    trigger: 'hover',
                    placement: 'right'
                });

                $('#time_upgrade_dialog .cycle-btn-group').append($.tmpl('expect_time_tmpl', {
                    data: timeSetting
                }));

                return function() {
                    Ui.dialog({
                        'id': 'd_time_dialog',
                        'title': '购买价格计算',
                        'content': document.getElementById('time_upgrade_dialog'),
                        'padding': '0',
                        'lock': true,
                        'init': function() {
                            var $dom = this.DOM.content,
                                $rmb = $dom.find('.suki-rmb'),
                                _slider;

                            _slider = slideProgress($dom, {
                                min: 5,
                                max: 2000,
                                step: 10,
                                values: 5,
                                scale: [5, 30, 50, 100, 1000, 2000]
                            });

                            // 续期计算
                            $(_slider).on('hello.slide', function(evt, data) {
                                var value = data.value,
                                    time, space, sukiRMB;

                                time = $dom.find('.cycle-btn-group input[type="radio"]:checked').val() || 0;
                                space = Ibos.app.g('space') - value > 0 ? Ibos.app.g('space') - value : 0;
                                sukiRMB = value * Ibos.app.g('univalenceuser') * time + space * Ibos.app.g('univalencespace') * time;
                                $rmb.text(sukiRMB.toFixed(2));
                            });
                        },
                        'footer': null
                    });
                }
            })(),
            'expectTime': function(param, elem) {
                var $this = $(elem),
                    $checkbox = $this.find('input[type="radio"]'),
                    $upgrade = $('#time_upgrade_dialog'),
                    $lis, users, space, sukiRMB;

                $checkbox.prop('checked', true);
                $lis = $this.addClass('active')
                    .find('span').text(param.active)
                    .end()
                    .siblings().removeClass('active');

                $lis.each(function(i, v) {
                    var text = JSON.parse(this.getAttribute('data-param')).text;
                    this.getElementsByTagName('span')[0].textContent = text;
                });

                users = $upgrade.find('.upgrade-val').val();
                space = Ibos.app.g('space') - users > 0 ? Ibos.app.g('space') - users : 0;
                sukiRMB = (users * 30 * $checkbox.val() + space * 15 * $checkbox.val()) * param.discount;
                $('#time_upgrade_dialog .suki-rmb').text(sukiRMB);
            },
            'submitOrder': function(param, elem) {
                var url = Ibos.app.url('dashboard/index/pay'),
                    values = {};

                switch (param.type) {
                    case 'user':
                        values['numbers'] = $('#user_upgrade_dialog .upgrade-val').val();
                        break;
                    case 'space':
                        values['space'] = $('#space_upgrade_dialog .upgrade-val').val();
                        break;
                    case 'time':
                        var $dialog = $('#time_upgrade_dialog');
                        values['numbers'] = $dialog.find('.upgrade-val').val();
                        values['month'] = $dialog.find('input[type="radio"]:checked').val();
                        break;
                }

                $.post(url, values, $.noop, 'json');
            }
        })
    }
});
