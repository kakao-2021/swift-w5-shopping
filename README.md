# swift-w5-shopping
모바일 5주차 쇼핑 저장소



### 초기 세팅 0201 11:30

- 프로젝트 clone
- .gitignore 생성
- 프로젝트 생성

### 네비게이션 컨트롤러 생성 0201 11:35

- 네비게이션 컨트롤러 생성

![image-20210201113643546](README.assets/image-20210201113643546.png)

### Model, View, Controller, Util 그룹 생성 0201 11:48

- 각 그룹 생성
- 컨트롤러 이름 변경 ViewController -> MainViewController
- 네비게이션아이템 title 추가

![image-20210201114850409](README.assets/image-20210201114850409.png)

### CollectionView 생성 0201 13:25

- colletionView의 layout 설정(item, group, section 설정)
- shoppingListView에 오토레이아웃 적용

![image-20210201132333021](README.assets/image-20210201132333021.png)

### JsonModels 생성 0201 17:05

- StoreItem 구조체 생성

### CollectionView layout 설정 및 header 추가 0201 17:55

- supplementary view로 header 추가

![image-20210201175252653](README.assets/image-20210201175252653.png)

### HTTP 요청 받기 : 0201 1000

- http요청을 받는 loadData 메소드 구현

### HTTPRequestManager 생성 0201 1020

- 네트워크 관리 객체(HTTPRequestManager 클래스) 생성
- ItemManager 클래스에 getItems, getCount, subscript메소드 추가

### 타입 이름 변경 0202 1030

- jsonPath -> ItemType

### 셀 정보 넣기 0202 1430

- ShoppingItemCell class 생성(xib도 생성)
- ProductImage, productName, groupDiscountPrice, originalPrice, groudDiscountUserCount outlet 연결 후 배치
- setCellData 메소드 추가
- HTTPRequestManager에 getImageURLString 메소드 추가

![image-20210202142434128](README.assets/image-20210202142434128.png)

### MyFileManager 생성 0202 17:00

- MyFileManager Class 생성
- getImageDataFromCache, saveImageDataIntoCache, createFilePath 메소드 생성
- HTTPRequestManager의 getImageUsingURLString 메소드에서 바로 URL을 타고 Image를 가져오는 것이 아니라 MyFileManager를 통해 Cache에 해당 image가 있는지 확인 후 없는 경우에면 URLSession을 통해 가져오도록 수정

![image-20210202170017430](README.assets/image-20210202170017430.png)

### Cell touch에 반응 0202 18:00

- StoreItem에 storeDomain, productId 추가
- ShoppingItemCell에 변수 추가 : storeDomain, productId
- gestureRecognizer 등록, 터치 시 NotificationCenter를 통해 cellTouched post
- MainViewController를 observer로 등록

