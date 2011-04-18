/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.display.scrollbar 
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.zombiz.display.scrollbar.events.ScrollBarEvent
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class ScrollBar extends Sprite
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		private var _track:Sprite;
		private var _thumb:Sprite;
		
		private var _yOffset:Number;
		private var _yMin:Number;
		private var _yMax:Number;
		
		private var _scrollValue:Number;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		override public function get height():Number
		{
			return super.height;
			_track.height = value;
		}
		
		override public function set height(value:Number):void 
		{
			//super.height = value;
			_track.height = value;
			_yMax = _track.height - _thumb.height;
		}
		
		public function get scrollValue():Number { return _scrollValue; }
		
		public function set scrollValue(value:Number):void 
		{
			if (value < 0) value = 0;
			if (value > 1) value = 1;
			_scrollValue = value;
			_thumb.y = _yMax * _scrollValue;
			if(_thumb.y <= 0) 
				_thumb.y = 0;
			if(_thumb.y >= _yMax) 
				_thumb.y = _yMax;
			dispatchEvent(new ScrollBarEvent(ScrollBarEvent.VALUE_CHANGED, _scrollValue));
		}
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function ScrollBar(pTrack:Sprite, pThumb:Sprite) 
		{
			_init(pTrack, pThumb);
			_initDisplay();
		}
		
		// METHODS
		// ----------------------------------------
		private function _init(pTrack:Sprite, pThumb:Sprite):void 
		{		
			_track = pTrack;
			addChild(_track);
			_thumb = pThumb;
			addChild(_thumb);
			
			_yMin = 0;
			_yMax = _track.height - _thumb.height;
			_scrollValue = 0;
			
			
			addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler, false, 0, true);
		}
		
		private function _initDisplay():void 
		{
			// On créer le track
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		private function _addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			_thumb.addEventListener(MouseEvent.MOUSE_DOWN, _thumbDownHandler, false, 0, true);
			stage.addEventListener(MouseEvent.MOUSE_UP, _thumbUpHandler, false, 0, true);
		}
		
		private function _thumbUpHandler(e:MouseEvent):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, _thumbMoveHandler, false);			
		}
		
		private function _thumbMoveHandler(e:MouseEvent):void 
		{
			_thumb.y = mouseY - _yOffset;
			if(_thumb.y <= 0) 
				_thumb.y = 0;
			if(_thumb.y >= _yMax) 
				_thumb.y = _yMax;
			_scrollValue = _thumb.y / _yMax;
			dispatchEvent(new ScrollBarEvent(ScrollBarEvent.VALUE_CHANGED, _scrollValue));			
			e.updateAfterEvent();
		}
		
		private function _thumbDownHandler(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, _thumbMoveHandler, false, 0, true);
			_yOffset = mouseY - _thumb.y;
		}
		
		private function _removedFromStageHandler(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler);
			_thumb.removeEventListener(MouseEvent.MOUSE_DOWN, _thumbDownHandler, false);
			stage.removeEventListener(MouseEvent.MOUSE_UP, _thumbUpHandler, false);
		}
	}
	
}