*** Variables ***
&{productDetailPageLocator}
...    txt_product_name=xpath=//*[@id='inf-viewProduct-{product_sku}']
...    txt_orignal_price=xpath=//*[@data-testid='inf-viewProductPriceV2ViewOnPriceSave']
...    txt_orignal_price_no_discount=xpath=//*[@data-testid='inf-viewProductPriceV2ViewOnPriceSell']
...    txt_discount_price=xpath=//*[@data-testid='inf-viewProductPriceV2ViewOnPriceSell']