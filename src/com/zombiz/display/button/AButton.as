/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.display.button 
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * Le comportement de base d'un bouton.
	 * @author Pascal Achard
	 */
	
	public class AButton extends Sprite
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		/**
		 * Objet conteneur de données. Evite de déclarer la classe en dynamique.
		 */
		protected var _data:Object;
		
		/**
		 * Sélectionné ?
		 */
		protected var _selected:Boolean;
		 
		
		
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get data():Object { return _data; }
		
		public function set data(value:Object):void 
		{
			_data = value;
		}
		
		
		public function get selected():Boolean { return _selected; }
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
			if (!_selected) _doUnSelected(); else _doSelected();
		}
		
		
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function AButton() 
		{
			super();
			
			buttonMode = true;
			mouseChildren = false;
			_data = { };
			
			addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler, false, 0, true);
			
		}
		
		// METHODS
		// ----------------------------------------
		
		protected function _doSelected():void 
		{
			_doRollOver();
		}
		
		protected function _doUnSelected():void 
		{
			_doRollOut();
		}
		
		protected function _doRollOver():void 
		{
			throw new Error("Methode abstraite, la sous classe doit l'overider !");
		}
		
		protected function _doRollOut():void 
		{
			throw new Error("Methode abstraite, la sous classe doit l'overider !");
		}
		
		
		// EVENTS HANDLERS
		// ----------------------------------------
		private function _addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			
			// On écoute les événements clasiques des boutons.
			addEventListener(MouseEvent.CLICK, _clickHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OVER, _rollOverHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, _rollOutHandler, false, 0, true);
		}
		
		protected function _clickHandler(e:MouseEvent):void 
		{
			//throw new Error("Methode abstraite, la sous classe doit l'overider !");
		}
		
		protected function _rollOverHandler(e:MouseEvent):void 
		{
			//throw new Error("Methode abstraite, la sous classe doit l'overider !");
			if (_selected) return;
			_doRollOver();
		}
		
		protected function _rollOutHandler(e:MouseEvent):void 
		{
			//throw new Error("Methode abstraite, la sous classe doit l'overider !");
			if (_selected) return;
			_doRollOut();
		}
		
		private function _removedFromStageHandler(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _removedFromStageHandler);
			removeEventListener(MouseEvent.CLICK, _clickHandler, false);
			removeEventListener(MouseEvent.ROLL_OVER, _rollOverHandler, false);
			removeEventListener(MouseEvent.ROLL_OUT, _rollOutHandler, false);
		}
		
		
		
	}

}