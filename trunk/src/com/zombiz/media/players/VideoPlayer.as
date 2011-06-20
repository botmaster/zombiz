/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.media.players 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.zombiz.media.APlayer;
	import com.zombiz.media.events.MediaEvent;
	import com.zombiz.media.PlayerStates;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	
	
	/**
	 * Le Player video.
	 * @author Pascal Achard
	 */
	
	 
	 //TODO: J'utilise un CustomClient pour recevoir les metadata, j'ai des problème de scope et d'encapsulation (duration);
	
	public class VideoPlayer extends APlayer 
	{
		static public const DEFAULT_BUFFERING_TIME:Number = 3;
		static public const DEFAULT_SMOOTHING:Boolean = false;
		
		
		// PROPERTIES
		// ----------------------------------------
		
		
		
		/**
		 * La taille de la video.
		 */
		private var _size:Rectangle;
		
		/**
		 * Redimensionnement auto ?
		 */
		private var _autoSize:Boolean;
		
		/**
		 * L'objet Video.
		 */
		private var _videoDisplay:Video;
		
		/**
		 * Lissage de la vidéo ?
		 */
		private var _smoothing:Boolean;
		
		/**
		 * La NetConnection
		 */
		private var _netConnection:NetConnection;
		
		/**
		 * Le stream
		 */
		private var _netStream:NetStream;
		
		/**
		 * Les metadata
		 */
		private var _metadata:Object;
		
		/**
		 * L'objet qui reçoi les données de la vidéo.
		 */
		private var _client:CustomClient;
		
		/**
		 * La vidéo est terminée ?
		 */
		private var _videoEnded:Boolean;
		
		
		
		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get metadata():Object 
		{
			return _metadata;
		}
		
		public function set metadata(value:Object):void 
		{
			_metadata = value;
		}
		
		public function set duration(pValue:Number):void 
		{
			_duration = pValue;
		}
		
		public function get smoothing():Boolean 
		{
			return _smoothing;
		}
		
		public function set smoothing(value:Boolean):void 
		{
			_smoothing = value;
			if (_videoDisplay) _videoDisplay.smoothing = _smoothing;
		}
		
		override public function get position():Number 
		{
			//return super.position;
			if (!_netStream) return -1;
			
			return _netStream.time;
		}
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function VideoPlayer(pAutoSize:Boolean = false, pWidth:int = 320, pHeight:int = 240) 
		{
			super();
			
			// Le smoothing par defaut.
			_smoothing = VideoPlayer.DEFAULT_SMOOTHING;
			
			// Les dimension de l'objet Video.
			_size = new Rectangle(0, 0, pWidth, pHeight);
			
			// On redimensionne automatiquement ?
			_autoSize = pAutoSize;
			
			// On créer l'objet video.
			_buildVideo();
			
			// On créer le custom client pour les metatdata, cuepoints...
			_client = new CustomClient(this, _autoSize);
		}
		
		// METHODS
		// ----------------------------------------
		
		/**
		 * Créer l'objet vidéo.
		 */
		private function _buildVideo():void 
		{
			_videoDisplay = new Video(_size.width, _size.height);
			_videoDisplay.smoothing = _smoothing;
			addChild(_videoDisplay);
		}
		
		/**
		 * Créer la NetConnection.
		 */
		private function _setupNetConnection():void 
		{
			MonsterDebugger.trace(this, "Setup of NetConnection.", "Botmaster", "", 0xff00ff, 1);
			_netConnection = new NetConnection();
            _netConnection.addEventListener(NetStatusEvent.NET_STATUS, _netStatusHandler);
			_netConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _securityErrorHandler); 
           
			// On fait du progressive download.
            _netConnection.connect(null);
		}
		
		
		
		
		/**
		 * Créer le NetStream.
		 */
		private function _setupNetStream():void 
		{
			MonsterDebugger.trace(this, "Setup of NetStream.", "Botmaster", "", 0xff00ff, 1);
			_netStream = new NetStream(_netConnection);
			_netStream.bufferTime = VideoPlayer.DEFAULT_BUFFERING_TIME;
			_netStream.client = _client;
			_netStream.addEventListener(NetStatusEvent.NET_STATUS, _netStatusHandler);
			_netStream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _asyncErrorHandler);
			
			
			// Commence le chargement.
			playStream();
			
			_videoDisplay.attachNetStream(_netStream);
		}
		
		
		protected function playStream() : void
        {
            /*this._flushed = false;
            this._stopped = false;
            this._netStream.bufferTime = _bufferTime;*/
			
			// La vidéo n'est pas terminée.
			_videoEnded =  false;
			
			// Joue le stream.
            _netStream.play(_url);
			
            //Au début la vidéo bufferise.
			setBufferStatus(true);
			
			// Applique le volume.
            applyVolume();
			
            if (autoPlay)
            {
                play();
            }
            else
            {
                stop();
            }
            // this.resetTimer(this._timerLoad, true);
            return;
        }
		
		/**
		 * Change la taille du player.
		 * @param	pWidth
		 * @param	pHeight
		 */
		public function setSize(pWidth:Number, pHeight:Number):void 
		{
			if (_size) _size = null;
			
			_size = new Rectangle(0, 0, pWidth, pHeight);
			_videoDisplay.width = _size.width;
			_videoDisplay.height = _size.height;
		}
		
		/**
		 * Charge la vidéo.
		 * @param	pURL
		 */
		override public function load(pURL:String):void 
		{
			super.load(pURL);
			
			// Si pas de connexion, on la créer.
			if (!_netConnection)
			{
				_setupNetConnection();
			}else
			{
				playStream();
			}
			
		}
		
		override public function play():void 
		{
			if (state == PlayerStates.PLAYING_STATE)
            {
                return;
            }
            if (state == PlayerStates.STOPPED_STATE)
            {
                //_netStream.seek(0);
            }
			
            this._netStream.resume();
			
            super.play();
			
		}
		
		override public function stop():void 
		{
			if (state == PlayerStates.STOPPED_STATE)
            {
                return;
            }
            _netStream.seek(0);
            _netStream.pause();
			
            super.stop();
		}
		
		override public function pause():void 
		{
			if (state == PlayerStates.PAUSED_STATE) return;
			
            _netStream.pause();
			
            super.pause();
		}
		
		override public function seek(pValue:Number):void 
		{
			if (state== PlayerStates.STOPPED_STATE)
            {
                setState(PlayerStates.PAUSED_STATE);
            }
            if (_duration) _netStream.seek(pValue * _duration / 100);
		}
		
		override protected function applyVolume():void 
		{
			if (_netStream)
            {
                _netStream.soundTransform = _soundTransform;
            }
		}
		
		
		// EVENTS HANDLERS
		// ----------------------------------------
		private function _netStatusHandler(e:NetStatusEvent):void 
		{
			MonsterDebugger.trace(this, e.info);
			switch (e.info.code) {
				
                case "NetConnection.Connect.Success":
                    _setupNetStream();
                    break;
				case "NetConnection.Connect.Failed":
                case "NetConnection.Connect.Success":
					trace(e.info.code);
					break;
                    
                case "NetStream.Play.StreamNotFound":
                    trace("Unable to locate video: " + _netStream.info);
                    break;
				case "NetStream.Play.Start":
                    trace("La vidéo commence");
					
                    break;
				case "NetStream.Play.Stop": 
					trace("La vidéo stop");
					_videoEnded = true;
					break;
				case "NetStream.Buffer.Empty": 
					trace("La vidéo bufferise");
					setBufferStatus(true);
					break;
				case "NetStream.Buffer.Full": 
					setBufferStatus(false);
					break;
			}
		}
		
		private function _securityErrorHandler(e:SecurityErrorEvent):void 
		{
			 trace("_securityErrorHandler: " + e);
			 MonsterDebugger.trace(this, e.text);
		}
		
		private function _asyncErrorHandler(e:AsyncErrorEvent):void 
		{
			// ignore AsyncErrorEvent events.
		}
		
		
		/**
		 * Ecoute la progression du media.
		 * @param	e
		 */
		override protected function progressTimerHandler(e:TimerEvent):void 
		{
			
			if (_position == _duration || _videoEnded) {
				_videoEnded = false;
				stop();
				
				dispatchEvent(new MediaEvent(MediaEvent.COMPLETED_EVENT));
			}
			
			super.progressTimerHandler(e);
		}
		
	}

}

