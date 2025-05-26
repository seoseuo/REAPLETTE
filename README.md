
<img src="https://github.com/user-attachments/assets/5eb3eb3b-92bc-48e2-a41a-1ebe7c605f2c" align="center">
<br>
<a href="https://chivalrous-saffron-326.notion.site/Reaplette-1650ba93975b80668fbadca4b9abbb8f?pvs=4"><img src="https://img.shields.io/badge/상세 보기 링크-E6E6E6?style=for-the-badge&logo=notion&logoColor=black" /></a>

[리플렛_포트폴리오.pptx](https://prod-files-secure.s3.us-west-2.amazonaws.com/f02911ff-a5c6-4c9a-ae3e-63ed719e4cfe/c95533ac-0495-4a48-bada-986045f96609/%E1%84%85%E1%85%B5%E1%84%91%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A6%E1%86%BA_%E1%84%91%E1%85%A9%E1%84%90%E1%85%B3%E1%84%91%E1%85%A9%E1%86%AF%E1%84%85%E1%85%B5%E1%84%8B%E1%85%A9.pptx)

[[BE27] 프로젝트_우수상.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/f02911ff-a5c6-4c9a-ae3e-63ed719e4cfe/10ccdaf1-4279-4f80-9cf5-887b17b95d17/BE27_%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%84%8C%E1%85%A6%E1%86%A8%E1%84%90%E1%85%B3_%E1%84%8B%E1%85%AE%E1%84%89%E1%85%AE%E1%84%89%E1%85%A1%E1%86%BC.pdf)

## 주요 기능
> Reaplette의 주요 기능은 사용자의 활동을 기반으로 카테고리 및 작가에 대한 취향 데이터를 수집하여
개인 맟춤형 도서를 추천하는 것 입니다.
> 

### 개인 도서 추천 : 최초 회원가입 시 취향 수집 및 분석 도서 추천

![image](https://github.com/user-attachments/assets/51dbf3fb-bce2-4c2b-99b3-95f29ea80064)


<aside>

최초 회원가입 시 PreferenceTable 에 저장된 3개의 사용자 취향 데이터를 분석하여 도서 추천 키워드를 도출하고,
이를 기반으로 개인 맞춤형 도서를 추천합니다.

</aside>

- **`CategoriesList`** : PrefereneceTable에서 추출한 취향 , 작가 리스트
- **`getPreferenceCategoriesList`** : PrefereneceTable에서 CategoriesList 를 받아오는 함수
- **`getMostCommonKeywords`** : CategoriesList 에서 가장 많이 중복된 키워드를 추출


### 개인 도서 추천 : 이용 중 취향 데이터 수집 및 분석 도서 추천

![image](https://github.com/user-attachments/assets/3366a90c-255e-43d6-a9cf-a377763c4f97)


<aside>

활동 중 도서 찜 기능을 사용하면 작가 정도가 PreferenceTable 에 저장되고, ISBN을 토대로 알라딘 상세 도서 사이트에서 카테고리 정보를 웹 크롤링하여 PrerfereneceTable 에 저장됩니다.
이러한 과정이 반복되면서 다양한 취향 데이터를 얻습니다. 후에 추천시에는 작가 추천도 포함됩니다.

</aside>

**`getBookCategoryInfo`** : ISBN 을 받아서 해당 도서의 카테고리 정보를 웹 크롤링.



## 메인 페이지 : 접속


https://github.com/user-attachments/assets/4e746e6b-c927-4bce-8fcb-aaeece93afdb



## 마이 페이지 : 목표 도서 추천 및 관리



https://github.com/user-attachments/assets/74ec45b0-3430-49f0-a21d-b7698c17aa0b



<aside>

사용자의 독서 습관 정착을 위해 사용자가 세운 목표 도서 리스트와, 목표 일정을 캘린더 형태로 정리하여 제공합니다.

</aside>



https://github.com/user-attachments/assets/4706b0bc-27f5-4ccd-90a1-8b7f200f044f



<aside>

네이버 도서 검색 API와 연동한 모달창에서 입력한 도서를 검색하고 선택 시 목표 설정 란으로 정보를 가져올 수 있고, 
이는 수동으로도 입력할 수 있습니다.

</aside>



https://github.com/user-attachments/assets/902f2949-cd5c-4e34-906b-722cb4c4f0e9



<aside>

독서 활동을 하면, 해당하는 목표 도서 정보에 들어가 내용을 수정할 수 있습니다.
이 때 사용자는 인상 깊은 문장을 필사 다이어리에 작성할 수 있습니다.
읽은 페이지 수가 총 페이지에 가꿔질 수록 막대 그래프 형태로 달성률을 가시화합니다.

</aside>



https://github.com/user-attachments/assets/f1d0a707-f830-418b-a547-c8a5075e3bb7



<aside>

목표 삭제를 누르면 캘린더와 목표 리스트에서 목표 도서가 사라집니다.

</aside>

---

# 소개

## 기술 스택

![image](https://github.com/user-attachments/assets/1079d3e0-2465-4aab-948c-46fe30c9e324)

![image](https://github.com/user-attachments/assets/87ce309f-2365-442b-8f95-d7ebf5e6d42b)


## 데이터베이스

![image](https://github.com/user-attachments/assets/f7c23de8-b9b6-480a-8e10-c9358b7d93e7)



### ERD
<details>
<summary>열람하기</summary>

![image](https://github.com/user-attachments/assets/f6ecea6d-58f6-45ca-8ce4-b8fe4f3ae4f5)
![image](https://github.com/user-attachments/assets/c62a3dd0-063e-4d98-a7a3-038799425f30)
![image](https://github.com/user-attachments/assets/4b5918fb-f5fb-4f69-b716-e4a1be2e5ad9)
![image](https://github.com/user-attachments/assets/d4b72805-052f-45f7-a1b5-992dc0e032ef)
![image](https://github.com/user-attachments/assets/3ce11392-a935-4337-9872-825e4179968e)

</details>




## 기획 배경

![image](https://github.com/user-attachments/assets/cc352458-2d7d-4884-a6e7-e1e8aa98f14f)


## 팀원

![image](https://github.com/user-attachments/assets/2737ec33-1d21-4d16-a305-4e41cfbdb199)


## 일정

![image](https://github.com/user-attachments/assets/f4956f61-afd7-4bcc-b4be-2ebb136f28a7)
![image](https://github.com/user-attachments/assets/c26550c8-93bf-46c4-bf84-8f6faca7c2a1)


## 후기

![image](https://github.com/user-attachments/assets/f51fab3e-a89e-4b60-adc6-96ff10f226e3)

![image](https://github.com/user-attachments/assets/a2b63081-715c-4f4b-91b3-a2790cd6a9b9)


![image](https://github.com/user-attachments/assets/7cde4bfb-a913-40d2-8fd6-878288199a0a)


---

# 산출물

[Reaplette 산출물](https://www.notion.so/Reaplette-1820ba93975b80dd957bd126a8fdd7a0?pvs=21)
