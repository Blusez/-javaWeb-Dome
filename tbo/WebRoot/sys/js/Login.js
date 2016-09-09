Ext.BLANK_IMAGE_URL = contextPath+'/images/blank.gif';

var login = function() {
	Ext.QuickTips.init();
	Ext.lib.Ajax.defaultPostHeader += ";charset=utf-8";
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

	// 实现具体的功能

	var form = new Ext.FormPanel( {
		defaultType : 'textfield',
		labelWidth : 60,
		style : 'background:#ffffff;padding:25px 35px 30px 16px;',
		region : "center",
		defaults : {
			border : false,
			allowBlank : false,
			msgTarget : 'side',
			blankText : '该字段不允许为空'
		},
		waitMsgTarget : true,
		items : [
				{
					fieldLabel : '登录帐号',
					name : 'account',
					regex:/^[0-9a-zA-Z]{2,15}$/,
					regexText:'只能为2到15位的大小写字母。'
				},
				{
					fieldLabel : '登录密码',
					name : 'pass',
					inputType : 'password',
					regex:/^.{4,}$/,
					regexText:'长度不能少于4位'
				},
				{
					xtype : 'panel',
					layout : 'column',
					items : [
							{
								width : 130,
								layout : 'form',
								border : false,
								items : [{
									fieldLabel : '校 验 码',
									name : 'verifyCode',
									xtype : 'textfield',
									allowBlank : false,
									msgTarget : 'side',
									blankText : '该字段不允许为空',
									anchor : '98%'
								}]
							},
							{   xtype : 'checkCode',
								src : contextPath+'/IMG',
								width : 60,
								height : 20,
								handler : true
							}

						/*	{
								width : 60,
								border : false,
								html : '<img id=\'checkpic\' src="IMG.action"  onclick="this.src=\'IMG.action?\'+new Date()"/>'
							}*/

					]
				}],
		buttons : [ {
			text : '登陆',
			handler : function() {
				form.getForm().submit( {
					success : function(f, a) {
						window.location.href=a.result.url;
						//OpenFullWin(a.result.url);
					},
					url : contextPath+'/oum/login.action',
					waitMsg : '正在提交，请稍等...'
				});
			}
		}, {
			text : '取消',
			handler : function() {
				form.getForm().reset();
			}
		}]

	});

	var panel = new Ext.Panel( {
		renderTo : 'loginpanel',
		layout : "border",
		width : 525,
		height : 290,
		defaults : {
			border : false
		},
		items : [ {
			region : "north",
			height : 56,
			html : '<img src="'+contextPath+'/images/head.gif"/>'
		}, {
			region : "south",
			height : 56,
			html : '<img src="'+contextPath+'/images/foot.gif"/>'
		}, {
			region : "west",
			width : 253,
			html : '<img src="'+contextPath+'/images/left.gif"/>'
		}, form]
	});

	Ext.get('loginpanel').setStyle('position', 'absolute').center(Ext.getBody());

};

Ext.onReady(login);

