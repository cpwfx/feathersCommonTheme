package harayoki.starling.feathers.themes
{
	import flash.geom.Rectangle;

	public class CommonThemeConfig extends ThemeConfig
	{
		//public var の名前は jsonのパラメータと同じです
		
		public var fontName:String = "_sans";
		public var atlasName:String = "";
		public var backgroundColor:uint = 0x4a4137;
		
		public var lightTextColor:uint = 0xe5e5e5;
		public var darkTextColor:uint = 0x1a1816;
		public var selectedTextColor:uint = 0xff9900;
		public var disabledTextColor:uint = 0x8a8a8a;
		public var darkDisabledTextColor:uint = 0x383430;
		public var listBackgroundColor:uint = 0x383430;
		public var tabBackgroundColor:uint = 0x1a1816;
		public var tabDisabledBackgroundColor:uint = 0x292624;
		public var groupedListHeaderBackgroundColor:uint = 0x2e2a26;
		public var groupedListFooterBackgroundColor:uint = 0x2e2a26;
		public var modalOverlayColor:uint = 0x29241e;
		public var modalOverlayAlpha:Number = 0.8;

		public var defaultScale9Grid:Rectangle = new Rectangle(5, 5, 22, 22);
		public var buttonScale9Grid:Rectangle = new Rectangle(5, 5, 50, 50);
		public var buttonSelectedScale9Grid:Rectangle = new Rectangle(8, 8, 44, 44);
		public var backButtonScale3Region1:Number = 24;
		public var backButtonScale3Region2:Number = 6;
		public var forwardButtonScale3Region1:Number = 6;
		public var forwardButtonScale3Region3:Number = 6;
		public var itemRendererScale8Grid:Rectangle = new Rectangle(13, 0, 2, 82);
		public var insetItemRendererFirstScale9Grid:Rectangle = new Rectangle(13, 13, 3, 70);
		public var insetItemRendererLastScale9Grid:Rectangle = new Rectangle(13, 0, 3, 75);
		public var insetItemRendererSingleScale9Grid:Rectangle = new Rectangle(13, 13, 3, 62);
		public var tabScale9Grid:Rectangle = new Rectangle(19, 19, 50, 50);
		public var scrollBarThumbRegion1:int = 5;
		public var scrollBarThumbRegion2:int = 14;
		
		/* 追加されたパラメータ */ 
		
		//font
		public var fontSizeNormal:int = 24;
		public var fontSizeSmall:int = 28;
		public var fontSizeLarge:int = 18;
		public var fontSizeHeader:int = 36;
		
		//button
		public var btnPaddingTop:int = 8;
		public var btnPaddingBottom:int = 8;
		public var btnPaddingLeft:int = 16;
		public var btnPaddingRight:int = 16;
		public var btnGap:int = 12;
		public var btnMinWidth:int = 60;
		public var btnMinHeight:int = 60;
		public var btnMinTouchWidth:int = 88;
		public var btnMinTouchHeight:int = 88;
		
		//callout
		public var calloutStagePadding:int = 16;
		
		
		public function CommonThemeConfig()
		{
			_analyzeVariables(CommonThemeConfig);
		}
		

		
	}
}