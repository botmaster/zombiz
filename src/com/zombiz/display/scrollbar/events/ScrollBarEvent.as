package com.zombiz.display.scrollbar.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	public class ScrollBarEvent extends Event 
	{
		
		public static const VALUE_CHANGED = "valueChanged";
		private var _scrollValue:Number; 
		
		public function ScrollBarEvent(type:String, scrollValue:Number, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			_scrollValue = scrollValue;
		} 
		
		public override function clone():Event 
		{ 
			return new ScrollBarEvent(type, _scrollValue, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ScrollBarEvent", "type", "scrollValue", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get scrollValue():Number { return _scrollValue; }
		
	}
	
}