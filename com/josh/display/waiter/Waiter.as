package com.josh.display.waiter
{
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.Event;	
	
	public class Waiter extends Sprite
	{
		
		private var indiceRotation:int = 0;
		private var indiceAlpha:Number = 1;
		private var roundRect:Shape;
		private var _color:uint = 0xFFFFFF;
		private var _present:Boolean = false;
		private var _turn:TweenMax;
		private var _rotationSpeed:Number = 1.5;
		
		public function Waiter()
		{
			super ();
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		
		private function draw():void
		{			
			for (var i:int = 0; i < 12; i++)
			{
				roundRect = new Shape  ;
				roundRect.graphics.beginFill (_color);
				roundRect.graphics.drawRoundRect (-2, -30, 4, 12, 3);
				roundRect.graphics.endFill();
				addChild(roundRect);
				roundRect.rotation = indiceRotation;
				roundRect.alpha = indiceAlpha;
				indiceRotation -= 30;
				indiceAlpha -= 0.08;
			}
			
			cacheAsBitmap = true;
			
			turn();
		}
		
		private function clear():void
		{
			while(numChildren > 0) removeChildAt(0);
		}
		
		private function turn():void
		{
			_turn = new TweenMax(this, _rotationSpeed, { transformMatrix: { rotation:360 }, ease:Linear.easeNone, repeat:-1, glowFilter: { color:_color, alpha:.5, blurX:5, blurY:5 } } );
		}
		
		private function addedToStageHandler(event:Event):void
		{
			removeEventListener (Event.ADDED_TO_STAGE, addedToStageHandler);
			TweenPlugin.activate([GlowFilterPlugin, TransformMatrixPlugin]);
			draw();
		}
		
		private function removedFromStageHandler(event:Event):void
		{
			_turn.kill();
		}
		
		// GETTER / SETTER
		
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}
		
		public function get speed():Number
		{
			return _rotationSpeed;
		}
		
		public function set speed (value:Number):void
		{
			if(value > 0.5 && value < 1.5) _rotationSpeed = value;
		}
		
	}
}