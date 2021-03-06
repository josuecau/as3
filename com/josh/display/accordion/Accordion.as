package com.josh.display.accordion
{
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.josh.display.accordion.Item;
	import com.josh.display.accordion.Head;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	
	dynamic public class Accordion extends MovieClip
	{
		
		public static const HORIZONTAL		:String = 'horizontal';
		public static const VERTICAL		:String = 'vertical';
		public static const ON_ROLL_OVER	:String = 'onRollOver';
		public static const ON_CLICK		:String = 'onClick';

		private var _items:Array;
		private var _slide:String;
		private var _duration:Number = .3;
		private var _mouse:String;
		private var _locked:Boolean;
		private var _currentItem:Item;
		private var _mask:Shape;
		private var _easing:Function;
		
		public function Accordion()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_items = new Array();			
			
			var i:int = numChildren;
			
			while(i--)
			{
				var child:DisplayObject = getChildAt(i);
				if( child is Item) addItem(child as Item);
			}
			
			/* default settings */
			slide = Accordion.HORIZONTAL;
			mouse = Accordion.ON_CLICK;
			locked = false;
			easing = Quint.easeOut;
			
			/* mask */
			toMask();
			
		}
		
		private function mouseHandler(e:Event):void
		{
			if(e.target.parent is Item)
			{
				openItem(e.target.parent as Item);
			}
		}
		
		public function addItem(item:Item):void
		{
			_items.push(item);
		}
		
		private function openItem(item:Item):void
		{
			_currentItem = item;
			
			for each(var i:Item in _items)
			{
				/* item ouvert / fermé */
				i.active = (i == currentItem);
				
				if(getChildIndex(i) > getChildIndex(currentItem))
				{
					switch(slide)
					{
						case Accordion.HORIZONTAL :
							TweenMax.to(i, duration, { x:i.initX + i.content.width, ease:easing } );
							break;
						case Accordion.VERTICAL :
							TweenMax.to(i, duration, { y:i.initY + i.content.height, ease:easing } );
							break;
					}
				}
				else
				{
					switch(slide)
					{
						case Accordion.HORIZONTAL :
							TweenMax.to(i, duration, { x:i.initX, ease:easing } );
							break;
						case Accordion.VERTICAL :
							TweenMax.to(i, duration, { y:i.initY, ease:easing } );
							break;
					}
				}
			}
		}
		
		private function toMask():void
		{
			_mask = new Shape();
			_mask.graphics.clear();
			_mask.graphics.beginFill(0xFF0000);
			_mask.graphics.drawRect(0, 0, width, height);
			addChild(_mask);
			mask = _mask;
		}
		
		/* GETTER / SETTER */
		
		public function set slide(value:String):void
		{
			_slide = (value == Accordion.VERTICAL) ? Accordion.VERTICAL : Accordion.HORIZONTAL;
		}
		
		public function get slide():String
		{
			return _slide;
		}
		
		public function set duration(value:Number):void
		{
			_duration = value;
		}
		
		public function get duration():Number
		{
			return _duration;
		}
		
		public function set mouse(value:String):void
		{
			switch(value)
			{
				case Accordion.ON_ROLL_OVER :
					removeEventListener(Head.ON_CLICK, mouseHandler);
					addEventListener(Head.ON_ROLL_OVER, mouseHandler);
					_mouse = value;
					break;
				case Accordion.ON_CLICK :
					addEventListener(Head.ON_CLICK, mouseHandler);
					removeEventListener(Head.ON_ROLL_OVER, mouseHandler);
					_mouse = value;
					break;
			}
		}
		
		public function get mouse():String
		{
			return _mouse;
		}
		
		public function set locked(value:Boolean):void
		{
			_locked = value;
			if(locked)
			{
				removeEventListener(Head.ON_CLICK, mouseHandler);
				removeEventListener(Head.ON_ROLL_OVER, mouseHandler);
			}
			else
			{
				mouse = mouse;
			}
			
			for each(var i:Item in _items) i.head.buttonMode = !locked;
		}
		
		public function get locked():Boolean
		{
			return _locked;
		}
		
		public function set currentItem(value:Item):void
		{
			_currentItem = value;
			openItem(currentItem);
		}
		
		public function get currentItem():Item
		{
			return _currentItem;
		}
		
		public function set easing(value:Function):void
		{
			_easing = value;
		}
		
		public function get easing():Function
		{
			return _easing;
		}
		
		
	}
		
}
