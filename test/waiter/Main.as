package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.josh.display.waiter.Waiter;
	import fl.ImportFlashClasses;
	
	public class Main extends Sprite
	{
		
		public var waiter:Waiter;

		public function Main ()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			waiter = new Waiter();
			waiter.color = 0x00FF00;
			addChild(waiter);
			
			waiter.x = stage.stageWidth / 2;
			waiter.y = stage.stageHeight / 2;
			waiter.scaleX = waiter.scaleY = .7;
			
		}

	}

}