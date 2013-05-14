package net.khaledgarbaya.games.kgarkanoid.view.score
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * the game score view 
	 * @author Khaled Garbaya
	 * 
	 */
	public class ScoreView extends Sprite
	{
		/**
		 * @private 
		 */
		private var _scoreTextField:TextField;
		/**
		 * @private 
		 */		
		private var _scoreTextFormat:TextFormat;
		
		/**
		 * @private 
		 */	
		public var _targetScore:Number=0.0;
		
		/**
		 * @private 
		 */	
		private var verdanaFont:Verdana;
		
		public function ScoreView()
		{
			init();
		}
		
		/**
		 * @private 
		 */
		protected function init():void
		{
			
			verdanaFont = new Verdana();
			
			//setup some basic format
			var __scoreTextFormat:TextFormat = new TextFormat();
			__scoreTextFormat.size  = 24;
			__scoreTextFormat.color = 0xFFFFFF;
			__scoreTextFormat.font = verdanaFont.fontName;
			_scoreTextField = new TextField();
			_scoreTextField.width = 300;
			
			this.addChild( _scoreTextField );
			
			this.scoreTextFormat = __scoreTextFormat;
			_scoreTextField.embedFonts = true;
			_scoreTextField.text = "Score : 0";			
		} 
		
		/**
		 * update the text of the score in an animated way 
		 * if the score is set to zero it will be displayed directelly without animation
		 * well it could be a nice effect seeing your score drops down like a bomb timer :D
		 * @param targetScore Number
		 */
		public function updateScore( targetScore : Number ) : void
		{
			if( targetScore <=0 )
			{
				//if the score still animating we stop it
				TweenLite.killTweensOf(this);
				
				_targetScore = targetScore;
				_scoreTextField.text = "Score : "+ Math.ceil(_targetScore).toString();
			}
			else
			{
				TweenLite.to( this, 1,{_targetScore : targetScore, onUpdate : updateText});
			}
		}
		
		private function updateText() : void
		{
			_scoreTextField.text = "Score : "+ Math.ceil(_targetScore).toString();
		}
		/**
		 * the textFormat for the score textField
		 * @return scoreTextFormat TextFormat
		 * 
		 */
		public function get scoreTextFormat():TextFormat
		{
			return _scoreTextFormat;
		}
		
		/**
		 * @private
		 */
		public function set scoreTextFormat(value:TextFormat):void
		{
			_scoreTextFormat = value;
			_scoreTextField.defaultTextFormat = _scoreTextFormat;
		}

	}
}