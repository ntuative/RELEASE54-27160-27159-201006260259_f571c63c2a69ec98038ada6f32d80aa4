package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ClubGiftWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
       
      
      private var var_199:IWindowContainer;
      
      private const const_182:int = 31;
      
      private var var_597:Map;
      
      private var _itemList:IItemListWindow;
      
      private var _controller:ClubGiftController;
      
      public function ClubGiftWidget(param1:IWindowContainer, param2:ClubGiftController)
      {
         super(param1);
         _controller = param2;
         var_597 = new Map();
      }
      
      private function updateList() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(!_controller || !window || !page)
         {
            return;
         }
         for each(_loc1_ in var_597)
         {
            _loc1_.dispose();
         }
         var_597.reset();
         _loc2_ = _controller.getOffers();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Map = _controller.getGiftData();
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IItemListWindow = window.findChildByName("gift_list") as IItemListWindow;
         if(!_loc4_)
         {
            return;
         }
         _loc4_.destroyListItems();
         for each(_loc6_ in _loc2_)
         {
            _loc1_ = new Offer(_loc6_,page);
            _loc7_ = _loc3_.getValue(_loc1_.offerId) as ClubGiftData;
            _loc5_ = createListItem(_loc1_,_loc7_);
            if(_loc5_)
            {
               _loc4_.addListItem(_loc5_);
               var_597.add(_loc1_.offerId,_loc1_);
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      private function showPreview(param1:Offer, param2:Rectangle) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param1.productContainer)
         {
            return;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return;
         }
         var _loc3_:IProduct = param1.productContainer.firstProduct;
         if(!_loc3_)
         {
            return;
         }
         switch(_loc3_.productType)
         {
            case "s":
               _loc4_ = page.viewer.roomEngine.getFurnitureImage(_loc3_.productClassId,new Vector3d(90),64,this,_loc3_.extraParam);
               break;
            case "i":
               _loc4_ = page.viewer.roomEngine.getWallItemImage(_loc3_.productClassId,new Vector3d(90),64,this,_loc3_.extraParam);
               break;
            default:
               return;
         }
         if(!_loc4_ || !_loc4_.data)
         {
            return;
         }
         if(!var_199)
         {
            var_199 = createWindow("club_gift_preview") as IWindowContainer;
         }
         if(!var_199)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = var_199.findChildByName("image") as IBitmapWrapperWindow;
         if(!_loc5_)
         {
            return;
         }
         _loc5_.width = _loc4_.data.width;
         _loc5_.height = _loc4_.data.height;
         if(_loc5_.bitmap)
         {
            _loc5_.bitmap.dispose();
         }
         _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height);
         _loc5_.bitmap.draw(_loc4_.data);
         var _loc6_:Point = Point.interpolate(param2.topLeft,param2.bottomRight,0.5);
         var_199.setGlobalPosition(_loc6_.subtract(new Point(0,0)));
         var_199.visible = true;
         var_199.activate();
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!_controller || true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = _controller.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return _controller.windowManager.buildFromXML(_loc3_);
      }
      
      override public function init() : void
      {
         if(!window)
         {
            return;
         }
         super.init();
         _controller.widget = this;
         var _loc1_:IWindowContainer = window.findChildByName("widget_main_container") as IWindowContainer;
         if(!_loc1_)
         {
            _loc1_ = createWindow("clubGiftWidget") as IWindowContainer;
            if(!_loc1_)
            {
               return;
            }
            window.addChild(_loc1_);
            _itemList = _loc1_.findChildByName("gift_list") as IItemListWindow;
         }
         update();
      }
      
      private function updateInfo() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!_controller || !window)
         {
            return;
         }
         var _loc1_:ITextWindow = window.findChildByName("info_text") as ITextWindow;
         if(!_loc1_)
         {
            return;
         }
         if(false)
         {
            _loc2_ = "catalog.club_gift.available";
            _controller.localization.registerParameter(_loc2_,"amount",_controller.giftsAvailable.toString());
         }
         else if(false)
         {
            _loc2_ = "catalog.club_gift.days_until_next";
            _controller.localization.registerParameter(_loc2_,"days",_controller.daysUntilNextGift.toString());
         }
         else if(false)
         {
            _loc2_ = "catalog.club_gift.not_available";
         }
         else
         {
            _loc2_ = "catalog.club_gift.no_club";
         }
         _loc1_.text = _controller.localization.getKey(_loc2_);
         if(true)
         {
            return;
         }
         var _loc5_:ITextWindow = window.findChildByName("past_club_days") as ITextWindow;
         if(_loc5_)
         {
            _loc2_ = _controller.purse.pastClubDays >= const_182 ? "catalog.club_gift.past_club.long" : "catalog.club_gift.past_club";
            _loc3_ = _controller.purse.pastClubDays % const_182;
            _loc4_ = _controller.purse.pastClubDays / const_182;
            _controller.localization.registerParameter(_loc2_,"days",_loc3_.toString());
            _controller.localization.registerParameter(_loc2_,"months",_loc4_.toString());
            _loc5_.text = _controller.localization.getKey(_loc2_);
         }
         var _loc6_:ITextWindow = window.findChildByName("past_vip_days") as ITextWindow;
         if(_loc6_)
         {
            _loc2_ = _controller.purse.pastVipDays >= const_182 ? "catalog.club_gift.past_vip.long" : "catalog.club_gift.past_vip";
            _loc3_ = _controller.purse.pastVipDays % const_182;
            _loc4_ = _controller.purse.pastVipDays / const_182;
            _controller.localization.registerParameter(_loc2_,"days",_loc3_.toString());
            _controller.localization.registerParameter(_loc2_,"months",_loc4_.toString());
            _loc6_.text = _controller.localization.getKey(_loc2_);
         }
      }
      
      public function update() : void
      {
         updateInfo();
         updateList();
      }
      
      private function clickHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !var_597 || !_controller)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(param2.name != "select_button")
         {
            return;
         }
         var _loc3_:Offer = var_597.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         _controller.selectGift(_loc3_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _controller = null;
         if(var_199)
         {
            var_199.dispose();
            var_199 = null;
         }
      }
      
      private function createListItem(param1:Offer, param2:ClubGiftData) : IWindow
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!param1 || !param1.productContainer || !param1.productContainer.firstProduct || !param2)
         {
            return null;
         }
         var _loc3_:IWindowContainer = createWindow("club_gift_list_item") as IWindowContainer;
         if(!_loc3_)
         {
            return null;
         }
         _loc3_.procedure = clickHandler;
         var _loc4_:IProduct = param1.productContainer.firstProduct;
         if(!_loc4_)
         {
            return null;
         }
         var _loc5_:IProductData = _loc4_.productData;
         if(!_loc5_)
         {
            return null;
         }
         setText(_loc3_.findChildByName("gift_name"),_loc5_.name);
         setText(_loc3_.findChildByName("gift_desc"),_loc5_.description);
         if(param2.isVip)
         {
            _loc6_ = param2.daysRequired - _controller.purse.pastVipDays;
         }
         else
         {
            _loc6_ = param2.daysRequired - _controller.purse.pastClubDays;
         }
         if(_loc6_ > 0)
         {
            if(param2.isVip)
            {
               _loc7_ = "catalog.club_gift.vip_missing";
            }
            else
            {
               _loc7_ = "catalog.club_gift.club_missing";
            }
            if(_loc6_ >= const_182)
            {
               _loc7_ += ".long";
            }
            _loc12_ = _loc6_ % const_182;
            _loc13_ = _loc6_ / const_182;
            _controller.localization.registerParameter(_loc7_,"days",_loc12_.toString());
            _controller.localization.registerParameter(_loc7_,"months",_loc13_.toString());
         }
         else if(false)
         {
            _loc7_ = "catalog.club_gift.selectable";
         }
         else
         {
            _loc7_ = "";
         }
         setText(_loc3_.findChildByName("months_required"),_loc7_.length > 0 ? _controller.localization.getKey(_loc7_) : "");
         var _loc8_:IIconWindow = _loc3_.findChildByName("vip_icon") as IIconWindow;
         if(_loc8_)
         {
            _loc8_.visible = param2.isVip;
         }
         var _loc9_:IButtonWindow = _loc3_.findChildByName("select_button") as IButtonWindow;
         if(_loc9_)
         {
            if(_loc6_ <= 0 && false)
            {
               _loc9_.enable();
            }
            else
            {
               _loc9_.disable();
            }
            _loc9_.id = param1.offerId;
         }
         var _loc10_:IProductContainer = param1.productContainer;
         if(!_loc10_)
         {
            return null;
         }
         if(!page || true || !page.viewer.roomEngine)
         {
            return null;
         }
         var _loc11_:IWindowContainer = _loc3_.findChildByName("image_container") as IWindowContainer;
         if(_loc11_)
         {
            _loc10_.view = _loc11_;
            _loc10_.initProductIcon(page.viewer.roomEngine);
            _loc11_.procedure = mouseOverHandler;
            _loc11_.id = param1.offerId;
         }
         return _loc3_;
      }
      
      private function setText(param1:IWindow, param2:String) : void
      {
         var _loc3_:ITextWindow = param1 as ITextWindow;
         if(!_loc3_)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      private function mouseOverHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!param1 || !param2 || !var_597)
         {
            return;
         }
         if(param2.name != "image_container")
         {
            return;
         }
         var _loc3_:Offer = var_597.getValue(param2.id) as Offer;
         if(!_loc3_)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc4_ = new Rectangle();
            param2.getGlobalRectangle(_loc4_);
         }
         if(param1.type == WindowMouseEvent.const_27)
         {
            hidePreview();
         }
      }
      
      private function hidePreview() : void
      {
         if(var_199)
         {
            var_199.visible = false;
         }
      }
   }
}
