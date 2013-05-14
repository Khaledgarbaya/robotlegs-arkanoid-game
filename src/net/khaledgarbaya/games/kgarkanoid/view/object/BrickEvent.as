package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import flash.events.Event;
	
	public class BrickEvent extends Event
	{
		public static var BRICK_DESTROYED:String = "brickDestoryed";
		public function BrickEvent(type:String,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			// TODO Auto Generated method stub
			return new BrickEvent(type,bubbles, cancelable);
		}
		
		
	}
}