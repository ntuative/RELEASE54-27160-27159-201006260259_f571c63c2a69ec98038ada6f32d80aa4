package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2350:XML;
      
      private var var_1707:ITextWindow;
      
      private var var_1708:ITextWindow;
      
      private var var_2353:XML;
      
      private var var_998:IWindowContainer;
      
      private var var_2483:ITextWindow;
      
      private var var_2352:String = "";
      
      private var var_2541:IButtonWindow;
      
      private var var_2351:XML;
      
      private var var_1709:ITextWindow;
      
      private var var_2349:XML;
      
      private var var_997:IButtonWindow;
      
      private var var_81:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_305:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2353) as IWindowContainer;
               break;
            case Offer.const_381:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2349) as IWindowContainer;
               break;
            case Offer.const_387:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2350) as IWindowContainer;
               break;
            case Offer.const_657:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2351) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_998 != null)
            {
               _window.removeChild(var_998);
               var_998.dispose();
            }
            var_998 = _loc2_;
            _window.addChild(_loc2_);
            var_998.x = 0;
            var_998.y = 0;
         }
         var_1709 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1708 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1707 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2483 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_997 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_997 != null)
         {
            var_997.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_997.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_81 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_81,page,var_2352);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2353 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2349 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2350 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2351 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_928,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2352 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_81 = param1.offer;
         attachStub(var_81.priceType);
         if(var_1709 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_81.priceInCredits));
            var_1709.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1708 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_81.priceInPixels));
            var_1708.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1707 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_81.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_81.priceInPixels));
            var_1707.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_997 != null)
         {
            var_997.enable();
         }
      }
   }
}
