package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
      
      protected static const KEY_TOOLTIP_DELAY:String = "tool_tip_delay";
      
      protected static const const_1055:String = "tool_tip_caption";
      
      protected static const const_1443:uint = 500;
      
      protected static const const_766:String = "";
      
      protected static var var_347:Array;
       
      
      protected var var_2422:uint = 0;
      
      protected var var_1024:String = "";
      
      protected var var_481:Array;
      
      protected var var_1025:uint = 500;
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         var_481 = new Array();
         var_481[0] = MouseCursorType.ARROW_LINK;
         var_481[1] = MouseCursorType.const_36;
         var_481[2] = MouseCursorType.ARROW_LINK;
         var_481[3] = MouseCursorType.ARROW_LINK;
         var_481[4] = MouseCursorType.const_36;
         var_481[5] = MouseCursorType.const_36;
         var_481[6] = MouseCursorType.ARROW_LINK;
         if(var_347 == null)
         {
            var_347 = new Array();
            var_347[0] = WindowState.const_94;
            var_347[1] = WindowState.const_76;
            var_347[2] = WindowState.const_80;
            var_347[3] = WindowState.const_64;
            var_347[4] = WindowState.WINDOW_STATE_SELECTED;
            var_347[5] = WindowState.const_93;
            var_347[6] = WindowState.const_70;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         param2.push(new PropertyStruct(const_1055,param1.toolTipCaption,PropertyStruct.STRING,param1.toolTipCaption != const_766));
         param2.push(new PropertyStruct(KEY_TOOLTIP_DELAY,param1.toolTipDelay,PropertyStruct.const_1053,param1.toolTipDelay != const_1443));
         return param2;
      }
      
      public static function readInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case const_1055:
                  param1.toolTipCaption = _loc3_.value as String;
                  break;
               case KEY_TOOLTIP_DELAY:
                  param1.toolTipDelay = _loc3_.value as uint;
                  break;
               case "mouse_cursor_hovering":
                  param1.setMouseCursorByState(WindowState.const_80,_loc3_.value as uint);
                  break;
               case "mouse_cursor_pressed":
                  param1.setMouseCursorByState(WindowState.const_93,_loc3_.value as uint);
                  break;
               case "mouse_cursor_disabled":
                  param1.setMouseCursorByState(WindowState.const_70,_loc3_.value as uint);
                  break;
            }
         }
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:Event) : void
      {
         if(param1.toolTipCaption != const_766)
         {
            if(param2.type == MouseEvent.MOUSE_OVER)
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type != MouseEvent.MOUSE_MOVE)
            {
               if(param2.type == MouseEvent.MOUSE_OUT)
               {
                  param1.context.getWindowServices().getToolTipAgentService().end(param1);
               }
            }
         }
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         var_1025 = param1;
      }
      
      public function hideToolTip() : void
      {
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function get toolTipCaption() : String
      {
         return var_1024;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         var_1024 = param1 == null ? const_766 : param1;
      }
      
      override public function set properties(param1:Array) : void
      {
         readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_481[_loc2_];
            }
         }
         return MouseCursorType.const_36;
      }
      
      public function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_347.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_481[_loc3_] = param2;
         }
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function get toolTipDelay() : uint
      {
         return var_1025;
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
         var_2422 = param1;
      }
      
      public function get mouseCursorType() : uint
      {
         return var_2422;
      }
   }
}
