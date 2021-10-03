package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1330:String;
      
      private var _disposed:Boolean;
      
      private var var_1514:String;
      
      private var var_1329:int;
      
      private var _main:ModerationManager;
      
      private var var_849:IDropMenuWindow;
      
      private var var_431:ITextFieldWindow;
      
      private var var_56:IFrameWindow;
      
      private var var_340:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         _main = param1;
         var_1329 = param2;
         var_1514 = param3;
         var_1330 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_226)
         {
            return;
         }
         if(!var_340)
         {
            return;
         }
         var_431.text = "";
         var_340 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_56;
      }
      
      public function getId() : String
      {
         return var_1514;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_340 || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         _main.connection.send(new ModMessageMessageComposer(var_1329,var_431.text,var_1330));
         this.dispose();
      }
      
      public function show() : void
      {
         var_56 = IFrameWindow(_main.getXmlWindow("send_msgs"));
         var_56.caption = "Msg To: " + var_1514;
         var_56.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_431 = ITextFieldWindow(var_56.findChildByName("message_input"));
         var_431.procedure = onInputClick;
         var_849 = IDropMenuWindow(var_56.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_849);
         var_849.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_56.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_56.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + _main.initMsg.messageTemplates.length);
         param1.populate(_main.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_56 != null)
         {
            var_56.destroy();
            var_56 = null;
         }
         var_849 = null;
         var_431 = null;
         _main = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_56)
         {
            return;
         }
         var _loc3_:String = _main.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_340 = false;
            var_431.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1342;
      }
   }
}
