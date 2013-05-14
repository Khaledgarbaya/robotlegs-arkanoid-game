package net.khaledgarbaya.games.kgarkanoid.model.event
{
	import flash.events.Event;
	
	public class ScoreModelEvent extends Event
	{
		public static var SCORE_UPDATED : String = "scoreUpdated";
		public function ScoreModelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ScoreModelEvent(type, bubbles, cancelable);
		}
		
		
	}
}