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

package com.zombiz.loader 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	/**
	 * Charge des média JPG, GIF, SWF.
	 * Basé sur le livre de Thibault Imbert.
	 * @author Pascal Achard
	 * @since 24/04/2010
	 * @version 1.0.0
	 */
	
	//TODO: regarder la syntaxe metaTags
	
	public class MediaLoader extends Sprite
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		public static const SCALE_OUT:String = "SCALE_OUT";
		public static const SCALE_IN:String = "SCALE_IN";
		public static const SCALE_STRETCH:String = "SCALE_STRETCH"; 
		public static const NO_SCALE:String = "NO_SCALE"; 
		
		private var _loader:Loader;
		private var _width:Number;
		private var _height:Number;
		private var _smooth:Boolean;
		private var _cli:LoaderInfo;
		private var _scaleMode:String;
		
		private var _content:DisplayObject;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get scaleMode():String { return _scaleMode; }
		
		public function set scaleMode(value:String):void 
		{
			if (value != MediaLoader.NO_SCALE && value != MediaLoader.SCALE_IN && value != MediaLoader.SCALE_OUT && value != MediaLoader.SCALE_STRETCH)
			{
				throw new Error(value + " n'est pas un mode valide");
				return;
			}
			_scaleMode = value;
		}
		
		public function get content():DisplayObject { return _content; }
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function MediaLoader(pWidth:Number, pHeight:Number, pSmooth:Boolean = true) 
		{
			_width = pWidth;
			_height = pHeight;
			_smooth = pSmooth;
			
			_loader = new Loader();
			addChild(_loader);
			
			// Mode par défaut.
			_scaleMode = MediaLoader.SCALE_IN;
			
			_cli = _loader.contentLoaderInfo;
			
			// On écoute le stage.
			addEventListener(Event.ADDED_TO_STAGE, _addToStageHandler, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, _removeFromStageHandler, false, 0, true);
			
		}
		
		
		
		// METHODS
		// ----------------------------------------	
		
		/**
		 * Charge un fichier SWF ou une Image dans un DisplayObject.
		 * @param	pURLRequest	La requette URL du média à charger.
		 * @param	pContext	Le context de chargement.
		 */
		public function load(pURLRequest:URLRequest, pContext:LoaderContext = null):void 
		{
			_loader.load(pURLRequest, pContext);
		}
		
		/**
		 * Annule un chargement qui est en cours sur l'instance de l'objet Loader.
		 */
		public function close():void 
		{
			_loader.close();
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------		
		private function _addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addToStageHandler);
			
			_cli.addEventListener ( Event.INIT, _redirectEvent );
			_cli.addEventListener ( Event.OPEN, _redirectEvent );
			_cli.addEventListener ( ProgressEvent.PROGRESS, _redirectEvent );
			_cli.addEventListener ( Event.COMPLETE, _loadCompleteHandler );
			_cli.addEventListener ( IOErrorEvent.IO_ERROR, _redirectEvent );
		}
		
		private function _redirectEvent(e:Event):void 
		{
			dispatchEvent(e);	
		}
		
		private function _removeFromStageHandler(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _removeFromStageHandler);
			
			_cli.removeEventListener ( Event.INIT, _redirectEvent );
			_cli.removeEventListener ( Event.OPEN, _redirectEvent );
			_cli.removeEventListener ( ProgressEvent.PROGRESS, _redirectEvent );
			_cli.removeEventListener ( Event.COMPLETE, _loadCompleteHandler );
			_cli.removeEventListener ( IOErrorEvent.IO_ERROR, _redirectEvent );	
		}
		
		private function _loadCompleteHandler ( e:Event ):void 
		{	
			//var loadedContent:DisplayObject = e.target.content;
			_content = e.target.content;
			
			if ( _content is Bitmap ) {
				Bitmap(_content).pixelSnapping = PixelSnapping.NEVER;
				Bitmap(_content).smoothing = _smooth;
			}
			
			var ratio:Number;
			scaleX = scaleY = 1;
			
			switch (_scaleMode) 
			{
				case MediaLoader.SCALE_IN:
					ratio = Math.min ( _width / _content.width,  _height / _content.height );
					scaleX = scaleY = ratio;
				break;
				case MediaLoader.SCALE_OUT:
					ratio = Math.max ( _width / _content.width,  _height / _content.height );
					scaleX = scaleY = ratio;
				break;
				case MediaLoader.SCALE_STRETCH:
					_loader.width = _width;
					_loader.height = _height;
				break;
				
				case MediaLoader.NO_SCALE:
				default:	
				
				break;
			}
			
			// On redirige l'event.
			dispatchEvent(e);
		}
		
		
	}
	
}