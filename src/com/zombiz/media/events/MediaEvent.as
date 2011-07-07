package com.zombiz.media.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Pascal Achard
	 */
	public class MediaEvent extends Event 
	{
		
		/*public static const PLAY:String = "play";
        public static const PAUSE:String = "paused";
        public static const STOP:String = "stop";
        public static const COMPLETED:String = "completed";
        public static const METADATA_RECEIVED:String = "metadataReceived";
        public static const ID3_RECEIVED:String = "id3Received";
        public static const LOOP:String = "loop";
        public static const BUFFERING:String = "buffering";
        public static const BUFFERED:String = "buffered";
        public static const STATUS_CHANGED:String = "statusChanged";
        public static const VOLUME_CHANGED:String = "volumeChanged";
        public static const LOAD_COMPLETED:String = "loadCompleted";
        public static const LOAD_PROGRESS:String = "loadProgress";
        public static const LOAD_ERROR:String = "loadError";*/
		
		
		/*public static const START:String = "mediaStart";
		public static const STOP:String = "mediaStop";
		public static const PROGRESS:String = "mediaProgess";
		public static const COMPLETE:String = "mediaComplete";
		public static const METADATA:String = "mediaMetadata";
		public static const BUFFERING:String = "BUFFERING";
		public static const LOAD:String = "mediaLoad";*/
		
		public static const STATE_CHANGE_EVENT:String			= "STATE_CHANGE_EVENT";
		public static const PLAY_EVENT:String 					= "PLAY_EVENT";
		public static const STOP_EVENT:String 					= "STOP_EVENT";
		public static const PAUSE_EVENT:String 					= "PAUSE_EVENT";		
		public static const PROGRESS_EVENT:String				= "PROGRESS_EVENT";		
		public static const COMPLETED_EVENT:String				= "COMPLETED_EVENT";
		public static const BUFFERING_EVENT:String 				= "BUFFERING_EVENT";
        public static const BUFFERED_EVENT:String 				= "BUFFERED_EVENT";
		public static const LOOP_EVENT:String 					= "LOOP_EVENT";
		public static const LOAD_PROGRESS:String 				= "LOAD_PROGRESS";
		public static const LOAD_COMPLETED:String 				= "LOAD_COMPLETED";
		public static const LOAD_ERROR:String 					= "LOAD_ERROR";
		
		
		
		public function MediaEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);			
		} 
		
		public override function clone():Event 
		{ 
			return new MediaEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("MediaEvent", "type", "bubbles", "cancelable", "eventPhase");
			
		}
		
		
		
	}
	
}