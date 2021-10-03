package com.sulake.core.communication.connection
{
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.messages.IMessageClassManager;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.communication.messages.MessageClassManager;
   import com.sulake.core.communication.messages.MessageDataWrapper;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.ErrorReportStorage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class SocketConnection extends EventDispatcher implements IConnection, IDisposable
   {
      
      public static const const_1418:int = 10000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1347:Boolean = false;
      
      private var var_74:Socket;
      
      private var var_925:IEncryption;
      
      private var var_757:int;
      
      private var var_280:ByteArray;
      
      private var _id:String;
      
      private var var_331:ICoreCommunicationManager;
      
      private var var_371:Timer;
      
      private var var_372:IConnectionStateListener;
      
      private var var_644:IProtocol;
      
      private var var_924:IMessageClassManager;
      
      public function SocketConnection(param1:String, param2:ICoreCommunicationManager, param3:IConnectionStateListener)
      {
         super();
         _id = param1;
         var_331 = param2;
         var_280 = new ByteArray();
         var_924 = new MessageClassManager();
         var_74 = new Socket();
         var_371 = new Timer(const_1418,1);
         var_371.addEventListener(TimerEvent.TIMER,onTimeOutTimer);
         var_74.addEventListener(Event.CONNECT,onConnect);
         var_74.addEventListener(Event.COMPLETE,onComplete);
         var_74.addEventListener(Event.CLOSE,onClose);
         var_74.addEventListener(ProgressEvent.SOCKET_DATA,onRead);
         var_74.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
         var_74.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_372 = param3;
      }
      
      private function onTimeOutTimer(param1:TimerEvent) : void
      {
         var_371.stop();
         logConnection("[SocketConnection] TimeOut Error");
         ErrorReportStorage.addDebugData("ConnectionTimer","TimeOut in " + (getTimer() - var_757));
         var _loc2_:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
         _loc2_.text = "Socket Timeout (undefined ms). Possible Firewall.";
         dispatchEvent(_loc2_);
      }
      
      public function setEncryption(param1:IEncryption) : void
      {
         var_925 = param1;
      }
      
      public function get connected() : Boolean
      {
         return var_74.connected;
      }
      
      private function onConnect(param1:Event) : void
      {
         logConnection("[SocketConnection] Connected");
         var_371.stop();
         var_1347 = true;
         ErrorReportStorage.addDebugData("ConnectionTimer","Connected in " + (getTimer() - var_757));
         dispatchEvent(param1);
      }
      
      public function send(param1:IMessageComposer, param2:int = -1) : Boolean
      {
         if(this.disposed)
         {
            return false;
         }
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:int = this.var_924.getMessageComposerID(param1);
         if(_loc4_ < 0)
         {
            logConnection("Could not find registered message composer for " + param1);
            return false;
         }
         var _loc5_:ByteArray = var_644.encoder.encode(_loc4_,param1.getMessageArray(),param2);
         if(var_372)
         {
            var_372.messageSent(String(_loc4_),_loc5_.toString());
         }
         if(var_925 != null)
         {
            _loc3_ = var_925.encipher(_loc5_);
         }
         else
         {
            _loc3_ = _loc5_;
         }
         logConnection("<< [SOCKET]: " + [_loc4_,param1.getMessageArray(),"->",_loc3_]);
         if(false)
         {
            var_74.writeBytes(_loc3_);
            var_74.flush();
            return true;
         }
         logConnection("[SOCKET] Not connected.");
         return false;
      }
      
      public function init(param1:String, param2:uint = 0) : Boolean
      {
         if(var_372)
         {
            var_372.connectionInit(param1,param2);
         }
         Security.loadPolicyFile("xmlsocket://" + param1 + ":" + param2);
         var_371.start();
         var_757 = getTimer();
         var_74.connect(param1,param2);
         return true;
      }
      
      private function onRead(param1:ProgressEvent) : void
      {
         if(!var_74)
         {
            return;
         }
         while(false)
         {
            var_280.writeByte(var_74.readUnsignedByte());
         }
         logConnection(">>[SOCKET]: " + var_280.toString());
      }
      
      public function get protocol() : IProtocol
      {
         return var_644;
      }
      
      public function addMessageEvent(param1:IMessageEvent) : void
      {
         var_331.addConnectionMessageEvent(_id,param1);
      }
      
      public function dispose() : void
      {
         _disposed = true;
         if(var_74)
         {
            var_74.removeEventListener(Event.CONNECT,onConnect);
            var_74.removeEventListener(Event.COMPLETE,onComplete);
            var_74.removeEventListener(Event.CLOSE,onClose);
            var_74.removeEventListener(ProgressEvent.SOCKET_DATA,onRead);
            var_74.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            var_74.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            if(var_1347)
            {
               var_74.close();
            }
         }
         var_74 = null;
         var_280 = null;
         var_372 = null;
         var_925 = null;
         var_644 = null;
         _id = null;
         var_924 = null;
         var_331 = null;
         var_372 = null;
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         var_371.stop();
         logConnection("[SocketConnection] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","SecurityError in " + (getTimer() - var_757));
         dispatchEvent(param1);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerMessageClasses(param1:IMessageConfiguration) : void
      {
         var_924.registerMessages(param1);
      }
      
      public function set protocol(param1:IProtocol) : void
      {
         var_644 = param1;
      }
      
      private function onComplete(param1:Event) : void
      {
         var_371.stop();
         logConnection("[SocketConnection] Complete");
         ErrorReportStorage.addDebugData("ConnectionTimer","Completed in " + (getTimer() - var_757));
         dispatchEvent(param1);
      }
      
      public function processReceivedData() : void
      {
         var id:int = 0;
         var message:Array = null;
         var data:ByteArray = null;
         var eventClasses:Array = null;
         var events:Array = null;
         var eventClass:Class = null;
         var parserInstance:IMessageParser = null;
         var parserClassCurrent:Class = null;
         var messageEventInstance:IMessageEvent = null;
         var eventsForClass:Array = null;
         var parserClass:Class = null;
         var wasParsed:Boolean = false;
         var dataClone:ByteArray = null;
         var dataWrapper:IMessageDataWrapper = null;
         var temp:ByteArray = null;
         if(disposed)
         {
            return;
         }
         var receivedMessages:Array = new Array();
         var offset:uint = var_644.getMessages(var_280,receivedMessages);
         var time:Number = new Date().getTime();
         try
         {
            for each(message in receivedMessages)
            {
               id = message[0] as int;
               data = message[1] as ByteArray;
               if(var_372)
               {
                  var_372.messageReceived(String(id),data.toString());
               }
               logConnection(">>[SocketConnection] timestamp:" + getTimer() + " Received message id: " + id + " data: " + data.toString());
               eventClasses = var_924.getMessageEventClasses(id);
               events = new Array();
               for each(eventClass in eventClasses)
               {
                  eventsForClass = var_331.getMessageEvents(this,eventClass);
                  events = events.concat(eventsForClass);
               }
               if(events.length == 0)
               {
                  logConnection(">>[SocketConnection] No message event listeners defined for id: " + id);
               }
               parserInstance = null;
               parserClassCurrent = null;
               for each(messageEventInstance in events)
               {
                  parserClass = messageEventInstance.parserClass;
                  if(parserClass == null)
                  {
                     logConnection(">>[SocketConnection] Message Event Has no parser defined, use annotation?: " + [id,messageEventInstance]);
                  }
                  else
                  {
                     wasParsed = false;
                     if(parserClass != parserClassCurrent)
                     {
                        dataClone = new ByteArray();
                        dataClone.writeBytes(data);
                        dataClone.position = data.position;
                        dataWrapper = new MessageDataWrapper(dataClone,protocol.decoder);
                        parserInstance = var_331.getMessageParser(parserClass);
                        if(!parserInstance.flush())
                        {
                           logConnection(">>[SocketConnection] Message Event Parser wasn\'t flushed: " + [id,parserClass,parserInstance]);
                        }
                        else if(parserInstance.parse(dataWrapper))
                        {
                           parserClassCurrent = parserClass;
                           wasParsed = true;
                        }
                     }
                     else
                     {
                        wasParsed = true;
                     }
                     if(wasParsed)
                     {
                        messageEventInstance.connection = this;
                        messageEventInstance.parser = parserInstance;
                        messageEventInstance.callback.call(null,messageEventInstance);
                     }
                     else
                     {
                        logConnection(">>[SocketConnection] Could not parse message: " + [id,eventClass,messageEventInstance]);
                        parserClassCurrent = null;
                        parserInstance = null;
                     }
                  }
               }
            }
            if(offset == var_280.length)
            {
               var_280 = new ByteArray();
            }
            else if(offset > 0)
            {
               temp = new ByteArray();
               temp.writeBytes(var_280,offset);
               var_280 = temp;
               logConnection("[SOCKET REST] offset: " + offset + " rest: " + var_280.toString());
            }
         }
         catch(e:Error)
         {
            if(!disposed)
            {
               ErrorReportStorage.addDebugData("SocketConnection","Crashed while processing incoming message with id=\"" + id + "\"!");
               throw e;
            }
         }
      }
      
      public function set timeout(param1:int) : void
      {
         var_371.delay = param1;
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         var_371.stop();
         logConnection("[SocketConnection] IO Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","IOError in " + (getTimer() - var_757));
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         dispatchEvent(param1);
      }
      
      private function onClose(param1:Event) : void
      {
         var_371.stop();
         logConnection("[SocketConnection] Closed");
         var_1347 = false;
         ErrorReportStorage.addDebugData("ConnectionTimer","Closed in " + (getTimer() - var_757));
         dispatchEvent(param1);
      }
      
      private function logConnection(param1:String) : void
      {
      }
      
      override public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ += "Socket Connection: \n";
         _loc1_ += "Protocol Encoder: undefined\n";
         _loc1_ += "Protocol Decoder: undefined\n";
         return _loc1_ + ("Encryption: " + var_925 + "\n");
      }
   }
}
