package net.khaledgarbaya.games.kgarkanoid.model
{
	import net.khaledgarbaya.games.kgarkanoid.model.event.BrickModelEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class BricksModel extends Actor
	{
		/**
		 * @private
		 * 
		 */
		private var _bricksCount : Number;
		
		public function BricksModel()
		{
		}

		/**
		 * the total active bricks on the inGameView
		 * by active mean not destroyed by the ball
		 * @return bricksCount Number
		 * 
		 */
		public function get bricksCount():Number
		{
			return _bricksCount;
		}

		/**
		 * 
		 * @private
		 */
		public function set bricksCount(value:Number):void
		{
			_bricksCount = value;
			if( _bricksCount <= 0){
				_bricksCount = 0;
				dispatch( new BrickModelEvent(BrickModelEvent.NO_MORE_BRICKS_TO_HIT));
			}
		}

	}
}