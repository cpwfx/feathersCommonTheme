package harayoki.starling.feathers.themes.util
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.text.Font;

	public class FontSwfLoader
	{
		private var _loader:Loader;
		private var _callback:Function;
		
		public function FontSwfLoader()
		{
		}
		
		public function clean():void
		{
			_cleanLoader();
			_loader = null;
			_callback = null;
		}
		
		public function load(path:String,callback:Function):void
		{
			
			var req:URLRequest = new URLRequest(path);
			_callback = callback;
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_handleComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,_handleError);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,_handleError);
			_loader.load(req);
		}
		
		private function _handleComplete(ev:Event):void
		{

			//trace(typeof _loader.content);
			var fontSwf:DisplayObject = _loader.content as DisplayObject;
			var fonClasses:Vector.<Class>
			try
			{
				fonClasses= fontSwf["getFontClasses"]() as Vector.<Class>;
			}
			catch(e:Error)
			{
				trace("couldn't get font classes");
			}
			
			for each(var fontClass:Class in fonClasses)
			{
				Font.registerFont(fontClass);		
				trace("font class found.",(new fontClass() as Font).fontName);
			}
						
			_callback && _callback.apply(null,[fontSwf]);
			clean();
		}
		
		private function _handleError(ev:ErrorEvent):void
		{
			_callback && _callback.apply(null,[null]);
			clean();
		}
		
		private function _cleanLoader():void
		{
			if(_loader)
			{
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,_handleComplete);			
				_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,_handleError);
				_loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,_handleError);
			}
		}
	}
}