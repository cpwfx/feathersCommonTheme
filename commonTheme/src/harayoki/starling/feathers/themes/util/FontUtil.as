package harayoki.starling.feathers.themes.util
{
	import flash.text.Font;
	import flash.text.FontType;

	public class FontUtil
	{
		private static const DEFAULT_FONT_FAMILIES:Vector.<String> = new <String>["_ゴシック","_明朝","_sans","_serif","_typewriter"];
		
		public static function getAllEmbedFontInfos():Vector.<String>
		{
			var vec:Vector.<String> = new Vector.<String>();
			var fonts:Array = Font.enumerateFonts(false);
			for each(var font:Font in fonts)
			{
				vec.push(font.fontName+"("+font.fontType+","+font.fontStyle+")");
			}			
			return vec;
		}
		public static function getAllDeviceFontInfos():Vector.<String>
		{
			var vec:Vector.<String> = new Vector.<String>();
			var fonts:Array = Font.enumerateFonts(true);
			for each(var font:Font in fonts)
			{
				if(font.fontType == FontType.DEVICE)
				{
					vec.push(font.fontName+"("+font.fontType+","+font.fontStyle+")");
				}
			}			
			return vec;
		}
		
		public static function isEmbedFont(fontName:String):Boolean
		{
			var fonts:Array = Font.enumerateFonts(false);
			for each(var font:Font in fonts)
			{
				if(font.fontName == fontName) return true;
			}
			return false;
		}
		
		public static function isDeveiceFont(fontName:String):Boolean
		{
			if(isEmbedFont(fontName)) return false;
			var fonts:Array = Font.enumerateFonts(true);
			for each(var font:Font in fonts)
			{
				if(font.fontName == fontName) return true;
			}
			return false;
		}
		
		public static function isDefaultFontFamily(fontName:String):Boolean
		{
			return DEFAULT_FONT_FAMILIES.indexOf(fontName) >= 0;
		}
		
	}
}