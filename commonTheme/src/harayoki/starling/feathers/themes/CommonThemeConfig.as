package harayoki.starling.feathers.themes
{
	import flash.utils.describeType;

	public class CommonThemeConfig
	{
		public static var verbose:Boolean = true;
		
		private static var _variablesAndTypes:Object;
		private static function _analyzeVariables(instance:Object):void
		{
			if(!_variablesAndTypes)
			{
				_variablesAndTypes = {};
				var xl:XMLList = describeType(instance).variable;
				for each(var x:XML in xl) {
					_variablesAndTypes[x.@name] = x.@type;
				}
			}			
		}
		
		//public var の名前は jsonのパラメータと同じです
		public var fontname:String = "_sans";
		public var atlasname:String = "";
		public var backgroundcolor:uint = 0x111111;

		public function CommonThemeConfig()
		{
			_analyzeVariables(this);
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			var key:String, type:String, temp:String;
			var value:Object;
			for (key in _variablesAndTypes)
			{
				type = _variablesAndTypes[key];
				value = o[key];
				//trace(key,type,value);
				switch(type)
				{
					case "String":
						_setupStringData(key,value);
						break;
					case "uint":
						temp = value as String;
						if(temp && temp.indexOf("#")==0)
						{
							_setupColor(key,temp);
						}
						break;
				}
			}
		}
		
		private function _setupStringData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as String;
			verbose && trace("string : ",key,this[key]);
		}
		
		private function _setupColor(key:String,colorString:String):void
		{
			colorString = colorString.replace("#","");
			if(colorString.length==3)
			{
				var a:Array = colorString.split("");
				colorString = a[0]+a[0]+a[1]+a[1]+a[2]+a[2];
			}
			this[key] = parseInt("0x" + colorString,16) as uint;
			verbose && trace("color : ",key,this[key]);
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