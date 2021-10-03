package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_1017:MouseEventQueue;
      
      public static var var_1720:IMouseCursor;
      
      public static const const_1614:int = 2;
      
      private static var var_1134:Factory;
      
      private static var var_144:IWindowRenderer;
      
      public static var var_1483:KeyboardEventQueue;
      
      public static const const_1579:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1549:int = 0;
      
      public static const const_1522:int = 3;
      
      public static const const_1185:int = 4;
       
      
      protected var var_2436:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_775:WindowController;
      
      private var var_751:Date;
      
      protected var var_2435:IWindowParser;
      
      protected var var_1030:Error;
      
      protected var var_2434:IInternalWindowServices;
      
      protected var var_102:WindowController;
      
      protected var var_1495:int = -1;
      
      protected var var_95:IDesktopWindow;
      
      private var var_1632:Boolean = false;
      
      protected var var_2515:Boolean = true;
      
      private var var_197:Boolean = false;
      
      protected var var_1206:SubstituteParentController;
      
      private var var_2471:Point;
      
      protected var var_345:DisplayObjectContainer;
      
      private var var_372:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_661:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_661 = new Point();
         var_2471 = new Point();
         super();
         _name = param1;
         var_144 = param2;
         _localization = param4;
         var_345 = param5;
         var_2434 = new InternalWindowServices(this,param5);
         var_2436 = param3;
         var_2435 = new WindowParser(this);
         var_751 = new Date();
         if(var_1134 == null)
         {
            var_1134 = new Factory();
         }
         if(var_1017 == null)
         {
            var_1017 = new MouseEventQueue(param5);
         }
         if(var_1483 == null)
         {
            var_1483 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_95 = new DesktopController("_CONTEXT_DESKTOP_" + _name,this,param6);
         var_345.addChild(var_95.getDisplayObject());
         var_345.doubleClickEnabled = true;
         var_345.addEventListener(Event.RESIZE,stageResizedHandler);
         var_102 = WindowController(var_95);
         var_1206 = new SubstituteParentController(this);
         var_372 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_95)
         {
            var_95 = null;
         }
         if(param1.state != WindowState.const_510)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_1134.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1185,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1206;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_95,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_95;
      }
      
      public function render(param1:uint) : void
      {
         var_1632 = true;
         var_144.update(param1);
         var_1632 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_345.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_345.removeChild(IGraphicContextHost(var_95).getGraphicContext(true) as DisplayObject);
         var_95.destroy();
         var_95 = null;
         var_1206.destroy();
         var_1206 = null;
         var_1134 = null;
         var_144 = null;
         var_102 = null;
         var_751 = null;
         var_372 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_95 != null && true)
         {
            if(var_345 is Stage)
            {
               var_95.width = Stage(var_345).stageWidth;
               var_95.height = Stage(var_345).stageHeight;
            }
            else
            {
               var_95.width = var_345.width;
               var_95.height = var_345.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_144.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2435;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2436;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_197 = true;
         if(var_1030)
         {
            throw var_1030;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_1017;
         _loc7_.begin();
         var_661.x = -1;
         var_661.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_661.x || _loc2_.stageY != var_661.y)
            {
               var_661.x = _loc2_.stageX;
               var_661.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_95.groupChildrenUnderPoint(var_661,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_102 != var_95 && true)
                  {
                     var_102.getGlobalPosition(_loc6_);
                     var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_102 = WindowController(var_95);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_102)
                     {
                        if(true)
                        {
                           var_102.getGlobalPosition(_loc6_);
                           var_102.update(var_102,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_102 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_102 && true)
                     {
                        if(var_372 != null)
                        {
                           var_372.mouseEventReceived(_loc2_.type,var_102);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_102)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_95)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_197 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_1030 = param2;
         var_1495 = param1;
         if(var_2515)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_1030;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1720 == null)
         {
            var_1720 = new MouseCursorControl(var_345);
         }
         return var_1720;
      }
      
      public function flushError() : void
      {
         var_1030 = null;
         var_1495 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1495;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_43))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_70))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_144.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_467))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_775 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_775 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_775 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_775 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_775 = null;
               }
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!(param1 is IScrollableWindow) && !(param1 is IScrollbarWindow))
               {
                  return null;
               }
               break;
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_95.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2434;
      }
   }
}
