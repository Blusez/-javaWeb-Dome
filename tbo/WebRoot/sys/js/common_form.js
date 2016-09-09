/**
 * 
 * 通用的表单控制函数
 * 
 * 主要用于控制表单控件状态，是否可用等
 * 
 */

/**
 * 全选或取消全选表单中的复选框
 * 不包含控制全选的复选框
 */
function selectOrReverse(form,clickCheckBox) 
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if(e.type=='checkbox'&&!e.disabled&&e.name!=clickCheckBox.name)
		{
			e.checked=clickCheckBox.checked;
		}
	}
}

/**
 * 全选或取消全选表单中的复选框
 * 不包含控制全选的复选框
 */
function selectOrReverse1(form,name) 
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if(e.type=='checkbox'&&!e.disabled&&e.name==name)
		{
			e.checked=!e.checked;
		}
	}
}
/**
 * 反向选中指定表单中的复选框
 * 即把选中的置为未选中，未选中的置为选中
 * 排除指定名称的复选框
 */
function reverseSelect(form,clickCheckBox) 
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if(e.type=='checkbox'&&!e.disabled&&e.name!=clickCheckBox.name)
		{
			e.checked=!e.checked;
		}
	}
}

/**
 * 检查指定的表单中是否有选中的复选框
 * 仅检查指定名称的复选框
 */
function hasSelectItem(form,checkBoxName) 
{
	var has=false;
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if(e.type=='checkbox'&&e.checked&&e.name==checkBoxName)
		{
			has=true;
			break;
		}
	}
	return has;
}


/**
 * 检查指定的表单中是否有选中的复选框
 * 排除指定名称的复选框
 */
function hasRadioSelectItem(form,exceptName) 
{
	var has=false;
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if(e.type=='radio'&&e.checked&&e.name==exceptName)
		{
			has=true;
			break;
		}
	}
	return has;
}

function clearItemsOfSelect(select,keep) 
{
	while(select.options.length>keep)
	{
		select.remove(1);
	}
}