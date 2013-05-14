package net.khaledgarbaya.games.kgarkanoid.model
{
	import net.khaledgarbaya.games.kgarkanoid.model.event.ScoreModelEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * holds the game's score data 
	 * @author Khaled
	 * 
	 */
	public class ScoreModel extends Actor
	{
		/**
		 * @private 
		 */
		private var _score : Number;
		
		public function ScoreModel()
		{
			_score = 0;
		}
		
		/**
		 * the current player score 
		 * @return score Number
		 * 
		 */
		public function get score():Number
		{
			return _score;
		}
		/**
		 * @private 
		 */
		public function set score(value:Number):void
		{
			_score = value;
			dispatch( new ScoreModelEvent(ScoreModelEvent.SCORE_UPDATED) );
		}

	}
}