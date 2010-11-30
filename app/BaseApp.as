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
	 * Permet d'avoir un accès sécurisé au stage grace à la méthode statique getStage()
	 * Permet d'éviter le bug d'IE qui renvoi un stage avec les propriétés stageWidth et stageHeight à 0.
	 * Votre classe principale doit étendre cette classe.
	 * @author Pascal Achard
	 * @since 28/04/2010
	 * @version 1.0.1
	 */
	
	public class BaseApp extends MovieClip
	{
		// PROPERTIES
		// ----------------------------------------
		
		// GETTERS - SETTERS
		// ----------------------------------------
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function BaseApp() 
		{
			// On test la présence d'un stage.
			if (stage) _addedToStageHandler();
			else addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
		}
		
		// METHODS
		// ----------------------------------------
		/**
		 * Point d'entrée de l'application.
		 * Fonction éxecutée quand on est sur d'avoir accès au stage et que ses dimensions ne sont pas égales à 0.
		 */
		protected function _startApp():void 
		{
			throw new Error("Cette méthode doit etre surchargée !");
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
		private function _addedToStageHandler(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			trace("stageWidth : " + stage.stageWidth, "stageHeight : " + stage.stageHeight);
			
			/**
			 * Test la présence d'un bug dans IE qui renvoi 0 pour les dimensions du stage.
			 * Attention ce hack ne foncitonne que si le stage est StageAlign.TOP_LEFT et StageScaleMode.NO_SCALE 
			 */
			if (stage.stageHeight <= 0 && stage.stageWidth <= 0)
			{
				trace("!!!!!!!!!!!!!! Bug IE stageWidth : " + stage.stageWidth, "stageHeight : " + stage.stageHeight + " !!!!!!!!!!!!!!");
				// On écoute le resize
				stage.addEventListener(Event.RESIZE, _resizeHandler);
				stage.dispatchEvent(new Event(Event.RESIZE)); // force stage resize event for normal cases
			}
			else
			{
				// On peut démarrer l'application.
				StageReference.setStage(stage);
				_startApp();
			}
			
		}
		
		
		private function _resizeHandler(e:Event):void 
		{
			if (stage.stageHeight > 0 && stage.stageWidth > 0) {
				
				stage.removeEventListener(Event.RESIZE, _resizeHandler); // only execute once
				
				StageReference.setStage(stage);
				_startApp();
			}
		}
		
		
		
	}
	
}