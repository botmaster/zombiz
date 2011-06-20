
package com.zombiz.media 
{
	
	/**
	 * Interface pour les classes qui peuvent lire des media.
	 * @author Pascal Achard
	 * @since 24 mai 2010
	 * @version 1.0.0
	 */
	
	 
	public interface IPlayable 
	{
		/**
		 * Charge un media.
		 * @param	pURL
		 */
		function load(pURL:String):void;
		
		/**
		 * Demarre la lécture d'un media.
		 */
		function play():void;
		
		/**
		 * Déplace la lecture du média à une position donnée en milisecondes.
		 * @param	pOffset La position en milisecondes.
		 */
		function seek(pOffset:Number):void;
		
		/**
		 * Arrête la lecture du média.
		 */
		function stop():void;
		
		/**
		 * Met en pause la lecture d'un média
		 */
		function pause():void;
		
		/**
		 * Bascule la pause.
		 */
		function togglePause():void
	}
	
}