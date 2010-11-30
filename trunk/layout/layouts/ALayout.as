/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.layout.layouts 
{
	
	import com.zombiz.layout.layoutpoints.ILayoutPoint;
	import com.zombiz.layout.layouts.ILayout;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getQualifiedClassName;
	


	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class ALayout implements ILayout
	{
		
		// PROPERTIES
		// ----------------------------------------
		protected var _layoutPointsList:Array;
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function ALayout() 
		{
			// Cette classe ne doit pas être instanciée directement.
			super ();
			if (getQualifiedClassName(this) == "com.zombiz.layout::ALayout") {
				throw new Error ("Cette classe est abstraite et ne peut être instanciée !");
			}
		}
		
		// METHODS DE L'INTERFACE
		// ----------------------------------------
		/* INTERFACE com.zombiz.layout.layouts.ILayout */
		
		public function addToLayout(pDisplayItem:DisplayObject):void
		{
			throw new Error ("Cette méthode est abstraite et doit être redéfinie dans les sous-classes");
			return null;
		}
		
		/**
		 * On enlève tous les DisplayObjects associé au layout.
		 */
		public function removeAllItems():void
		{
			var item:ILayoutPoint;
			for (var i:int = 0; i < _layoutPointsList.length; i++) 
			{
				item = _layoutPointsList[i] as ILayoutPoint;
				var _parent:DisplayObjectContainer = item.displayObject.parent;
				_parent.removeChild(item.displayObject);
				item.displayObject = null;
			}
		}
		
		// METHODS
		// ----------------------------------------
		
		protected function _addLayoutPoint(pLayoutPoint:ILayoutPoint):void 
		{
			if (!_layoutPointsList) _layoutPointsList = new Array();
			_layoutPointsList.push(pLayoutPoint);
		}
		
		protected function _moveToCoord():void 
		{
			for each (var point:ILayoutPoint in _layoutPointsList) 
			{
				if (point.displayObject != null)
				{
					point.displayObject.x = point.x;
					point.displayObject.y = point.y;
				}
				
			}
		}
		
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
	}

}