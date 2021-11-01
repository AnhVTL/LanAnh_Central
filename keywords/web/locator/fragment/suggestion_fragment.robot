*** Variables ***
&{suggestionFragmentLocator}
...    txt_search_keywords=xpath=//*[text()='Search keywords']
...    txt_categories=xpath=//*[text()='Categories']
...    txt_products=xpath=//*[text()='Products']
...    txt_products_name=xpath=//*[contains(@id,'inf-viewProductOnProductSearchPreview')]
...    txt_search_keywords_data=xpath=//*[@data-testid='lnk-viewSearchSuggestionPopup-term']
...    txt_categories_data=xpath=//*[@data-testid='lnk-viewSearchSuggestionPopup-category']
...    txt_product_name=xpath=//*[@id='inf-viewProductOnProductSearchPreview-{product_sku}']
...    txt_product_original_price=xpath=//*[@id='inf-viewPriceSpecialOnProductSearchPreview-{product_sku}']
...    txt_product_special_price=xpath=//*[@id='inf-viewPriceNormalOnProductSearchPreview-{product_sku}']
...    txt_product_original_price_no_discount=xpath=//*[@id='inf-viewPriceNormalOnProductSearchPreview-{product_sku}']
...    txt_brand_name_suggestion_term=xpath=//*[@data-testid='lnk-viewSearchSuggestionPopup-term' and text()='{brand_name}']