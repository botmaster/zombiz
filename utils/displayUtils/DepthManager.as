/*
 * ZOMBIZ ActionScript 3 Framework
 * 
 *                     _     _     
 *  _______  _ __ ___ | |__ (_)____
 * |_  / _ \| '_ ` _ \| '_ \| |_  /
 *  / / (_) | | | | | | |_) | |/ / 
 * /___\___/|_| |_| |_|_.__/|_/___|
 * 
 *
 * Licensed under the MIT License
 * 
 * Copyright (c) 2010 La Haute Société
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.zombiz.utils.displayUtils 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * 
	 * Classe utilitaire de gestion de la display list.
	 * @author Pascal Achard
	 * @version 1.0
	 * @since 05/25/10
	 * 
	 * @example <listing version="3.0"> 
	 * </listing> 
	 */
	
	public final class DepthManager
	{
		
			
		// CONSTRUCTOR
		// ----------------------------------------

		public function DepthManager() 
		{
			throw new Error( this + " Ne pas instancier cette classe utilitaire" );
		}
		
		// METHODS
		// ----------------------------------------
		
		
		/**
		 * Retourne l'index disponible le plus élevé dans un DisplayObjectContainer.
		 * @param	pDisplayObjectContainer		Le DisplayObjectContainer où récupérer l'index le plus élevé.
		 * @return	L'index disponible le plus élevé à l'intérieur DisplayObjectContainer.
		 * @throws	Error Une erreur si le DiplayObjectContainer est null.
		 */
		public static function getHighestDepth(pDisplayObjectContainer:DisplayObjectContainer):int 
		{
			if(!pDisplayObjectContainer) throw new Error(DepthManager + " Le displayObject ne peut pas être null");
			
			trace("Hello world");
			return Math.max(0, pDisplayObjectContainer.numChildren - 1);

			
		}
		
		
		/**
		 * Passe un DisplayObject à l'index le plus haut de sont parent.
		 * @param	pDisplayObject		Le DisplayObject à passer à la profondeur la plus haute.
		 * @return	Le nouvel index du DisplayObject.
		 * @throws	Error Une erreur si le DiplayObject ou son parent est null.
		 */
		public static function bringToFront(pDisplayObject:DisplayObject):int 
		{
			if( pDisplayObject == null || pDisplayObject.parent == null ) throw new Error(DepthManager + " Le displayObject ne peut pas être null et son parent doit être définit");
			
			var index:int = DepthManager.getHighestDepth(pDisplayObject.parent);		
			pDisplayObject.parent.setChildIndex(pDisplayObject, index);
			
			return index;
		}
		
		
		/**
		 * Passe un DisplayObject à l'index le plus bas de son parent.
		 * @param	pDisplayObject		Le DisplayObject à passer à la profondeur la plus basse.
		 * @return	Le nouvel index du DisplayObject.
		 * @throws	Error Une erreur si le DiplayObject ou son parent est null.
		 */
		public static function sendToBack(pDisplayObject:DisplayObject):int 
		{
			if ( pDisplayObject == null || pDisplayObject.parent == null ) throw new Error(DepthManager + " Le displayObject ne peut pas être null et son parent doit être définit");
			
			pDisplayObject.parent.setChildIndex(pDisplayObject, 0);
			
			return pDisplayObject.parent.getChildIndex(pDisplayObject);
		}
		
		
		/**
		 * Incrémente l'index d'un DisplayObject.
		 * @param	pDisplayObject		Le DisplayObject à passer à la profondeur supérieure.
		 * @return	Le nouvel index du DisplayObject.
		 * @throws	Error Une erreur si le DiplayObject ou son parent est null.
		 */
		public static function bringForward(pDisplayObject:DisplayObject):int 
		{
			if ( pDisplayObject == null || pDisplayObject.parent == null ) throw new Error(DepthManager + " Le displayObject ne peut pas être null et son parent doit être définit");
			
			var maxIndex:int = DepthManager.getHighestDepth(pDisplayObject.parent);
			var displayObjectIndex:int = pDisplayObject.parent.getChildIndex(pDisplayObject);
			
			var nextIndex:int = (displayObjectIndex >= maxIndex) ? maxIndex : ++displayObjectIndex;			
			pDisplayObject.parent.setChildIndex(pDisplayObject, nextIndex);
			
			return pDisplayObject.parent.getChildIndex(pDisplayObject);			
		}
		
		/**
		 * Décrémente l'index d'un DisplayObject.
		 * @param	pDisplayObject		Le DisplayObject à passer à la profondeur inférieure.
		 * @return	Le nouvel index du DisplayObject.
		 * @throws	Error Une erreur si le DiplayObject ou son parent est null.
		 */
		public static function sendBackward(pDisplayObject:DisplayObject):int 
		{
			if ( pDisplayObject == null || pDisplayObject.parent == null ) throw new Error(DepthManager + " Le displayObject ne peut pas être null et son parent doit être définit");
			
			var minIndex:int = 0;
			var displayObjectIndex:int = pDisplayObject.parent.getChildIndex(pDisplayObject);
			
			var prevIndex:int = (displayObjectIndex <= 0) ? minIndex : --displayObjectIndex;
			pDisplayObject.parent.setChildIndex(pDisplayObject, prevIndex);
			
			return pDisplayObject.parent.getChildIndex(pDisplayObject);
		}
		
	}

}