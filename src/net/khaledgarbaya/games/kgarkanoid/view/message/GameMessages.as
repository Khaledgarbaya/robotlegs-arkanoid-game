package net.khaledgarbaya.games.kgarkanoid.view.message
{
	public class GameMessages extends Object implements IGameMessage
	{
		private static var TRY_AGAIN_MESSAGE  : String = "Oups !! Left Click to retry"
		private static var START_GAME_MESSAGE : String = "Left click to start the game";
		private static var GAME_OVER_MESSAGE  : String = "Left click to play again\nYour  score is : ";
		public function GameMessages()
		{
			super();
		}
		
		public function get tryAgainMessage():String
		{
			return TRY_AGAIN_MESSAGE;
		}
		
		public function get startGameMessage():String
		{
			return START_GAME_MESSAGE;
		}
		
		public function get gameOverMessage():String
		{
			return GAME_OVER_MESSAGE;
		}
	}
}