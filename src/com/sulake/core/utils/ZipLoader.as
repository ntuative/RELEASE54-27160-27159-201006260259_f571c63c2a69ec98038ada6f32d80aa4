package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import deng.fzip.FZipErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_546:uint = 0;
      
      private var var_101:FZip;
      
      private var var_1359:Array;
      
      private var var_2088:uint = 0;
      
      private var var_936:int = 0;
      
      private var _bytesTotal:uint = 0;
      
      public function ZipLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
         var_1359 = new Array();
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_101)
         {
            var_101.removeEventListener(Event.COMPLETE,onComplete);
            var_101.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_101.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_101.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
            var_101.removeEventListener(FZipErrorEvent.const_117,onParseError);
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         debug("Load event IO ERROR for file \"undefined\"");
         if(!handleHttpStatus(var_152))
         {
            var_194 = getTimer();
            failure("IO Error, load operation failed for file \"undefined\" (" + var_546 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_546;
      }
      
      private function onParseError(param1:FZipErrorEvent) : void
      {
         debug("Load event parse error for file \"undefined\"");
         if(!handleHttpStatus(var_152))
         {
            var_194 = getTimer();
            failure("Parse Error, load operation failed for file \"undefined\" (" + var_546 + "/" + _bytesTotal + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return _bytesTotal;
      }
      
      public function get resources() : Array
      {
         return var_1359;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var name:String = null;
         var event:Event = param1;
         try
         {
            name = getQualifiedClassName(var_17.content);
            var_1359.push(var_17.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_936;
            if(var_1359.length == var_2088)
            {
               var_17.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_17.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               var_584 = true;
               var_194 = getTimer();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,_bytesTotal,var_546,elapsedTime));
            }
            else
            {
               var_17.loadBytes(var_101.getFileAt(var_936).content);
            }
         }
         catch(e:Error)
         {
            failure("Crashed on ZipLoader.onLoaderComplete: \"undefined\" (" + var_546 + "/" + _bytesTotal + " bytes): " + e.message);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         _bytesTotal = param1.bytesTotal;
         var_546 = param1.bytesLoaded;
         debug("Load event PROGRESS for file \"undefined\"");
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,_bytesTotal,var_546,elapsedTime));
      }
      
      override public function load(param1:URLRequest, param2:int = 5) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_42 = param1;
         _name = parseNameFromUrl(var_42.url);
         var_303 = param2;
         if(var_101)
         {
            var_101.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_101 = new FZip();
         var_101.addEventListener(Event.COMPLETE,onComplete);
         var_101.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_101.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_101.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_101.addEventListener(FZipErrorEvent.const_117,onParseError);
         if(!var_477)
         {
            var_835 = getTimer();
            var_101.load(var_42);
         }
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(var_303 > 0)
            {
               if(var_101)
               {
                  var_101.close();
               }
               addRequestCounterToUrlRequest(var_42,const_1019 - var_303);
               if(var_1198)
               {
                  var_42.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_42.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1198 = false;
               }
               var_101.load(var_42);
               --var_303;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_42.url + "\" (" + var_546 + "/" + _bytesTotal + " bytes)");
            removeEventListeners();
         }
         return false;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_936 = 0;
         var_2088 = var_101.getFileCount();
         debug("Load event COMPLETE for file \"undefined\"");
         removeEventListeners();
         try
         {
            if(var_17)
            {
               var_17.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_17.loadBytes(var_101.getFileAt(var_936).content);
            }
         }
         catch(e:Error)
         {
            debug("Failed to extract files from library \"undefined\"");
            if(!handleHttpStatus(var_152))
            {
               failure("Crashed on ZipLoader.onComplete: \"undefined\" (" + var_546 + "/" + _bytesTotal + " bytes): " + e.message);
            }
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_152 = param1.status;
         debug("Load event STATUS " + var_152 + " for file \"" + var_42.url + "\"");
      }
      
      override public function resume() : void
      {
         if(var_477 && !_disposed)
         {
            var_477 = false;
            if(!var_584 && var_42)
            {
               var_101.load(var_42);
            }
         }
      }
   }
}
