package com.josh.display.accordion
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.josh.display.accordion.Accordion;
	import com.josh.display.accordion.Head;
	import com.josh.display.accordion.Content;
	
	public class Item extends MovieClip
	{
		
		public var head:Head;
		public var content:Content;
		
		private var _active:Boolean = false;
		private var _initX:int;
		private var _initY:int;
		
		public function Item()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_initX = x;
			_initY = y;
		}
		
		public function get initX():int
		{
			return _initX;
		}
		
		public function get initY():int
		{
			return _initY;
		}
		
		public function set active(value:Boolean):void
		{
			_active = value;
			//head.buttonMode = !active;
		}
		
		public function get active():Boolean
		{
			return _active;
		}
		
	}
		
}
