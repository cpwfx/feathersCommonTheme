package
{
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
		}
		
		public function ThemeTest()
		{
			addEventListener(Event.ADDED_TO_STAGE,_handleAddedToStage);
		}
		
		private function _handleAddedToStage(ev:Event):void
		{
			new MetalWorksMobileThemeWithAssetManager("assets/",Objects.assetManager,this);
				
		}
	}
}