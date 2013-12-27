package harayoki.starling.feathers.themes.util
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.text.Font;
	import flash.utils.describeType;

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
			
			//iOSでcontextを用意しないと Error: Error #3747: Multiple application domains are not supported on this operating system. となる
			//@see http://blogs.adobe.com/airodynamics/2012/11/09/packaging-and-loading-multiple-swfs-in-air-apps-on-ios/
			var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
			
			_loader.load(req,context);
		}
		
		private function _handleComplete(ev:Event):void
		{
			var fontSwf:Sprite = _loader.content as Sprite;
			
			//registerFontはswf側で行っている
			
			var fontNames:Vector.<String>
			try
			{
				trace("fontNames",fontSwf["getFontNames"]() as Vector.<String>);
			}
			catch(e:Error)
			{
				trace("couldn't get font classes from swf");
			}			
						
			_callback && _callback.apply(null);
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