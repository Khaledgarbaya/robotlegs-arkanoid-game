package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PaddleMediator extends Mediator
	{
		[Inject]
		public var paddle:Paddle;
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		public function PaddleMediator()
		{
			//nothing to do here and we should avoid that also
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
			paddle.init();
			gameLoopSignal.add( paddleGameLoop );
			super.onRegister();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event And Signal Handler
		//
		//--------------------------------------------------------------------------
		private function paddleGameLoop():void
		{
			//trace( "Padle Loop Is Working too :D" );
			paddle.move( contextView.mouseX );
		}		
		
		
	}
}