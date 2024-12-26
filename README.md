
<img src="https://github.com/user-attachments/assets/5eb3eb3b-92bc-48e2-a41a-1ebe7c605f2c" align="center">
<br>
<a href="https://chivalrous-saffron-326.notion.site/Reaplette-1650ba93975b80668fbadca4b9abbb8f?pvs=4"><img src="https://img.shields.io/badge/READ ME-E6E6E6?style=for-the-badge&logo=notion&logoColor=black" /></a>

## 주요 기능

### 개인 도서 추천 : 최초 회원가입 시 취향 수집 및 분석 도서 추천

![슬라이드22](https://github.com/user-attachments/assets/ea0ccc3e-7d63-419a-b50f-a27b939a2572)

최초 회원가입 시 PreferenceTable 에 저장된 3개의 사용자 취향 데이터를 분석하여 도서 추천 키워드를 도출하고, 이를 기반으로 개인 맞춤형 도서를 추천합니다.

- `CategoriesList` : PrefereneceTable에서 추출한 취향 , 작가 리스트
- `getPreferenceCategoriesList` : PrefereneceTable에서 CategoriesList 를 받아오는 함수
- `getMostCommonKeywords` : CategoriesList 에서 가장 많이 중복된 키워드를 추출


### 개인 도서 추천 : 이용 중 취향 데이터 수집 및 분석 도서 추천
![슬라이드24](https://github.com/user-attachments/assets/cead2831-cfe5-4f8e-b169-57a654894be6)
활동 중 도서 찜 기능을 사용하면 작가 정도가 PreferenceTable 에 저장되고, ISBN 을 토대로 알라딘 상세 도서 사이트에서 카테고리 정보를 웹 크롤링하여 PrerfereneceTable 에 저장됩니다. 이러한 과정이 반복되면서 다양한 취향 데이터를 얻습니다. 후에 추천시에는 작가 추천도 포함됩니다.

`getBookCategoryInfo` : ISBN 을 받아서 해당 도서의 카테고리 정보를 웹 크롤링.

more : <a href="https://chivalrous-saffron-326.notion.site/Reaplette-1650ba93975b80668fbadca4b9abbb8f?pvs=4"><img src="https://img.shields.io/badge/READ ME-E6E6E6?style=for-the-badge&logo=notion&logoColor=black" /></a>
