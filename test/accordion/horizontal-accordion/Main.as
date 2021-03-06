package
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import com.josh.display.accordion.Accordion;
	
	public class Main extends Sprite
	{
		
		public var accordion:Accordion;
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			accordion.duration = .6;
			accordion.slide = Accordion.VERTICAL;
			accordion.mouse = Accordion.ON_ROLL_OVER;
	
		}
		
	}
		
}