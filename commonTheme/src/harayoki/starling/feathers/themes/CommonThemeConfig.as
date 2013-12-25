package harayoki.starling.feathers.themes
{
	import flash.geom.Rectangle;

	public class CommonThemeConfig extends ThemeConfig
	{
		//それぞれのpublic var の名前は jsonのパラメータと同じです
		
		/* themeファイルに元々定義されていたパラメータ */
		
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
		public var fontFile:String = "";//"SourceSansPro.swf"などフォント埋め込み済みのswfを指定します
		public var fontClassList:Array = [];
		public var fontSizeNormal:int = 24;
		public var fontSizeSmall:int = 28;
		public var fontSizeLarge:int = 18;
		public var fontSizeHeader:int = 36;
		
		//simple button
		public var simpleBtnMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60);
		public var simpleBtnMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//scroll text
		public var scrollTextPadding:PaddingSettingForTheme = new PaddingSettingForTheme(32,36,32,32);
		
		//base button		
		public var btnPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,16,8,16);
		public var btnGap:int = 12;
		public var btnMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60);
		public var btnMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//quiet button
		public var quietBtnPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,16,8,16);
		public var quietBtnGap:int = 12;
		public var quietBtnMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60);
		public var quietBtnMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//back button
		public var backBtnPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,16,8,28);
		
		//forward button
		public var forwardBtnPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,28,8,16);
		
		//button group button
		public var btnGroupBtnPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,16,8,16);
		public var btnGroupBtnGap:int = 12;
		public var btnGroupBtnMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60);
		public var btnGroupBtnMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//alert button
		public var alertBtnMinSize:SizeSettingForTheme = new SizeSettingForTheme(120,60);
		
		//tab
		public var tabPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,16,8,16);
		public var tabGap:int = 12;
		public var tabMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		public var tabMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//buttonGroup
		public var btnGroupGap:int = 18;
		public var btnGroupMinSize:SizeSettingForTheme = new SizeSettingForTheme(560,0);//heightは無視されます
		
		//alert button group
		public var alertBtnGroupPadding:PaddingSettingForTheme = new PaddingSettingForTheme(12,12,12,12);
		public var alertBtnGroupGap:int = 12;
		
		//item renderer
		public var itemRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,24,8,32);
		public var itemRendererGap:int = 20;
		public var itemRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		public var itemRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//pickerList item renderer
		public var pickerListItemRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,24,8,32);
		//public var pickerListItemRendererGap:Number = Number.POSITIVE_INFINITY;//TODO JSONでどう表現？ とりあえず省く
		public var pickerListItemRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		public var pickerListItemRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//inset item Renderer
		public var insetItemRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(8,24,8,32);
		public var insetItemRendererGap:int = 20;
		public var insetItemRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		public var insetItemRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//header renderer
		public var headerRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(4,16,4,16);
		public var headerRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(16,44);
		public var headerRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(16,44);
		
		//footer renderer
		public var footerRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(4,16,4,16);
		public var footerRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(44,44);
		public var footerRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(44,44);		
		
		//inset header renderer
		public var insetHeaderRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(4,32,4,32);
		public var insetHeaderRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(66,66);
		public var insetHeaderRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(44,44);
				
		//inset footer renderer
		public var insetFooterRendererPadding:PaddingSettingForTheme = new PaddingSettingForTheme(4,32,4,32);
		public var insetFooterRendererMinSize:SizeSettingForTheme = new SizeSettingForTheme(66,66);
		public var insetFooterRendererMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(44,44);
		
		//radio
		public var radioGap:int = 8; 
		public var radioMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88); 
		
		//check
		public var checkGap:int = 8; 
		public var checkMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88); 
		
		//callout
		public var calloutStagePadding:PaddingSettingForTheme = new PaddingSettingForTheme(16,16,16,16);
		
		//slider
		public var sliderSize:SizeSettingForTheme = new SizeSettingForTheme(60,210);
		
		//numeric stepper
		public var numericStepperIncrementLabel:String = "+";
		public var numericStepperDecrementLabel:String = "-";
		
		//horizontal scrollbar
		public var hScrollbarPadding:PaddingSettingForTheme = new PaddingSettingForTheme(-1,4,4,4);//topは無視される
		
		//vertical scrollbar
		public var vScrollbarPadding:PaddingSettingForTheme = new PaddingSettingForTheme(4,4,4,-1);//leftは無視される
		
		//textinput
		public var textInputFontSize:int = 24; 
		public var textInputFontFamily:String = "_sans";//オリジナルはHelvetica 
		public var textInputGap:int = 12; 
		public var textInputSize:SizeSettingForTheme = new SizeSettingForTheme(264,60); 
		public var textInputMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60); 
		public var textInputMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88); 
		public var textInputPadding:PaddingSettingForTheme = new PaddingSettingForTheme(12,14,10,14); 
		
		//numeric stepper text input
		public var numericStepperTextInputPadding:PaddingSettingForTheme = new PaddingSettingForTheme(12,14,10,14);
		public var numericStepperTextInputGap:int = 12;
		public var numericStepperTextInputMinSize:SizeSettingForTheme = new SizeSettingForTheme(60,60);
		public var numericStepperTextInputMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//page indicator
		public var pageIndicatorPadding:PaddingSettingForTheme = new PaddingSettingForTheme(6,6,6,6);
		public var pageIndicatorGap:int = 10;
		public var pageIndicatorMinTouchSize:SizeSettingForTheme = new SizeSettingForTheme(44,44);
		
		//header
		public var headerPadding:PaddingSettingForTheme = new PaddingSettingForTheme(14,14,14,14);
		public var headerGap:int = 8;
		public var headerTitleGap:int = 12;
		public var headerMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//header without background
		public var headerWithoutBackgroundPadding:PaddingSettingForTheme = new PaddingSettingForTheme(14,18,14,18);
		public var headerWithoutBackgroundMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//callout
		public var calloutPadding:PaddingSettingForTheme = new PaddingSettingForTheme(12,14,12,14);
		
		//panel
		public var panelPadding:PaddingSettingForTheme = new PaddingSettingForTheme(0,8,8,8);
		
		//alert
		public var alertPadding:PaddingSettingForTheme = new PaddingSettingForTheme(0,24,16,24);
		public var alertGap:int = 16;
		public var alertMinSize:SizeSettingForTheme = new SizeSettingForTheme(560,560);
		
		//scroll container toolbar
		public var scrollContainerToolbarLayoutGap:int = 8;
		public var scrollContainerToolbarLayoutPadding:PaddingSettingForTheme = new PaddingSettingForTheme(14,14,14,14);
		public var scrollContainerToolbarMinSize:SizeSettingForTheme = new SizeSettingForTheme(88,88);
		
		//inset grouped list layout
		public var insetGroupedListLayoutPadding:int = 18;
		public var insetGroupedListLayoutGap:int = 0;
		
		public function CommonThemeConfig()
		{
			_analyzeVariables(CommonThemeConfig);
		}
		

		
	}
}