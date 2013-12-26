package
{
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import harayoki.starling.feathers.themes.CommonThemeWithAssetManager;
	
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
			Objects.stage.align = StageAlign.TOP_LEFT;
			Objects.stage.scaleMode = StageScaleMode.NO_SCALE;
			Starling.handleLostContext = true;
			_starling = new Starling(ThemeTest,Objects.stage,new Rectangle(0,0,Constants.CONTENTS_WIDTH,Constants.CONTENTS_HEIGHT));
			_starling.showStats = true;
			_starling.showStatsAt("left","top",2);				
		}
		
		private var _themeManager:CommonThemeWithAssetManager
		
		public function ThemeTest()
		{
			addEventListener(Event.ADDED_TO_STAGE,_handleAddedToStage);
		}
		
		private function _handleAddedToStage(ev:Event):void
		{
			stage.addEventListener(Event.RESIZE,_handleStageResize);
			
			_starling.start();
			_themeManager = new CommonThemeWithAssetManager("metalworks","assets/sampleTheme/",Objects.assetManager,stage,false);
			_themeManager.addEventListener(Event.COMPLETE,_handleThemeManagerReady);
			
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
			btn.x = 32;
			btn.y = 96;
			btn.label = "ここはFeathersのButtonです。";
			addChild(btn);
			
			var label:Label = new Label();
			label.x = 32;
			label.y = 184;
			label.text = "ここはFeathersのLabelです。";
			addChild(label);
			
			var tf:TextField = new TextField();
			tf.defaultTextFormat = new TextFormat(_themeManager.config.fontName,26,0xff99ff,true);
			tf.text = "ここはFlashのTextFieldです。";
			tf.selectable = false;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.embedFonts = true;
			tf.x = 32;
			tf.y = 224;
			Starling.current.nativeStage.addChild(tf);

			
		}
	}
}