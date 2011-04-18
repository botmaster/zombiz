/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.display.scrollbox 
{
	
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.zombiz.display.scrollbar.events.ScrollBarEvent
	import com.zombiz.display.scrollbar.ScrollBar
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class ScrollBox extends Sprite
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _content:Sprite;
		private var _masker:Shape;
		private var _sb:ScrollBar;
		private var _scrollDelay:Number;
		private var _backGround:Sprite;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get content():Sprite { return _content; }
		override public function get height():Number
		{
			//return super.height;
			return _backGround.height;
		}
		
		override public function set height(value:Number):void 
		{
			super.height = value;
		}
		
		public function get sb():ScrollBar 
		{ 
			return _sb; 
		}
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function ScrollBox(pWidth:int, pHeight:int, pScrollBarTrack:Sprite, pScrollBarThumb:Sprite, pScrollDelay:Number = 0.6) 
		{
			_init(pScrollDelay);
			_initDisplay(pWidth, pHeight, pScrollBarTrack, pScrollBarThumb);
		}
		
		// METHODS
		// ----------------------------------------
		private function _init(pScrollDelay:Number):void 
		{	
			_scrollDelay = pScrollDelay;
			addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler, false, 0, true);
		}
		
		private function _initDisplay(pWidth:int, pHeight:int, pScrollBarTrack:Sprite, pScrollBarThumb:Sprite):void 
		{
			// On créer le fond.
			_backGround = new Sprite();
			_backGround.graphics.beginFill(0x00ffff, 0);
			_backGround.graphics.drawRect(0, 0, pWidth, pHeight);
			_backGround.graphics.endFill();
			addChild(_backGround);
			
			// On créer le container.
			_content = new Sprite();
			addChild(_content);
			
			// Le mask.
			_masker = new Shape();
			_masker.graphics.beginFill(0xff0000, 0);
			_masker.graphics.drawRect(0, 0, pWidth, pHeight);
			_masker.graphics.endFill();
			addChild(_masker);
			
			_content.mask = _masker;
			
			// La scrollBar
			_sb = new ScrollBar(pScrollBarTrack, pScrollBarThumb);
			_sb.x = int(_masker.x + (_masker.width - _sb.width));
			_sb.visible = false;
			addChild(_sb);
		}
		
		public function addContent(pContent:DisplayObject):void 
		{
			cleanContent();
			
			_content.addChild(pContent);
			
			if (_content.height > _masker.height)
			{
				_sb.visible = true;
				this.addEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheelHandler, false, 0, true);
			}else
			{
				_sb.visible = false;
				this.removeEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheelHandler, false);
			}
			
			// on redimensionne la sb
			_sb.height = _masker.height;
		}
		
		public function cleanContent():void 
		{
			// On vire tout ce qu'il y a dans content.
			for (var i:int = 0; i < _content.numChildren; i++) 
			{
				_content.removeChild(_content.getChildAt(0));				
			}
			
			_sb.scrollValue = 0;
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		private function _addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			_sb.addEventListener(ScrollBarEvent.VALUE_CHANGED, _scrollBarChangedHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheelHandler, false, 0, true);
		}
		
		private function _mouseWheelHandler(e:MouseEvent):void 
		{
			var prct:Number = e.delta / 3 / 10 * -1;
			_sb.scrollValue += prct;
		}
		
		private function _removedFromStageHandler(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler);
			_sb.removeEventListener(ScrollBarEvent.VALUE_CHANGED, _scrollBarChangedHandler, false);
			_masker.removeEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheelHandler, false);
		}
		
		private function _scrollBarChangedHandler(e:ScrollBarEvent):void 
		{
			var yPos:Number = -e.scrollValue * (_content.height - _masker.height + 10);
			TweenLite.to(_content, _scrollDelay, {
				y:yPos
			})
		}
	}
	
}