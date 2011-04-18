package com.zombiz.display.loader.visualprogress

{
	import flash.display.DisplayObject;
	
	/**
	 * Exeple de barre de progression.
	 * @author Pascal Achard
	 * @since 18 avril 2011
	 * @version 1.0.0
	 */
	
	public class BarProgress extends AVisualProgress
	{
		
		
		public var bar_mc:DisplayObject;
		
		public function BarProgress()
		{
			super ();
		}
		
		override public function setProgress(pRatio:Number):void 
		{
			// Encapsuler le changement
			bar_mc.scaleX = pRatio;
		}
		
		
	}
	
}