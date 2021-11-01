*** Variables ***
&{productListPageLocator}
...    txt_search_title=xpath=//*[@data-testid='txt-viewProductListOnTitle' and contains(text(),'{search_keyword}')]
...    button_sort_filter=xpath=//*[@data-testid='btn-filterSelectSort']
...    part_tool_bar=xpath=//*[@data-testid='mnu-viewSubFilterToolBar-Header']