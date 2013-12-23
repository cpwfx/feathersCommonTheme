package
{
	import feathers.controls.Button;
	
	import harayoki.starling.feathers.themes.MetalWorksMobileThemeWithAssetManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ThemeTest extends Sprite
	{
		private static var _starling:Starling;
		public static function main():void
		{
			Starling.handleLostContext = true;
			_starling = new Starling(ThemeTest,Objects.stage,null);
			_starling.showStats = true;
			_starling.showStatsAt("right","top",2);				
		}
		
		public function ThemeTest()
		{
			addEventListener(Event.ADDED_TO_STAGE,_handleAddedToStage);
		}
		
		private function _handleAddedToStage(ev:Event):void
		{
			_starling.start();
			var themeManager:MetalWorksMobileThemeWithAssetManager = new MetalWorksMobileThemeWithAssetManager("assets/",Objects.assetManager,this,false);
			themeManager.addEventListener(Event.COMPLETE,_handleThemeManagerReady);
			
		}
		
		private function _handleThemeManagerReady(ev:Event):void
		{
			var btn:Button = new Button();
			btn.x = 64;
			btn.y = 64;
			btn.label = "TEST";
			addChild(btn);
			
		}
	}
}