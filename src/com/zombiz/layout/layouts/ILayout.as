package com.zombiz.layout.layouts 
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	public interface ILayout 
	{
		function addToLayout(pDisplayItem:DisplayObject):void;
		function removeAllItems():void;
	}
	
}