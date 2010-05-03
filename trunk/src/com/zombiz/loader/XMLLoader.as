/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.loader 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	


	/**
	 * ...
	 * @author Pascal Achard
	 */
	
	public class XMLLoader extends EventDispatcher
	{
		
		// PROPERTIES
		// ----------------------------------------
		private var _loader:URLLoader;
		private var _XMLData:XML;
		private var _cacheKiller:Boolean;
		
		// GETTERS - SETTERS
		// ----------------------------------------
		
		public function get data():XML { return _XMLData; }
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function XMLLoader(pCacheKiller:Boolean = true) 
		{
			// Utilisation du cache.
			_cacheKiller = pCacheKiller;
			
			// Le loader.
			_loader = new URLLoader();
			_loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			// On écoute le loader.
			_registerEvent(_loader);
		}
		
		// METHODS
		// ----------------------------------------
		
		private function _registerEvent(pEventDispatcher:IEventDispatcher):void 
		{
			var eDispatcher:IEventDispatcher = pEventDispatcher;
			eDispatcher.addEventListener(Event.INIT, _redirectEvent);
			eDispatcher.addEventListener(Event.OPEN, _redirectEvent);
			eDispatcher.addEventListener(ProgressEvent.PROGRESS, _redirectEvent);
			eDispatcher.addEventListener(Event.COMPLETE, _loadCompleteHandler);
			eDispatcher.addEventListener(IOErrorEvent.IO_ERROR, _redirectEvent);
			eDispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _redirectEvent);
		}
		
		/**
		 * Charge et envoi les données d'une URL.
		 * @param	pRequest	L'URL.
		 */
		public function load(pRequest:URLRequest):void 
		{
			if (_cacheKiller) pRequest.requestHeaders.push(new URLRequestHeader("pragma", "no-cache"));
			_loader.load(pRequest);	
		}
		
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
		private function _redirectEvent(e:Event):void 
		{
			dispatchEvent(e);
		}
		
		private function _loadCompleteHandler(e:Event):void 
		{
			try 	
			{
				_XMLData = new XML( e.currentTarget.data);
				
			} catch ( pErreur:Error )
			{
				trace (pErreur);	
			}
			
			dispatchEvent(e);
		}
		
	}

}