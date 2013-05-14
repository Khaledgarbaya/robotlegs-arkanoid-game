package net.khaledgarbaya.games.kgarkanoid.view.message
{
	public interface IGameMessage
	{
		function get tryAgainMessage()  : String;
		function get startGameMessage() : String;
		function get gameOverMessage()  : String;
	}
}