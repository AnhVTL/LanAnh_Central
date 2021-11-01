*** Setting ***
# Setting
Resource    ${CURDIR}/base_import.robot

# API
Resource    ${CURDIR}/../../keywords/api/search_api.robot
Resource    ${CURDIR}/../../keywords/api/brand_api.robot

# Common
Resource    ${CURDIR}/../../keywords/web/common/common_keywords.robot

# Page
Resource    ${CURDIR}/../../keywords/web/page/brand_page.robot
Resource    ${CURDIR}/../../keywords/web/page/product_list_page.robot
Resource    ${CURDIR}/../../keywords/web/page/product_detail_page.robot

#Section
Resource    ${CURDIR}/../../keywords/web/fragment/header_fragment.robot
Resource    ${CURDIR}/../../keywords/web/fragment/suggestion_fragment.robot

# Page Feature
Resource    ${CURDIR}/../../keywords/web/feature/page/brand_page_feature.robot
Resource    ${CURDIR}/../../keywords/web/feature/page/product_list_page_feature.robot
Resource    ${CURDIR}/../../keywords/web/feature/page/product_detail_page_feature.robot

# Fragment Function
Resource    ${CURDIR}/../../keywords/web/feature/fragment/header_fragment_feature.robot
Resource    ${CURDIR}/../../keywords/web/feature/fragment/suggestion_fragment_feature.robot