package net.khaledgarbaya.games.kgarkanoid.model.event
{
	import flash.events.Event;
	
	public class BrickModelEvent extends Event
	{
		public static var NO_MORE_BRICKS_TO_HIT : String = "noMoreBricksToHit";
		public function BrickModelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new BrickModelEvent( type, bubbles, cancelable );
		}
		
		
	}
}