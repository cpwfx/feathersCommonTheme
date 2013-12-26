package harayoki.starling.feathers.themes
{
	public class ColorSettingForTheme
	{
		private static var _instances:Object = {};
		
		public static function getColorSettingByUint(color:uint):ColorSettingForTheme
		{
			var setting:ColorSettingForTheme = _instances[color+""];
			if(!setting)
			{
				setting = _instances[color+""] = new ColorSettingForTheme();
				setting.colorData = color;
			}
			return setting;
		}
		
		public static function getColorSettingByString(colorString:String):ColorSettingForTheme
		{
			var color:int = colorStringToUint(colorString);
			return getColorSettingByUint(color);
		}
		
		private static function colorStringToUint(colorString:String):uint
		{
			colorString = colorString.replace("#","");
			if(colorString.length==3)
			{
				var a:Array = colorString.split("");
				colorString = a[0]+a[0]+a[1]+a[1]+a[2]+a[2];
			}
			return parseInt("0x" + colorString,16) as uint;
		}
		
		public var colorData:uint = 0x000000;
		public function ColorSettingForTheme()
		{
		}
		
		public function toString():String
		{
			return "#" + ("00000"+colorData.toString(16)).slice(-6);
		}
		
	}
}