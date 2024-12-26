
<img src="https://github.com/user-attachments/assets/5eb3eb3b-92bc-48e2-a41a-1ebe7c605f2c" align='center'>
<br>
### 리플렛 -

## 주요 기능

### 개인 도서 추천 : 최초 회원가입 시 취향 수집 및 분석 도서 추천

![슬라이드22](https://github.com/user-attachments/assets/ea0ccc3e-7d63-419a-b50f-a27b939a2572)

최초 회원가입 시 PreferenceTable 에 저장된 3개의 사용자 취향 데이터를 분석하여 도서 추천 키워드를 도출하고, 이를 기반으로 개인 맞춤형 도서를 추천합니다.

- `CategoriesList` : PrefereneceTable에서 추출한 취향 , 작가 리스트
- `getPreferenceCategoriesList` : PrefereneceTable에서 CategoriesList 를 받아오는 함수
- `getMostCommonKeywords` : CategoriesList 에서 가장 많이 중복된 키워드를 추출

