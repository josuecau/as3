package com.josh.display.accordion
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Content extends MovieClip
	{
		
		public function Content()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
	}
		
}
