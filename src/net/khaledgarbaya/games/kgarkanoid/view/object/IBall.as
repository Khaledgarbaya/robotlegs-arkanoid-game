package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import flash.display.DisplayObject;

	/**
	 * the basic blue print of the ball object
	 * @author Khaled Garbaya
	 * 
	 */
	public interface IBall
	{		
		function move () : void
		function destroy() : void;
		function hittedBy ( object : DisplayObject ) : void 
		function reflect() : void; 
	}
}