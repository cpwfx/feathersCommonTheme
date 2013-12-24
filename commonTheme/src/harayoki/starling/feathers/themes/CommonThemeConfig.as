package harayoki.starling.feathers.themes
{
	public class CommonThemeConfig
	{
		
		public var atlasname:String = "";//json.atlasname
		public var backgroundcolor:uint = 0x111111;//json.backgroundcolor
		

		public function CommonThemeConfig()
		{
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			this.atlasname = _selectParam(o.atlasname,atlasname) as String;	
			this.backgroundcolor = _selectParam(_parseColorString(o.backgroundcolor),backgroundcolor) as uint;
		}
		
		private function _parseColorString(colorString:String):uint
		{
			colorString = colorString.replace("#","");
			if(colorString.length==3)
			{
				var a:Array = colorString.split("");
				colorString = a[0]+a[0]+a[1]+a[1]+a[2]+a[2];
			}
			return parseInt("0x" + colorString,16);
		}
		
		private function _selectParam(newVal:Object,defaltValue:Object):Object
		{			
			if(newVal == null || typeof newVal == "undefined")
			{
				return defaltValue;
			}
			else
			{
				return newVal;
			}
		}
		
	}
}