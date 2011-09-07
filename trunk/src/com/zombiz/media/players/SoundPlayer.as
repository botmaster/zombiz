/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.media.players 
{
	import com.zombiz.media.APlayer;
	import com.zombiz.media.events.MediaEvent;
	import com.zombiz.media.PlayerStates;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import nl.demonsters.debugger.MonsterDebugger;
	
	
	/**
	 * Un player audio
	 * @author Pascal Achard
	 */
	
	 //TODO: Je reçois 2 fois les données ID3 ?! Pourquoi ?
	 //TODO: Récupérer la durée : duration.
	 //TODO: Récupérer la position : position.
	 //TODO: Dispatcher les events qui vont bien.
	
	public class SoundPlayer extends APlayer 
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		public static const BUFFER_TICK:int = 30;
		
		/**
		 * L'objet Sound.
		 */
		private var _sound:Sound;
		
		/**
		 * Le channel.
		 */
		private var _channel:SoundChannel;
		
		/**
		 * Les données ID3.
		 */
		private var _id3:ID3Info;
		
		/**
		 * Au moment de la pause.
		 */
		private var _positionAtPause:Number;
		
		/**
		 * Le timer du buffering.
		 */
		private var _bufferingTimer:Timer;
		
		 
		
		// GETTERS - SETTERS
		// ----------------------------------------
		
		override public function get position():Number 
		{
			//return super.position;
			if (!_channel) return -1
			return _channel.position;
		}
		
		override public function get duration():Number 
		{
			if (_id3 && _id3.hasOwnProperty("TLEN"))
            {
                return parseFloat(_id3["TLEN"]) / 1000;
            }
            /*if (!isNaN(_manualDuration))
            {
                return _manualDuration / 1000;
            }
            return this._sound.length / 1000;*/
			
			return _sound.length; // attention, vrai seulement si le son est completement chargé. (enfin je crois ^^).
			
			return 0;
		}
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function SoundPlayer() 
		{
			super();
			
			
			// On initialise l'objet Sound.
			_initSound();
			
			// On créer les timer du buffer.
			_bufferingTimer = new Timer(BUFFER_TICK);
			_bufferingTimer.addEventListener(TimerEvent.TIMER, _bufferingTimerHandler, false, 0, true);
		}
		
		// METHODS
		// ----------------------------------------
		
		/**
		 * Initialise l'objet Sound.
		 */
		private function _initSound():void 
		{
			_sound = new Sound();
            _sound.addEventListener(ProgressEvent.PROGRESS, _loadProgressHandler, false, 0, true);
            _sound.addEventListener(IOErrorEvent.IO_ERROR, _loadErrorHandler, false, 0, true);
            _sound.addEventListener(Event.COMPLETE, _loadCompletedHandler, false, 0, true);
            _sound.addEventListener(Event.ID3, _ID3Handler, false, 0, true);
		}
		
		/**
		 * Destroy Sound.
		 */
		private function _destroySound():void 
		{
			if (!_sound) return;
			
			_sound.removeEventListener(ProgressEvent.PROGRESS, _loadProgressHandler, false);
            _sound.removeEventListener(IOErrorEvent.IO_ERROR, _loadErrorHandler, false);
            _sound.removeEventListener(Event.COMPLETE, _loadCompletedHandler, false);
            _sound.removeEventListener(Event.ID3, _ID3Handler, false);
			
			//TODO: Essayer de fermer le stream.
			//_sound.close();
			
			_sound = null;
			
		}
		
		/**
		 * Charge le son.
		 * @param	pURL
		 */
		override public function load(pURL:String):void 
		{
			super.load(pURL);
			
			// On reset le son.
			_resetSound();
			
			// On démarre le son.
			_startSound();
			
			
		}
		
		private function _startSound():void 
		{
			// On charge le son.
			_sound.load(new URLRequest(url)); // Nouveau SoundLoaderContext ?
			
			if (this.autoPlay)
            {
                play();
            }
            else
            {
                stop();
            }
			
			// On check si ça bufferise.
			_checkBuffering(true);
		}
		
		
		
		
		protected function playSound(pStartTime:Number = 0) : void
        {
            if (_channel)
            {
               _channel.stop();
               _channel.removeEventListener(Event.SOUND_COMPLETE, _loadCompletedHandler);
               _channel = null;
            }
			_channel = _sound.play(pStartTime, 0, _soundTransform);
            _channel.addEventListener(Event.SOUND_COMPLETE, _playCompletedHandler, false, 0, true);
			
        }
		
		
		
		/**
		 * Reset le son.
		 */
		private function _resetSound():void 
		{
			//TODO: Reseter le son. Channel, Sound, listeners...
			
			// On a un channel ouvert ?
			if (_channel)
            {
               _channel.stop();
               _channel.removeEventListener(Event.SOUND_COMPLETE, _loadCompletedHandler);
               _channel = null;
            }
			
			// On a un sound ?
			if (_sound)
			{
				_destroySound();
			}
			
			// On init le son.
			_initSound();
		}
		
		
		override public function play():void 
		{
			
			if (state == PlayerStates.PLAYING_STATE)
            {
                return;
            }
            if (state == PlayerStates.STOPPED_STATE)
            {
                _positionAtPause = 0;
            }
            playSound(_positionAtPause);
			
			super.play();
		}
		
		override public function stop():void 
		{
			if (state == PlayerStates.STOPPED_STATE)
            {
                return;
            }
            _positionAtPause = 0;
            if (_channel)
            {
				playSound(this._positionAtPause);
                _channel.stop();
            }
			
			super.stop();
		}
		
		override public function pause():void 
		{
			if (state == PlayerStates.PAUSED_STATE)
            {
                return;
            }
            if(_channel) _positionAtPause = _channel.position;
			
            if (_channel)
            {
                _channel.stop();
            }
			
			super.pause();
		}
		
		override protected function applyVolume():void 
		{
			if (_channel)
			{
				_channel.soundTransform = _soundTransform;
			}
		}
		
		/**
		 * Lance la vérification du buffering.
		 */
		private function _checkBuffering(pValue:Boolean):void 
		{			
			if (pValue)
			{
				if (!_bufferingTimer.running)
				{
					_bufferingTimer.start();
				}
			}else
			{
				if (_bufferingTimer.running)
				{
					_bufferingTimer.stop();
				}
			}
			
		}
		
		// EVENTS HANDLERS
		// ----------------------------------------
		private function _loadProgressHandler(e:ProgressEvent):void 
		{
			
		}
		
		private function _loadErrorHandler(e:IOErrorEvent):void 
		{
			
		}
		
		private function _loadCompletedHandler(e:Event):void 
		{
			// On stop le check du buffer.
			_checkBuffering(false);
		}
		
		/**
		 * Les données ID3 sont reçus
		 * @param	e
		 */
		private function _ID3Handler(e:Event):void 
		{
			//MonsterDebugger.log("Données ID3 reçues !");
			_id3 = e.currentTarget.id3;
		}
		
		/**
		 * Le média à fini de joué.
		 * @param	e
		 */
		private function _playCompletedHandler(e:Event):void 
		{
			//MonsterDebugger.log("Média terminé !");
			dispatchEvent(new MediaEvent(MediaEvent.COMPLETED_EVENT));
		}
		
		override protected function progressTimerHandler(e:TimerEvent):void 
		{
			super.progressTimerHandler(e);
		}
		
		
		private function _bufferingTimerHandler(e:TimerEvent):void 
		{
			setBufferStatus(_sound.isBuffering);
		}
		
		
	}

}