package harayoki.starling.feathers.themes
{
	public class CommonThemeConfig
	{
		
		public var atlasname:String = "";//json.atlasname
		

		public function CommonThemeConfig()
		{
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			atlasname = _resetParam(o.atlasname,atlasname) as String;	
		}
		
		private function _resetParam(newVal:Object,defaltValue:Object):Object
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