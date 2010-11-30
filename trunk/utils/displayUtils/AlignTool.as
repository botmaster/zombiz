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

package com.zombiz.utils.displayUtils 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	
	/**
	 * AlignTool est une classe qui permet d'aligner un display object par rapport à un autre.
	 * @author Pascal Achard
	 * @since 04/15/10
	 * @version 1.0
	 * 
	 * @example <listing version="3.0"> 
	 * 	AlignTool.alignCenter(rect, ref);
	 * </listing> 
	 */
	
	 
	public class AlignTool 
	{
		
		public function AlignTool() 
		{
			throw new Error( this + " Ne pas instancier cette classe utilitaire" );
		}
		
		/**
		 * Aligne un DisplayObject sur le coté gauche d'un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 * @param	pPadding = 0	Le décalage.
		 */
		public static function alignLeft(pWho:DisplayObject, pWith:DisplayObject, pPadding:Number = 0):void 
		{
			pWho.x = pWith.x + pPadding;
		}
		
		/**
		 * Aligne un DisplayObject sur le coté droit d'un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 * @param	pPadding = 0	Le décalage.
		 */
		public static function alignRight(pWho:DisplayObject, pWith:DisplayObject, pPadding:Number = 0):void 
		{
			pWho.x = pWith.x + pWith.width - pWho.width - pPadding;
		}
		
		/**
		 * Aligne un DisplayObject sur le haut d'un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 * @param	pPadding = 0	Le décalage.
		 */
		public static function alignTop(pWho:DisplayObject, pWith:DisplayObject, pPadding:Number = 0):void 
		{
			pWho.y = pWith.y - pWho.height - pPadding;
		}
		
		/**
		 * Aligne un DisplayObject sur le haut d'un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 * @param	pPadding = 0	Le décalage.
		 */
		public static function alignBottom(pWho:DisplayObject, pWith:DisplayObject, pPadding:Number = 0):void 
		{
			pWho.y = pWith.y + pWith.height + pPadding;
		}
		
		/**
		 * Aligne horizontalement un DisplayObject sur un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 */
		public static function alignCenterH(pWho:DisplayObject, pWith:DisplayObject):void 
		{
			pWho.x = pWith.x + ((pWith.width - pWho.width) >> 1);
		}
		
		/**
		 * Aligne verticalement un DisplayObject sur un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 */
		public static function alignCenterV(pWho:DisplayObject, pWith:DisplayObject):void 
		{
			pWho.y = pWith.y + ((pWith.height - pWho.height) >> 1);
		}
		
		/**
		 * Aligne un DisplayObject sur un autre DisplayObject.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pWith	Le DisplayObject référence.
		 */
		public static function alignCenter(pWho:DisplayObject, pWith:DisplayObject):void 
		{
			AlignTool.alignCenterH(pWho, pWith);
			AlignTool.alignCenterV(pWho, pWith);
		}
		
		
		/**
		 * Aligne horizontalement un DisplayObject sur le stage.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pStage	Le stage.
		 */
		public static function alignToStageCenterH(pWho:DisplayObject, pStage:Stage):void 
		{
			pWho.x = (pStage.stageWidth - pWho.width) >> 1;
		}
		
		/**
		 * Aligne verticalement un DisplayObject sur le stage.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pStage	Le stage.
		 * @param	pXPadding = 0	Le décalage.
		 */
		public static function alignToStageCenterV(pWho:DisplayObject, pStage:Stage):void 
		{
			pWho.y = (pStage.stageHeight - pWho.height) >> 1;
		}
		
		/**
		 * Aligne un DisplayObject sur le stage.
		 * @param	pWho	Le DisplayObject à aligner.
		 * @param	pStage	Le stage.
		 * @param	pXPadding = 0	Le décalage.
		 */
		public static function alignToStageCenter(pWho:DisplayObject, pStage:Stage):void 
		{
			AlignTool.alignToStageCenterH(pWho, pStage);
			AlignTool.alignToStageCenterV(pWho, pStage);
		}
		
	}
	
}