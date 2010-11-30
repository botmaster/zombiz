package com.zombiz.layout.layoutpoints
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	public interface ILayoutPoint 
	{
		function get displayObject():DisplayObject;
		function set displayObject(value:DisplayObject):void;
		function get x():Number;
		function set x(value:Number):void;
		function get y():Number;
		function set y(value:Number):void;
		function get rotation():Number;
		function set rotation(value:Number):void;
	}
	
}