package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1277:String = "WN_CREATED";
      
      public static const const_1018:String = "WN_DISABLE";
      
      public static const const_940:String = "WN_DEACTIVATED";
      
      public static const const_919:String = "WN_OPENED";
      
      public static const const_1006:String = "WN_CLOSED";
      
      public static const const_973:String = "WN_DESTROY";
      
      public static const const_1495:String = "WN_ARRANGED";
      
      public static const const_438:String = "WN_PARENT_RESIZED";
      
      public static const const_900:String = "WN_ENABLE";
      
      public static const const_884:String = "WN_RELOCATE";
      
      public static const const_1038:String = "WN_FOCUS";
      
      public static const const_960:String = "WN_PARENT_RELOCATED";
      
      public static const const_425:String = "WN_PARAM_UPDATED";
      
      public static const const_606:String = "WN_PARENT_ACTIVATED";
      
      public static const const_158:String = "WN_RESIZED";
      
      public static const const_953:String = "WN_CLOSE";
      
      public static const const_1004:String = "WN_PARENT_REMOVED";
      
      public static const const_249:String = "WN_CHILD_RELOCATED";
      
      public static const const_573:String = "WN_ENABLED";
      
      public static const const_274:String = "WN_CHILD_RESIZED";
      
      public static const const_892:String = "WN_MINIMIZED";
      
      public static const const_624:String = "WN_DISABLED";
      
      public static const const_206:String = "WN_CHILD_ACTIVATED";
      
      public static const const_462:String = "WN_STATE_UPDATED";
      
      public static const const_751:String = "WN_UNSELECTED";
      
      public static const const_507:String = "WN_STYLE_UPDATED";
      
      public static const const_1526:String = "WN_UPDATE";
      
      public static const const_389:String = "WN_PARENT_ADDED";
      
      public static const const_553:String = "WN_RESIZE";
      
      public static const const_710:String = "WN_CHILD_REMOVED";
      
      public static const const_1535:String = "";
      
      public static const const_909:String = "WN_RESTORED";
      
      public static const const_303:String = "WN_SELECTED";
      
      public static const const_1050:String = "WN_MINIMIZE";
      
      public static const const_1021:String = "WN_FOCUSED";
      
      public static const const_1411:String = "WN_LOCK";
      
      public static const const_323:String = "WN_CHILD_ADDED";
      
      public static const const_951:String = "WN_UNFOCUSED";
      
      public static const const_440:String = "WN_RELOCATED";
      
      public static const const_977:String = "WN_DEACTIVATE";
      
      public static const const_1341:String = "WN_CRETAE";
      
      public static const const_853:String = "WN_RESTORE";
      
      public static const const_329:String = "WN_ACTVATED";
      
      public static const const_1333:String = "WN_LOCKED";
      
      public static const const_496:String = "WN_SELECT";
      
      public static const const_968:String = "WN_MAXIMIZE";
      
      public static const const_879:String = "WN_OPEN";
      
      public static const const_689:String = "WN_UNSELECT";
      
      public static const const_1497:String = "WN_ARRANGE";
      
      public static const const_1393:String = "WN_UNLOCKED";
      
      public static const const_1633:String = "WN_UPDATED";
      
      public static const const_1054:String = "WN_ACTIVATE";
      
      public static const const_1369:String = "WN_UNLOCK";
      
      public static const const_950:String = "WN_MAXIMIZED";
      
      public static const const_949:String = "WN_DESTROYED";
      
      public static const const_1027:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1727,cancelable);
      }
   }
}
