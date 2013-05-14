package net.khaledgarbaya.games.kgarkanoid.view.object
{
	import flash.display.Sprite;
	
	public class Brick extends Sprite implements IBrick
	{
		private var brickSkin:BrickSkin;
		private var _balls:Array;
		private var _hitted:Boolean;
		private var _obstacleType:uint;
		public function Brick( ...balls )
		{
			this.balls = balls;
			init();
		}
		public function init() : void
		{
			brickSkin ||= new BrickSkin();
			_obstacleType = Math.random() > 0.7 ? 2 : 1; 
			brickSkin.gotoAndStop( _obstacleType );
			this.addChild( brickSkin );
		}
		
		public function destroy():void
		{
			this.parent.removeChild( this );
		}
		
		public function update():void
		{
			if( hitted )
				return;
			
			for( var i : uint =0, len : int = balls.length; i < len; i++  )
			{
				if( this.hitTestObject( balls[i] ) )
				{
					hitted = true;
					if( _obstacleType > 1 )
						balls[i].reflect();
					
					dispatchEvent( new BrickEvent( BrickEvent.BRICK_DESTROYED) );
				}
			}
		}

		public function get balls():Array
		{
			return _balls;
		}

		public function set balls(value:Array):void
		{
			_balls = value;
		}

		public function get hitted():Boolean
		{
			return _hitted;
		}

		public function set hitted(value:Boolean):void
		{
			_hitted = value;
		}

		
	}
}