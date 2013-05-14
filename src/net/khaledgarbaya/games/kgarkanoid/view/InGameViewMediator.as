package net.khaledgarbaya.games.kgarkanoid.view
{
	import flash.events.MouseEvent;
	
	import net.khaledgarbaya.games.kgarkanoid.model.BricksModel;
	import net.khaledgarbaya.games.kgarkanoid.model.ScoreModel;
	import net.khaledgarbaya.games.kgarkanoid.model.event.BrickModelEvent;
	import net.khaledgarbaya.games.kgarkanoid.view.event.GameLoopEvent;
	import net.khaledgarbaya.games.kgarkanoid.view.message.IGameMessage;
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class InGameViewMediator extends Mediator
	{
		//declare view to be injected
		[Inject]
		public var view:InGameView;
		
		//declare the gameLoopSignal Singleton
		[Inject]
		public var gameLoopSignal:GameLoopSignal;
		
		//declare the brick model to track how many bricks still active
		[Inject]
		public var bricksModel:BricksModel;
		
		//declare score model to reset it when the game restarts
		[Inject]
		public var scoreModel:ScoreModel;
		
		//decalre message object to get appropriate message for each case
		[Inject]
		public var gameMessage:IGameMessage;
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function InGameViewMediator()
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
			
			eventMap.mapListener( view, MouseEvent.CLICK, startGameLoop,MouseEvent);
			addContextListener( BrickModelEvent.NO_MORE_BRICKS_TO_HIT, initGameView,BrickModelEvent);
			addContextListener( GameLoopEvent.STOP_LOOP, looStoped, GameLoopEvent);
			
			gameLoopSignal.add( gameLoopHandler );
			
			bricksModel.bricksCount = 21;
			view.init( bricksModel.bricksCount );
			view.showMessage( gameMessage.startGameMessage );
		}
		private function looStoped( event:GameLoopEvent ) : void
		{
			eventMap.mapListener( view, MouseEvent.CLICK, startGameLoop,MouseEvent);
			view.showMessage( gameMessage.tryAgainMessage );
		}
		/**
		 * @private
		 * 
		 */

		private function initGameView( event : BrickModelEvent ) : void
		{
			bricksModel.bricksCount = 21;			
			view.createBricks( bricksModel.bricksCount );		
			view.showMessage( gameMessage.gameOverMessage, scoreModel.score );
			gameLoopSignal.stop();
			scoreModel.score = 0;
			eventMap.mapListener( view, MouseEvent.CLICK, startGameLoop,MouseEvent);
		}
		/**
		 * @private
		 * 
		 */

		private function gameLoopHandler(  ):void
		{
			//trace( " InGame looooop !" );
		}
		
		/**
		 * @private
		 * 
		 */
		private function startGameLoop( event : MouseEvent ):void
		{
			eventMap.unmapListener( view, MouseEvent.CLICK, startGameLoop,MouseEvent);
			view.hideMessage();
			gameLoopSignal.start();
		}		
		
	}
}