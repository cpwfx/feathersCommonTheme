package harayoki.starling.feathers.themes.config
{
	import flash.geom.Rectangle;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import harayoki.starling.feathers.themes.datatype.ColorSettingForTheme;
	import harayoki.starling.feathers.themes.datatype.SizeSettingForTheme;
	import harayoki.starling.feathers.themes.datatype.PaddingSettingForTheme;

	public class ThemeConfig
	{
		
		protected static var _variablesAndTypes:Object;
		protected static function _analyzeProperties(object:Object):void
		{
			trace(describeType(object));
			
			if(!_variablesAndTypes)
			{
				_variablesAndTypes = {};
				var xl:XMLList = describeType(object).factory.variable;
				for each(var x:XML in xl) {
					_variablesAndTypes[x.@name] = x.@type;
				}
			}	
			
		}
		
		protected var _themeId:String = "";
		public function get themeId():String
		{
			return _themeId;
		}
		public function get atlasName():String
		{
			return _themeId;
		}
		
		protected var _verbose:Boolean = true;
		
		public function ThemeConfig()
		{
		}
		
		public function applyJsonData(jsonObject:Object):void
		{
			var o:Object = jsonObject || {};
			
			const PADDING_CLASS_NAME:String = flash.utils.getQualifiedClassName(PaddingSettingForTheme);
			const SIZE_CLASS_NAME:String = flash.utils.getQualifiedClassName(SizeSettingForTheme);
			const COLOR_CLASS_NAME:String = flash.utils.getQualifiedClassName(ColorSettingForTheme);
			
			var key:String, type:String;
			var value:Object;
			for (key in _variablesAndTypes)
			{
				type = _variablesAndTypes[key];
				value = o[key];
				//verbose && trace(key,type,value);
				switch(type)
				{
					
					case "Boolean":
						_setupBooleanData(key,value);
						break;						
					case "String":
						_setupStringData(key,value);
						break;
					case "Number":
						_setupNumberData(key,value);
					case "int":
						_setupIntData(key,value);
						break;
					case "uint":
						_setupUintData(key,value);
						break;
					case "Array":
						_setupArray(key,value);
						break;
					case "flash.geom::Rectangle":
						_setupRectangle(key,value);
						break;
					case PADDING_CLASS_NAME:
						_setUpPadding(key,value);
						break;
					case SIZE_CLASS_NAME:
						_setUpSize(key,value);
						break;
					case COLOR_CLASS_NAME:
						_setUpColor(key,value);
				}
			}
		}
		
		public function propertiesToObject():Object
		{
			var o:Object = {};
			var key:String, type:String;
			var value:Object;
			for (key in _variablesAndTypes)
			{
				type = _variablesAndTypes[key];
				value = this[key];
				switch(true)
				{
					case value is Rectangle:
						value = [Rectangle(value).x,Rectangle(value).y,Rectangle(value).width,Rectangle(value).height];
						break;
					case value is PaddingSettingForTheme:
						value = [PaddingSettingForTheme(value).top,PaddingSettingForTheme(value).right,PaddingSettingForTheme(value).bottom,PaddingSettingForTheme(value).left];
						break;
					case value is SizeSettingForTheme:
						value = [SizeSettingForTheme(value).width,SizeSettingForTheme(value).height];
						break;
					case value is ColorSettingForTheme:
						value = ColorSettingForTheme(value).toString();
						break;
					default:
						break;
				}				
				o[key] = value;
			}
			return o;
		}
		
		public function propertiesToJson(spacer:String="\t"):String
		{
			return JSON.stringify(propertiesToObject(),null,spacer);
		}
		
		
		protected function _setupBooleanData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as Boolean;
			_verbose && trace("Boolean : ",key,"'"+this[key]+"'");
		}		
		
		protected function _setupStringData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as String;
			_verbose && trace("string : ",key,"'"+this[key]+"'");
		}
		
		protected function _setupIntData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as int;
			_verbose && trace("int : ",key,this[key]);
		}
		
		protected function _setupUintData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as uint;
			_verbose && trace("uint : ",key,this[key]);
		}
		
		protected function _setupNumberData(key:String,value:Object):void
		{
			this[key] = _selectParam(value,this[key]) as Number;
			_verbose && trace("Number : ",key,this[key]);
		}		
		
		protected function _setupArray(key:String,value:Object):void
		{
			var arr:Array = value as Array;
			this[key] = _selectParam(arr,this[key]) as Array;
			_verbose && trace("Array : ",key,this[key]);
		}		
		
		protected function _setupRectangle(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array))
				{
					throw(new Error("Rectangle setting needs array(length:4) data."));
				}
				else
				{
					value = new Rectangle(value[0],value[1],value[2],value[3]);
				}
			}
			this[key] = _selectParam(value,this[key]) as Rectangle;
			_verbose && trace("Rectangle : ",key,this[key]);
		}
		
		protected function _setUpPadding(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array) || (value as Array).length!=4)
				{
					throw(new Error("Padding setting needs array(length:4) data."));
				}
				else
				{
					value = new PaddingSettingForTheme(value[0],value[1],value[2],value[3]);
				}
			}
			this[key] = _selectParam(value,this[key]) as PaddingSettingForTheme;
			_verbose && trace("PaddingSettingForTheme : ",key,this[key]);
		}
		
		protected function _setUpSize(key:String,value:Object):void
		{
			if(value)
			{
				if(!(value is Array) || (value as Array).length!=2)
				{
					throw(new Error("Padding setting needs array(length:2) data."));
				}
				else
				{
					value = new SizeSettingForTheme(value[0],value[1]);
				}
			}
			this[key] = _selectParam(value,this[key]) as SizeSettingForTheme;
			_verbose && trace("SizeSettingForTheme : ",key,this[key]);
		}
		
		
		protected function _setUpColor(key:String,colorString:Object):void
		{
			if(colorString)
			{
				this[key] = ColorSettingForTheme.getColorSettingByString(colorString+"");
			}
			_verbose && trace("ColorSettingForTheme : ",key,this[key].toString());
		}
		
		protected function _selectParam(newVal:Object,defaltValue:Object):Object
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