package
{
	import flash.display.Stage;
	import flash.geom.Rectangle;
	
	import feathers.controls.Button;
	
	import harayoki.starling.feathers.themes.MetalWorksMobileThemeWithAssetManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	public class ThemeTest extends Sprite
	{
		private static var _starling:Starling;
		public static function main():void
		{
			Starling.handleLostContext = true;
			_starling = new Starling(ThemeTest,Objects.stage,new Rectangle(0,0,Constants.CONTENTS_WIDTH,Constants.CONTENTS_HEIGHT));
			_starling.showStats = true;
			_starling.showStatsAt("right","top",2);				
		}
		
		public function ThemeTest()
		{
			addEventListener(Event.ADDED_TO_STAGE,_handleAddedToStage);
		}
		
		private function _handleAddedToStage(ev:Event):void
		{
			stage.addEventListener(Event.RESIZE,_handleStageResize);
			
			_starling.start();
			var themeManager:MetalWorksMobileThemeWithAssetManager = new MetalWorksMobileThemeWithAssetManager("assets/",Objects.assetManager,this,false);
			themeManager.addEventListener(Event.COMPLETE,_handleThemeManagerReady);
			
		}
		
		private function _handleStageResize(ev:Event):void
		{
			var w:int = Objects.stage.stageWidth;
			var h:int = Objects.stage.stageHeight
			_starling.viewPort = RectangleUtil.fit(
				new Rectangle(0, 0, Constants.CONTENTS_WIDTH, Constants.CONTENTS_HEIGHT),
				new Rectangle(0, 0, w,h),
				ScaleMode.SHOW_ALL);			
		}
		
		private function _handleThemeManagerReady(ev:Event):void
		{
			var btn:Button = new Button();
			btn.x = 64;
			btn.y = 64;
			btn.label = "こんにちはWORLD";
			addChild(btn);
			
		}
	}
}