package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import net.khaledgarbaya.games.kgarkanoid.model.event.BrickModelEvent;
	import net.khaledgarbaya.games.kgarkanoid.view.event.GameLoopEvent;
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BallMediator extends Mediator
	{
		[Inject]
		public var ball:Ball;
		
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		public function BallMediator()
		{
			//Again  :p 
			//Forever alone
			//override the onRegister Method instead
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{	
			ball.init();
			gameLoopSignal.add( ballLoop );
			addViewListener( GameLoopEvent.START_LOOP, dispatch );
			addViewListener( GameLoopEvent.STOP_LOOP, dispatch );
			addViewListener( GameLoopEvent.STOP_LOOP, stopLoop );
			addContextListener( BrickModelEvent.NO_MORE_BRICKS_TO_HIT, initBall,BrickModelEvent);
			super.onRegister();
		}
		private function stopLoop ( event :GameLoopEvent ) :void
		{
			ball.init();
		}
		public function initBall( event : BrickModelEvent ) : void
		{
			ball.init();
		}
		private function ballLoop():void
		{
			ball.move();
		}
		
	}
}