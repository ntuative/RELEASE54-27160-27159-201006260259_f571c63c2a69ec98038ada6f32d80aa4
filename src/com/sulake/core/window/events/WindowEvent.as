package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_276:String = "WE_CHILD_RESIZED";
      
      public static const const_1236:String = "WE_CLOSE";
      
      public static const const_1232:String = "WE_DESTROY";
      
      public static const const_133:String = "WE_CHANGE";
      
      public static const const_1399:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1700:String = "WE_PARENT_RESIZE";
      
      public static const const_91:String = "WE_UPDATE";
      
      public static const const_1403:String = "WE_MAXIMIZE";
      
      public static const const_409:String = "WE_DESTROYED";
      
      public static const const_1023:String = "WE_UNSELECT";
      
      public static const const_1199:String = "WE_MAXIMIZED";
      
      public static const const_1546:String = "WE_UNLOCKED";
      
      public static const const_375:String = "WE_CHILD_REMOVED";
      
      public static const const_162:String = "WE_OK";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1237:String = "WE_ACTIVATE";
      
      public static const const_253:String = "WE_ENABLED";
      
      public static const const_492:String = "WE_CHILD_RELOCATED";
      
      public static const const_1331:String = "WE_CREATE";
      
      public static const const_761:String = "WE_SELECT";
      
      public static const const_175:String = "";
      
      public static const const_1518:String = "WE_LOCKED";
      
      public static const const_1562:String = "WE_PARENT_RELOCATE";
      
      public static const const_1655:String = "WE_CHILD_REMOVE";
      
      public static const const_1686:String = "WE_CHILD_RELOCATE";
      
      public static const const_1592:String = "WE_LOCK";
      
      public static const const_226:String = "WE_FOCUSED";
      
      public static const const_574:String = "WE_UNSELECTED";
      
      public static const const_852:String = "WE_DEACTIVATED";
      
      public static const const_1238:String = "WE_MINIMIZED";
      
      public static const const_1606:String = "WE_ARRANGED";
      
      public static const const_1624:String = "WE_UNLOCK";
      
      public static const const_1691:String = "WE_ATTACH";
      
      public static const const_1280:String = "WE_OPEN";
      
      public static const const_1269:String = "WE_RESTORE";
      
      public static const const_1544:String = "WE_PARENT_RELOCATED";
      
      public static const const_1396:String = "WE_RELOCATE";
      
      public static const const_1666:String = "WE_CHILD_RESIZE";
      
      public static const const_1619:String = "WE_ARRANGE";
      
      public static const const_1252:String = "WE_OPENED";
      
      public static const const_1321:String = "WE_CLOSED";
      
      public static const const_1617:String = "WE_DETACHED";
      
      public static const const_1717:String = "WE_UPDATED";
      
      public static const const_1207:String = "WE_UNFOCUSED";
      
      public static const const_397:String = "WE_RELOCATED";
      
      public static const const_1268:String = "WE_DEACTIVATE";
      
      public static const const_217:String = "WE_DISABLED";
      
      public static const const_609:String = "WE_CANCEL";
      
      public static const const_570:String = "WE_ENABLE";
      
      public static const const_1349:String = "WE_ACTIVATED";
      
      public static const const_1335:String = "WE_FOCUS";
      
      public static const const_1515:String = "WE_DETACH";
      
      public static const const_1259:String = "WE_RESTORED";
      
      public static const const_1188:String = "WE_UNFOCUS";
      
      public static const const_56:String = "WE_SELECTED";
      
      public static const const_1419:String = "WE_PARENT_RESIZED";
      
      public static const const_1356:String = "WE_CREATED";
      
      public static const const_1638:String = "WE_ATTACHED";
      
      public static const const_1266:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1727:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1497:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1727 = param3;
         var_1497 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1497;
      }
      
      public function get related() : IWindow
      {
         return var_1727;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1497 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
