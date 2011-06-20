/*
  Copyright (c) 2009, La Haute Société (http://www.lahautesociete.com).
  All rights reserved.
*/

package com.zombiz.media 
{
	import com.zombiz.core.BaseClass;
	
	/**
	 * Les "états" du player.
	 * @author Pascal Achard
	 */
	
	 //TODO: Un état BUFFERING_STATE et SEEKING_STATE ?
	
	public class PlayerStates extends BaseClass 
	{
		
		// PROPERTIES
		// ----------------------------------------		
		
		
		public static const IDDLE_STATE:String		= "IDDLE_STATE";
		public static const PLAYING_STATE:String 	= "PLAYING_STATE";
        public static const STOPPED_STATE:String 	= "STOPPED_STATE";
        public static const PAUSED_STATE:String 	= "PAUSED_STATE";
		
		
	}

}