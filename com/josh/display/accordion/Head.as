package com.josh.display.accordion
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Head extends MovieClip
	{
		
		public static const ON_ROLL_OVER	:String = 'onRollOver';
		public static const ON_CLICK		:String = 'onClick';
		
		public function Head()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			buttonMode = true;
			mouseChildren = false;
			addEventListener(MouseEvent.CLICK, clickHandler);
			addEventListener(MouseEvent.ROLL_OVER, rollHoverHandler);
		}
		
		private function clickHandler(e:MouseEvent):void
		{
			dispatchEvent(new Event(Head.ON_CLICK, true));
		}
		
		private function rollHoverHandler(e:MouseEvent):void
		{
			dispatchEvent(new Event(Head.ON_ROLL_OVER, true));
		}
		
	}
		
}
