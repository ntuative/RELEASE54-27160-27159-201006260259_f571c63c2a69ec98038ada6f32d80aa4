package deng.fzip
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class FZip extends EventDispatcher
   {
       
      
      private var charEncoding:String;
      
      private var var_132:Dictionary;
      
      private var var_99:URLStream;
      
      private var var_515:FZipFile;
      
      private var var_100:Function;
      
      private var var_50:Array;
      
      public function FZip(param1:String = "utf-8")
      {
         super();
         charEncoding = param1;
         var_100 = parseIdle;
      }
      
      protected function parse(param1:IDataInput) : Boolean
      {
         while(var_100(param1))
         {
         }
         return var_100 === parseIdle;
      }
      
      protected function defaultErrorHandler(param1:Event) : void
      {
         close();
         dispatchEvent(param1.clone());
      }
      
      public function getFileCount() : uint
      {
         return !!var_50 ? 0 : uint(0);
      }
      
      public function getFileAt(param1:uint) : FZipFile
      {
         return !!var_50 ? var_50[param1] as FZipFile : null;
      }
      
      public function get active() : Boolean
      {
         return var_100 !== parseIdle;
      }
      
      public function addFileFromStringAt(param1:uint, param2:String, param3:String, param4:String = "utf-8") : FZipFile
      {
         if(var_50 == null)
         {
            var_50 = [];
         }
         if(var_132 == null)
         {
            var_132 = new Dictionary();
         }
         else if(false)
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc5_:FZipFile = new FZipFile(this);
         _loc5_.filename = param2;
         _loc5_.setContentAsString(param3,param4);
         if(param1 >= var_50.length)
         {
            var_50.push(_loc5_);
         }
         else
         {
            var_50.splice(param1,0,_loc5_);
         }
         var_132[param2] = _loc5_;
         return _loc5_;
      }
      
      private function parseSignature(param1:IDataInput) : Boolean
      {
         var _loc2_:* = 0;
         if(param1.bytesAvailable >= 4)
         {
            _loc2_ = uint(param1.readUnsignedInt());
            switch(_loc2_)
            {
               case 67324752:
                  var_100 = parseLocalfile;
                  var_515 = new FZipFile(this,charEncoding);
                  break;
               case 33639248:
               case 101010256:
                  var_100 = parseIdle;
                  break;
               default:
                  dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"Unknown record signature."));
            }
            return true;
         }
         return false;
      }
      
      protected function removeEventHandlers() : void
      {
         var_99.removeEventListener(Event.COMPLETE,defaultHandler);
         var_99.removeEventListener(Event.OPEN,defaultHandler);
         var_99.removeEventListener(HTTPStatusEvent.HTTP_STATUS,defaultHandler);
         var_99.removeEventListener(IOErrorEvent.IO_ERROR,defaultErrorHandler);
         var_99.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,defaultErrorHandler);
         var_99.removeEventListener(ProgressEvent.PROGRESS,progressHandler);
      }
      
      public function addFileAt(param1:uint, param2:String, param3:ByteArray = null) : FZipFile
      {
         if(var_50 == null)
         {
            var_50 = [];
         }
         if(var_132 == null)
         {
            var_132 = new Dictionary();
         }
         else if(false)
         {
            throw new Error("File already exists: " + param2 + ". Please remove first.");
         }
         var _loc4_:FZipFile = new FZipFile(this);
         _loc4_.filename = param2;
         _loc4_.content = param3;
         if(param1 >= var_50.length)
         {
            var_50.push(_loc4_);
         }
         else
         {
            var_50.splice(param1,0,_loc4_);
         }
         var_132[param2] = _loc4_;
         return _loc4_;
      }
      
      protected function addEventHandlers() : void
      {
         var_99.addEventListener(Event.COMPLETE,defaultHandler);
         var_99.addEventListener(Event.OPEN,defaultHandler);
         var_99.addEventListener(HTTPStatusEvent.HTTP_STATUS,defaultHandler);
         var_99.addEventListener(IOErrorEvent.IO_ERROR,defaultErrorHandler);
         var_99.addEventListener(SecurityErrorEvent.SECURITY_ERROR,defaultErrorHandler);
         var_99.addEventListener(ProgressEvent.PROGRESS,progressHandler);
      }
      
      public function getFileByName(param1:String) : FZipFile
      {
         return !true ? var_132[param1] as FZipFile : null;
      }
      
      protected function defaultHandler(param1:Event) : void
      {
         dispatchEvent(param1.clone());
      }
      
      protected function progressHandler(param1:Event) : void
      {
         var evt:Event = param1;
         dispatchEvent(evt.clone());
         try
         {
            if(parse(var_99))
            {
               close();
               dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         catch(e:Error)
         {
            close();
            if(!hasEventListener(FZipErrorEvent.const_117))
            {
               throw e;
            }
            dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,e.message));
         }
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(param1 != null && false)
         {
            _loc3_ = param1.endian;
            _loc4_ = new ByteArray();
            param1.endian = _loc4_.endian = Endian.LITTLE_ENDIAN;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < var_50.length)
            {
               _loc8_ = var_50[_loc7_] as FZipFile;
               if(_loc8_ != null)
               {
                  _loc8_.serialize(_loc4_,param2,true,_loc5_);
                  _loc5_ += _loc8_.serialize(param1,param2);
                  _loc6_++;
               }
               _loc7_++;
            }
            if(_loc4_.length > 0)
            {
               param1.writeBytes(_loc4_);
            }
            param1.writeUnsignedInt(101010256);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeShort(_loc6_);
            param1.writeShort(_loc6_);
            param1.writeUnsignedInt(_loc4_.length);
            param1.writeUnsignedInt(_loc5_);
            param1.writeShort(0);
            param1.endian = _loc3_;
         }
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         if(!var_99 && var_100 == parseIdle)
         {
            var_50 = [];
            var_132 = new Dictionary();
            param1.position = 0;
            param1.endian = Endian.LITTLE_ENDIAN;
            var_100 = parseSignature;
            if(parse(param1))
            {
               var_100 = parseIdle;
               dispatchEvent(new Event(Event.COMPLETE));
            }
            else
            {
               dispatchEvent(new FZipErrorEvent(FZipErrorEvent.const_117,"EOF"));
            }
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         if(!var_99 && var_100 == parseIdle)
         {
            var_99 = new URLStream();
            var_99.endian = Endian.LITTLE_ENDIAN;
            addEventHandlers();
            var_50 = [];
            var_132 = new Dictionary();
            var_100 = parseSignature;
            var_99.load(param1);
         }
      }
      
      private function parseIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      private function parseLocalfile(param1:IDataInput) : Boolean
      {
         if(var_515.parse(param1))
         {
            var_50.push(var_515);
            if(false)
            {
               var_132["null"] = var_515;
            }
            dispatchEvent(new FZipEvent(FZipEvent.const_1427,var_515));
            var_515 = null;
            if(var_100 != parseIdle)
            {
               var_100 = parseSignature;
               return true;
            }
         }
         return false;
      }
      
      public function close() : void
      {
         if(var_99)
         {
            var_100 = parseIdle;
            removeEventHandlers();
            var_99.close();
            var_99 = null;
         }
      }
      
      public function removeFileAt(param1:uint) : FZipFile
      {
         var _loc2_:* = null;
         if(var_50 != null && var_132 != null && param1 < var_50.length)
         {
            _loc2_ = var_50[param1] as FZipFile;
            if(_loc2_ != null)
            {
               var_50.splice(param1,1);
               delete var_132[_loc2_.filename];
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addFile(param1:String, param2:ByteArray = null) : FZipFile
      {
         return addFileAt(!!var_50 ? 0 : uint(0),param1,param2);
      }
      
      public function addFileFromString(param1:String, param2:String, param3:String = "utf-8") : FZipFile
      {
         return addFileFromStringAt(!!var_50 ? 0 : uint(0),param1,param2,param3);
      }
   }
}