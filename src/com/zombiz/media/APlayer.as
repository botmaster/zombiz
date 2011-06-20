/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.media 
{
	import com.zombiz.media.events.MediaEvent;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.media.SoundTransform;
	import flash.utils.getQualifiedClassName;
	import flash.utils.Timer;
	
	/**
	 * Classe abstraite des différents types de player (vidéo player, mp3Player,...).
	 * @author Pascal Achard
	 */
	
	
	public class APlayer extends Sprite implements IAudible, IPlayable
	{
		
		// PROPERTIES
		// ----------------------------------------
		
		
		/**
		 * 
		 */
		public static const PROGRESS_TIMER_TICK:Number = 30;
		
		/**
		 * L'état du player.
		 */
		protected var _state:String;
		
		/**
		 * L'URL du média.
		 */
		protected var _url:String;
		
		/**
		 * Le media bufferise ?
		 */
		protected var _buffering:Boolean;
		
		/**
		 * L'objet SoundTransform du player.
		 */
		protected var _soundTransform:SoundTransform;
		
		/**
		 * Le volume.
		 */
		protected var _volume:Number;
		
		/**
		 * On attend le play()?
		 */
		protected var _autoPlay:Boolean;
		
		/**
		 * On joue en boucle ?
		 */
		protected var _loop:Boolean;
		
		/**
		 * La durée
		 */
		protected var _duration:Number;
		
		/**
		 * La postion de lecture.
		 */
		protected var _position:Number;
		
		/**
		 * Le timer de progression de lecture.
		 */
		protected var _trackProgressTimer:Timer;

		
		// GETTERS - SETTERS
		// ----------------------------------------
		public function get volume():Number 
		{
			return _volume;
		}
		
		public function set volume(value:Number):void 
		{
			_volume = value;
			
			_soundTransform.volume = value;
            
			
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function get url():String 
		{
			return _url;
		}
		
		public function set url(value:String):void 
		{
			_url = value;
		}
		
		public function get autoPlay():Boolean 
		{
			return _autoPlay;
		}
		
		public function set autoPlay(value:Boolean):void 
		{
			_autoPlay = value;
		}
		
		public function get loop():Boolean 
		{
			return _loop;
		}
		
		public function set loop(value:Boolean):void 
		{
			_loop = value;
		}
		
		public function get duration():Number 
		{
			return _duration;
		}
		
		public function get position():Number 
		{
			return _position;
		}
		
		
		
			
		// CONSTRUCTOR
		// ----------------------------------------
		public function APlayer() 
		{
			// Cette classe ne doit pas être instanciée directement.
			super ();
			if (getQualifiedClassName(this) == "com.zombiz.media::APlayer") {
				throw new Error ("Cette classe est abstraite et ne peut être instanciée !");
			}
			
			// Etat initial.
			_state = PlayerStates.IDDLE_STATE;
			
			// On créer le st.
			_soundTransform = new SoundTransform();
			
			// Volume par défaut. On le stock dans un SharedObject pour garder le précédant volume ?
			_volume = 1;
			
			// Le timer de progression.
			_trackProgressTimer = new Timer(APlayer.PROGRESS_TIMER_TICK);
			
			// On bufferise pas.
			_buffering = false;
			
		}
		
		
		
		
		
		// METHODS
		// ----------------------------------------
		
		/**
		 * Méthode abstraite pour appliquer le volume (SoundTransform). L'implémentation est différentes en fonction du player.
		 */
		protected function applyVolume():void 
		{
			throw new Error("Abstract method !!! Need to override !!!");
		}
		
		
		/**
		 * Définit l'état du player. Prévient le client du changement.
		 * @param	pValue
		 */
		protected function setState(pValue:String):void 
		{
			// On a besoin de changer l'état ?
			if (pValue == _state) return;
			
			_state = pValue;
			dispatchEvent(new MediaEvent(MediaEvent.STATE_CHANGE_EVENT));
			
			//TODO: diffuser des events sur le changement d'état.
			switch(_state)
            {
                case PlayerStates.PLAYING_STATE:
                {
                    dispatchEvent(new MediaEvent(MediaEvent.PLAY_EVENT));
                    break;
                }
				
				case PlayerStates.STOPPED_STATE:
                {
                    dispatchEvent(new MediaEvent(MediaEvent.STOP_EVENT));
                    break;
                }
				
                case PlayerStates.PAUSED_STATE:
                {
                    dispatchEvent(new MediaEvent(MediaEvent.PAUSE_EVENT));
                    break;
                }
                
                default:
                {
                    break;
                }
            }
		}
		
		/**
		 * Commence ou arrete l'écoute de la progression du media.
		 * @param	pStart
		 */
		protected function startTrackProgress(pStart:Boolean):void
		{
			if (pStart) {
				
				_trackProgressTimer.addEventListener(TimerEvent.TIMER, progressTimerHandler, false, 0, true);
				_trackProgressTimer.start();
				
			} else {
				
				_trackProgressTimer.removeEventListener(TimerEvent.TIMER, progressTimerHandler, false);
				_trackProgressTimer.stop();
			}
		}
		
		
		/**
		 * Définit le status du buffer.
		 * @param	param1
		 */
		protected function setBufferStatus(pValue:Boolean) : void
        {
            if (_buffering == pValue)
            {
                return;
            }
            _buffering = pValue;
			

            dispatchEvent(new MediaEvent(_buffering ? (MediaEvent.BUFFERING_EVENT) : (MediaEvent.BUFFERED_EVENT)));
            return;
        }
		
		
		
		
		/**
		 * Charge un média.
		 * @param	pURL
		 */
		public function load(pURL:String):void 
		{
			_url = pURL;
		}
		
		
		/**
		 * Joue le média.
		 */
		public function play():void 
		{
			setState(PlayerStates.PLAYING_STATE);
			
			startTrackProgress(true);
		}
		
		/**
		 * Se deplacer dans le media.
		 * @param	param1
		 */
		public function seek(pValue:Number) : void
        {
            
        }
		
		/**
		 * Stop le média.
		 */
		public function stop():void 
		{
			setState(PlayerStates.STOPPED_STATE);
			
			startTrackProgress(false);
		}
		
		/**
		 * Met en pause le média.
		 */
		public function pause():void 
		{
			setState(PlayerStates.PAUSED_STATE);
			
			startTrackProgress(false);
		}
		
		/**
		 * Bascule le play/pause.
		 */
		public function togglePause():void 
		{
			if (_state == PlayerStates.PLAYING_STATE)
			{
				pause();
			}else
			{
				play();
			}
		}
		
		
		
		
		// EVENTS HANDLERS
		// ----------------------------------------
		
		/**
		 * 
		 */
		protected function progressTimerHandler(e:TimerEvent):void 
		{
			dispatchEvent(new MediaEvent(MediaEvent.PROGRESS_EVENT));
		}
		
	}

}