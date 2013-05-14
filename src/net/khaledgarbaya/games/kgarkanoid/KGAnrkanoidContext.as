package net.khaledgarbaya.games.kgarkanoid
{
	import flash.display.DisplayObjectContainer;
	
	import net.khaledgarbaya.games.kgarkanoid.command.StartGameLoopCommand;
	import net.khaledgarbaya.games.kgarkanoid.command.StopGameLoopCommand;
	import net.khaledgarbaya.games.kgarkanoid.model.BricksModel;
	import net.khaledgarbaya.games.kgarkanoid.model.ScoreModel;
	import net.khaledgarbaya.games.kgarkanoid.view.InGameView;
	import net.khaledgarbaya.games.kgarkanoid.view.InGameViewMediator;
	import net.khaledgarbaya.games.kgarkanoid.view.event.GameLoopEvent;
	import net.khaledgarbaya.games.kgarkanoid.view.message.GameMessages;
	import net.khaledgarbaya.games.kgarkanoid.view.message.IGameMessage;
	import net.khaledgarbaya.games.kgarkanoid.view.object.Ball;
	import net.khaledgarbaya.games.kgarkanoid.view.object.BallMediator;
	import net.khaledgarbaya.games.kgarkanoid.view.object.Brick;
	import net.khaledgarbaya.games.kgarkanoid.view.object.BrickMediator;
	import net.khaledgarbaya.games.kgarkanoid.view.object.Paddle;
	import net.khaledgarbaya.games.kgarkanoid.view.object.PaddleMediator;
	import net.khaledgarbaya.games.kgarkanoid.view.score.ScoreView;
	import net.khaledgarbaya.games.kgarkanoid.view.score.ScoreViewMediator;
	import net.khaledgarbaya.games.kgarkanoid.view.signal.GameLoopSignal;
	
	import org.robotlegs.mvcs.Context;
	
	/**
	 * KGAnrkanoidContext
	 * @author Khaled
	 * 
	 */
	public class KGAnrkanoidContext extends Context
	{
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Factory method. Provide the Context with the necessary objects to do its work.

		 *
		 * @param contextView DisplayObjectContainer
		 * @param autoStartup Boolean
		 *
		 */
		public function KGAnrkanoidContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Gets called by the framework if autoStartup is true. Here we need to provide
		 * the framework with the basic actors. The proxies/services we want to use in
		 * the model, map some view components to Mediators and to get things started,
		 * add some Sprites to the stage. Only after we drop a Sprite on the stage,
		 * RobotLegs will create the Mediator. 
		 * 
		 */
		override public function startup():void
		{
			//--------------------------------------------------------------------------
			//  map views
			//--------------------------------------------------------------------------
			/**
			 * We could organize mapping in different Command like BootstrapCommand
			 * but since it is simple example i'll keep all the mapping on the main startup
			 */
			mediatorMap.mapView( InGameView, InGameViewMediator );
			mediatorMap.mapView( Ball, BallMediator );
			mediatorMap.mapView( Paddle, PaddleMediator );
			mediatorMap.mapView( Brick, BrickMediator );
			mediatorMap.mapView( ScoreView, ScoreViewMediator );
			
			//--------------------------------------------------------------------------
			//  map Singleton
			//--------------------------------------------------------------------------
			injector.mapSingleton( ScoreModel );
			injector.mapSingleton( GameLoopSignal );
			injector.mapSingleton( BricksModel );
			
			//--------------------------------------------------------------------------
			//  map Singleton with interfaces
			//--------------------------------------------------------------------------
			injector.mapSingletonOf( IGameMessage, GameMessages );
			
			//--------------------------------------------------------------------------
			//  map commands
			//--------------------------------------------------------------------------
			commandMap.mapEvent( GameLoopEvent.START_LOOP,StartGameLoopCommand , GameLoopEvent);
			commandMap.mapEvent( GameLoopEvent.STOP_LOOP, StopGameLoopCommand, GameLoopEvent);
			
			//add something to the display list
			contextView.addChild( new InGameView() );
			
			// and we'r done !
			super.startup();
		}
	}
}