import com.zombiz.media.players.*
class CustomClient {
	
	private var _videoPlayer:VideoPlayer;
	private var _metadata:Object;
	private var _autoSize:Boolean;
	
	public function CustomClient(pVideoPlayer:VideoPlayer, pAutoSize:Boolean = false ) 
	{
		_videoPlayer = pVideoPlayer;
		_autoSize = pAutoSize;
	}
	
    public function onMetaData(pObject:Object):void {
		//for (var i:String in pObject) trace("key : " + i , ", value : " + pObject[i]);       
		
		// On stocke les metadata.
		_metadata = pObject;
		_videoPlayer.metadata = _metadata;
		
		
		// Si les metadata contiennent la durée du média, on la stoque.
		if (_metadata.hasOwnProperty("duration"))
		{
			_videoPlayer.duration = Number(_metadata.duration);
		}
		
		// Si les metadata contiennent les dimension de la vidéo, on les stock et on met à jour les dimension de l'objet Video si besoin.
		if (_metadata.hasOwnProperty("width") && _metadata.hasOwnProperty("height"))
		{
			if (_autoSize) _videoPlayer.setSize(Number(_metadata.width), Number(_metadata.height));
		}
    }
	
    public function onCuePoint(info:Object):void {
        trace("cuepoint: time=" + info.time + " name=" + info.name + " type=" + info.type);
    }
	
	public function onXMPData(pObject:Object):void 
	{
		//for (var i:String in pObject) trace("key : " + i + ", value : " + pObject[i]);
		
	}
}