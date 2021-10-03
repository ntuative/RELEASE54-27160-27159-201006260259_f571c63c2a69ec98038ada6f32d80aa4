package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CreateFlatMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.RoomLayout;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class RoomCreateViewCtrl
   {
       
      
      private var var_1308:Boolean = true;
      
      private var var_900:RoomLayout;
      
      private var var_22:IWindowContainer;
      
      private var var_41:Array;
      
      private var var_51:IItemListWindow;
      
      private var _navigator:HabboNavigator;
      
      private var var_525:Timer;
      
      private var var_1086:TextFieldManager;
      
      public function RoomCreateViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_525 = new Timer(100);
         var_525.addEventListener(TimerEvent.TIMER,updateArrowPos);
         var_41 = new Array();
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,104,"a"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,94,"b"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,36,"c"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,84,"d"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,80,"e"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,80,"f"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,416,"i"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,320,"j"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,448,"k"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,352,"l"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,384,"m"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_44,372,"n"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,80,"g"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,74,"h"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,416,"o"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,352,"p"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,304,"q"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,336,"r"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,748,"u"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_54,438,"v"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,540,"t"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,512,"w"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,396,"x"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,440,"y"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,456,"z"));
         var_41.push(new RoomLayout(HabboClubLevelEnum.const_48,208,"0"));
      }
      
      private function getCancelButton() : IButtonWindow
      {
         return IButtonWindow(var_22.findChildByName("back_button"));
      }
      
      private function prepare() : void
      {
         if(this.var_22 != null)
         {
            return;
         }
         var_22 = IWindowContainer(_navigator.getXmlWindow("roc_create_room"));
         var_51 = IItemListWindow(var_22.findChildByName("item_list"));
         refreshRoomThumbnails();
         Util.setProcDirectly(getCreateButton(),onCreateButtonClick);
         Util.setProcDirectly(getCancelButton(),onCancelButtonClick);
         var _loc1_:IWindow = var_22.findChildByTag("close");
         _loc1_.procedure = onCancelButtonClick;
         var_1086 = new TextFieldManager(_navigator,ITextFieldWindow(var_22.findChildByName("room_name_input")),25,null,_navigator.getText("navigator.createroom.roomnameinfo"));
         var _loc2_:Rectangle = Util.getLocationRelativeTo(var_22.desktop,var_22.width,var_22.height);
         var_22.x = _loc2_.x;
         var_22.y = _loc2_.y;
      }
      
      private function addThumbnail(param1:IWindowContainer, param2:RoomLayout, param3:Boolean) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(_navigator.getXmlWindow("roc_room_thumbnail"));
         _loc4_.tags.push(param2.name);
         if(!param3)
         {
            _loc4_.x = _loc4_.width;
         }
         var _loc5_:IWindowContainer = IWindowContainer(_loc4_.findChildByName("bg_pic"));
         var _loc6_:IBitmapWrapperWindow = _navigator.getButton(param2.name,"model_" + param2.name,onPicClick,0,0,0);
         _loc5_.addChild(_loc6_);
         var _loc7_:Rectangle = Util.getLocationRelativeTo(_loc5_,_loc6_.width,_loc6_.height);
         _loc6_.x = _loc7_.x;
         _loc6_.y = _loc7_.y;
         Util.setProc(_loc4_,"bg_unsel",onChooseLayout);
         param1.addChild(_loc4_);
         param1.width = 2 * _loc4_.width;
         param1.height = _loc4_.height;
         param2.view = _loc4_;
         ITextWindow(param2.view.findChildByName("tile_size_txt")).text = param2.tileSize + " " + _navigator.getText("navigator.createroom.tilesize");
         var _loc8_:IIconWindow = _loc4_.findChildByName("club_icon") as IIconWindow;
         if(_loc8_)
         {
            switch(param2.requiredClubLevel)
            {
               case HabboClubLevelEnum.const_54:
                  _loc8_.style = 11;
                  break;
               case HabboClubLevelEnum.const_48:
                  _loc8_.style = 12;
                  break;
               default:
                  _loc8_.visible = false;
            }
         }
      }
      
      public function show() : void
      {
         this.prepare();
         this.var_22.visible = true;
         this.refresh();
         this.var_22.activate();
         this.var_525.start();
      }
      
      private function findLayout(param1:String) : RoomLayout
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_41)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return var_41[0];
      }
      
      private function getCreateButton() : IButtonWindow
      {
         return IButtonWindow(var_22.findChildByName("create_button"));
      }
      
      private function onHcMoreClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         trace("HC LINK CLICKED");
         _navigator.openCatalogClubPage();
      }
      
      private function onPicClick(param1:WindowEvent, param2:IWindow) : void
      {
         onChooseLayout(param1,param2.parent);
      }
      
      private function isAllowed(param1:RoomLayout) : Boolean
      {
         switch(param1.requiredClubLevel)
         {
            case HabboClubLevelEnum.const_44:
               return true;
            case HabboClubLevelEnum.const_54:
               return _navigator.sessionData.hasUserRight("fuse_use_special_room_layouts");
            case HabboClubLevelEnum.const_48:
               return _navigator.sessionData.hasUserRight("fuse_use_vip_room_layouts");
            default:
               return false;
         }
      }
      
      public function dispose() : void
      {
         if(var_525)
         {
            var_525.removeEventListener(TimerEvent.TIMER,updateArrowPos);
            var_525.reset();
            var_525 = null;
         }
      }
      
      private function onChooseLayout(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = getLayout(param2);
            if(isAllowed(_loc3_))
            {
               var_900 = _loc3_;
               refreshSelection();
            }
         }
      }
      
      public function refresh() : void
      {
         var_1086.goBackToInitialState();
         var_1086.input.textBackgroundColor = 4294967295;
         var_900 = var_41[0];
         this.refreshRoomThumbnails();
         refreshSelection();
      }
      
      private function getRow() : IWindowContainer
      {
         return IWindowContainer(_navigator.windowManager.createWindow("","",HabboWindowType.const_52,HabboWindowStyle.const_36,HabboWindowParam.const_69,new Rectangle(0,0,100,300)));
      }
      
      private function onCancelButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         close();
      }
      
      private function getLayout(param1:IWindow) : RoomLayout
      {
         var _loc2_:IWindowContainer = IWindowContainer(param1.parent);
         return findLayout(_loc2_.tags[0]);
      }
      
      private function onCreateButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:String = var_1086.getText();
         var _loc4_:String = "model_undefined";
         if(!isMandatoryFieldsFilled())
         {
            return;
         }
         _navigator.send(new CreateFlatMessageComposer(_loc3_,_loc4_));
         var_22.visible = false;
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         var _loc1_:Boolean = var_1086.checkMandatory(_navigator.getText("navigator.createroom.nameerr"));
         return Boolean(_loc1_);
      }
      
      private function refreshSelection() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = false;
         var _loc3_:* = null;
         for each(_loc1_ in var_41)
         {
            if(_loc1_.view != null)
            {
               _loc2_ = _loc1_ == var_900;
               _loc1_.view.findChildByName("bg_sel").visible = _loc2_;
               _loc1_.view.findChildByName("bg_unsel").visible = !_loc2_;
               _loc3_ = ITextWindow(_loc1_.view.findChildByName("tile_size_txt"));
               _loc3_.textColor = !!_loc2_ ? 4294967295 : uint(4278190080);
               _loc3_.color = !!_loc2_ ? 4285432196 : uint(4291546059);
               _navigator.refreshButton(_loc1_.view,"tile_icon_black",!_loc2_,null,0);
               _navigator.refreshButton(_loc1_.view,"tile_icon_white",_loc2_,null,0);
               _navigator.refreshButton(_loc1_.view,"select_arrow",_loc2_,null,0);
            }
         }
      }
      
      private function close() : void
      {
         this.var_22.visible = false;
         this.var_525.reset();
      }
      
      private function updateArrowPos(param1:Event) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_900.view.findChildByName("select_arrow"));
         var _loc6_:int = Math.abs(_loc3_.y - 0) < 2 || Math.abs(_loc3_.y - 15) < 2 ? 1 : 2;
         _loc3_.y += !!var_1308 ? _loc6_ : -_loc6_;
         if(_loc3_.y < 0)
         {
            var_1308 = true;
            _loc3_.y = 1;
         }
         else if(_loc3_.y > 15)
         {
            var_1308 = false;
            _loc3_.y = 14;
         }
      }
      
      private function refreshRoomThumbnails() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         while(false)
         {
            _loc6_ = var_51.removeListItemAt(0);
            _loc6_.destroy();
         }
         for each(_loc1_ in var_41)
         {
            if(_loc1_.view != null)
            {
               _loc1_.view.destroy();
               _loc1_.view = null;
            }
         }
         _loc2_ = 0;
         _loc4_ = 0;
         while(_loc4_ < var_41.length)
         {
            _loc7_ = var_41[_loc4_];
            if(isAllowed(_loc7_))
            {
               if(_loc2_ == 0)
               {
                  _loc3_ = getRow();
                  var_51.addListItem(_loc3_);
               }
               addThumbnail(_loc3_,var_41[_loc4_],_loc2_ % 2 == 0);
               _loc2_ = _loc2_ == 0 ? 1 : 0;
            }
            _loc4_++;
         }
         refreshSelection();
         var _loc5_:* = "roc_hc_promo";
         if(_navigator.sessionData.hasUserRight("fuse_use_special_room_layouts"))
         {
            if(_navigator.sessionData.hasUserRight("fuse_use_vip_room_layouts"))
            {
               _loc5_ = null;
            }
            else
            {
               _loc5_ = "roc_vip_promo";
            }
         }
         if(_loc5_)
         {
            _loc8_ = IWindowContainer(_navigator.getXmlWindow(_loc5_));
            if(_loc8_)
            {
               _loc8_.findChildByName("link").procedure = onHcMoreClick;
               var_51.addListItem(_loc8_);
            }
         }
      }
   }
}
