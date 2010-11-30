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

package com.zombiz.app 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * Permet d'avoir un accès sécurisé au stage.
	 * Permet d'éviter le bug d'IE qui renvoi un stage avec les propriétés stageWidth et stageHeight à 0.
	 * Votre classe principale doit étendre cette classe.
	 * @author Pascal Achard
	 * @since 28/04/2010
	 * @version 1.0.0
	 */
	
	public class BaseApp extends MovieClip
	{
		
		/**
		 * Le constructeur
		 */
		public function BaseApp() 
		{
			// On initalise le stage.
			_initStage();
			
		}
		
		/**
		 * Initialise le stage.
		 */
		protected function _initStage():void 
		{
			if (stage) // On à déjà un stage.
			{
				if (stage.stageWidth > 0 && stage.stageHeight > 0) // Pas de bug de dimmension du stage.
				{
					StageReference.setStage(stage);
					_onStageIsInit();
				}
				else // On a le bug !
				{
					// Anit bug taille du stage = 0 dans ie.			
					stage.addEventListener(Event.RESIZE, _initResizeHandler);			
					stage.dispatchEvent(new Event(Event.RESIZE));
				}
			}
			else	// On a pas de stage (swf chargé dans une autre anim).
			{
				// On écoute l'ajout au stage.
				addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, false, 0, true );
			}
		}
		
		/**
		 * Déclanché sur le Event.ADDED_TO_STAGE
		 * @param	e
		 */
		private function addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			if (stage.stageWidth == 0 && stage.stageHeight == 0) // On a le bug !
			{
				// Anit bug taille du stage = 0 dans ie.			
				stage.addEventListener(Event.RESIZE, _initResizeHandler);			
				stage.dispatchEvent(new Event(Event.RESIZE));
			}
			else // Pas de bug de dimmension du stage.
			{
				StageReference.setStage(stage);
				_onStageIsInit();
			}
			
		}
		
		/**
		 * Déclanché sur le resise
		 * @param	e
		 */
		private function _initResizeHandler(e:Event):void 
		{
			if (stage.stageHeight > 0 && stage.stageWidth > 0) {
				
				stage.removeEventListener(Event.RESIZE, _initResizeHandler); // only execute once
				
				StageReference.setStage(stage);
				_onStageIsInit();
			}
		}
		
		/**
		 * Quand le stage à été initialisé.
		 */
		protected function _onStageIsInit():void 
		{
			//throw new Error("Cette méthode doit etre surchargée !");
		}
		
	}
	
}